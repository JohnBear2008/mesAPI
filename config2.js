var path = require("path");
var g_dbConenctions = {
    engine: "mysql",
    connection: {
        server: '127.0.0.1',
        database: 'toolsWeb',
        user: 'root',
        password: '654321',
        insecureAuth: true
    }, 
    "erp_Connection" : {
    	  engine:"sqlserver",
    	  package:"msnodesqlv8",
    	  connection:{
    	   driver : "SQL Server Native Client 11.0",
    	   server : '192.168.0.2',
    	   database : 'CHIComp99',
    	   user: 'sa',
         password: 'techDG2218',
    	  }
    }

};
var config = {
    port: 3000,
    biz_Connection: {
        engine: "remote.superagent",
        connection: {
            url: "http://127.0.0.1:3000/biz"

//        	url: "http://192.168.0.9:2019/"
        }
    },
    homePage_url: "/app/system/sitemap/showSitemap",
    db_Connection: g_dbConenctions,
    product: {
        name: "ToolsWeb",
        namePic: "/images/logo.jpg",
        projectName:'ToolsWeb',
        description: "",
        logo: "/images/logo.jpg",
        favIcon:path.join(__dirname,'/client/images/Foil.ico'),
        version: "1.0.0",
        releaseLogDir: path.join(__dirname, "./web/system/release/data"),
        company: {
            name: "Techmation Co.,Ltd.",
            website: "http://www.techmation.com.cn",
            CNName:'宁波弘讯软件开发有限公司西安分公司'
        },
		mes:{
			deviceType:"EEI"
		},
        loginBackgroundImage:"/images/login/background.jpg",
        userImg:''
    },
    processTree: {
        isNeedAuthorityCheck:true,
        style:"mes_accordion" 
    },
    security: {
        passwordEncryptMode: 'rsa',
        isNeedSession: true,
        isOpenRegister: false,
        login_url: "/app/account/showLogin",
        loginTypes: ["userID"],
//        loginTypes: ["mobilePhone"],
        notNeedLogin_urls:[]
    },
    theme: {

        layout: {
            foil: ["mes"][0]
        },
        style: {
            easyui: ["default", "black", "bootstrap", "gray", "metro"][3],
            foil: ["mes", "modern"][0]
        }
    },
    packages:{
        version:{
            "jquery-easyui":"1.5",
            "jquery":'1.7.2'
        }
    },
    project: {
        edition: "mes"
    },
    isNeedView: true,
    rootDir: path.join(__dirname, "../yujiang.Foil.Node.WebServer"),
    logDir: path.join(__dirname, "./system/log"),
    autoRunDirs:[path.join(__dirname, "./biz/auto")],
    routeDirs: [{
        isNeedAuthorityCheck: true,
        rootDir: path.join(__dirname, "../yujiang.Foil.Node.BizServer"),
        dir: path.join(__dirname, "../yujiang.Foil.Node.BizServer/biz")
    }, {
        rootDir: path.join(__dirname, "../yujiang.Foil.Node.WebServer"),
        dir: path.join(__dirname, "../yujiang.Foil.Node.WebServer/app")
    },{
        isNeedAuthorityCheck: true,
        rootDir: path.join(__dirname),
        dir: path.join(__dirname, "./biz")
    }, {
        rootDir: path.join(__dirname, "./web"),
        dir: path.join(__dirname, "./web/app")
    }],
    staticDirs: [
        path.join(__dirname, "../node_modules"),
        path.join(__dirname, "../yujiang.Foil.Node/client"),
        path.join(__dirname, "../yujiang.Foil.Node/src/client"),
        path.join(__dirname, "../yujiang.Foil.Node.WebServer/client"),  
        path.join(__dirname, "./web/client"),  
    ],
    requireDirs: {
        "yujiang.Foil": path.join(__dirname, "../yujiang.Foil.Node/src"),
        "acroprise.MultiLang": path.join(__dirname, "../MultiLanguage/Component/JavaScript/Acroprise.MultiLang.JavaScript/src"),
        "yujiang.Foil.Biz":path.join(__dirname, "../yujiang.Foil.Node.BizServer/biz")
    },
    locale: {
        DDFile: path.join(__dirname, "../yujiang.Foil.Node.Lng/Unicode.lng"),
        LCID: 2052
    },
    cache:{
        engine:"native",
        connection:{
            dir:path.join(__dirname,'./uploaded')
        },
        isCacheView:false
    }
}
module.exports = config;
