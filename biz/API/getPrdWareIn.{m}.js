module.exports = function(sender) {
//  var yjDBService = global.yjRequire("yujiang.Foil").yjDBService.engine.sqlserver;
    var yjDBService = global.yjRequire("yujiang.Foil","yjDBService.engine.sqlserver");
    var yjDB = global.yjRequire("yujiang.Foil").yjDB;
    var yjDBServiceUtil=global.yjRequire("yujiang.Foil",'yjDBService.util.js');
    var connectionOptions=yjGlobal.config.db_Connection.erp_Connection.connection;
    
//  console.log("connectionOptions:"+JSON.stringify(connectionOptions));
    var connection=null;
    if(connectionOptions){
    	connection=yjDBServiceUtil.extractConnectionOptions(connectionOptions);
    }
    
    var getinfo=sender.req.query;
    
    var WareInNO=sender.req.query.WareInNO;
    var Flag=sender.req.query.Flag;
    console.log("getinfo:"+JSON.stringify(getinfo));
    
  
    console.log("数据类型:"+typeof(WareInNO));
    
    if(typeof(WareInNO)=="string"){
    	var sql="select BillDate,WareInNO,WareInClass,MkOrdNo,InMkOrdType,InMkOrdNo from prdWareIn where WareInNO =? and Flag=?";
    }
    
//    if(typeof(WareInNO)=="object"){
//
//    	  var sql="select * from prdMKOrdMain Where WareInNO in('333','444') ";
//    }
//    
//    console.log("connection:"+JSON.stringify(connection));

    yjDBService.exec({
    	
        connectionOptions:connection,
        sql : sql,
        parameters : [WareInNO,Flag],
        rowsAsArray : true,
        success : function(result) {
            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);
            
            
//            console.log("result:"+JSON.stringify(result));
//            
            console.log("data:"+JSON.stringify(data));
//            
            var mesData={return:true,Message:'',Data:data}

            sender.success(mesData);
        },
        error : sender.error
    });
}