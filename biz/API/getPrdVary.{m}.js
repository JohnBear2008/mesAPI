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
    var VaryID = sender.req.query.VaryID;
    console.log("getinfo:" + JSON.stringify(getinfo));
    console.log("数据类型:" + typeof (VaryID));
    if (typeof (VaryID) == "string") {
        var sqlmain = "select MakerID as UserID,Maker as UserName,VaryID,VaryDate,EffectDate,IsEffect,VaryReason,VaryMan,ProductID,ProductName from prdVaryMain where VaryID=?";
        var sqlmats = "select VaryType,ProductID,SubProdID,QtyOfBatch,WastingRate,MatSource from prdVaryMats  where VaryID = ? ";
    }
    if (sqlmain != undefined) {
        yjDBService.exec({
            connectionOptions: connection,
            sql: sqlmain,
            parameters: [VaryID],
            rowsAsArray: true,
            success: function (result) {
                    var DataMain = yjDB.dataSet2ObjectList(result.meta, result.rows);
                    yjDBService.exec({
                        connectionOptions: connection,
                        sql: sqlmats,
                        parameters: [VaryID],
                        rowsAsArray: true,
                        success: function (MatsResult) {
                                var DataMats = yjDB.dataSet2ObjectList(MatsResult.meta, MatsResult.rows);
                            
                                if (DataMats.length == 0) {
                                    var mesData = {
                                        return :false,
                                        Message: '找不到数据',
                                        Data: []
                                    }
                                    mesData["Data"] = DataMain;
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