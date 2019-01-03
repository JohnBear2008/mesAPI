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
    
    var MKOrdNO=sender.req.query.MKOrdNO;
    console.log("getinfo:"+JSON.stringify(getinfo));
    
  
    console.log("数据类型:"+typeof(MKOrdNO));
    
    if(typeof(MKOrdNO)=="string"){

    	var sql="select MKOrdNO,MKOrdDate,MakeType,BillStatus,ProductID,Producer,ProdtQty,CompleteStatus from prdMKOrdMain Where Flag='1' and MKOrdNO =? ";
    }
    
//    if(typeof(MKOrdNO)=="object"){
//
//    	  var sql="select * from prdMKOrdMain Where MKOrdNO in('333','444') ";
//    }
//    
//    console.log("connection:"+JSON.stringify(connection));
    
    console.log("sql:"+sql);
    
    if(sql!=undefined){
    	
    	 yjDBService.exec({
    	    	
    	        connectionOptions:connection,
    	        sql : sql,
    	        parameters : [MKOrdNO],
    	        rowsAsArray : true,
    	        success : function(result) {
    	            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);
    	            
    	            
//    	            console.log("result:"+JSON.stringify(result));
//    	            
    	            console.log("data:"+JSON.stringify(data));
//    	            
    	            var mesData={return:true,Message:'',Data:data}

    	            sender.success(mesData);
    	        },
    	        error : sender.error
    	    });
    	
    	
    }else{
    	sender.error('请输入参数!');
    }

   
}