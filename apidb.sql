-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.10-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 imes_component_api 的数据库结构
CREATE DATABASE IF NOT EXISTS `imes_component_api` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `imes_component_api`;

-- 导出  表 imes_component_api.alltypes 结构
CREATE TABLE IF NOT EXISTS `alltypes` (
  `TypeOID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeAID` varchar(256) COLLATE utf8_bin NOT NULL,
  `TypeName` varchar(256) COLLATE utf8_bin NOT NULL,
  `TypeValue` varchar(256) COLLATE utf8_bin NOT NULL,
  `Category` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  `OrgOID` int(11) DEFAULT NULL COMMENT 'null:公共参数；非null：对应组织私有参数',
  PRIMARY KEY (`TypeOID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.alltypes 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `alltypes` DISABLE KEYS */;
INSERT INTO `alltypes` (`TypeOID`, `TypeAID`, `TypeName`, `TypeValue`, `Category`, `SortNumber`, `OrgOID`) VALUES
	(6, '6', '外部', '', 'OrgType', NULL, NULL),
	(8, '8', '弘讯内部', '', 'OrgType', NULL, NULL),
	(9, '9', '工具目录', '', 'OrgType', NULL, NULL);
/*!40000 ALTER TABLE `alltypes` ENABLE KEYS */;

-- 导出  表 imes_component_api.api_restservices 结构
CREATE TABLE IF NOT EXISTS `api_restservices` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectSource` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TableOID` int(11) NOT NULL,
  `UrlPath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Parameters` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.api_restservices 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `api_restservices` DISABLE KEYS */;
INSERT INTO `api_restservices` (`OID`, `ProjectSource`, `TableOID`, `UrlPath`, `Parameters`, `Description`) VALUES
	(1, 'MES', 1, '/api/getInfosApi', '{DataOID:[],type:""}', 'DataOID:查询数据的OID数组；type：查询内容（comWareHouse）'),
	(2, 'MES', 2, '/api/getInfosApi', '{DataOID:[],type:""}', 'DataOID:查询数据的OID数组；type：查询内容（comproduct）'),
	(3, 'MES', 3, '/api/getInfosApi', '{DataOID:[],type:""}', 'DataOID:查询数据的OID数组；type：查询内容（comProductClass）'),
	(4, 'MES', 4, '/api/getInfosApi', '{DataOID:[],type:""}', 'DataOID:查询数据的OID数组；type：查询内容（prdSubsMats）'),
	(5, 'MES', 5, '/api/getInfosApi', '{DataOID:[],type:""}', 'DataOID:查询数据的OID数组；type：查询内容（prdProdRec）');
/*!40000 ALTER TABLE `api_restservices` ENABLE KEYS */;

-- 导出  表 imes_component_api.api_tables 结构
CREATE TABLE IF NOT EXISTS `api_tables` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `TableName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.api_tables 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `api_tables` DISABLE KEYS */;
INSERT INTO `api_tables` (`OID`, `TableName`, `Description`) VALUES
	(1, 'comWareHouse', '仓库资料'),
	(2, 'comproduct', '产品基础资料'),
	(3, 'comProductClass', '产品类别'),
	(4, 'prdSubsMats', '产品替代物料'),
	(5, 'prdProdRec', '厂内领料单'),
	(6, 'comDepartment', '部门信息'),
	(7, 'prdMKOrdMain', '生产制令单');
/*!40000 ALTER TABLE `api_tables` ENABLE KEYS */;

-- 导出  表 imes_component_api.comdepartment 结构
CREATE TABLE IF NOT EXISTS `comdepartment` (
  `OID` int(11) NOT NULL,
  `ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateByID` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreateByName` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.comdepartment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `comdepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comdepartment` ENABLE KEYS */;

-- 导出  表 imes_component_api.comproduct 结构
CREATE TABLE IF NOT EXISTS `comproduct` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ClassID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ProdForm` smallint(2) DEFAULT NULL,
  `Description` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreateByID` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreateByName` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.comproduct 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `comproduct` DISABLE KEYS */;
INSERT INTO `comproduct` (`OID`, `ID`, `Name`, `ClassID`, `ProdForm`, `Description`, `CreateByID`, `CreateByName`) VALUES
	(1, 'test01', 'test01', 'A1', NULL, NULL, 'Admin', '管理员'),
	(2, 'test02', 'test02', 'A1', NULL, NULL, 'Admin', '管理员'),
	(3, 'test02', 'test02', 'A1', NULL, NULL, 'Admin', '管理员');
/*!40000 ALTER TABLE `comproduct` ENABLE KEYS */;

-- 导出  表 imes_component_api.comproductclass 结构
CREATE TABLE IF NOT EXISTS `comproductclass` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CreateByID` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreateByName` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.comproductclass 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `comproductclass` DISABLE KEYS */;
INSERT INTO `comproductclass` (`OID`, `ID`, `Name`, `CreateByID`, `CreateByName`) VALUES
	(1, 'test', 'test', 'Admin', '管理员'),
	(2, 'test02', 'test02', 'Admin', '管理员');
/*!40000 ALTER TABLE `comproductclass` ENABLE KEYS */;

-- 导出  表 imes_component_api.comwarehouse 结构
CREATE TABLE IF NOT EXISTS `comwarehouse` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(16) COLLATE utf8_bin NOT NULL,
  `Name` varchar(128) COLLATE utf8_bin NOT NULL,
  `Description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CreateByID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `CreateByName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.comwarehouse 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `comwarehouse` DISABLE KEYS */;
INSERT INTO `comwarehouse` (`OID`, `ID`, `Name`, `Description`, `CreateByID`, `CreateByName`) VALUES
	(1, 'test测试', 'test测试', 'test测试', 'Admin', '管理员'),
	(4, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(5, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(6, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(7, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(8, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(9, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(10, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(11, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(12, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(13, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(14, 'test测试1', 'test测试1', '', 'Admin', '管理员'),
	(15, 'test测试1', 'test测试1', '', 'Admin', '管理员'),
	(16, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(17, 'test测试', 'test测试', '', 'Admin', '管理员'),
	(18, 'TM_C', '临时仓', '测试临时仓库', 'Admin', '管理员');
/*!40000 ALTER TABLE `comwarehouse` ENABLE KEYS */;

-- 导出  表 imes_component_api.dataaynchmappings 结构
CREATE TABLE IF NOT EXISTS `dataaynchmappings` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目来源',
  `TableName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `DataOID` int(11) DEFAULT NULL COMMENT '数据源OID',
  `TempDataOID` int(11) DEFAULT -1,
  `SynchMold` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SynchFlag` int(11) NOT NULL COMMENT '0.插入',
  `SynchType` int(1) NOT NULL COMMENT '1.新增   2.修改 3.删除',
  `CreateTime` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.dataaynchmappings 的数据：~179 rows (大约)
/*!40000 ALTER TABLE `dataaynchmappings` DISABLE KEYS */;
INSERT INTO `dataaynchmappings` (`OID`, `ProjectName`, `TableName`, `ID`, `Name`, `DataOID`, `TempDataOID`, `SynchMold`, `SynchFlag`, `SynchType`, `CreateTime`) VALUES
	(1, 'MES', 'prdSubsMats', '08CM600THYB3HS500B65400L', '油电机控制系统hyb3', 12, 1, 'DataBase', 0, 1, '2018-10-29 12:52:59'),
	(2, 'MES', 'prdSubsMats', '08CM600THYB3HS500B65400L', '油电机控制系统hyb3', 12, 2, 'DataBase', 0, 2, '2018-10-29 12:53:05'),
	(3, 'MES', 'prdSubsMats', '08CM600THYB3HS500B65400L', '油电机控制系统hyb3', 12, 3, 'DataBase', 0, 3, '2018-10-29 12:53:08'),
	(16, 'ERP', 'comWareHouse', 'test测试', 'test测试', NULL, 13, 'DataBase', 2, 1, '2018-10-30 10:30:00'),
	(18, 'ERP', 'comWareHouse', 'test测试1', 'test测试1', 43, 14, NULL, 2, 3, '2018-10-30 10:30:00'),
	(22, 'ERP', 'comproduct', 'test01', 'test01', 50488, 3, 'Database', 2, 3, '2018-10-30 10:30:00'),
	(23, 'ERP', 'comProductClass', 'test', 'test', -1, 1, 'DataBase', 2, 1, '2018-10-30 10:30:00'),
	(24, 'ERP', 'comProductClass', 'TEST01', 'TEST01', 626, 2, 'DataBase', 2, 3, '2018-10-30 10:30:00'),
	(25, 'ERP', 'prdProdRec', 'TEST01', 'TEST01', -1, 1, 'DataBase', 2, 1, '2018-10-30 10:30:00'),
	(26, 'ERP', 'comWareHouse', 'TM_C', '临时仓', -1, 18, 'DataBase', 2, 1, '2018-11-1 10:05:00'),
	(27, 'erp', 'prdMKOrdMain', '1812J059', '厂内制令主表', NULL, -1, 'DataBase', 0, 9, '2018-12-06 18:01:29'),
	(28, 'erp', 'prdMKOrdMain', '1812J060', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(29, 'erp', 'prdMKOrdMain', '1812J061', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(30, 'erp', 'prdMKOrdMain', '1812JE004', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(31, 'erp', 'prdMKOrdMain', '1812HB055', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(32, 'erp', 'prdMKOrdMain', '1812JE005', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(33, 'erp', 'prdMKOrdMain', '1812JE001', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(34, 'erp', 'prdMKOrdMain', '1812JE003', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(35, 'erp', 'prdMKOrdMain', '1812J064', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(36, 'erp', 'prdMKOrdMain', '1812J062', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(37, 'erp', 'prdMKOrdMain', '1812J063', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(38, 'erp', 'prdMKOrdMain', '1812JE002', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(39, 'erp', 'prdMKOrdMain', '1812J065', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(40, 'erp', 'prdMKOrdMain', '1812HB056', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(41, 'erp', 'prdMKOrdMain', '1812HB058', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(42, 'erp', 'prdMKOrdMain', '1812HB059', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(43, 'erp', 'prdMKOrdMain', '1812HB057', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(44, 'erp', 'prdMKOrdMain', '1812HB061', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(45, 'erp', 'prdMKOrdMain', '1812HB062', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(46, 'erp', 'prdMKOrdMain', '1812HB063', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(47, 'erp', 'prdMKOrdMain', '1812HB064', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(48, 'erp', 'prdMKOrdMain', '1812HB065', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(49, 'erp', 'prdMKOrdMain', '1812HB060', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(50, 'erp', 'prdMKOrdMain', '1812HC070', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(51, 'erp', 'prdMKOrdMain', '1812HC071', '厂内制令主表', NULL, -1, 'DataBase', 0, 3, '2018-12-06 18:01:29'),
	(52, 'erp', 'prdMKOrdMain', '1812HC071', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(53, 'erp', 'prdMKOrdMain', '1812HC072', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(54, 'erp', 'prdMKOrdMain', '1812HC073', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(55, 'erp', 'prdMKOrdMain', '1812HC074', '厂内制令主表', NULL, -1, 'DataBase', 0, 3, '2018-12-06 18:01:29'),
	(56, 'erp', 'prdMKOrdMain', '1812HC074', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(57, 'erp', 'prdMKOrdMain', '1812HC077', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(58, 'erp', 'prdMKOrdMain', '1812HC076', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(59, 'erp', 'prdMKOrdMain', '1812HC075', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(60, 'erp', 'prdMKOrdMain', '1812HC078', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(61, 'erp', 'prdMKOrdMain', '1812HC079', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(62, 'erp', 'prdMKOrdMain', '1812HD008', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(63, 'erp', 'prdMKOrdMain', '1812HD009', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(64, 'erp', 'prdMKOrdMain', '1812HD010', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(65, 'erp', 'prdMKOrdMain', '1812HD011', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(66, 'erp', 'prdMKOrdMain', '1812HE082', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(67, 'erp', 'prdMKOrdMain', '1812HE083', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(68, 'erp', 'prdMKOrdMain', '1812HE084', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(69, 'erp', 'prdMKOrdMain', '1812HE081', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(70, 'erp', 'prdMKOrdMain', '1812HE085', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(71, 'erp', 'prdMKOrdMain', '1812HE087', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(72, 'erp', 'prdMKOrdMain', '1812HE088', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(73, 'erp', 'prdMKOrdMain', '1812HE086', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(74, 'erp', 'prdMKOrdMain', '1812HE090', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(75, 'erp', 'prdMKOrdMain', '1812HF028', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(76, 'erp', 'prdMKOrdMain', '1812HF029', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(77, 'erp', 'prdMKOrdMain', '1812HF030', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(78, 'erp', 'prdMKOrdMain', '1812HF031', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(79, 'erp', 'prdMKOrdMain', '1812HE089', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(80, 'erp', 'prdMKOrdMain', '1812HG021', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(81, 'erp', 'prdMKOrdMain', '1812HG023', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(82, 'erp', 'prdMKOrdMain', '1812HG022', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(83, 'erp', 'prdMKOrdMain', '1812J060', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(84, 'erp', 'prdMKOrdMain', '1812J063', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(85, 'erp', 'prdMKOrdMain', '1812J064', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(86, 'erp', 'prdMKOrdMain', '1812JA048', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(87, 'erp', 'prdMKOrdMain', '1812J065', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(88, 'erp', 'prdMKOrdMain', '1812J061', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(89, 'erp', 'prdMKOrdMain', '1812J062', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(90, 'erp', 'prdMKOrdMain', '1812JA049', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(91, 'erp', 'prdMKOrdMain', '1812JA050', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(92, 'erp', 'prdMKOrdMain', '1812JA051', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(93, 'erp', 'prdMKOrdMain', '1812JA052', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(94, 'erp', 'prdMKOrdMain', '1812JA054', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(95, 'erp', 'prdMKOrdMain', '1812JB067', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(96, 'erp', 'prdMKOrdMain', '1812JA055', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(97, 'erp', 'prdMKOrdMain', '1812JB068', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(98, 'erp', 'prdMKOrdMain', '1812JB070', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(99, 'erp', 'prdMKOrdMain', '1812JA053', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(100, 'erp', 'prdMKOrdMain', '1812JB069', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:01:29'),
	(101, 'ERP', 'prdMKOrdMain', '1812J059', '厂内制令主表', NULL, -1, 'DataBase', 0, 9, '2018-12-06 18:08:13'),
	(102, 'ERP', 'prdMKOrdMain', '1812J060', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(103, 'ERP', 'prdMKOrdMain', '1812J061', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(104, 'ERP', 'prdMKOrdMain', '1812J062', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(105, 'ERP', 'prdMKOrdMain', '1812J063', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(106, 'ERP', 'prdMKOrdMain', '1812J064', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(107, 'ERP', 'prdMKOrdMain', '1812J065', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(108, 'ERP', 'prdMKOrdMain', '1812JE001', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(109, 'ERP', 'prdMKOrdMain', '1812JE002', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(110, 'ERP', 'prdMKOrdMain', '1812JE003', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(111, 'ERP', 'prdMKOrdMain', '1812JE004', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(112, 'ERP', 'prdMKOrdMain', '1812HB055', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(113, 'ERP', 'prdMKOrdMain', '1812JE005', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(114, 'ERP', 'prdMKOrdMain', '1812HB057', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(115, 'ERP', 'prdMKOrdMain', '1812HB058', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(116, 'ERP', 'prdMKOrdMain', '1812HB059', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(117, 'ERP', 'prdMKOrdMain', '1812HB060', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(118, 'ERP', 'prdMKOrdMain', '1812HB061', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(119, 'ERP', 'prdMKOrdMain', '1812HB056', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(120, 'ERP', 'prdMKOrdMain', '1812HB062', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(121, 'ERP', 'prdMKOrdMain', '1812HB063', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(122, 'ERP', 'prdMKOrdMain', '1812HB064', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(123, 'ERP', 'prdMKOrdMain', '1812HB065', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(124, 'ERP', 'prdMKOrdMain', '1812HC071', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(125, 'ERP', 'prdMKOrdMain', '1812HC070', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(126, 'ERP', 'prdMKOrdMain', '1812HC073', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(127, 'ERP', 'prdMKOrdMain', '1812HC074', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(128, 'ERP', 'prdMKOrdMain', '1812HC075', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(129, 'ERP', 'prdMKOrdMain', '1812HC076', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(130, 'ERP', 'prdMKOrdMain', '1812HC072', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(131, 'ERP', 'prdMKOrdMain', '1812HC077', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(132, 'ERP', 'prdMKOrdMain', '1812HC078', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(133, 'ERP', 'prdMKOrdMain', '1812HC079', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(134, 'ERP', 'prdMKOrdMain', '1812HD008', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(135, 'ERP', 'prdMKOrdMain', '1812HD010', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(136, 'ERP', 'prdMKOrdMain', '1812HD011', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(137, 'ERP', 'prdMKOrdMain', '1812HE081', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(138, 'ERP', 'prdMKOrdMain', '1812HE082', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(139, 'ERP', 'prdMKOrdMain', '1812HE083', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(140, 'ERP', 'prdMKOrdMain', '1812HD009', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(141, 'ERP', 'prdMKOrdMain', '1812HE084', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(142, 'ERP', 'prdMKOrdMain', '1812HE085', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(143, 'ERP', 'prdMKOrdMain', '1812HE088', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(144, 'ERP', 'prdMKOrdMain', '1812HE089', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(145, 'ERP', 'prdMKOrdMain', '1812HF028', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(146, 'ERP', 'prdMKOrdMain', '1812HE090', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(147, 'ERP', 'prdMKOrdMain', '1812HE086', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(148, 'ERP', 'prdMKOrdMain', '1812HE087', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(149, 'ERP', 'prdMKOrdMain', '1812HF029', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(150, 'ERP', 'prdMKOrdMain', '1812HF030', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(151, 'ERP', 'prdMKOrdMain', '1812HG021', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(152, 'ERP', 'prdMKOrdMain', '1812HF031', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(153, 'ERP', 'prdMKOrdMain', '1812J060', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(154, 'ERP', 'prdMKOrdMain', '1812J062', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(155, 'ERP', 'prdMKOrdMain', '1812HG022', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(156, 'ERP', 'prdMKOrdMain', '1812HG023', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(157, 'ERP', 'prdMKOrdMain', '1812J061', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(158, 'ERP', 'prdMKOrdMain', '1812J063', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(159, 'ERP', 'prdMKOrdMain', '1812J064', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(160, 'ERP', 'prdMKOrdMain', '1812J065', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(161, 'ERP', 'prdMKOrdMain', '1812JA048', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(162, 'ERP', 'prdMKOrdMain', '1812JA049', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(163, 'ERP', 'prdMKOrdMain', '1812JA050', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(164, 'ERP', 'prdMKOrdMain', '1812JA052', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(165, 'ERP', 'prdMKOrdMain', '1812JA053', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(166, 'ERP', 'prdMKOrdMain', '1812JA054', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(167, 'ERP', 'prdMKOrdMain', '1812JA055', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(168, 'ERP', 'prdMKOrdMain', '1812JB067', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(169, 'ERP', 'prdMKOrdMain', '1812JA051', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(170, 'ERP', 'prdMKOrdMain', '1812JB068', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(171, 'ERP', 'prdMKOrdMain', '1812JB069', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(172, 'ERP', 'prdMKOrdMain', '1812JB070', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(173, 'ERP', 'prdMKOrdMain', '1812JB071', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(174, 'ERP', 'prdMKOrdMain', '1812JB072', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(175, 'ERP', 'prdMKOrdMain', '1812JC079', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(176, 'ERP', 'prdMKOrdMain', '1812JC080', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(177, 'ERP', 'prdMKOrdMain', '1812JC082', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(178, 'ERP', 'prdMKOrdMain', '1812JC083', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(179, 'ERP', 'prdMKOrdMain', '1812JC084', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(180, 'ERP', 'prdMKOrdMain', '1812JC081', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(181, 'ERP', 'prdMKOrdMain', '1812JC085', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(182, 'ERP', 'prdMKOrdMain', '1812JC086', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(183, 'ERP', 'prdMKOrdMain', '1812JC088', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(184, 'ERP', 'prdMKOrdMain', '1812JC089', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(185, 'ERP', 'prdMKOrdMain', '1812JC090', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(186, 'ERP', 'prdMKOrdMain', '1812JC091', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(187, 'ERP', 'prdMKOrdMain', '1812JE001', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(188, 'ERP', 'prdMKOrdMain', '1812JE002', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(189, 'ERP', 'prdMKOrdMain', '1812JC087', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(190, 'ERP', 'prdMKOrdMain', '1812JE003', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(191, 'ERP', 'prdMKOrdMain', '1812JE004', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(192, 'ERP', 'prdMKOrdMain', '1812JE005', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(193, 'ERP', 'prdMKOrdMain', '1812JK004', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(194, 'ERP', 'prdMKOrdMain', '1812JK006', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13'),
	(195, 'ERP', 'prdMKOrdMain', '1812JK005', '厂内制令主表', NULL, -1, 'DataBase', 0, 1, '2018-12-06 18:08:13');
/*!40000 ALTER TABLE `dataaynchmappings` ENABLE KEYS */;

-- 导出  表 imes_component_api.ddprocessescontent 结构
CREATE TABLE IF NOT EXISTS `ddprocessescontent` (
  `DDKey` varchar(128) COLLATE utf8_bin NOT NULL,
  `LCID` int(11) NOT NULL,
  `SeqNo` int(11) NOT NULL,
  `DisplayValue` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CatalogID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`DDKey`,`LCID`,`SeqNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.ddprocessescontent 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ddprocessescontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ddprocessescontent` ENABLE KEYS */;

-- 导出  表 imes_component_api.orgs 结构
CREATE TABLE IF NOT EXISTS `orgs` (
  `OrgOID` int(11) NOT NULL AUTO_INCREMENT,
  `OrgOIDParent` int(11) NOT NULL,
  `OrgAID` varchar(64) COLLATE utf8_bin NOT NULL,
  `Name` varchar(64) COLLATE utf8_bin NOT NULL,
  `Category` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Company` int(11) DEFAULT NULL,
  `ManufacturingCenter` int(11) DEFAULT NULL,
  `FinancialCenter` int(11) DEFAULT NULL,
  `ProfitCenter` int(11) DEFAULT NULL,
  `CostCenter` int(11) DEFAULT NULL,
  `LevelNumber` int(11) DEFAULT NULL,
  `OfficerOID` int(11) DEFAULT NULL,
  `Address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Contactor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ContactorPhone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ContactorMobile` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ContactorEMail` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `OrgTypeOID` int(11) DEFAULT NULL,
  `VI_Logo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `VI_Name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `VI_Description` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `VI_Banner` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrgOID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.orgs 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `orgs` DISABLE KEYS */;
INSERT INTO `orgs` (`OrgOID`, `OrgOIDParent`, `OrgAID`, `Name`, `Category`, `Description`, `Company`, `ManufacturingCenter`, `FinancialCenter`, `ProfitCenter`, `CostCenter`, `LevelNumber`, `OfficerOID`, `Address`, `Phone`, `Contactor`, `ContactorPhone`, `ContactorMobile`, `ContactorEMail`, `OrgTypeOID`, `VI_Logo`, `VI_Name`, `VI_Description`, `VI_Banner`, `SortNumber`) VALUES
	(1, 1, '弘讯', '弘讯', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', '', 8, NULL, '', '', NULL, 1),
	(2, -1, 'HMIPrint', 'HMIPrint', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', '', 9, NULL, '', '', NULL, 2),
	(3, 2, '厂家', '厂家', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', '', 9, NULL, '', '', NULL, 1),
	(4, 3, '爱科', '爱科', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', '', 6, NULL, '', '', NULL, 1);
/*!40000 ALTER TABLE `orgs` ENABLE KEYS */;

-- 导出  表 imes_component_api.prdprodrec 结构
CREATE TABLE IF NOT EXISTS `prdprodrec` (
  `OID` int(11) NOT NULL,
  `BillNO` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillDate` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProdID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MkOrdType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateByID` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreateByName` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.prdprodrec 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `prdprodrec` DISABLE KEYS */;
INSERT INTO `prdprodrec` (`OID`, `BillNO`, `BillDate`, `ProdID`, `MkOrdType`, `CreateByID`, `CreateByName`) VALUES
	(1, '20010001', '20181030', '00TKCA60M5C', NULL, NULL, NULL);
/*!40000 ALTER TABLE `prdprodrec` ENABLE KEYS */;

-- 导出  表 imes_component_api.prdsubsmats 结构
CREATE TABLE IF NOT EXISTS `prdsubsmats` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `MainProdID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRI` int(11) DEFAULT NULL,
  `ReplProdID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateByID` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreateByName` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.prdsubsmats 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `prdsubsmats` DISABLE KEYS */;
INSERT INTO `prdsubsmats` (`OID`, `MainProdID`, `PRI`, `ReplProdID`, `CreateByID`, `CreateByName`) VALUES
	(1, '08CM600THYB3HS500B65400L', 1, '08AK070THYB3HS333B25', 'Admin', '管理员'),
	(2, '08CM600THYB3HS500B65400L', 2, '08AK070THYB3HS333B25', 'Admin', '管理员'),
	(3, '08CM600THYB3HS500B65400L', 2, '08AK070THYB3HS333B25', 'Admin', '管理员');
/*!40000 ALTER TABLE `prdsubsmats` ENABLE KEYS */;

-- 导出  表 imes_component_api.processes 结构
CREATE TABLE IF NOT EXISTS `processes` (
  `ProcessOID` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessOIDParent` int(11) NOT NULL DEFAULT 0,
  `ProcessAID` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'AID',
  `Name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'Name',
  `Category` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `ExecType` int(11) NOT NULL DEFAULT 0,
  `ExecMode` int(11) NOT NULL DEFAULT 0,
  `ExecName` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Route` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ArgumentList` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `LevelNumber` int(11) NOT NULL DEFAULT 0,
  `SortNumber` int(11) NOT NULL DEFAULT 0,
  `ImageAID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ColorOdd` int(11) DEFAULT NULL,
  `ColorEven` int(11) DEFAULT NULL,
  `Hidden` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProcessOID`),
  UNIQUE KEY `UNIQUE` (`ProcessAID`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.processes 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `processes` DISABLE KEYS */;
INSERT INTO `processes` (`ProcessOID`, `ProcessOIDParent`, `ProcessAID`, `Name`, `Category`, `Description`, `ExecType`, `ExecMode`, `ExecName`, `Route`, `ArgumentList`, `LevelNumber`, `SortNumber`, `ImageAID`, `ColorOdd`, `ColorEven`, `Hidden`) VALUES
	(97, 106, 'System Log', '系统日志', 'Root', '', 4, 0, '/app/system/log/showLoginLogs', '0', NULL, 2, 500, '', NULL, NULL, 0),
	(104, 106, 'Users', '系统用户', 'Root', '', 0, 0, '/app/system/authority2/user/showUsers', '0', NULL, 1, 100, '', NULL, NULL, 0),
	(106, 93, 'Authority', 'FOIL系统授权', 'Root', '', 4, 0, '', '0', NULL, 2, 400, '', NULL, NULL, 0),
	(146, 106, 'Processes', '系统功能', NULL, '', 0, 0, '/app/system/authority2/process/showProcesses', '0', NULL, 0, 0, '', NULL, NULL, 0),
	(163, 106, 'RoleAthority', '系统授权', NULL, '', 0, 0, '/app/system/authority2/roleAuthority/showRoleAuthority', '0', NULL, 0, 3, '', NULL, NULL, 0),
	(164, 106, 'Roles', '系统角色', NULL, '', 0, 0, '/app/system/authority2/role/showRoles', '0', NULL, 0, 2, '', NULL, NULL, 0),
	(169, 106, 'Orgs', '系统组织', NULL, '', 0, 0, '/app/system/authority2/org/showOrgs', '0', NULL, 0, 1, '', NULL, NULL, 0),
	(172, -1, 'API', 'API接口前端', NULL, '', 0, 0, '', NULL, NULL, 0, 80, '', NULL, NULL, 0),
	(173, 172, 'getERPMKORD', 'MES 数据接口', NULL, '', 0, 0, '/app/API/getERPMKOrd', NULL, NULL, 0, 81, '', NULL, NULL, 0),
	(174, 172, 'uploadPic', 'uploadPic', NULL, '', 0, 0, '/app/bear/uploadPic', NULL, NULL, 0, 82, '', NULL, NULL, 0),
	(175, 172, 'bearAdd', '子页面3', NULL, '', 0, 0, '/app/bear/BearAdd', NULL, NULL, 0, 83, '', NULL, NULL, 0),
	(176, 172, 'bearTest', '子测试页', NULL, '', 0, 0, '/app/bear/BearTest', NULL, NULL, 0, 84, '', NULL, NULL, 0);
/*!40000 ALTER TABLE `processes` ENABLE KEYS */;

-- 导出  表 imes_component_api.processesactions 结构
CREATE TABLE IF NOT EXISTS `processesactions` (
  `ActionOID` int(11) NOT NULL AUTO_INCREMENT,
  `ActionAID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Category` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  `ImageAID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ActionOID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.processesactions 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `processesactions` DISABLE KEYS */;
INSERT INTO `processesactions` (`ActionOID`, `ActionAID`, `Name`, `Category`, `SortNumber`, `ImageAID`) VALUES
	(1, 'MInsert', 'Insert', 'Master', 1, NULL),
	(2, 'MEdit', 'Edit', 'Master', 2, NULL),
	(3, 'MDelete', 'Delete', 'Master', 3, NULL),
	(4, 'MExport', 'Export', 'Master', 4, NULL),
	(5, 'MPrint', 'Print', 'Master', 5, NULL),
	(21, 'DInsert', 'Insert', 'Detail', 21, NULL),
	(22, 'DEdit', 'Edit', 'Detail', 22, NULL),
	(23, 'DDelete', 'Delete', 'Detail', 23, NULL),
	(24, 'DExport', 'Export', 'Detail', 24, NULL),
	(25, 'DPrint', 'Print', 'Detail', 25, NULL);
/*!40000 ALTER TABLE `processesactions` ENABLE KEYS */;

-- 导出  表 imes_component_api.projectdatamappings 结构
CREATE TABLE IF NOT EXISTS `projectdatamappings` (
  `MapOID` int(11) NOT NULL AUTO_INCREMENT,
  `TableOID` int(11) NOT NULL,
  `TableField` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ProjectSource` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ProjectField` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MapOID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  imes_component_api.projectdatamappings 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `projectdatamappings` DISABLE KEYS */;
INSERT INTO `projectdatamappings` (`MapOID`, `TableOID`, `TableField`, `ProjectSource`, `ProjectField`) VALUES
	(1, 2, 'ID', 'ERP', 'ProdID'),
	(2, 2, 'Name', 'ERP', 'ProdName'),
	(3, 2, 'ClassID', 'ERP', 'ClassID'),
	(4, 2, 'ProdForm', 'ERP', 'ProdForm'),
	(5, 1, 'ID', 'ERP', 'WareHouseID'),
	(6, 1, 'Name', 'ERP', 'WareHouseName'),
	(7, 3, 'ID', 'ERP', 'ClassID'),
	(8, 3, 'Name', 'ERP', 'ClassName'),
	(9, 4, 'MainProdID', 'ERP', 'MainProdID'),
	(16, 4, 'ReplProdID', 'ERP', 'ReplProdID'),
	(17, 4, 'PRI', 'ERP', 'PRI'),
	(18, 2, 'ID', 'MES', 'ItemCode'),
	(19, 2, 'Name', 'MES', 'ItemName'),
	(20, 2, 'ClassID', 'MES', 'ChiItemType'),
	(21, 2, 'ProdForm', 'MES', 'ChiItemType'),
	(23, 1, 'ID', 'MES', 'WarehouseCode'),
	(24, 1, 'Name', 'MES', 'WarehouseName'),
	(25, 1, 'ID', 'MES', 'LookupCode'),
	(26, 1, 'Name', 'MES', 'LookupName'),
	(27, 1, 'MainProdID', 'MES', 'MainProdOID--ItemCode'),
	(28, 1, 'ReplProdID', 'MES', 'ReplProdOID--ItemCode'),
	(29, 1, 'PRI', 'MES', 'SortNumber');
/*!40000 ALTER TABLE `projectdatamappings` ENABLE KEYS */;

-- 导出  表 imes_component_api.projects 结构
CREATE TABLE IF NOT EXISTS `projects` (
  `ProjectOID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `ProcessTable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'Processes',
  `ActionTable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'ProcessesActions',
  `DDTable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'DDProcessesContent',
  `RoleAuthorityTable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'RolesAuthority',
  `UserAuthorityTable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'UsersAuthority',
  `SortNumber` int(11) DEFAULT NULL,
  `ImageTable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'ProcessesImages',
  PRIMARY KEY (`ProjectOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.projects 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`ProjectOID`, `ProjectName`, `Description`, `ProcessTable`, `ActionTable`, `DDTable`, `RoleAuthorityTable`, `UserAuthorityTable`, `SortNumber`, `ImageTable`) VALUES
	(1, 'mes', NULL, 'Processes', 'ProcessesActions', 'DDProcessesContent', 'RolesAuthority', 'UsersAuthority', 1, 'ProcessesImages');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- 导出  表 imes_component_api.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `RoleOID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleAID` varchar(64) COLLATE utf8_bin NOT NULL,
  `Name` varchar(64) COLLATE utf8_bin NOT NULL,
  `Description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `OrgOID` int(11) DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoleOID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.roles 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`RoleOID`, `RoleAID`, `Name`, `Description`, `OrgOID`, `SortNumber`) VALUES
	(1, '01', '厂家级', NULL, 4, 1),
	(2, '01', 'HMIPrint管理员', NULL, 1, 1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 导出  表 imes_component_api.rolesauthority 结构
CREATE TABLE IF NOT EXISTS `rolesauthority` (
  `RoleOID` int(11) NOT NULL,
  `ProcessOID` int(11) NOT NULL,
  `ActionOID` int(11) NOT NULL,
  `Value` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoleOID`,`ProcessOID`,`ActionOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.rolesauthority 的数据：~30 rows (大约)
/*!40000 ALTER TABLE `rolesauthority` DISABLE KEYS */;
INSERT INTO `rolesauthority` (`RoleOID`, `ProcessOID`, `ActionOID`, `Value`) VALUES
	(1, 183, 1, 1),
	(1, 183, 2, 1),
	(1, 183, 3, 1),
	(1, 183, 4, 1),
	(1, 183, 5, 1),
	(1, 183, 21, 1),
	(1, 183, 22, 1),
	(1, 183, 23, 1),
	(1, 183, 24, 1),
	(1, 183, 25, 1),
	(2, 183, 1, 1),
	(2, 183, 2, 1),
	(2, 183, 3, 1),
	(2, 183, 4, 1),
	(2, 183, 5, 1),
	(2, 183, 21, 1),
	(2, 183, 22, 1),
	(2, 183, 23, 1),
	(2, 183, 24, 1),
	(2, 183, 25, 1),
	(2, 190, 1, 1),
	(2, 190, 2, 1),
	(2, 190, 3, 1),
	(2, 190, 4, 1),
	(2, 190, 5, 1),
	(2, 190, 21, 1),
	(2, 190, 22, 1),
	(2, 190, 23, 1),
	(2, 190, 24, 1),
	(2, 190, 25, 1);
/*!40000 ALTER TABLE `rolesauthority` ENABLE KEYS */;

-- 导出  表 imes_component_api.systemlogs 结构
CREATE TABLE IF NOT EXISTS `systemlogs` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `UserAID` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `SessionID` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `HostName` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `HostIP` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `LoginTime` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `LogoutTime` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `Country` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `Province` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `City` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  `Location` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.systemlogs 的数据：~301 rows (大约)
/*!40000 ALTER TABLE `systemlogs` DISABLE KEYS */;
INSERT INTO `systemlogs` (`OID`, `UserAID`, `SessionID`, `HostName`, `HostIP`, `LoginTime`, `LogoutTime`, `Country`, `Province`, `City`, `Latitude`, `Longitude`, `Location`) VALUES
	(1, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-17 06:22:26', NULL, '', '', '', NULL, NULL, NULL),
	(2, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-17 06:41:21', NULL, '', '', '', NULL, NULL, NULL),
	(3, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-17 07:15:49', NULL, '', '', '', NULL, NULL, NULL),
	(4, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-18 01:28:30', NULL, '', '', '', NULL, NULL, NULL),
	(5, '101', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-18 07:39:56', NULL, '', '', '', NULL, NULL, NULL),
	(6, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-18 07:40:14', NULL, '', '', '', NULL, NULL, NULL),
	(7, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-18 23:58:28', NULL, '', '', '', NULL, NULL, NULL),
	(8, 'user', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-19 00:47:24', NULL, '', '', '', NULL, NULL, NULL),
	(9, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-19 00:47:40', NULL, '', '', '', NULL, NULL, NULL),
	(10, 'John', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-19 00:50:44', NULL, '', '', '', NULL, NULL, NULL),
	(11, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-19 00:51:03', NULL, '', '', '', NULL, NULL, NULL),
	(12, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-19 05:18:07', NULL, '', '', '', NULL, NULL, NULL),
	(13, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-20 05:43:06', NULL, '', '', '', NULL, NULL, NULL),
	(14, 'John', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-20 05:59:12', NULL, '', '', '', NULL, NULL, NULL),
	(15, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-20 05:59:30', NULL, '', '', '', NULL, NULL, NULL),
	(16, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-20 07:18:20', NULL, '', '', '', NULL, NULL, NULL),
	(17, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-21 06:58:55', NULL, '', '', '', NULL, NULL, NULL),
	(18, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 SE 2.X MetaSr 1.0', '::ffff:172.16.3.45', '2018-09-21 07:03:32', NULL, '', '', '', NULL, NULL, NULL),
	(19, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-25 01:02:47', NULL, '', '', '', NULL, NULL, NULL),
	(20, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-25 07:29:33', NULL, '', '', '', NULL, NULL, NULL),
	(21, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-26 03:05:31', NULL, '', '', '', NULL, NULL, NULL),
	(22, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-26 08:04:07', NULL, '', '', '', NULL, NULL, NULL),
	(23, 'John', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-26 08:59:35', NULL, '', '', '', NULL, NULL, NULL),
	(24, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-26 08:59:47', NULL, '', '', '', NULL, NULL, NULL),
	(25, 'John', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-26 09:01:07', NULL, '', '', '', NULL, NULL, NULL),
	(26, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-26 09:26:09', NULL, '', '', '', NULL, NULL, NULL),
	(27, 'John', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-26 09:29:39', NULL, '', '', '', NULL, NULL, NULL),
	(28, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-27 01:15:56', NULL, '', '', '', NULL, NULL, NULL),
	(29, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-27 01:24:41', NULL, '', '', '', NULL, NULL, NULL),
	(30, 'John', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-27 01:41:10', NULL, '', '', '', NULL, NULL, NULL),
	(31, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-27 03:36:10', NULL, '', '', '', NULL, NULL, NULL),
	(32, 'John', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-27 03:40:15', NULL, '', '', '', NULL, NULL, NULL),
	(33, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:127.0.0.1', '2018-09-27 05:00:54', NULL, '', '', '', NULL, NULL, NULL),
	(34, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-28 01:40:40', NULL, '', '', '', NULL, NULL, NULL),
	(35, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-29 00:37:04', NULL, '', '', '', NULL, NULL, NULL),
	(36, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-09-29 00:37:03', NULL, '', '', '', NULL, NULL, NULL),
	(37, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-08 07:13:19', NULL, '', '', '', NULL, NULL, NULL),
	(38, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-08 08:50:01', NULL, '', '', '', NULL, NULL, NULL),
	(39, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-09 00:11:08', NULL, '', '', '', NULL, NULL, NULL),
	(40, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-09 00:11:09', NULL, '', '', '', NULL, NULL, NULL),
	(41, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-09 01:41:56', NULL, '', '', '', NULL, NULL, NULL),
	(42, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-09 04:46:14', NULL, '', '', '', NULL, NULL, NULL),
	(43, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-10 01:22:26', NULL, '', '', '', NULL, NULL, NULL),
	(44, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-10 09:24:32', NULL, '', '', '', NULL, NULL, NULL),
	(45, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-10 23:59:17', NULL, '', '', '', NULL, NULL, NULL),
	(46, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-10 23:59:16', NULL, '', '', '', NULL, NULL, NULL),
	(47, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-11 08:50:56', NULL, '', '', '', NULL, NULL, NULL),
	(48, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-12 00:51:04', NULL, '', '', '', NULL, NULL, NULL),
	(49, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-12 00:56:33', NULL, '', '', '', NULL, NULL, NULL),
	(50, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-12 02:50:17', NULL, '', '', '', NULL, NULL, NULL),
	(51, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-15 00:26:38', NULL, '', '', '', NULL, NULL, NULL),
	(52, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-16 01:01:14', NULL, '', '', '', NULL, NULL, NULL),
	(53, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 06:54:02', NULL, '', '', '', NULL, NULL, NULL),
	(54, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 08:13:39', NULL, '', '', '', NULL, NULL, NULL),
	(55, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 09:56:56', NULL, '', '', '', NULL, NULL, NULL),
	(56, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 09:57:10', NULL, '', '', '', NULL, NULL, NULL),
	(57, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 09:57:36', NULL, '', '', '', NULL, NULL, NULL),
	(58, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 09:57:54', NULL, '', '', '', NULL, NULL, NULL),
	(59, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 10:00:15', NULL, '', '', '', NULL, NULL, NULL),
	(60, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 10:01:21', NULL, '', '', '', NULL, NULL, NULL),
	(61, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 10:03:57', NULL, '', '', '', NULL, NULL, NULL),
	(62, '7HD002', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 10:04:31', NULL, '', '', '', NULL, NULL, NULL),
	(63, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-17 10:04:56', NULL, '', '', '', NULL, NULL, NULL),
	(64, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 01:23:55', NULL, '', '', '', NULL, NULL, NULL),
	(65, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 01:27:56', NULL, '', '', '', NULL, NULL, NULL),
	(66, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 01:28:08', NULL, '', '', '', NULL, NULL, NULL),
	(67, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 01:28:34', NULL, '', '', '', NULL, NULL, NULL),
	(68, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 03:18:28', NULL, '', '', '', NULL, NULL, NULL),
	(69, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 05:10:25', NULL, '', '', '', NULL, NULL, NULL),
	(70, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 05:11:02', NULL, '', '', '', NULL, NULL, NULL),
	(71, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-18 08:54:26', NULL, '', '', '', NULL, NULL, NULL),
	(72, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-19 00:40:48', NULL, '', '', '', NULL, NULL, NULL),
	(73, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.79', '2018-10-19 01:55:08', NULL, '', '', '', NULL, NULL, NULL),
	(74, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-19 07:02:23', NULL, '', '', '', NULL, NULL, NULL),
	(75, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-22 00:35:04', NULL, '', '', '', NULL, NULL, NULL),
	(76, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-23 00:41:25', NULL, '', '', '', NULL, NULL, NULL),
	(77, '7HD001', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-23 00:51:40', NULL, '', '', '', NULL, NULL, NULL),
	(78, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-23 00:52:10', NULL, '', '', '', NULL, NULL, NULL),
	(79, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-23 09:08:01', NULL, '', '', '', NULL, NULL, NULL),
	(80, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-23 23:57:50', NULL, '', '', '', NULL, NULL, NULL),
	(81, 'Admin', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-10-24 04:53:34', NULL, '', '', '', NULL, NULL, NULL),
	(82, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-24 08:20:55', NULL, '', '', '', NULL, NULL, NULL),
	(83, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-24 08:48:13', NULL, '', '', '', NULL, NULL, NULL),
	(84, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-25 00:07:46', NULL, '', '', '', NULL, NULL, NULL),
	(85, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-25 01:34:18', NULL, '', '', '', NULL, NULL, NULL),
	(86, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-25 01:34:20', NULL, '', '', '', NULL, NULL, NULL),
	(87, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-25 06:55:05', NULL, '', '', '', NULL, NULL, NULL),
	(88, 'Admin', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-10-25 07:27:37', NULL, '', '', '', NULL, NULL, NULL),
	(89, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-25 07:29:02', NULL, '', '', '', NULL, NULL, NULL),
	(90, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-26 00:59:35', NULL, '', '', '', NULL, NULL, NULL),
	(91, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-26 02:13:09', NULL, '', '', '', NULL, NULL, NULL),
	(92, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-26 07:08:37', NULL, '', '', '', NULL, NULL, NULL),
	(93, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-26 07:08:35', NULL, '', '', '', NULL, NULL, NULL),
	(94, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-29 01:14:13', NULL, '', '', '', NULL, NULL, NULL),
	(95, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-30 00:28:09', NULL, '', '', '', NULL, NULL, NULL),
	(96, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 01:57:14', NULL, '', '', '', NULL, NULL, NULL),
	(97, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-30 01:57:42', NULL, '', '', '', NULL, NULL, NULL),
	(98, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 02:01:22', NULL, '', '', '', NULL, NULL, NULL),
	(99, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-30 02:09:05', NULL, '', '', '', NULL, NULL, NULL),
	(100, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-30 02:30:32', NULL, '', '', '', NULL, NULL, NULL),
	(101, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-30 02:46:24', NULL, '', '', '', NULL, NULL, NULL),
	(102, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 02:51:30', NULL, '', '', '', NULL, NULL, NULL),
	(103, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 02:51:40', NULL, '', '', '', NULL, NULL, NULL),
	(104, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 02:52:27', NULL, '', '', '', NULL, NULL, NULL),
	(105, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 02:52:43', NULL, '', '', '', NULL, NULL, NULL),
	(106, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 02:53:16', NULL, '', '', '', NULL, NULL, NULL),
	(107, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 02:53:31', NULL, '', '', '', NULL, NULL, NULL),
	(108, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 03:14:01', NULL, '', '', '', NULL, NULL, NULL),
	(109, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 03:14:09', NULL, '', '', '', NULL, NULL, NULL),
	(110, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 03:15:05', NULL, '', '', '', NULL, NULL, NULL),
	(111, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 03:18:15', NULL, '', '', '', NULL, NULL, NULL),
	(112, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 03:20:03', NULL, '', '', '', NULL, NULL, NULL),
	(113, 'HMIUser01', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 05:44:29', NULL, '', '', '', NULL, NULL, NULL),
	(114, 'HMIUser01', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-10-30 05:47:47', NULL, '', '', '', NULL, NULL, NULL),
	(115, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-10-30 06:01:56', NULL, '', '', '', NULL, NULL, NULL),
	(116, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 06:07:17', NULL, '', '', '', NULL, NULL, NULL),
	(117, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 06:08:20', NULL, '', '', '', NULL, NULL, NULL),
	(118, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-10-30 06:10:07', NULL, '', '', '', NULL, NULL, NULL),
	(119, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 08:41:31', NULL, '', '', '', NULL, NULL, NULL),
	(120, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:43:25', NULL, '', '', '', NULL, NULL, NULL),
	(121, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-30 08:43:25', NULL, '', '', '', NULL, NULL, NULL),
	(122, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-30 08:43:38', NULL, '', '', '', NULL, NULL, NULL),
	(123, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:45:59', NULL, '', '', '', NULL, NULL, NULL),
	(124, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:47:11', NULL, '', '', '', NULL, NULL, NULL),
	(125, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:48:45', NULL, '', '', '', NULL, NULL, NULL),
	(126, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:49:19', NULL, '', '', '', NULL, NULL, NULL),
	(127, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:51:55', NULL, '', '', '', NULL, NULL, NULL),
	(128, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:53:00', NULL, '', '', '', NULL, NULL, NULL),
	(129, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:55:18', NULL, '', '', '', NULL, NULL, NULL),
	(130, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-30 08:57:52', NULL, '', '', '', NULL, NULL, NULL),
	(131, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-31 01:42:33', NULL, '', '', '', NULL, NULL, NULL),
	(132, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-31 01:52:16', NULL, '', '', '', NULL, NULL, NULL),
	(133, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-10-31 02:32:57', NULL, '', '', '', NULL, NULL, NULL),
	(134, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-31 05:40:11', NULL, '', '', '', NULL, NULL, NULL),
	(135, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-31 10:03:49', NULL, '', '', '', NULL, NULL, NULL),
	(136, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-10-31 10:04:43', NULL, '', '', '', NULL, NULL, NULL),
	(137, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-10-31 10:08:58', NULL, '', '', '', NULL, NULL, NULL),
	(138, 'HMIUser01', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-01 01:22:20', NULL, '', '', '', NULL, NULL, NULL),
	(139, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-01 01:29:26', NULL, '', '', '', NULL, NULL, NULL),
	(140, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-01 01:30:59', NULL, '', '', '', NULL, NULL, NULL),
	(141, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-01 01:37:45', NULL, '', '', '', NULL, NULL, NULL),
	(142, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-01 01:45:40', NULL, '', '', '', NULL, NULL, NULL),
	(143, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-01 02:18:44', NULL, '', '', '', NULL, NULL, NULL),
	(144, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-01 02:19:30', NULL, '', '', '', NULL, NULL, NULL),
	(145, 'HMIUser01', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-01 02:23:51', NULL, '', '', '', NULL, NULL, NULL),
	(146, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-01 02:25:25', NULL, '', '', '', NULL, NULL, NULL),
	(147, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-01 02:29:42', NULL, '', '', '', NULL, NULL, NULL),
	(148, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-01 08:58:27', NULL, '', '', '', NULL, NULL, NULL),
	(149, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-01 08:58:43', NULL, '', '', '', NULL, NULL, NULL),
	(150, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-02 02:11:56', NULL, '', '', '', NULL, NULL, NULL),
	(151, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 02:12:01', NULL, '', '', '', NULL, NULL, NULL),
	(152, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 02:12:11', NULL, '', '', '', NULL, NULL, NULL),
	(153, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 02:12:37', NULL, '', '', '', NULL, NULL, NULL),
	(154, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 02:13:19', NULL, '', '', '', NULL, NULL, NULL),
	(155, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 02:13:35', NULL, '', '', '', NULL, NULL, NULL),
	(156, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 02:14:19', NULL, '', '', '', NULL, NULL, NULL),
	(157, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 02:16:58', NULL, '', '', '', NULL, NULL, NULL),
	(158, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-02 02:49:03', NULL, '', '', '', NULL, NULL, NULL),
	(159, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 02:50:46', NULL, '', '', '', NULL, NULL, NULL),
	(160, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 03:10:14', NULL, '', '', '', NULL, NULL, NULL),
	(161, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 03:12:56', NULL, '', '', '', NULL, NULL, NULL),
	(162, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 03:14:04', NULL, '', '', '', NULL, NULL, NULL),
	(163, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 03:21:20', NULL, '', '', '', NULL, NULL, NULL),
	(164, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 03:21:20', NULL, '', '', '', NULL, NULL, NULL),
	(165, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 03:22:16', NULL, '', '', '', NULL, NULL, NULL),
	(166, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 03:23:09', NULL, '', '', '', NULL, NULL, NULL),
	(167, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 03:24:08', NULL, '', '', '', NULL, NULL, NULL),
	(168, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 03:25:06', NULL, '', '', '', NULL, NULL, NULL),
	(169, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-02 04:53:46', NULL, '', '', '', NULL, NULL, NULL),
	(170, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-02 05:04:31', NULL, '', '', '', NULL, NULL, NULL),
	(171, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-02 05:10:35', NULL, '', '', '', NULL, NULL, NULL),
	(172, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:10:38', NULL, '', '', '', NULL, NULL, NULL),
	(173, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:11:00', NULL, '', '', '', NULL, NULL, NULL),
	(174, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:11:20', NULL, '', '', '', NULL, NULL, NULL),
	(175, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:11:55', NULL, '', '', '', NULL, NULL, NULL),
	(176, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:13:46', NULL, '', '', '', NULL, NULL, NULL),
	(177, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:14:22', NULL, '', '', '', NULL, NULL, NULL),
	(178, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:15:09', NULL, '', '', '', NULL, NULL, NULL),
	(179, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:15:28', NULL, '', '', '', NULL, NULL, NULL),
	(180, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-02 05:16:08', NULL, '', '', '', NULL, NULL, NULL),
	(181, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:18:05', NULL, '', '', '', NULL, NULL, NULL),
	(182, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:18:42', NULL, '', '', '', NULL, NULL, NULL),
	(183, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:19:07', NULL, '', '', '', NULL, NULL, NULL),
	(184, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:19:27', NULL, '', '', '', NULL, NULL, NULL),
	(185, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:19:42', NULL, '', '', '', NULL, NULL, NULL),
	(186, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:19:57', NULL, '', '', '', NULL, NULL, NULL),
	(187, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:20:06', NULL, '', '', '', NULL, NULL, NULL),
	(188, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:26:55', NULL, '', '', '', NULL, NULL, NULL),
	(189, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:27:31', NULL, '', '', '', NULL, NULL, NULL),
	(190, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.45', '2018-11-02 05:27:40', NULL, '', '', '', NULL, NULL, NULL),
	(191, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-02 05:30:08', NULL, '', '', '', NULL, NULL, NULL),
	(192, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:30:27', NULL, '', '', '', NULL, NULL, NULL),
	(193, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 05:31:17', NULL, '', '', '', NULL, NULL, NULL),
	(194, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 06:01:15', NULL, '', '', '', NULL, NULL, NULL),
	(195, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 06:31:32', NULL, '', '', '', NULL, NULL, NULL),
	(196, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-02 07:33:42', NULL, '', '', '', NULL, NULL, NULL),
	(197, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 01:40:43', NULL, '', '', '', NULL, NULL, NULL),
	(198, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 01:55:18', NULL, '', '', '', NULL, NULL, NULL),
	(199, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-05 03:17:57', NULL, '', '', '', NULL, NULL, NULL),
	(200, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 04:14:08', NULL, '', '', '', NULL, NULL, NULL),
	(201, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-05 06:18:30', NULL, '', '', '', NULL, NULL, NULL),
	(202, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 06:27:34', NULL, '', '', '', NULL, NULL, NULL),
	(203, 'HMIUser', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-05 06:50:59', NULL, '', '', '', NULL, NULL, NULL),
	(204, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-05 06:53:57', NULL, '', '', '', NULL, NULL, NULL),
	(205, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-05 06:54:10', NULL, '', '', '', NULL, NULL, NULL),
	(206, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-05 06:54:25', NULL, '', '', '', NULL, NULL, NULL),
	(207, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-05 06:57:47', NULL, '', '', '', NULL, NULL, NULL),
	(208, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-05 06:58:01', NULL, '', '', '', NULL, NULL, NULL),
	(209, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-05 06:58:57', NULL, '', '', '', NULL, NULL, NULL),
	(210, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-05 07:19:05', NULL, '', '', '', NULL, NULL, NULL),
	(211, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 08:16:21', NULL, '', '', '', NULL, NULL, NULL),
	(212, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 08:17:01', NULL, '', '', '', NULL, NULL, NULL),
	(213, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-05 08:17:32', NULL, '', '', '', NULL, NULL, NULL),
	(214, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-06 00:03:15', NULL, '', '', '', NULL, NULL, NULL),
	(215, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 00:13:10', NULL, '', '', '', NULL, NULL, NULL),
	(216, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-06 00:14:04', NULL, '', '', '', NULL, NULL, NULL),
	(217, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 01:57:55', NULL, '', '', '', NULL, NULL, NULL),
	(218, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-06 01:58:08', NULL, '', '', '', NULL, NULL, NULL),
	(219, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 01:58:52', NULL, '', '', '', NULL, NULL, NULL),
	(220, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 02:12:46', NULL, '', '', '', NULL, NULL, NULL),
	(221, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-06 02:13:28', NULL, '', '', '', NULL, NULL, NULL),
	(222, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 02:14:33', NULL, '', '', '', NULL, NULL, NULL),
	(223, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-06 02:16:14', NULL, '', '', '', NULL, NULL, NULL),
	(224, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-06 02:17:03', NULL, '', '', '', NULL, NULL, NULL),
	(225, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-06 02:17:52', NULL, '', '', '', NULL, NULL, NULL),
	(226, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 02:18:23', NULL, '', '', '', NULL, NULL, NULL),
	(227, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-06 07:41:53', NULL, '', '', '', NULL, NULL, NULL),
	(228, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-06 08:12:14', NULL, '', '', '', NULL, NULL, NULL),
	(229, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-06 08:18:12', NULL, '', '', '', NULL, NULL, NULL),
	(230, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-07 00:03:22', NULL, '', '', '', NULL, NULL, NULL),
	(231, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-07 00:03:21', NULL, '', '', '', NULL, NULL, NULL),
	(232, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-07 00:04:23', NULL, '', '', '', NULL, NULL, NULL),
	(233, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-07 02:42:50', NULL, '', '', '', NULL, NULL, NULL),
	(234, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-07 02:43:01', NULL, '', '', '', NULL, NULL, NULL),
	(235, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-07 02:57:13', NULL, '', '', '', NULL, NULL, NULL),
	(236, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko', '::ffff:172.16.3.53', '2018-11-07 02:57:24', NULL, '', '', '', NULL, NULL, NULL),
	(237, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-07 03:24:19', NULL, '', '', '', NULL, NULL, NULL),
	(238, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-07 05:29:53', NULL, '', '', '', NULL, NULL, NULL),
	(239, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-07 08:05:52', NULL, '', '', '', NULL, NULL, NULL),
	(240, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-08 00:00:43', NULL, '', '', '', NULL, NULL, NULL),
	(241, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-08 03:09:12', NULL, '', '', '', NULL, NULL, NULL),
	(242, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-08 08:00:54', NULL, '', '', '', NULL, NULL, NULL),
	(243, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-10 02:15:37', NULL, '', '', '', NULL, NULL, NULL),
	(244, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-10 02:26:36', NULL, '', '', '', NULL, NULL, NULL),
	(245, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-10 02:27:25', NULL, '', '', '', NULL, NULL, NULL),
	(246, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-10 07:30:35', NULL, '', '', '', NULL, NULL, NULL),
	(247, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-12 06:50:39', NULL, '', '', '', NULL, NULL, NULL),
	(248, 'HMIUser', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.53', '2018-11-12 08:49:18', NULL, '', '', '', NULL, NULL, NULL),
	(249, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-12 08:49:44', NULL, '', '', '', NULL, NULL, NULL),
	(250, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-12 08:50:29', NULL, '', '', '', NULL, NULL, NULL),
	(251, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-12 08:54:26', NULL, '', '', '', NULL, NULL, NULL),
	(252, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-12 08:56:48', NULL, '', '', '', NULL, NULL, NULL),
	(253, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-12 09:16:38', NULL, '', '', '', NULL, NULL, NULL),
	(254, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-12 09:19:14', NULL, '', '', '', NULL, NULL, NULL),
	(255, 'Admin', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-12 09:20:48', NULL, '', '', '', NULL, NULL, NULL),
	(256, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-12 23:59:29', NULL, '', '', '', NULL, NULL, NULL),
	(257, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-12 23:59:30', NULL, '', '', '', NULL, NULL, NULL),
	(258, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-13 00:03:20', NULL, '', '', '', NULL, NULL, NULL),
	(259, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-13 00:07:20', NULL, '', '', '', NULL, NULL, NULL),
	(260, 'HMIUser', NULL, '5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.31', '2018-11-13 00:16:48', NULL, '', '', '', NULL, NULL, NULL),
	(261, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-13 05:24:20', NULL, '', '', '', NULL, NULL, NULL),
	(262, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-13 07:00:38', NULL, '', '', '', NULL, NULL, NULL),
	(263, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-13 07:00:49', NULL, '', '', '', NULL, NULL, NULL),
	(264, 'HMIUser', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', '::ffff:172.16.3.53', '2018-11-13 08:14:11', NULL, '', '', '', NULL, NULL, NULL),
	(265, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 03:13:43', NULL, '', '', '', NULL, NULL, NULL),
	(266, '7AK', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 03:14:21', NULL, '', '', '', NULL, NULL, NULL),
	(267, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 03:16:49', NULL, '', '', '', NULL, NULL, NULL),
	(268, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 03:17:11', NULL, '', '', '', NULL, NULL, NULL),
	(269, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 03:28:05', NULL, '', '', '', NULL, NULL, NULL),
	(270, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 03:28:58', NULL, '', '', '', NULL, NULL, NULL),
	(271, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 07:13:17', NULL, '', '', '', NULL, NULL, NULL),
	(272, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-15 07:13:52', NULL, '', '', '', NULL, NULL, NULL),
	(273, 'Admin', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3554.0 Safari/537.36', '::ffff:172.16.3.53', '2018-11-15 08:58:11', NULL, '', '', '', NULL, NULL, NULL),
	(274, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-16 00:28:37', NULL, '', '', '', NULL, NULL, NULL),
	(275, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36 LBBROWSER', '::ffff:172.16.3.79', '2018-11-16 01:19:44', NULL, '', '', '', NULL, NULL, NULL),
	(276, '7AK', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-16 05:15:42', NULL, '', '', '', NULL, NULL, NULL),
	(277, '7AK', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-16 08:19:17', NULL, '', '', '', NULL, NULL, NULL),
	(278, '7AK', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-16 08:34:13', NULL, '', '', '', NULL, NULL, NULL),
	(279, '7AK', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-16 08:35:43', NULL, '', '', '', NULL, NULL, NULL),
	(280, '7AK', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-16 08:36:01', NULL, '', '', '', NULL, NULL, NULL),
	(281, '7AK', NULL, '5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '::ffff:172.16.3.39', '2018-11-16 08:36:42', NULL, '', '', '', NULL, NULL, NULL),
	(282, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-16 09:49:17', NULL, '', '', '', NULL, NULL, NULL),
	(283, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-19 00:53:57', NULL, '', '', '', NULL, NULL, NULL),
	(284, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-19 08:56:05', NULL, '', '', '', NULL, NULL, NULL),
	(285, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-20 00:59:40', NULL, '', '', '', NULL, NULL, NULL),
	(286, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-20 07:18:59', NULL, '', '', '', NULL, NULL, NULL),
	(287, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-21 00:13:55', NULL, '', '', '', NULL, NULL, NULL),
	(288, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-21 06:49:30', NULL, '', '', '', NULL, NULL, NULL),
	(289, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-21 08:15:55', NULL, '', '', '', NULL, NULL, NULL),
	(290, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-23 01:27:53', NULL, '', '', '', NULL, NULL, NULL),
	(291, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-27 03:29:23', NULL, '', '', '', NULL, NULL, NULL),
	(292, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-28 00:47:20', NULL, '', '', '', NULL, NULL, NULL),
	(293, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-29 06:30:13', NULL, '', '', '', NULL, NULL, NULL),
	(294, 'Admin', NULL, '5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', '::ffff:127.0.0.1', '2018-11-29 08:19:40', NULL, '', '', '', NULL, NULL, NULL),
	(295, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-29 08:21:46', NULL, '', '', '', NULL, NULL, NULL),
	(296, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-30 02:34:10', NULL, '', '', '', NULL, NULL, NULL),
	(297, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-11-30 09:51:53', NULL, '', '', '', NULL, NULL, NULL),
	(298, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-12-03 00:12:15', NULL, '', '', '', NULL, NULL, NULL),
	(299, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-12-03 08:14:24', NULL, '', '', '', NULL, NULL, NULL),
	(300, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-12-04 00:11:55', NULL, '', '', '', NULL, NULL, NULL),
	(301, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-12-04 06:19:40', NULL, '', '', '', NULL, NULL, NULL),
	(302, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-12-06 10:04:30', NULL, '', '', '', NULL, NULL, NULL),
	(303, 'Admin', NULL, '5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '::ffff:127.0.0.1', '2018-12-07 01:27:16', NULL, '', '', '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `systemlogs` ENABLE KEYS */;

-- 导出  表 imes_component_api.test 结构
CREATE TABLE IF NOT EXISTS `test` (
  `productid` char(50) COLLATE utf8_bin DEFAULT NULL,
  `unitcost` char(50) COLLATE utf8_bin DEFAULT NULL,
  `status` char(50) COLLATE utf8_bin DEFAULT NULL,
  `listprice` char(50) COLLATE utf8_bin DEFAULT NULL,
  `attr1` char(50) COLLATE utf8_bin DEFAULT NULL,
  `itemid` char(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.test 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 导出  表 imes_component_api.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `UserOID` int(11) NOT NULL AUTO_INCREMENT,
  `UserAID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Password` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `Name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `OrgOID` int(11) DEFAULT NULL,
  `DueDate` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `RefType` int(11) DEFAULT NULL,
  `RefOID` int(11) DEFAULT NULL,
  `DataSharingFlag` int(11) DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  `UserKey` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `eMail` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `PasswordQuestion` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `PasswordAnswer` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CreationDate` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `LastLoginDate` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `LastActivityDate` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `LastPasswordChangedDate` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `LastLockoutDate` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `SoftPhoneNumber` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LogonCount` int(11) DEFAULT NULL,
  `MobilePhone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `AccessTypes` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserOID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.users 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`UserOID`, `UserAID`, `Password`, `Name`, `Description`, `OrgOID`, `DueDate`, `Status`, `RefType`, `RefOID`, `DataSharingFlag`, `SortNumber`, `UserKey`, `eMail`, `PasswordQuestion`, `PasswordAnswer`, `CreationDate`, `LastLoginDate`, `LastActivityDate`, `LastPasswordChangedDate`, `LastLockoutDate`, `SoftPhoneNumber`, `LogonCount`, `MobilePhone`, `AccessTypes`) VALUES
	(1, 'Admin', 'HgmCWxqQ13nu5PYT8gB4HeqL0kvHM88jngsJITF0an19ryy4ayhrg/Rhf6yqYQR9bZKYHI5koKnDD/03dohnPzpMdnTqdS90TzhA/QrI86Zi5B45KlJSrcxyMjBwcDcnhMwvzGoGm8e1PGAOaXXBUHnbXoZ3Tsa9vVyUGjfOX22PBMK2sF4DqB9ggP5YRPCdklmNFMrFo7cHfSkjeBfgKXVOtZ4AV/0F0462tLR/PA3qSIaIWxSMnCK1axThGZfpUHEFD2neI6iAJasyfLNmQEozOtRpnnsvJxq7Cjjc/CBs+R+p6KBgEmAYvDRlkELuqtE3hfQybW3vgFd8H9/GKQ==', 'admin', 'admin', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18969833377', 1),
	(2, '7AK', 'HgmCWxqQ13nu5PYT8gB4HeqL0kvHM88jngsJITF0an19ryy4ayhrg/Rhf6yqYQR9bZKYHI5koKnDD/03dohnPzpMdnTqdS90TzhA/QrI86Zi5B45KlJSrcxyMjBwcDcnhMwvzGoGm8e1PGAOaXXBUHnbXoZ3Tsa9vVyUGjfOX22PBMK2sF4DqB9ggP5YRPCdklmNFMrFo7cHfSkjeBfgKXVOtZ4AV/0F0462tLR/PA3qSIaIWxSMnCK1axThGZfpUHEFD2neI6iAJasyfLNmQEozOtRpnnsvJxq7Cjjc/CBs+R+p6KBgEmAYvDRlkELuqtE3hfQybW3vgFd8H9/GKQ==', '', '', 4, '2019-12-31', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2018-11-15 10:47:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	(3, 'yyw', 'HgmCWxqQ13nu5PYT8gB4HeqL0kvHM88jngsJITF0an19ryy4ayhrg/Rhf6yqYQR9bZKYHI5koKnDD/03dohnPzpMdnTqdS90TzhA/QrI86Zi5B45KlJSrcxyMjBwcDcnhMwvzGoGm8e1PGAOaXXBUHnbXoZ3Tsa9vVyUGjfOX22PBMK2sF4DqB9ggP5YRPCdklmNFMrFo7cHfSkjeBfgKXVOtZ4AV/0F0462tLR/PA3qSIaIWxSMnCK1axThGZfpUHEFD2neI6iAJasyfLNmQEozOtRpnnsvJxq7Cjjc/CBs+R+p6KBgEmAYvDRlkELuqtE3hfQybW3vgFd8H9/GKQ==', 'HMI虞晔文', '', 1, '', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2018-11-15 10:57:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 导出  表 imes_component_api.usersauthority 结构
CREATE TABLE IF NOT EXISTS `usersauthority` (
  `UserOID` int(11) NOT NULL,
  `ProcessOID` int(11) NOT NULL,
  `ActionOID` int(11) NOT NULL,
  `Value` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserOID`,`ProcessOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.usersauthority 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `usersauthority` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersauthority` ENABLE KEYS */;

-- 导出  表 imes_component_api.usersroles 结构
CREATE TABLE IF NOT EXISTS `usersroles` (
  `UserOID` int(11) NOT NULL,
  `RoleOID` int(11) NOT NULL,
  PRIMARY KEY (`UserOID`,`RoleOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.usersroles 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `usersroles` DISABLE KEYS */;
INSERT INTO `usersroles` (`UserOID`, `RoleOID`) VALUES
	(2, 1),
	(3, 1),
	(3, 2),
	(8, 3),
	(9, 4),
	(11, 8),
	(12, 9),
	(13, 9),
	(13, 10),
	(14, 10),
	(15, 11);
/*!40000 ALTER TABLE `usersroles` ENABLE KEYS */;

-- 导出  表 imes_component_api.usersttt 结构
CREATE TABLE IF NOT EXISTS `usersttt` (
  `UserOID` int(11) NOT NULL AUTO_INCREMENT,
  `UserAID` varchar(64) COLLATE utf8_bin NOT NULL,
  `Password` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `Name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `AName` char(50) COLLATE utf8_bin DEFAULT NULL,
  `AAID` char(3) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `OrgOID` int(11) DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `RefType` int(11) DEFAULT NULL,
  `RefOID` int(11) DEFAULT NULL,
  `DataSharingFlag` bit(1) DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  `UserKey` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `eMail` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `PasswordQuestion` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `PasswordAnswer` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `LastLoginDate` datetime DEFAULT NULL,
  `LastActivityDate` datetime DEFAULT NULL,
  `LastPasswordChangedDate` datetime DEFAULT NULL,
  `LastLockoutDate` datetime DEFAULT NULL,
  `SoftPhoneNumber` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LogonCount` int(11) DEFAULT NULL,
  `AccessTypes` int(11) DEFAULT NULL,
  `UserFID` varchar(50) COLLATE utf8_bin NOT NULL,
  `VidDate` date DEFAULT NULL,
  `auth` int(1) DEFAULT NULL,
  PRIMARY KEY (`UserOID`),
  UNIQUE KEY `UserAID` (`UserAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  imes_component_api.usersttt 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `usersttt` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersttt` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
