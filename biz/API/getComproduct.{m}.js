module.exports = function(sender) {
    console.log("getinfo:"+JSON.stringify(getinfo));
    
  
    console.log("数据类型:"+typeof(ProdID));

    
    if(typeof(ProdID)=="string"){
//    	var sql="select ProdID,ClassID,ProdName,ProdForm from comproduct Where ProdID =?";
@ -33,41 +33,33 @@ module.exports = function(sender) {
//    
//    console.log("connection:"+JSON.stringify(connection));

    yjDBService.exec({
    	
    yjDBService.exec({ 
        connectionOptions:connection,
        sql : sql,
        parameters : [ProdID],
        rowsAsArray : true,
        isAutoDisconnect:false,
        success : function(result) {
            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);
            
            
//  console.log("result:"+JSON.stringify(result));
            if(data.length!=0){
            	 console.log("data:"+JSON.stringify(data));       
               var mesData={return:true,Message:'',Data:data}
              console.log("data:"+JSON.stringify(data));       
               var mesData={return:true,Message:'',Data:data};
               yjDBService.releaseConnection(result.connection);
               sender.success(mesData);
           	
            }else{
            	
            	console.log("data2222:"+JSON.stringify(data));     
            	yjDBService.exec({
        			
        			connectionOptions:connection,

                    sql: sql2,
                    parameters: [ProdID],
                    success: function(result2) {
                    	 var data2=yjDB.dataSet2ObjectList(result2.meta,result2.rows);
                    	 console.log("data2:"+JSON.stringify(data2));
                    	 data2[0].UserID="Admin";
                    	 data2[0].UserName="Admin";
                    	 var mesData={return:true,Message:'',Data:data2}
                    	 sender.success(mesData);
                     
                    },
                    error: {}
                });
 
            }