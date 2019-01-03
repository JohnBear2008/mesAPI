//定义前置组件-------------------------
var yjDBService_sqlserver = global.yjRequire("yujiang.Foil", "yjDBService.engine.sqlserver");
var yjDBService = global.yjRequire("yujiang.Foil").yjDBService;
var yjDB = global.yjRequire("yujiang.Foil").yjDB;
var yjDBServiceUtil = global.yjRequire("yujiang.Foil", 'yjDBService.util.js');
var connectionOptions = yjGlobal.config.db_Connection.erp_Connection.connection;
var connectionOptionsMES = yjGlobal.config.db_Connection.mesapi_Connection.connection;
var schedule = require("node-schedule");
require("../../client/js/Date.js");

//定义数据库连接选项---------------------
var connection = null;
if (connectionOptions) {
    connection = yjDBServiceUtil.extractConnectionOptions(connectionOptions);
}
var connectionMES = null;
if (connectionOptionsMES) {
    connectionMES = yjDBServiceUtil.extractConnectionOptions(connectionOptionsMES);
}

//定义执行SQL-------------------------	    	    
var getsql = " select a.LineID,b.Action from prdPrdLine a,(select  PKValue,Action from comChangeLog where   changetime>= DATEADD(minute,-5, GETDATE()+2)  and ProgID='CHIProdt.PrdLine')b where a.LineID=b.PKValue";
var postsql = "insert into dataaynchmappings (ProjectName,TableName,ID,Name,SynchMold,SynchFlag,SynchType,CreateTime) values(?,?,?,?,?,?,?,?)";

//主函数----------------------------
(function () {
    var rule = new schedule.RecurrenceRule();
    rule.minute = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
    schedule.scheduleJob(rule, function () {
        CreateTime = new Date().Format("yyyy-MM-dd HH:mm:ss");
        ERPtoMES();
    });
})();

//ERP数据抓取至中间数据库函数---------------
function ERPtoMES() {
    yjDBService_sqlserver.exec({
        connectionOptions: connection,
        sql: getsql,
        parameters: [],
        rowsAsArray: true,
        success: function (result) {
                var data = yjDB.dataSet2ObjectList(result.meta, result.rows);
                console.log("get产线data:" + JSON.stringify(data));
                if (data.length != 0) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].Action == 1) {
                            SynchType = 1;
                        } else {
                            if (data[i].Action == 2) {
                                SynchType = 3;
                            } else {
                                SynchType = 2;
                            }
                        }
                        yjDBService.exec({
                            connectionOptions: connectionMES,
                            sql: postsql,
                            parameters: ["ERP", "prdprdLine", data[i].LineID, data[i].LineID, "API", "0", SynchType, CreateTime],
                            success: function (result) {
                                    console.log("产线插入成功!")
                                },
                                error: {}
                        });
                    }
                }
            },
            error: {}
    });
}