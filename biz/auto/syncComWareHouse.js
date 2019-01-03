//定义前置组件-------------------------
var yjDBService_sqlserver = global.yjRequire("yujiang.Foil", "yjDBService.engine.sqlserver");
var yjDBService = global.yjRequire("yujiang.Foil").yjDBService;
var yjDB = global.yjRequire("yujiang.Foil").yjDB;
<<<<<<< HEAD
var yjDBServiceUtil = global.yjRequire("yujiang.Foil", 'yjDBService.util.js');
var connectionOptions = yjGlobal.config.db_Connection.erp_Connection.connection;
var connectionOptionsMES = yjGlobal.config.db_Connection.mesapi_Connection.connection;
=======
var yjDBServiceUtil=global.yjRequire("yujiang.Foil",'yjDBService.util.js');
var connectionOptions=yjGlobal.config.db_Connection.erp_Connection.connection;
var connectionOptionsMES=yjGlobal.config.db_Connection.mesapi_Connection.connection;

var connection=null;
    if(connectionOptions){
	    	connection=yjDBServiceUtil.extractConnectionOptions(connectionOptions);
	}

var connectionMES=null;
    if(connectionOptionsMES){
	    	connectionMES=yjDBServiceUtil.extractConnectionOptions(connectionOptionsMES);
	    	
//	    	console.log("connectionMES:"+JSON.stringify(connectionMES))
	}
	    
    var getsql=" select a.WareHouseID,b.Action from comWareHouse a,(select PKValue,Action from comChangeLog where  changetime>= DATEADD(minute,-5, GETDATE()+2) and  ProgID='CHIComm.WareHouse') b where a.WareHouseID=b.PKValue ";
    //getsql 为从erp抓取数据的sql语句,可修改
    
    var postsql="insert into dataaynchmappings (ProjectName,TableName,ID,Name,SynchMold,SynchFlag,SynchType,CreateTime) values(?,?,?,?,?,?,?,?)"
    //postsql 为向中间数据库插入数据的sql语句	

//-------------------------------
    	
    	Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "H+": this.getHours(), //小时 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds() //毫秒 
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    	
    	

////------------------------------------	    
>>>>>>> parent of f2cc2fe... 0.2.2
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
var getsql = " select a.WareHouseID,b.Action from comWareHouse a,(select PKValue,Action from comChangeLog where  changetime>= DATEADD(minute,-5, GETDATE()+2) and  ProgID='CHIComm.WareHouse') b where a.WareHouseID=b.PKValue ";
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
                console.log("get仓库data:" + JSON.stringify(data));
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
                            parameters: ["ERP", "comWareHouse", data[i].WareHouseID, data[i].WareHouseID, "API", "0", SynchType, CreateTime],
                            success: function (result) {
                                    console.log("仓库插入成功!")
                                },
                                error: {}
                        });
                    }
                }
            },
            error: {}
    });
}