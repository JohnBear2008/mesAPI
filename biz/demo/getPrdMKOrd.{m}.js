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

    	var sqlmain="select f.UserID,f.UserName,e.MKOrdNO,e.MKOrdDate,e.MakeType,e.ProductID,e.Producer,e.ProdtQty,e.CompleteStatus from prdmkordmain e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIProdt.InnMkOrd' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.MKOrdNO=f.PKValue and PKValue=?";
    	var sqlmats="select PartsID,MatForm,SubProdID,UnitOughtQty,OughtQty,OriginalQty,WestingRate,MatSource from prdMkOrdMats where MkOrdNO = ?";
    	
    	
    }


    if(sqlmain!=undefined){
    	
    	 yjDBService.exec({
    	    	
    	        connectionOptions:connection,
    	        sql : sqlmain,
    	        parameters : [MKOrdNO],
    	        rowsAsArray : true,
    	        success : function(result) {
    	            var DataMain=yjDB.dataSet2ObjectList(result.meta,result.rows);
    	            
    	          //查询子表数据--------------
    	            yjDBService.exec({
    	            	
    	                connectionOptions:connection,
    	                sql : sqlmats,
    	                parameters : [MKOrdNO],
    	                rowsAsArray : true,
    	                success : function(MatsResult) {
    	                    var DataMats=yjDB.dataSet2ObjectList(MatsResult.meta,MatsResult.rows);  
//    	                    console.log("DataMats:"+JSON.stringify(DataMats));

    	                    DataMain[0]["MKOrdMats"]=DataMats;      
    	                    
//   	                    console.log("DataMain:"+JSON.stringify(DataMain));
    	                    var mesData={return:true,Message:''}
    	                    mesData["Data"]=DataMain;
 //	                    console.log("mesData:"+JSON.stringify(mesData));

    	                    sender.success(mesData);
    	                },
    	                error : sender.error
    	            });
    	            
    	            

    	        },
    	        error : sender.error
    	    });
    	
    	
    }else{
    	sender.error('请输入参数!');
    }

   
}