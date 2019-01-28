module.exports = function (sender) {
    var yjDBService = global.yjRequire("yujiang.Foil", "yjDBService.engine.sqlserver");
    var yjDB = global.yjRequire("yujiang.Foil").yjDB;
    var yjDBServiceUtil = global.yjRequire("yujiang.Foil", 'yjDBService.util.js');
    var connectionOptions = yjGlobal.config.db_Connection.erp_Connection.connection;
    var connection = null;
    
    if (connectionOptions) {
        connection = yjDBServiceUtil.extractConnectionOptions(connectionOptions);
    }
    var getinfo = sender.req.query;
    
    console.log("API getPrdBOM:"+JSON.stringify(getinfo));
    
    var ProductID = sender.req.query.ProductID;
    
    if (typeof (ProductID) == "string") {
        var sqlmain = "select ProductID,ProductName,ReviseDate,InvalidDate,EffectDate,BOMStatus,BatchAmount,NorProdtMode,NorProdtLine,WorkTimeOfBatch,CurVersion,Maker,Permitter from prdBOMMain  where  ProductID =? and Flag=1";
        var sqlmats = "select Flag,SerNO,SubProdID,QtyOfBatch,WastingRate,Detail,BatchAmount from prdBOMMats where ProductID = ? and Flag=1";
    }
    
    if (sqlmain != undefined) {
        yjDBService.exec({
            connectionOptions: connection,
            sql: sqlmain,
            parameters: [ProductID],
            rowsAsArray: true,
            success: function (result) {
                    var DataMain = yjDB.dataSet2ObjectList(result.meta, result.rows);
                    
                    yjDBService.exec({
                        connectionOptions: connection,
                        sql: sqlmats,
                        parameters: [ProductID],
                        rowsAsArray: true,
                        success: function (MatsResult) {

                                var DataMats = yjDB.dataSet2ObjectList(MatsResult.meta, MatsResult.rows);

                                if (DataMats.length == 0) {
                                    var mesData = {
                                        return :false,
                                        Message: '找不到数据',
                                        Data: []
                                    }
                                    sender.success(mesData);
                                } else {
                                    DataMain[0]["Mats"] = DataMats;
                                    var mesData = {
                                        return :true,
                                        Message: ''
                                    }
                                    mesData["Data"] = DataMain;
                                    sender.success(mesData);
                                }
                            },
                            error: sender.error
                    });
                },
                error: sender.error
        });
    } else {
        sender.error('请输入参数!');
    }
}