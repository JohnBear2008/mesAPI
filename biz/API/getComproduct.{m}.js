module.exports = function(sender) {
    var connectionOptions=yjGlobal.config.db_Connection.erp_Connection.connection;
    
//  console.log("connectionOptions:"+JSON.stringify(connectionOptions));
    
    var connection=null;
    if(connectionOptions){
    	connection=yjDBServiceUtil.extractConnectionOptions(connectionOptions);

    if(typeof(ProdID)=="string"){
//    	var sql="select ProdID,ClassID,ProdName,ProdForm from comproduct Where ProdID =?";
    	

    	var sql=" select h.ProdID,h.ClassID,g.ClassName,h.ProdName,h.ProdForm,h.UserID,h.UserName from (select e.ProdID,e.ClassID,e.ProdName,e.ProdForm,f.UserID,f.UserName from comproduct e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIComm.Product' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.ProdID=f.PKValue and PKValue=?) h inner join comProductClass g  on g.ClassID=h.ClassID";
    	var sql2="select a.ProdID,b.ClassID,b.ClassName,a.ProdName,a.ProdForm from comproduct a,comProductClass b Where a.ClassID=b.ClassID and ProdID =?";
    }
    
//    if(typeof(ProdID)=="object"){
//
//    	  var sql="select * from prdMKOrdMain Where ProdID in('333','444') ";
//    }
//    
module.exports = function(sender) {
            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);
            
            
//            console.log("result:"+JSON.stringify(result));
//            
            console.log("data:"+JSON.stringify(data));
//            
            var mesData={return:true,Message:'',Data:data}
//  console.log("result:"+JSON.stringify(result));
            if(data.length!=0){
            	 console.log("data:"+JSON.stringify(data));       
               var mesData={return:true,Message:'',Data:data}
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

            sender.success(mesData);
        },
        error : sender.error
    });