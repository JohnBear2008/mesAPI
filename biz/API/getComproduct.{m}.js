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
    
    console.log("API getComproductinfo:"+JSON.stringify(getinfo));
    
    var ProdID = sender.req.query.ProdID;
    if (typeof (ProdID) == "string") {
        var sql = " select h.ProdID,h.ClassID,g.ClassName,h.ProdName,h.ProdForm,h.UserID,h.UserName from (select e.ProdID,e.ClassID,e.ProdName,e.ProdForm,f.UserID,f.UserName from comproduct e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIComm.Product' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.ProdID=f.PKValue and PKValue=?) h inner join comProductClass g  on g.ClassID=h.ClassID";
        var sql2 = "select a.ProdID,b.ClassID,b.ClassName,a.ProdName,a.ProdForm from comproduct a,comProductClass b Where a.ClassID=b.ClassID and ProdID =?";
    }
    yjDBService.exec({
        connectionOptions: connection,
        sql: sql,
        parameters: [ProdID],
        rowsAsArray: true,
        timerTimeout:15,
        isAutoDisconnect: false,
        success: function (result) {
                var data = yjDB.dataSet2ObjectList(result.meta, result.rows);
                if (data.length != 0) {
                    var mesData = {
                        return :true,
                        Message: '',
                        Data: data
                    };
                    yjDBService.releaseConnection(result.connection);
                    sender.success(mesData);
                } else {
                    yjDBService.exec({
                        connection: result.connection,
                        sql: sql2,
                        timerTimeout:15,
                        parameters: [ProdID],
                        success: function (result2) {
                                var data2 = yjDB.dataSet2ObjectList(result2.meta, result2.rows);
                                data2[0].UserID = "Admin";
                                data2[0].UserName = "Admin";
                                var mesData = {
                                    return :true,
                                    Message: '',
                                    Data: data2
                                }
                                sender.success(mesData);
                            },
                            error: sender.error
                    });
                }
            },
            error: sender.error
    });
}