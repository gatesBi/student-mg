/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : student-mg

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-04-02 08:12:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `db_fhdb`
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_fhdb
-- ----------------------------

-- ----------------------------
-- Table structure for `db_timingbackup`
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', '2', '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', '2', '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for `oa_datajur`
-- ----------------------------
DROP TABLE IF EXISTS `oa_datajur`;
CREATE TABLE `oa_datajur` (
  `DATAJUR_ID` varchar(100) NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`),
  KEY `FSTAFF` (`STAFF_ID`),
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_datajur
-- ----------------------------
INSERT INTO `oa_datajur` VALUES ('6e6133043ca141fabd458a059150a0c7', '(\'fh\')', '6e6133043ca141fabd458a059150a0c7', '0956d8c279274fca92f4091f2a69a9ad');

-- ----------------------------
-- Table structure for `oa_department`
-- ----------------------------
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `oa_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `oa_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `oa_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `oa_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `oa_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `oa_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `oa_department` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for `oa_staff`
-- ----------------------------
DROP TABLE IF EXISTS `oa_staff`;
CREATE TABLE `oa_staff` (
  `STAFF_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_staff
-- ----------------------------
INSERT INTO `oa_staff` VALUES ('6e6133043ca141fabd458a059150a0c7', 'www', 'ww', 'www', '3e7227e11dc14b4d9e863dd1a1fcedf6', 'ww', 'ww', 'ww', '男', '2016-04-27', 'ww', 'ww', '2016-06-01', 'ww', 'wwwww', '2016-02-03', 'ww', '已婚', '2016-05-25', 'ww', '2016-05-25', 'ww', 'ww', 'w', 'ww', 'ww', '1', '2016-05-16', '2016-05-24', 'ww', '', 'eee');
INSERT INTO `oa_staff` VALUES ('797d580b5cd341e7bc35c88089bd3091', 'fff', 'fff', 'ff', '83a25761c618457cae2fa1211bd8696d', 'ff', 'ff', 'ff', '男', '2016-04-06', 'ff', 'ff', '2016-05-04', 'ff', 'fff', '2016-03-29', 'fff', '已婚', '2016-05-03', 'ff', '2016-04-27', 'ff', 'ff', 'f', 'ff', 'ff', '55', '2016-05-03', '2016-04-26', 'ff', 'ffffs', 'ffff');
INSERT INTO `oa_staff` VALUES ('fc26491d77ea4929aa1f6fc48cda85fa', 'www', 'www', 'www', 'cbbc84eddde947ba8af7d509e430eb70', 'ww', 'ww', 'www', '女', '2016-03-30', 'www', 'ww', '2016-04-29', 'www', 'www', '2016-03-30', 'www', '未婚', '2016-04-25', 'www', '2016-04-19', 'ww', 'ww', 'ww', 'ww', 'www', '2', '2016-04-25', '2016-04-13', 'www', 'san', 'www');

-- ----------------------------
-- Table structure for `sys_app_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('55d00299ec76448790e5f38da99b8ed6', 'dd', '698d51a19d8a121ce581499d7b701668', '1212', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '1', '1213', '213123', '213', '2016-03-30', '2016-03-31', '123', '1121', '213435345@qq.com');

-- ----------------------------
-- Table structure for `sys_createcode`
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限', 'single');
INSERT INTO `sys_createcode` VALUES ('01c910b6254546e29a76e7c25f11a972', 'fhtest', 'Stest', 'FHTESTS_,fh,STEST', 'FHSJS,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0Q313596790BRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,11,fh,0Q313596790JINGDU,fh,Double,fh,精度,fh,是,fh,无,fh,11,fh,3Q313596790', '2016-04-16 03:13:10', '测试', 'tree');
INSERT INTO `sys_createcode` VALUES ('0ee023606efb45b9a3baaa072e502161', 'information', 'FtestMx', 'FH_,fh,FTESTMX', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790', '2016-04-21 01:52:11', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('1be959583e82473b82f6e62087bd0d38', 'information', 'Attached', 'TB_,fh,ATTACHED', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790', '2016-04-21 17:07:59', '主表测试', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('2af47016a47b446ca62bd6e77303358d', 'manage', 'TeatherSubjectAssociate', 'z_,fh,TEATHERSUBJECTASSOCIATE', 'T_ID,fh,String,fh,老师id,fh,是,fh,无,fh,36,fh,0Q313596790S_ID,fh,String,fh,学科id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:48:58', '老师学科关联', 'single');
INSERT INTO `sys_createcode` VALUES ('4173a8c56a504dd6b6213d2b9cd3e91b', 'information', 'AttachedMx', 'TB_,fh,ATTACHEDMX', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790', '2016-04-21 17:09:40', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('44570f0d52cb44ba91407eda39ebba67', 'datasourcetwo', 'DataSource2', 'DS_,fh,DATASOURCE2', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-29 02:01:06', '第2数据源例子', 'single');
INSERT INTO `sys_createcode` VALUES ('49d985e081ed44e6b34ba1b8c5466e39', 'fhdb', 'TimingBackUp', 'DB_,fh,TIMINGBACKUP', 'JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-04-09 11:53:38', '定时备份', 'single');
INSERT INTO `sys_createcode` VALUES ('4cde553ec4854a4e9f1ae17c2e831a0e', 'information', 'Ftest', 'FH_,fh,FTEST', 'NAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,11,fh,0Q313596790CHANGDU,fh,Double,fh,长度,fh,是,fh,无,fh,11,fh,2Q313596790', '2016-04-21 01:41:19', '主表测试', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('57a2dd9b8925438487c2b7bc25c255ff', 'manage', 'Schedule', 'z_,fh,SCHEDULE', 'TIMEDURING,fh,String,fh,时间段,fh,是,fh,无,fh,20,fh,0Q313596790GRADE,fh,String,fh,年级,fh,是,fh,无,fh,4,fh,0Q313596790SUBJECT,fh,String,fh,学科,fh,是,fh,无,fh,5,fh,0Q313596790TEATHER_NAME,fh,String,fh,老师姓名,fh,是,fh,无,fh,20,fh,0Q313596790', '2019-03-27 22:01:25', '课程表', 'single');
INSERT INTO `sys_createcode` VALUES ('62aa47e591284e06b216301f09a5d921', 'manage', 'SchoolTeatherAssociate', 'z_,fh,SCHOOLTEATHERASSOCIATE', 'T_ID,fh,String,fh,老师id,fh,是,fh,无,fh,36,fh,0Q313596790S_ID,fh,String,fh,学校id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:09:35', '学校老师关联', 'single');
INSERT INTO `sys_createcode` VALUES ('6748424646d04a06a2735c233bf88554', 'manage', 'StudentList', 'z_,fh,STUDENTLIST', 'HEAD_ID,fh,String,fh,主表id,fh,是,fh,无,fh,36,fh,0Q313596790TIMEDURING,fh,String,fh,时间段,fh,是,fh,无,fh,36,fh,0Q313596790GRADE,fh,String,fh,年级,fh,是,fh,无,fh,5,fh,0Q313596790SUBJECT,fh,String,fh,学科,fh,是,fh,无,fh,20,fh,0Q313596790TEATHER_NAME,fh,String,fh,老师姓名,fh,是,fh,无,fh,20,fh,0Q313596790CLASSROOM_ID,fh,String,fh,教室id,fh,否,fh,无,fh,36,fh,0Q313596790CREATE_TIME,fh,String,fh,创建时间,fh,否,fh,无,fh,20,fh,0Q313596790UPDATE_TIME,fh,String,fh,更新时间,fh,否,fh,无,fh,20,fh,0Q313596790', '2019-03-28 23:27:00', '学生子表', 'single');
INSERT INTO `sys_createcode` VALUES ('6ed5bfe401a44bc5b47b14911fa9a4ef', 'dst', 'DataSource2', 'DS_,fh,DATASOURCE2', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-29 02:07:34', '第2数据源例子', 'single');
INSERT INTO `sys_createcode` VALUES ('8826260508a249d3be230967722a32f9', 'manage', 'Grade', 'z_,fh,GRADE', 'NAME,fh,String,fh,年级名称,fh,是,fh,无,fh,10,fh,0Q313596790CODE,fh,String,fh,年级代码,fh,是,fh,无,fh,2,fh,0Q313596790', '2019-03-23 11:53:55', '年级', 'single');
INSERT INTO `sys_createcode` VALUES ('8b80cbc7dcfa40f3a5dfddb37c2dc073', 'manage', 'Teather', 'z_,fh,TEATHER', 'NAME,fh,String,fh,老师姓名,fh,是,fh,无,fh,10,fh,0Q313596790AGE,fh,String,fh,老师年龄,fh,是,fh,无,fh,3,fh,0Q313596790GENDER,fh,String,fh,老师性别,fh,是,fh,无,fh,1,fh,0Q313596790CODE,fh,String,fh,老师编号,fh,是,fh,无,fh,36,fh,0Q313596790CREATE_TIME,fh,String,fh,创建时间,fh,是,fh,无,fh,20,fh,0Q313596790UPDATE_TIME,fh,String,fh,更新时间,fh,是,fh,无,fh,20,fh,0Q313596790STATUS,fh,String,fh,状态,fh,是,fh,无,fh,1,fh,0Q313596790', '2019-03-23 13:51:45', '老师信息', 'single');
INSERT INTO `sys_createcode` VALUES ('905223e3142140ecab3060eeaecc2a73', 'manage', 'Subject', 'z_,fh,SUBJECT', 'NAME,fh,String,fh,学科名称,fh,是,fh,无,fh,20,fh,0Q313596790CODE,fh,String,fh,学科编码,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:42:17', '学科', 'single');
INSERT INTO `sys_createcode` VALUES ('90e217f15a534c1fadd966d7164cd687', 'manage', 'SchoolGradeAssociate', 'z_,fh,SCHOOLGRADEASSOCIATE', 'S_ID,fh,String,fh,学校id,fh,是,fh,无,fh,36,fh,0Q313596790G_ID,fh,String,fh,年级id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:07:36', '学校年级关联', 'single');
INSERT INTO `sys_createcode` VALUES ('91af9fe509704fa68f6bca121359e3ec', 'fhoa', 'Staff', 'OA_,fh,STAFF', 'NAME,fh,String,fh,姓名,fh,是,fh,无,fh,50,fh,0Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50,fh,0Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门,fh,是,fh,无,fh,100,fh,0Q313596790FUNCTIONS,fh,String,fh,职责,fh,是,fh,无,fh,255,fh,0Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,20,fh,0Q313596790EMAIL,fh,String,fh,邮箱,fh,是,fh,无,fh,50,fh,0Q313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,10,fh,0Q313596790BIRTHDAY,fh,Date,fh,出生日期,fh,是,fh,无,fh,32,fh,0Q313596790NATION,fh,String,fh,民族,fh,是,fh,无,fh,10,fh,0Q313596790JOBTYPE,fh,String,fh,岗位类别,fh,是,fh,无,fh,30,fh,0Q313596790JOBJOINTIME,fh,Date,fh,参加工作时间,fh,是,fh,无,fh,32,fh,0Q313596790FADDRESS,fh,String,fh,籍贯,fh,是,fh,无,fh,100,fh,0Q313596790POLITICAL,fh,String,fh,政治面貌,fh,是,fh,无,fh,30,fh,0Q313596790PJOINTIME,fh,Date,fh,入团时间,fh,是,fh,无,fh,32,fh,0Q313596790SFID,fh,String,fh,身份证号,fh,是,fh,无,fh,20,fh,0Q313596790MARITAL,fh,String,fh,婚姻状况,fh,是,fh,无,fh,10,fh,0Q313596790DJOINTIME,fh,Date,fh,进本单位时间,fh,是,fh,无,fh,32,fh,0Q313596790POST,fh,String,fh,现岗位,fh,是,fh,无,fh,30,fh,0Q313596790POJOINTIME,fh,Date,fh,上岗时间,fh,是,fh,无,fh,32,fh,0Q313596790EDUCATION,fh,String,fh,学历,fh,是,fh,无,fh,10,fh,0Q313596790SCHOOL,fh,String,fh,毕业学校,fh,是,fh,无,fh,30,fh,0Q313596790MAJOR,fh,String,fh,专业,fh,是,fh,无,fh,30,fh,0Q313596790FTITLE,fh,String,fh,职称,fh,是,fh,无,fh,30,fh,0Q313596790CERTIFICATE,fh,String,fh,职业资格证,fh,是,fh,无,fh,30,fh,0Q313596790CONTRACTLENGTH,fh,Integer,fh,劳动合同时长,fh,是,fh,无,fh,2,fh,0Q313596790CSTARTTIME,fh,Date,fh,签订日期,fh,是,fh,无,fh,32,fh,0Q313596790CENDTIME,fh,Date,fh,终止日期,fh,是,fh,无,fh,32,fh,0Q313596790ADDRESS,fh,String,fh,现住址,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,绑定账号ID,fh,否,fh,无,fh,100,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-23 20:44:31', '员工管理', 'single');
INSERT INTO `sys_createcode` VALUES ('91b0a388d9674bd08eb8318e79da7151', 'manage', 'Seat', 'z_,fh,SEAT', 'NAME,fh,String,fh,座位名,fh,是,fh,无,fh,20,fh,0Q313596790CODE,fh,String,fh,座位编码,fh,是,fh,无,fh,20,fh,0Q313596790CLASS_ID,fh,String,fh,班级id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:19:23', '座位信息', 'single');
INSERT INTO `sys_createcode` VALUES ('979021575add4bbcade4c427a94a49c1', 'manage', 'SchoolClassAssociate', 'z_,fh,SCHOOLCLASSASSOCIATE', 'S_ID,fh,String,fh,学校id,fh,是,fh,无,fh,36,fh,0Q313596790C_ID,fh,String,fh,班级id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:04:08', '学校班级关联', 'single');
INSERT INTO `sys_createcode` VALUES ('a0858515af9643868fcec0e448792494', 'manage', 'Refund', 'z_,fh,REFUND', 'STU_ID,fh,String,fh,学生id,fh,否,fh,无,fh,36,fh,0Q313596790REFUND_AMOUNT,fh,String,fh,退费金额,fh,是,fh,无,fh,10,fh,0Q313596790SUBJECT_ID,fh,String,fh,科目id,fh,否,fh,无,fh,36,fh,0Q313596790CREATE_TIME,fh,String,fh,创建时间,fh,否,fh,无,fh,20,fh,0Q313596790', '2019-03-23 12:57:55', 'refund', 'single');
INSERT INTO `sys_createcode` VALUES ('a5157054f72e4448b3f901d49f15494e', 'manage', 'School', 'z_,fh,SCHOOL', 'NAME,fh,String,fh,学校名称,fh,是,fh,无,fh,50,fh,0Q313596790ADDRESS,fh,String,fh,学校地址,fh,是,fh,无,fh,500,fh,0Q313596790CODE,fh,String,fh,学校代码,fh,是,fh,无,fh,10,fh,0Q313596790', '2019-03-23 13:15:46', '学校信息', 'single');
INSERT INTO `sys_createcode` VALUES ('a81283d775264728990c3039d1b4d4c1', 'fhoa', 'Datajur', 'OA_,fh,DATAJUR', 'DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790', '2016-04-26 19:00:11', '数据权限表', 'single');
INSERT INTO `sys_createcode` VALUES ('ac170f6d9e3d4c38b225c806e0a09dac', 'manage', 'TimeDuring', 'z_,fh,TIMEDURING', 'CODE,fh,String,fh,备注2,fh,是,fh,无,fh,2,fh,0Q313596790TIMEDURING,fh,String,fh,备注3,fh,是,fh,无,fh,30,fh,0Q313596790', '2019-03-29 20:19:40', '时间段', 'single');
INSERT INTO `sys_createcode` VALUES ('ae92803163ff44539e91711cfbe35411', 'fhoa', 'Datajur', 'OA_,fh,DATAJUR', 'DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,是,fh,无,fh,100,fh,0Q313596790', '2016-04-27 03:49:39', '数据权限表', 'single');
INSERT INTO `sys_createcode` VALUES ('b3e78a1abd5a4254aae2d17a865ac0e8', 'manage', 'StudentSubjectAssociate', 'z_,fh,STUDENTSUBJECTASSOCIATE', 'STU_ID,fh,String,fh,学生id,fh,是,fh,无,fh,36,fh,0Q313596790SUB_ID,fh,String,fh,学科id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:28:47', '学生学科关联', 'single');
INSERT INTO `sys_createcode` VALUES ('bf35ab8b2d064bf7928a04bba5e5a6dd', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-03-27 21:39:45', '站内信', 'single');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构', 'tree');
INSERT INTO `sys_createcode` VALUES ('c937e21208914e5b8fb1202c685bbf2f', 'fhdb', 'Fhdb', 'DB_,fh,FHDB', 'USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790', '2016-03-30 13:46:54', '数据库管理', 'single');
INSERT INTO `sys_createcode` VALUES ('d4098933fe45426c8b31304dd5f5f72a', 'manage', 'StudentClassAssociate', 'z_,fh,STUDENTCLASSASSOCIATE', 'S_ID,fh,String,fh,学生id,fh,是,fh,无,fh,36,fh,0Q313596790C_ID,fh,String,fh,班级id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:26:36', '学生班级id', 'single');
INSERT INTO `sys_createcode` VALUES ('f06942316afb4f0aa5110ee12ad48c2b', 'manage', 'Student', 'z_,fh,STUDENT', 'CODE,fh,String,fh,学号,fh,是,fh,无,fh,36,fh,0Q313596790NAME,fh,String,fh,姓名,fh,是,fh,无,fh,10,fh,0Q313596790AGE,fh,String,fh,年龄,fh,是,fh,无,fh,3,fh,0Q313596790GENDER,fh,String,fh,性别,fh,是,fh,无,fh,1,fh,0Q313596790ADDRESS,fh,String,fh,住址,fh,是,fh,无,fh,500,fh,0Q313596790PHONE,fh,String,fh,电话,fh,是,fh,无,fh,18,fh,0Q313596790GRADE_ID,fh,String,fh,年级id,fh,是,fh,无,fh,36,fh,0Q313596790SUBJECT_TIME_PERIOD,fh,String,fh,科目时间段,fh,是,fh,无,fh,50,fh,0Q313596790SCHOOL_ID,fh,String,fh,学校id,fh,是,fh,无,fh,36,fh,0Q313596790SEAT_ID,fh,String,fh,座位号,fh,是,fh,无,fh,36,fh,0Q313596790IS_PAY,fh,String,fh,是否缴费,fh,是,fh,无,fh,1,fh,0Q313596790PAYMENT_AMOUNT,fh,String,fh,缴费金额,fh,是,fh,无,fh,10,fh,0Q313596790CREATE_TIME,fh,String,fh,创建时间,fh,是,fh,无,fh,20,fh,0Q313596790UPDATE_TIME,fh,String,fh,更新时间,fh,是,fh,无,fh,20,fh,0Q313596790STATUS,fh,String,fh,状态,fh,是,fh,无,fh,1,fh,0Q313596790', '2019-03-23 13:37:54', 'student', 'single');
INSERT INTO `sys_createcode` VALUES ('f0996c3dccff4cd180c95dc716f2f48c', 'manage', 'TeatherStudentAssociate', 'z_,fh,TEATHERSTUDENTASSOCIATE', 'T_ID,fh,String,fh,老师id,fh,是,fh,无,fh,36,fh,0Q313596790S_ID,fh,String,fh,学生id,fh,是,fh,无,fh,36,fh,0Q313596790', '2019-03-23 13:45:27', '老师学生关联', 'single');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理', 'single');

-- ----------------------------
-- Table structure for `sys_dictionaries`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', '1', '0', '分类', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', '3', '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', '绿色', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', '2', '0', '课程', '');

-- ----------------------------
-- Table structure for `sys_fhbutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('8988c3e7e6354e419738848ade7431d8', '选座', 'toChooseSeat', '选座位');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `sys_fhbutton` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for `sys_fhsms`
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '8', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', '微信管理', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('23', '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('24', '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('31', '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('32', '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('33', '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('34', '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('35', '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('45', '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('46', '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('47', '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', '站内信', 'fhsms/list.do', '6', '3', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('51', '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('52', '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', '1');
INSERT INTO `sys_menu` VALUES ('53', '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('54', '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('55', '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('56', '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('57', '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('58', 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('59', 'OA办公', '#', '0', '6', 'menu-icon fa fa-laptop pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('60', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '59', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('61', '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('62', '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', '1');
INSERT INTO `sys_menu` VALUES ('63', '主附结构', 'attached/list.do', '6', '2', 'menu-icon fa fa-folder-open blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('64', '员工管理', 'staff/list.do', '59', '2', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('65', '多数据源', 'datasource2/list.do', '6', '4', 'menu-icon fa fa-folder-open-o purple', '1', '0');
INSERT INTO `sys_menu` VALUES ('66', '学生管理', '#', '0', '30', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('67', '学生列表', 'student/list.do', '66', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('68', '教师管理', '#', '0', '31', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('69', '教师列表', 'teather/list.do', '68', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('70', '课程表管理', '#', '0', '32', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('71', '课程表列表', 'schedule/list.do', '70', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('72', '座位表管理', '#', '0', '33', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('73', '座位表列表', 'seat/list.do', '72', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('74', '选座', 'seat/chooseSeat.do', '72', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('75', '教室管理', '#', '0', '34', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('76', '教室列表', 'classroom/list.do', '75', '1', 'menu-icon fa fa-leaf black', '1', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `SCHOOL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('06db3dfa8ee24e7dacf42264d680589c', '前台', '151041940475533808631808', '1', '151041940475533808631808', '151041940475533808631808', '151041940475533808631808', '151041940475533808631808', '1');
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '73786413343844589510', '0', '1', '1', '1', '1', null);
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '498', '2', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '498', '2', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('2', '会员组', '498', '0', '0', '0', '0', '1', null);
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '73786413343844589510', '1', '36892925196425486278', '36892925196425486278', '36892925196425486278', '36892925196425486278', null);
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '73786413343844589510', '1', '0', '0', '2251798773489606', '0', null);
INSERT INTO `sys_role` VALUES ('77307a5c1c3f4f9b854e58445188c570', '测试角色', '73786413343844589510', '1', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '498', '2', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('da1468757a354272a64bd204a1660347', '测试角色2', '73786413343844589510', '1', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '73786413343844589510', '1', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `sys_role_fhbutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('03385d55f8d74bb1beb642b60a6de56f', '3264c8e83d0248bb9e3ea6195b4c0216', '4c7f34b9eed54683957f356afcda24df');
INSERT INTO `sys_role_fhbutton` VALUES ('07b81b740bf7439dae3e99455cf2b5ec', '06db3dfa8ee24e7dacf42264d680589c', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('635d7e9ff4494dec915cdf1fd79ccbf8', '06db3dfa8ee24e7dacf42264d680589c', '8988c3e7e6354e419738848ade7431d8');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('88d723607e3c4afea9ab2c395962ed82', '06db3dfa8ee24e7dacf42264d680589c', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('91958c938bfe4a5fb7b18c7c6a871848', '3264c8e83d0248bb9e3ea6195b4c0216', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `SCHOOL_ID` varchar(36) DEFAULT NULL COMMENT '学校id',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'admin', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2019-03-30 23:35:24', '0:0:0:0:0:0:0:1', '0', 'admin', 'default', 'QQ313596790@main.com', '001', '18788888888', null);
INSERT INTO `sys_user` VALUES ('4fa4fe44e169483a9db8fff4adadcd32', 'test2', 'ff5c981e515756ac18bb82aa7807dc43382c5e7e', '程亮2', '', '06db3dfa8ee24e7dacf42264d680589c', '2019-03-30 23:52:58', '0:0:0:0:0:0:0:1', '0', '12313', 'default', '12313@qq.com', '002', '18677332223', '1');
INSERT INTO `sys_user` VALUES ('5f38a80f54014aec9cc03c343a80da6b', 'test1', '5d8c9cfd972eadc84f1c16816c56974a818013ab', '程亮', '', '06db3dfa8ee24e7dacf42264d680589c', '2019-04-02 02:57:22', '0:0:0:0:0:0:0:1', '0', '测试用户前台', 'default', '707596848@qq.com', '100', '18654183527', '1');
INSERT INTO `sys_user` VALUES ('a0283febbbf74280b4ef93ffd2a2db9f', '123', 'f0f8e902ca7a41c634c5c8247d4b94f2c9b351fb', '123123', '', '06db3dfa8ee24e7dacf42264d680589c', '', '', '0', '123123', 'default', '433534@qq.com', '004', '18655433321', '1');
INSERT INTO `sys_user` VALUES ('c9e32e8338934897ba1c352b7e24bf94', 'test3', 'f167bf74fc7e1294df459f9a49d14854c0d1abb1', '234243', '', '06db3dfa8ee24e7dacf42264d680589c', '', '', '0', '12313123', 'default', '23424@qq.com', '003', '23423424234', '1');

-- ----------------------------
-- Table structure for `tb_attached`
-- ----------------------------
DROP TABLE IF EXISTS `tb_attached`;
CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attached
-- ----------------------------
INSERT INTO `tb_attached` VALUES ('60d05d8e7d9046a4893f8bdaa34d6488', 'eee', 'ee', '22.00', '2016-04-22 15:33:23');
INSERT INTO `tb_attached` VALUES ('d74b6f507e784607b8f85e31e3cfad22', 'AA', 'aaa', '222.00', '2016-04-17 18:20:41');

-- ----------------------------
-- Table structure for `tb_attachedmx`
-- ----------------------------
DROP TABLE IF EXISTS `tb_attachedmx`;
CREATE TABLE `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attachedmx
-- ----------------------------
INSERT INTO `tb_attachedmx` VALUES ('04717d1a034c4e51aacd5e062a4c63bd', 'ddd', 'ddd', '2016-03-29', '111.00', 'd74b6f507e784607b8f85e31e3cfad22');
INSERT INTO `tb_attachedmx` VALUES ('7992c783fd0b476d90be363858a941ba', 'ddd', 'ddsds', '2016-04-06', '222.00', 'd74b6f507e784607b8f85e31e3cfad22');

-- ----------------------------
-- Table structure for `tb_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------

-- ----------------------------
-- Table structure for `weixin_command`
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for `weixin_imgmsg`
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `weixin_textmsg`
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', '1', '关注回复');

-- ----------------------------
-- Table structure for `z_classroom`
-- ----------------------------
DROP TABLE IF EXISTS `z_classroom`;
CREATE TABLE `z_classroom` (
  `classroom_id` varchar(36) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `school_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`classroom_id`),
  KEY `id` (`classroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_classroom
-- ----------------------------
INSERT INTO `z_classroom` VALUES ('1', '教室一', '1');
INSERT INTO `z_classroom` VALUES ('2', '教室二', '1');
INSERT INTO `z_classroom` VALUES ('4ffaeac6804a4b38a2f43234a20221a9', '教室三', '1');

-- ----------------------------
-- Table structure for `z_grade`
-- ----------------------------
DROP TABLE IF EXISTS `z_grade`;
CREATE TABLE `z_grade` (
  `grade_id` varchar(36) NOT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '年级名称',
  `code` varchar(2) DEFAULT NULL COMMENT '年级代码',
  PRIMARY KEY (`grade_id`),
  KEY `id` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_grade
-- ----------------------------
INSERT INTO `z_grade` VALUES ('1', '初一', '01');
INSERT INTO `z_grade` VALUES ('2', '初二', '02');
INSERT INTO `z_grade` VALUES ('3', '初三', '03');
INSERT INTO `z_grade` VALUES ('4', '高一', '04');
INSERT INTO `z_grade` VALUES ('5', '高二', '05');
INSERT INTO `z_grade` VALUES ('6', '高三', '06');

-- ----------------------------
-- Table structure for `z_reception`
-- ----------------------------
DROP TABLE IF EXISTS `z_reception`;
CREATE TABLE `z_reception` (
  `id` varchar(36) NOT NULL,
  `school_id` varchar(36) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_reception
-- ----------------------------

-- ----------------------------
-- Table structure for `z_refund`
-- ----------------------------
DROP TABLE IF EXISTS `z_refund`;
CREATE TABLE `z_refund` (
  `refund_id` varchar(36) NOT NULL,
  `stu_id` varchar(36) DEFAULT NULL,
  `refund_amount` varchar(10) DEFAULT NULL COMMENT '退费金额',
  `subject_id` varchar(36) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_refund
-- ----------------------------

-- ----------------------------
-- Table structure for `z_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `z_schedule`;
CREATE TABLE `z_schedule` (
  `schedule_id` varchar(36) NOT NULL,
  `TimeDuring` varchar(20) DEFAULT NULL,
  `grade` varchar(4) DEFAULT NULL,
  `subject` varchar(5) DEFAULT NULL,
  `teather_name` varchar(20) DEFAULT NULL,
  `school_id` varchar(36) DEFAULT NULL,
  `classroom` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_schedule
-- ----------------------------
INSERT INTO `z_schedule` VALUES ('1eb012622c634b32a81af29668944462', '9:40-11:40', '初一', '数学', '是我企鹅', '1', '教室一');
INSERT INTO `z_schedule` VALUES ('7f6119bf1ea64817a610cf77d12a7588', '9:40-11:40', '初一', '化学', '呵呵2', '1', '教室一');
INSERT INTO `z_schedule` VALUES ('8b13ee67a3544d5aacba123f1683edc0', '7:10-9:10', '高一', '语文', '周虎', '1', '教室三');
INSERT INTO `z_schedule` VALUES ('93a9dc3b20b245ad9e7d6e188c316ebc', '9:40-11:40', '初三', '化学', '惹惹她', '1', '教室二');
INSERT INTO `z_schedule` VALUES ('d2e61130391843659548e5fce57c42cd', '7:10-9:10', '初一', '数学', '呵呵', '1', '教室一');
INSERT INTO `z_schedule` VALUES ('ea63fb0c58814268bf6a2b0981a3d534', '7:10-9:10', '初一', '语文', '我去额', '1', '教室三');

-- ----------------------------
-- Table structure for `z_school`
-- ----------------------------
DROP TABLE IF EXISTS `z_school`;
CREATE TABLE `z_school` (
  `school_id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '学校名称',
  `address` varchar(500) DEFAULT NULL COMMENT '学校地址',
  `code` varchar(10) DEFAULT NULL COMMENT '学校编码',
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  KEY `id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_school
-- ----------------------------
INSERT INTO `z_school` VALUES ('1', '测试学校', '合肥市高新区', '001', '0');

-- ----------------------------
-- Table structure for `z_sch_tea_associate`
-- ----------------------------
DROP TABLE IF EXISTS `z_sch_tea_associate`;
CREATE TABLE `z_sch_tea_associate` (
  `schoolteatherassociate_id` varchar(36) NOT NULL,
  `t_id` varchar(36) DEFAULT NULL COMMENT '老师id',
  `s_id` varchar(36) DEFAULT NULL COMMENT '学校id',
  PRIMARY KEY (`schoolteatherassociate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_sch_tea_associate
-- ----------------------------
INSERT INTO `z_sch_tea_associate` VALUES ('04be0cb1f93746d7995f4f9846bb08d1', '0642b7a971854949ac5c3edb4293a600', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('0ab1c253c1aa4b50b5e68f84780d2c43', 'eeb9ce7e611244af8c168eafd942010c', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('1', '1', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('92425ff86db845d38b40ca6576b42ff0', '1372b0de003745968b33faf6a253d295', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('c72ffcaecf6d496f9581164d7dbfa71a', '6d4bc2b4422a47bc8f05496df5e0deaa', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('e5280ca0164f458e92abc7f7e5ebdafd', '4359990a67c64903b48ad176bf0ddd3d', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('e78d0f1349b94a59b8d317d8dbb20822', '8931314b30e6429c8998c98d15774fa2', '1');
INSERT INTO `z_sch_tea_associate` VALUES ('f68fe553c97548ec88892b8762d61900', 'cf8b184508f14de2bf9225656d396523', '1');

-- ----------------------------
-- Table structure for `z_seat`
-- ----------------------------
DROP TABLE IF EXISTS `z_seat`;
CREATE TABLE `z_seat` (
  `seat_id` varchar(36) NOT NULL,
  `stu_id` varchar(300) DEFAULT NULL,
  `seat_row` varchar(3) DEFAULT NULL,
  `seat_column` varchar(3) DEFAULT NULL,
  `TimeDuring` varchar(200) DEFAULT NULL,
  `classroom_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `id` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_seat
-- ----------------------------
INSERT INTO `z_seat` VALUES ('189a34f04b51439aaf10e8babfac5c9d', ',daf5f57be9684d43b50433625d77c99c', '1', '4', ',9:40-11:40', '1');
INSERT INTO `z_seat` VALUES ('1e21bc627b284f7390a53d37485b66f3', null, '6', '6', null, '1');
INSERT INTO `z_seat` VALUES ('820b7b01ddde4dea9927ed574eecee53', ',daf5f57be9684d43b50433625d77c99c', '2', '2', ',7:10-9:10', '4ffaeac6804a4b38a2f43234a20221a9');
INSERT INTO `z_seat` VALUES ('8422fa2869ee4fb49be9c9413aaffaf0', '', '1', '1', '', '4ffaeac6804a4b38a2f43234a20221a9');
INSERT INTO `z_seat` VALUES ('9dc6c605df3048bd83692d4cf74ced24', '', '1', '5', '', '4ffaeac6804a4b38a2f43234a20221a9');
INSERT INTO `z_seat` VALUES ('a13d0e2a41e1456fa45281d567dbb87c', null, '2', '1', null, '1');
INSERT INTO `z_seat` VALUES ('a8683db25c6040f3ade7c8d8106a7d40', null, '1', '2', null, '1');

-- ----------------------------
-- Table structure for `z_student`
-- ----------------------------
DROP TABLE IF EXISTS `z_student`;
CREATE TABLE `z_student` (
  `student_id` varchar(36) NOT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '学生姓名',
  `phone` varchar(18) DEFAULT NULL COMMENT '电话',
  `grade` varchar(36) DEFAULT NULL COMMENT '年级',
  `school_id` varchar(36) DEFAULT NULL COMMENT '学校id',
  `create_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_student
-- ----------------------------
INSERT INTO `z_student` VALUES ('17071ce926da46339db8097eddf7bb99', '777', '777', '1', '1', '2019-03-24 17:13:59', '2019-03-24 17:13:59', '0');
INSERT INTO `z_student` VALUES ('27d5ae591e234b9c83622f183fd820d0', '测试学生1', '123132', '初一', '1', '2019-03-30 16:32:47', '2019-04-02 03:00:13', '0');
INSERT INTO `z_student` VALUES ('2f3d77e3596447648f002495324fcd67', '学生1', '18677645562', '1', '1', '2019-03-24 00:26:13', '2019-03-24 00:34:58', '0');
INSERT INTO `z_student` VALUES ('4b57317992cd4570b2cba579bd4c7b5b', '嘿嘿', '123123', '1', '1', '2019-03-30 14:39:55', '2019-03-30 14:39:55', '0');
INSERT INTO `z_student` VALUES ('5630b77bd3de401a982fa4258a31e021', 'ttttt', '123123', '初一', '1', '2019-03-30 15:06:54', '2019-03-30 15:06:54', '0');
INSERT INTO `z_student` VALUES ('7ef7c9cfc49b4cf7a1b8e2a5975f0185', 'ertet', '23423424', '高一', '1', '2019-03-24 23:21:00', '2019-03-30 15:31:34', '0');
INSERT INTO `z_student` VALUES ('8b30be881533441498d17ea20f4978e6', '学生2', '18766565432', '2', '1', '2019-03-24 00:38:13', '2019-03-24 00:38:13', '0');
INSERT INTO `z_student` VALUES ('9ec585434a1f444ab82d5965b981d210', '1', '1', '1', '1', '2019-03-24 23:15:06', '2019-03-24 23:15:06', '0');
INSERT INTO `z_student` VALUES ('a1b6cca5030c456c8997c8aad5e2fc26', '345', '345345', '1', '1', '2019-03-24 16:03:40', '2019-03-24 16:03:40', '0');
INSERT INTO `z_student` VALUES ('b5b052bc3bcf4e8d86ebb39acd99ee58', '哈哈', '123123123', '1', '1', '2019-03-30 14:38:37', '2019-03-30 14:38:37', '0');
INSERT INTO `z_student` VALUES ('c9fe27730fa14214bf641bfadc99c951', '123123', '123132', null, '1', '2019-03-30 14:59:20', '2019-03-30 14:59:20', '0');
INSERT INTO `z_student` VALUES ('daf5f57be9684d43b50433625d77c99c', '啊啊啊', '123123', '1', '1', '2019-03-30 14:42:24', '2019-03-30 14:42:24', '0');
INSERT INTO `z_student` VALUES ('dcd1e369a3ed4cc2ae67921c46be6148', '8', '8', '3', '1', '2019-03-24 17:16:05', '2019-03-24 17:16:05', '0');
INSERT INTO `z_student` VALUES ('e57427ea0c944b9ab213a14250353abb', 'uuuuu', '12313', '初一', '1', '2019-03-30 14:56:52', '2019-03-30 17:41:32', '0');
INSERT INTO `z_student` VALUES ('ee539200f8024436add1bfa9e398e735', '5', '5', '1', '1', '2019-03-24 16:06:24', '2019-03-24 16:06:24', '0');

-- ----------------------------
-- Table structure for `z_studentlist`
-- ----------------------------
DROP TABLE IF EXISTS `z_studentlist`;
CREATE TABLE `z_studentlist` (
  `studentlist_id` varchar(36) NOT NULL,
  `head_id` varchar(36) DEFAULT NULL,
  `TimeDuring` varchar(36) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `teather_name` varchar(20) DEFAULT NULL,
  `classroom` varchar(36) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_studentlist
-- ----------------------------
INSERT INTO `z_studentlist` VALUES ('015b1d523754401dac5762f4b6d5bbde', 'c9fe27730fa14214bf641bfadc99c951', '7:10-9:10', '初一', '语文', '我去额', '教室一', '2019-03-30 14:59:20', '2019-03-30 14:59:20');
INSERT INTO `z_studentlist` VALUES ('0af8fe2a3dd64d19a0b788b236729569', '5630b77bd3de401a982fa4258a31e021', '7:10-9:10', '初一', '语文', '我去额', '教室一', '2019-03-30 15:06:54', '2019-03-30 15:06:54');
INSERT INTO `z_studentlist` VALUES ('1eb997dc166c4969967650484922ef77', 'daf5f57be9684d43b50433625d77c99c', '7:10-9:10', '初一', '语文', '我去额', '教室一', '2019-03-30 14:42:24', '2019-03-30 14:42:24');
INSERT INTO `z_studentlist` VALUES ('272a5bda6e22430bb2799229cc3a43ac', 'e57427ea0c944b9ab213a14250353abb', '9:40-11:40', '初一', '化学', '呵呵2', '教室一', '2019-03-30 14:56:52', '2019-03-30 14:56:52');
INSERT INTO `z_studentlist` VALUES ('63e794e1c9634fe28d036e592b68bd0c', '27d5ae591e234b9c83622f183fd820d0', '7:10-9:10', '初一', '语文', '我去额', '教室一', '2019-03-30 16:32:47', '2019-03-30 16:32:47');
INSERT INTO `z_studentlist` VALUES ('6c801aa9d3174b8e912e262e3706f44c', null, '9:40-11:40', '初一', '数学', null, '教室一', null, null);
INSERT INTO `z_studentlist` VALUES ('7030f93118ec46dea94a4c07964c373f', 'daf5f57be9684d43b50433625d77c99c', '9:40-11:40', '初一', '数学', '是我企鹅', '教室一', '2019-03-30 14:42:24', '2019-03-30 14:42:24');
INSERT INTO `z_studentlist` VALUES ('7921eb3f62be4848a904c0748f906da5', 'c9fe27730fa14214bf641bfadc99c951', '9:40-11:40', '初一', '数学', '是我企鹅', '教室一', '2019-03-30 14:59:20', '2019-03-30 14:59:20');
INSERT INTO `z_studentlist` VALUES ('851b5e958c284492a67f81d2c11ee335', null, '9:40-11:40', '初一', '数学', null, '教室一', null, null);
INSERT INTO `z_studentlist` VALUES ('a229ded9ca92456aab285cff169a856b', null, '7:10-9:10', '初一', '语文', null, '教室一', null, null);
INSERT INTO `z_studentlist` VALUES ('d82f033a377749bb815fd7cd49e53bb3', null, '7:10-9:10', '初一', '语文', null, '教室一', null, null);

-- ----------------------------
-- Table structure for `z_stu_class_associate`
-- ----------------------------
DROP TABLE IF EXISTS `z_stu_class_associate`;
CREATE TABLE `z_stu_class_associate` (
  `studentclassassociate_id` varchar(36) NOT NULL,
  `s_id` varchar(36) DEFAULT NULL COMMENT '学生id',
  `c_id` varchar(36) DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`studentclassassociate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_stu_class_associate
-- ----------------------------

-- ----------------------------
-- Table structure for `z_stu_seat_associate`
-- ----------------------------
DROP TABLE IF EXISTS `z_stu_seat_associate`;
CREATE TABLE `z_stu_seat_associate` (
  `id` varchar(36) NOT NULL,
  `stu_id` varchar(36) DEFAULT NULL COMMENT '学生id',
  `seat_id` varchar(36) DEFAULT NULL COMMENT '座位id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_stu_seat_associate
-- ----------------------------

-- ----------------------------
-- Table structure for `z_stu_sub_associate`
-- ----------------------------
DROP TABLE IF EXISTS `z_stu_sub_associate`;
CREATE TABLE `z_stu_sub_associate` (
  `studentsubjectassociate_id` varchar(36) NOT NULL,
  `stu_id` varchar(36) DEFAULT NULL COMMENT '学生id',
  `sub_id` varchar(36) DEFAULT NULL COMMENT '学科id',
  PRIMARY KEY (`studentsubjectassociate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_stu_sub_associate
-- ----------------------------
INSERT INTO `z_stu_sub_associate` VALUES ('0515aa189056449bbd92c948f04dbddf', '7ef7c9cfc49b4cf7a1b8e2a5975f0185', '7');
INSERT INTO `z_stu_sub_associate` VALUES ('11841167db6143e8a8baf204a30d276c', '9ec585434a1f444ab82d5965b981d210', '5');
INSERT INTO `z_stu_sub_associate` VALUES ('4b9fa13188b84ffa96aecd1a7c3d15e4', '7ef7c9cfc49b4cf7a1b8e2a5975f0185', '2');
INSERT INTO `z_stu_sub_associate` VALUES ('5ad507b5d58040d98599b65b3a11364d', '9ec585434a1f444ab82d5965b981d210', '2');
INSERT INTO `z_stu_sub_associate` VALUES ('5d3518bdec9247a4ae42668b39b1cee7', '7ef7c9cfc49b4cf7a1b8e2a5975f0185', '3');
INSERT INTO `z_stu_sub_associate` VALUES ('81318e3607474371bbfbf7a3bcf651c9', '17071ce926da46339db8097eddf7bb99', '3');
INSERT INTO `z_stu_sub_associate` VALUES ('82cb2ff6147f44d18d4bac9940f87c8c', 'dcd1e369a3ed4cc2ae67921c46be6148', '7');
INSERT INTO `z_stu_sub_associate` VALUES ('920d49faaea44124a10a42a480c8d7a2', '17071ce926da46339db8097eddf7bb99', '8');
INSERT INTO `z_stu_sub_associate` VALUES ('c1c75e53ecaa48c5b788c28f4f7fdfcc', 'dcd1e369a3ed4cc2ae67921c46be6148', '9');
INSERT INTO `z_stu_sub_associate` VALUES ('e92d0033f3e6423c82160cce278e65f2', '9ec585434a1f444ab82d5965b981d210', '9');

-- ----------------------------
-- Table structure for `z_subject`
-- ----------------------------
DROP TABLE IF EXISTS `z_subject`;
CREATE TABLE `z_subject` (
  `subject_id` varchar(36) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '科目名称',
  `code` varchar(36) DEFAULT NULL COMMENT '科目编号',
  PRIMARY KEY (`subject_id`),
  KEY `id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_subject
-- ----------------------------
INSERT INTO `z_subject` VALUES ('1', '语文', '001');
INSERT INTO `z_subject` VALUES ('2', '数学', '002');
INSERT INTO `z_subject` VALUES ('3', '英语', '003');
INSERT INTO `z_subject` VALUES ('4', '化学', '004');
INSERT INTO `z_subject` VALUES ('5', '物理', '005');
INSERT INTO `z_subject` VALUES ('6', '生物', '006');
INSERT INTO `z_subject` VALUES ('7', '政治', '007');
INSERT INTO `z_subject` VALUES ('8', '历史', '008');
INSERT INTO `z_subject` VALUES ('9', '地理', '009');

-- ----------------------------
-- Table structure for `z_teather`
-- ----------------------------
DROP TABLE IF EXISTS `z_teather`;
CREATE TABLE `z_teather` (
  `teather_id` varchar(36) NOT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `age` varchar(3) DEFAULT NULL COMMENT '年龄',
  `gender` varchar(1) DEFAULT NULL COMMENT '性别',
  `code` varchar(36) DEFAULT NULL COMMENT '教师编号',
  `create_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`teather_id`),
  KEY `id` (`teather_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_teather
-- ----------------------------
INSERT INTO `z_teather` VALUES ('0642b7a971854949ac5c3edb4293a600', '周虎', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('0b945151f52544318f9d70a914fc9d48', '我去额', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('1', '老师1', '30', '男', '001', '2019-03-23 13:57:37', '2019-03-23 13:57:37', '0');
INSERT INTO `z_teather` VALUES ('1372b0de003745968b33faf6a253d295', '7777', '777', '女', '777', '2019-03-23 17:58:11', '2019-03-23 17:58:11', '0');
INSERT INTO `z_teather` VALUES ('1eef315428a8407babc18df39e416290', null, null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('4359990a67c64903b48ad176bf0ddd3d', '呵呵2', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('46bdbdae4d884f6f8e57be03510d4555', '的说法都是', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('4ffba491b31d401cabadce0464834cb2', '温热温热', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('54ffc87cb48d4426aba2de3597ef4c3c', null, null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('6d4bc2b4422a47bc8f05496df5e0deaa', '老师3', '24', '女', '003', '2019-03-23 17:54:46', '2019-03-23 17:54:46', '0');
INSERT INTO `z_teather` VALUES ('6e9803e3f79b4b4f910e3619ff3eb0f8', '惹惹她', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('8931314b30e6429c8998c98d15774fa2', '老师2', '24', '女', '234', '2019-03-23 17:57:14', '2019-03-23 17:57:14', '0');
INSERT INTO `z_teather` VALUES ('cf8b184508f14de2bf9225656d396523', '老师2', '24', '女', '002', '2019-03-23 17:49:42', '2019-03-23 17:49:42', '0');
INSERT INTO `z_teather` VALUES ('d9fd612bd6c84edb86c7d7103ef1fb89', '是我企鹅', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('eeb9ce7e611244af8c168eafd942010c', '呵呵', null, null, null, null, null, '0');
INSERT INTO `z_teather` VALUES ('f145b0ccd863453fb11023333674679c', '爱的', null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for `z_tea_stu_associate`
-- ----------------------------
DROP TABLE IF EXISTS `z_tea_stu_associate`;
CREATE TABLE `z_tea_stu_associate` (
  `teatherstudentassociate_id` varchar(36) NOT NULL,
  `t_id` varchar(36) DEFAULT NULL COMMENT '老师id',
  `s_id` varchar(36) DEFAULT NULL COMMENT '学生id',
  PRIMARY KEY (`teatherstudentassociate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_tea_stu_associate
-- ----------------------------
INSERT INTO `z_tea_stu_associate` VALUES ('079a5e6ef62940e393f7a8a6f4c58b87', '8931314b30e6429c8998c98d15774fa2', '9ec585434a1f444ab82d5965b981d210');
INSERT INTO `z_tea_stu_associate` VALUES ('130852b9278644d8aa16a434bb637fdc', '1', 'dcd1e369a3ed4cc2ae67921c46be6148');
INSERT INTO `z_tea_stu_associate` VALUES ('476a917cbad747ffb0d678b4155066f0', '8931314b30e6429c8998c98d15774fa2', '17071ce926da46339db8097eddf7bb99');
INSERT INTO `z_tea_stu_associate` VALUES ('6e0d6cedb7b8463b8935b08b050ddf60', '6d4bc2b4422a47bc8f05496df5e0deaa', '9ec585434a1f444ab82d5965b981d210');
INSERT INTO `z_tea_stu_associate` VALUES ('7dc7974becec4df4ac08b2a4f36e99f4', '1', '7ef7c9cfc49b4cf7a1b8e2a5975f0185');
INSERT INTO `z_tea_stu_associate` VALUES ('8e6f2f5bc51a490d9a0e4df574783658', '1372b0de003745968b33faf6a253d295', '7ef7c9cfc49b4cf7a1b8e2a5975f0185');
INSERT INTO `z_tea_stu_associate` VALUES ('91d877861281498fadbc3210e8e82eaf', '1', '9ec585434a1f444ab82d5965b981d210');
INSERT INTO `z_tea_stu_associate` VALUES ('9c5aa0f7ebca4d9dbd1c2f5a19edda7c', '8931314b30e6429c8998c98d15774fa2', '17071ce926da46339db8097eddf7bb99');
INSERT INTO `z_tea_stu_associate` VALUES ('c952105da2324f78bb2b050b6461a6ed', '6d4bc2b4422a47bc8f05496df5e0deaa', 'dcd1e369a3ed4cc2ae67921c46be6148');
INSERT INTO `z_tea_stu_associate` VALUES ('d3e333e42d81492588fe576f4ad383bb', '6d4bc2b4422a47bc8f05496df5e0deaa', '7ef7c9cfc49b4cf7a1b8e2a5975f0185');

-- ----------------------------
-- Table structure for `z_tea_sub_associate`
-- ----------------------------
DROP TABLE IF EXISTS `z_tea_sub_associate`;
CREATE TABLE `z_tea_sub_associate` (
  `teathersubjectassociate_id` varchar(36) NOT NULL,
  `t_id` varchar(36) DEFAULT NULL COMMENT '教师id',
  `s_id` varchar(36) DEFAULT NULL COMMENT '学科id',
  PRIMARY KEY (`teathersubjectassociate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_tea_sub_associate
-- ----------------------------
INSERT INTO `z_tea_sub_associate` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `z_timeduring`
-- ----------------------------
DROP TABLE IF EXISTS `z_timeduring`;
CREATE TABLE `z_timeduring` (
  `timeduring_id` varchar(36) NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `timeDuring` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`timeduring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_timeduring
-- ----------------------------
INSERT INTO `z_timeduring` VALUES ('1', '01', '7:10-9:10');
INSERT INTO `z_timeduring` VALUES ('2', '02', '9:40-11:40');
INSERT INTO `z_timeduring` VALUES ('3', '03', '13:10-15:10');
INSERT INTO `z_timeduring` VALUES ('4', '04', '15:30-17:30');
INSERT INTO `z_timeduring` VALUES ('5', '05', '18:30-20:30');
