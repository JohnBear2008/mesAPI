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

    	var sqlmain="select MakerID as UserID,Maker as UserName,MKOrdNO,MKOrdDate,MakeType,SrcMkOrdType,BillStatus,ProductID,Producer,ProdtQty,CompleteStatus,Permitter from prdMKOrdMain where MKOrdNO=?";
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