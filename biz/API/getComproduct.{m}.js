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
    
    var ProdID=sender.req.query.ProdID;
    console.log("getinfo:"+JSON.stringify(getinfo));
    
  
//    console.log("数据类型:"+typeof(ProdID));
    
    if(typeof(ProdID)=="string"){
//    	var sql="select ProdID,ClassID,ProdName,ProdForm from comproduct Where ProdID =?";
    	
    	var sql=" select h.ProdID,h.ClassID,g.ClassName,h.ProdName,h.ProdForm,h.UserID,h.UserName from (select e.ProdID,e.ClassID,e.ProdName,e.ProdForm,f.UserID,f.UserName from comproduct e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIComm.Product' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.ProdID=f.PKValue and PKValue=?) h inner join comProductClass g  on g.ClassID=h.ClassID";
    	var sql2="select a.ProdID,b.ClassID,b.ClassName,a.ProdName,a.ProdForm from comproduct a,comProductClass b Where a.ClassID=b.ClassID and ProdID =?";
    }
    
//    if(typeof(ProdID)=="object"){
//    	  var sql="select * from prdMKOrdMain Where ProdID in('333','444') ";
//    }
//    
//    console.log("connection:"+JSON.stringify(connection));

    yjDBService.exec({ 
        connectionOptions:connection,
        sql : sql,
        parameters : [ProdID],
        rowsAsArray : true,
        isAutoDisconnect:false,
        success : function(result) {
            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);
            if(data.length!=0){
              console.log("data:"+JSON.stringify(data));       
               var mesData={return:true,Message:'',Data:data};
               yjDBService.releaseConnection(result.connection);
               sender.success(mesData);
            }else{
             yjDBService.exec({
           connection:result.connection,
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
                    error: sender.error
                });
 
            }

        },
        error : sender.error
    });
}