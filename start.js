var init=require("../yujiang.Foil.Node/src/yjApp.init.js");
var path=require("path");
init.setConfigFile(path.join(__dirname,"./config.js"));
require("../yujiang.Foil.Node/src/yjApp.js");
