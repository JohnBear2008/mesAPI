
var yjBizService = global.yjRequire("yujiang.Foil").yjBizService;
var yjPusher = yjRequire("yujiang.Foil").yjPusher;
var g_realTimeGreenPushing =false;
var path=require("path");
module.exports = function(sender) {
    yjBizService.get({
        params : ["bear","getIllumationChartData"],
        query : sender.req.query,
        success : function(data){
            sender.success(data);  
            
            console.log("2222222");
        },
        error : sender.error
    });
}
