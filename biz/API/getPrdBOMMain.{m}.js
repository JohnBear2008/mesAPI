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
    
    var ProductID=sender.req.query.ProductID;
    console.log("getinfo:"+JSON.stringify(getinfo));
    
  
    console.log("数据类型:"+typeof(ProductID));
    
    if(typeof(ProductID)=="string"){
    	var sql="select ProductID,ProductName,BatchAmount,NorProdtMode,NorProdtLine,WorkTimeOfBatch,CurVersion from prdBOMMain Where ProductID =?";
    }
    
//    if(typeof(ProductID)=="object"){
//
//    	  var sql="select * from prdMKOrdMain Where ProductID in('333','444') ";
//    }
//    
//    console.log("connection:"+JSON.stringify(connection));

    yjDBService.exec({
    	
        connectionOptions:connection,
        sql : sql,
        parameters : [ProductID],
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