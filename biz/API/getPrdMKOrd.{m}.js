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
    var MKOrdNO = sender.req.query.MKOrdNO;
    if (typeof (MKOrdNO) == "string") {
        var sqlmain = "select MakerID as UserID,Maker as UserName,MKOrdNO,MKOrdDate,MakeType,SrcMkOrdType,BillStatus,ProductID,Producer,ProdtQty,CompleteStatus,Permitter from prdMKOrdMain where MKOrdNO=?";
        var sqlmats = "select PartsID,MatForm,SubProdID,UnitOughtQty,OughtQty,OriginalQty,WestingRate,MatSource from prdMkOrdMats where MkOrdNO = ?";
    }
    if (sqlmain != undefined) {
        yjDBService.exec({
            connectionOptions: connection,
            sql: sqlmain,
            parameters: [MKOrdNO],
            rowsAsArray: true,
            success: function (result) {
                    var DataMain = yjDB.dataSet2ObjectList(result.meta, result.rows);
                    yjDBService.exec({
                        connectionOptions: connection,
                        sql: sqlmats,
                        parameters: [MKOrdNO],
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