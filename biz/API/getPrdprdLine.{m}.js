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
    var LineID = sender.req.query.LineID;
    if (typeof (LineID) == "string") {
        var sql = "select f.UserID,f.UserName,e.LineId,e.LineName from prdPrdLine e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIProdt.PrdLine' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.LineID=f.PKValue and PKValue=?";
        var sql2 = "select LineId,LineName from prdPrdLine where LineId=? ";
    }
    yjDBService.exec({
        connectionOptions: connection,
        sql: sql,
        parameters: [LineID],
        rowsAsArray: true,
        success: function (result) {
                var data = yjDB.dataSet2ObjectList(result.meta, result.rows);
                if (data.length != 0) {
                    var mesData = {
                        return :true,
                        Message: '',
                        Data: data
                    }
                    sender.success(mesData);
                } else {
                    yjDBService.exec({
                        connectionOptions: connection,
                        sql: sql2,
                        parameters: [LineID],
                        success: function (result2) {
                                var data2 = yjDB.dataSet2ObjectList(result2.meta, result2.rows);
                                if (data2.length == 0) {
                                    var mesData = {
                                        return :false,
                                        Message: '找不到数据',
                                        Data: []
                                    }
                                    sender.success(mesData);
                                } else {
                                    data2[0].UserID = "Admin";
                                    data2[0].UserName = "Admin";
                                    var mesData = {
                                        return :true,
                                        Message: '',
                                        Data: data2
                                    }
                                    sender.success(mesData);
                                }
                            },
                            error: sender.error
                    });
                }
            },
            error: sender.error
    });
}