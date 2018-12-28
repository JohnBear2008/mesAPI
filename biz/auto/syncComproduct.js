var yjDBService_sqlserver = global.yjRequire("yujiang.Foil","yjDBService.engine.sqlserver");
var yjDBService = global.yjRequire("yujiang.Foil").yjDBService;
var yjDB = global.yjRequire("yujiang.Foil").yjDB;
var yjDBServiceUtil=global.yjRequire("yujiang.Foil",'yjDBService.util.js');
var connectionOptions=yjGlobal.config.db_Connection.erp_Connection.connection;
var connectionOptionsMES=yjGlobal.config.db_Connection.mesapi_Connection.connection;

require("../../client/js/Date.js");

var connection=null;
    if(connectionOptions){
	    	connection=yjDBServiceUtil.extractConnectionOptions(connectionOptions);
	}

var connectionMES=null;
    if(connectionOptionsMES){
	    	connectionMES=yjDBServiceUtil.extractConnectionOptions(connectionOptionsMES);
	    	
//	    	console.log("connectionMES:"+JSON.stringify(connectionMES))
	}
	    
    var getsql="select a.ProdID,a.ProdName,b.Action from comproduct a,(select PKValue,Action from comChangeLog where  changetime>= DATEADD(minute,-5, GETDATE()+2) and  ProgID='CHIComm.Product') b where a.ProdID=b.PKValue ";
    //getsql 为从erp抓取数据的sql语句,可修改
    
    var postsql="insert into dataaynchmappings (ProjectName,TableName,ID,Name,SynchMold,SynchFlag,SynchType,CreateTime) values(?,?,?,?,?,?,?,?)"
    //postsql 为向中间数据库插入数据的sql语句	



////------------------------------------	    
var schedule = require("node-schedule");


(function() {
    var rule = new schedule.RecurrenceRule();  
    
//   rule.hour = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];  
 rule.minute = [0,5,10,15,20,25,30,35,40,45,50,55];  
 //rule.minute =  [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59 ]; 
//rule.second=  [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59 ];  
     
    schedule.scheduleJob(rule, function(){ 
    	
    	 CreateTime = new Date().Format("yyyy-MM-dd HH:mm:ss");
 //   	 console.log("CreateTime:"+CreateTime);

    	 
    	   
//      console.log("CreateTime:"+JSON.stringify(CreateTime));
	
    	ERPtoMES();


    });
})();


function ERPtoMES(){

	yjDBService_sqlserver.exec({
    	
        connectionOptions:connection,
        sql : getsql,
        parameters : [],
        rowsAsArray : true,
        success : function(result) {
            var data=yjDB.dataSet2ObjectList(result.meta,result.rows);
            console.log("get产品data:"+JSON.stringify(data));
            //插入mes-----------------
            
            if(data.length!=0){
            	
            	
            	for(var i=0;i<data.length;i++){
            		
            		if(data[i].Action==1){
            			SynchType=1;
            		}else{
            			if(data[i].Action==2){
            				SynchType=3;
            			}else{
            				SynchType=2;
            			}
            		}
            		
//            		console.log("SynchType:"+SynchType);
 //           		console.log("CreateTime:"+JSON.stringify(CreateTime));
            		
            		yjDBService.exec({
            			
            			connectionOptions:connectionMES,
                        sql: postsql,
                        parameters: ["ERP","comproduct",data[i].ProdID,data[i].ProdName,"API","0",SynchType,CreateTime],
                        success: function(result) {
                        	console.log("产品插入成功!")
                        },
                        error: {}
                    });
            	}

            }

            
        },
        error : {}
    });
	
	
}



	
