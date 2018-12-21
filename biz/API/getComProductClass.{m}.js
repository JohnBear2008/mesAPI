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
    
    var ClassID=sender.req.query.ClassID;
    console.log("getinfo:"+JSON.stringify(getinfo));
    console.log("数据类型:"+typeof(ClassID));
    
    if(typeof(ClassID)=="string"){
    	var sql="select f.UserID,f.UserName,e.ClassID,e.ClassID,e.ClassName from comProductClass e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIComm.ProductClass' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.ClassID=f.PKValue and PKValue=?";
    	var sql2="select ClassID,ClassName from comProductClass where ClassID=?";
    }

    yjDBService.exec({
        connectionOptions:connection,
        sql : sql,
        parameters : [ClassID],
        rowsAsArray : true,
        success : function(result) {
            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);

            if(data.length!=0){
//           	 console.log("data:"+JSON.stringify(data));       
              var mesData={return:true,Message:'',Data:data}
              sender.success(mesData);
          	
           }else{
           	
//           	console.log("data2222:"+JSON.stringify(data));     
           	
           	yjDBService.exec({
       			
       			connectionOptions:connection,
                   sql: sql2,
                   parameters: [ClassID],
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
        },
        error : sender.error
    });
}