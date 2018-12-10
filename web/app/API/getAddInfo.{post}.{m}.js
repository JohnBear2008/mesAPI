var yjBizService = global.yjRequire("yujiang.Foil").yjBizService;
var yjPusher = yjRequire("yujiang.Foil").yjPusher;
var g_realTimeGreenPushing =false;
var path=require("path");
module.exports = function(sender) {
    yjBizService.post({
        params : ["bear","getAddInfo"],
        query : sender.req.body,
        success : function(data){
           alert("bear info post....");
            sender.success(data);
        },
        error : sender.error
    });
}
