//根据传入物料编号查询BOM主表,子表信息

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
    	var sqlmain="select ProductID,ProductName,BatchAmount,NorProdtMode,NorProdtLine,WorkTimeOfBatch,CurVersion,MakerID,PermitterID from prdBOMMain where  ProductID =?";
    	var sqlmats="select SubProdID,QtyOfBatch,WastingRate,Detail,BatchAmount from prdBOMMats where ProductID = ?";
    }
    

    if(sqlmain!=undefined){
    
    yjDBService.exec({
    	
        connectionOptions:connection,
        sql : sqlmain,
        parameters : [ProductID],
        rowsAsArray : true,
        success : function(result) {
        	
            var DataMain=yjDB.dataSet2ObjectList(result.meta,result.rows);

            
            
         //查询子表数据--------------
            yjDBService.exec({
            	
                connectionOptions:connection,
                sql : sqlmats,
                parameters : [ProductID],
                rowsAsArray : true,
                success : function(MatsResult) {
                    var DataMats=yjDB.dataSet2ObjectList(MatsResult.meta,MatsResult.rows);  
//                    console.log("DataMats:"+JSON.stringify(DataMats));

                    DataMain[0]["PrdMats"]=DataMats;      
                    
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