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
    
    var ProductID=sender.req.query.ProductID;
    console.log("getinfo:"+JSON.stringify(getinfo));
    console.log("数据类型:"+typeof(ProductID));
    
    if(typeof(ProductID)=="string"){
    	var sqlmain="select f.UserID,f.UserName,e.ProductID,e.ProductName,e.BatchAmount,e.NorProdtMode,e.NorProdtLine,e.WorkTimeOfBatch,e.CurVersion from (select i.* from prdBOMMain i inner join (select MAX(CurVersion)as CurVersion,ProductID from prdBOMMain  group by ProductID) j on i.ProductID=j.ProductID and i.CurVersion=j.CurVersion) e,( select c.PersonID as UserID,c.PersonName as UserName,d.PKValue from comperson c,(select a.PKValue,a.UserName from comChangeLog a inner join (select PKValue ,max(changetime)as changetime from comChangeLog where   ProgID='CHIProdt.BOM' group by PKValue  ) b on a.PKValue=b.PKValue and a.ChangeTime=b.changetime) d where c.PersonID=d.UserName) f where e.ProductID=f.PKValue and ProductID =?";
    	var sqlmats="select Flag,SubProdID,QtyOfBatch,WastingRate,Detail,BatchAmount from prdBOMMats where ProductID = ? and Flag=1";
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