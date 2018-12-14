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
    	var sql="select f.UserID,f.UserName,e.ProductID,e.ProductName,e.BatchAmount,e.NorProdtMode,e.NorProdtLine,e.WorkTimeOfBatch,e.CurVersion from (select i.* from prdBOMMain i inner join (select MAX(CurVersion)as CurVersion,ProductID from prdBOMMain  group by ProductID) j on i.ProductID=j.ProductID and i.CurVersion=j.CurVersion) e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIProdt.BOM' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.ProductID=f.PKValue and ProductID =?";
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

            console.log("data:"+JSON.stringify(data));
         
            var mesData={return:true,Message:'',Data:data}

            sender.success(mesData);
        },
        error : sender.error
    });
}