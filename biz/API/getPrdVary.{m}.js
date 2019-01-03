//从log表抓数据  感觉不对.....
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
    
    var VaryID=sender.req.query.VaryID;
    console.log("getinfo:"+JSON.stringify(getinfo));
    console.log("数据类型:"+typeof(VaryID));
    
    if(typeof(VaryID)=="string"){
    	var sqlmain="select MakerID as UserID,Maker as UserName,VaryID,VaryDate,EffectDate,IsEffect,VaryReason,VaryMan,ProductID,ProductName from prdVaryMain where VaryID=?";
    	var sqlmats="select VaryType,ProductID,SubProdID,QtyOfBatch,WastingRate,MatSource from prdVaryMats  where VaryID = ? ";
    }
    

    if(sqlmain!=undefined){
    
    yjDBService.exec({
    	
        connectionOptions:connection,
        sql : sqlmain,
        parameters : [VaryID],
        rowsAsArray : true,
        success : function(result) {
        	
            var DataMain=yjDB.dataSet2ObjectList(result.meta,result.rows);

            
            
         //查询子表数据--------------
            yjDBService.exec({
            	
                connectionOptions:connection,
                sql : sqlmats,
                parameters : [VaryID],
                rowsAsArray : true,
                success : function(MatsResult) {
                    var DataMats=yjDB.dataSet2ObjectList(MatsResult.meta,MatsResult.rows);  
                   console.log("DataMats:"+JSON.stringify(DataMats));

                    DataMain[0]["Mats"]=DataMats;      
                    
//                    console.log("DataMain:"+JSON.stringify(DataMain));
                    var mesData={return:true,Message:''}
                    mesData["Data"]=DataMain;
//                    console.log("mesData:"+JSON.stringify(mesData));

                    sender.success(mesData);
                },
                error : sender.error
            });
            

//            var mesData={return:true,Message:'',Data:data}
//
//            sender.success(mesData);
        },
        error : sender.error
    });
    
    }else{
    	sender.error('请输入参数!');
    }

    
    
}