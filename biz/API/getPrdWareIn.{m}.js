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
    	var sqlmain="select MakerID as UserID,Maker as UserName,BillDate,WareInNO,WareInClass,MkOrdNo,WareInType,Permitter,SumQuantity,MakerID,ProdtMan,ProdId from prdWareIn where WareInNO=? and Flag=?";
    	var sqlmats="select Flag,ProdID,ProdName,WareID,IsReplace from comprodrec where BillNO = ? and Flag=?";
    }


    if(sqlmain!=undefined){
    	
    	 yjDBService.exec({
    	    	
    	        connectionOptions:connection,
    	        sql : sqlmain,
    	        parameters : [WareInNO,Flag],
    	        rowsAsArray : true,
    	        success : function(result) {
    	            var DataMain=yjDB.dataSet2ObjectList(result.meta,result.rows);
    	            
    	          //查询子表数据--------------
    	            yjDBService.exec({
    	            	
    	                connectionOptions:connection,
    	                sql : sqlmats,
    	                parameters : [WareInNO,Flag],
    	                rowsAsArray : true,
    	                success : function(MatsResult) {
    	                    var DataMats=yjDB.dataSet2ObjectList(MatsResult.meta,MatsResult.rows);  
//    	                    console.log("DataMats:"+JSON.stringify(DataMats));

    	                    DataMain[0]["Mats"]=DataMats;      
    	                    
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