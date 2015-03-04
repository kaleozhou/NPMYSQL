/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL
Source Server Version : 50618
Source Host           : localhost:3306
Source Database       : newm

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2015-01-02 02:30:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app_user
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
INSERT INTO `sys_app_user` VALUES ('13dbff2292ac4108bf3ce16d431e792d', 'k2', 'c4ca4238a0b923820dcc509a6f75849b', '22', '', 'f944a9df72634249bbcb8cb73b0c9b86', '', '', '0', '22', '2', '2', '2014-12-02', '2014-12-24', '2', '12', '222@qq.com');
INSERT INTO `sys_app_user` VALUES ('265688c2f4dc4defb4074601880f4cfc', 'k4', 'c4ca4238a0b923820dcc509a6f75849b', 'k', '', 'f944a9df72634249bbcb8cb73b0c9b86', '', '', '1', 'k', '1111', '1111', '2014-12-03', '2014-12-26', '1', '901', 'qqqqq@qq.com');
INSERT INTO `sys_app_user` VALUES ('d9cf895d3be54d6082f8cf91fb422f75', 'k1', 'c4ca4238a0b923820dcc509a6f75849b', 'K', '', 'f944a9df72634249bbcb8cb73b0c9b86', '', '', '1', 'K', '1', '', '2014-12-16', '2014-12-16', '1', '010', '313596790@qq.com');

-- ----------------------------
-- Table structure for sys_gl_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('318df4c13a434293b389afe41866a04c', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('7de550fd36d84ff8837dac45c5cbdf07', '4', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '', '0', '1', 'icon-desktop', '1');
INSERT INTO `sys_menu` VALUES ('2', '组织管理', 'role.do?1=1', '1', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('4', '会员管理', 'happuser/listUsers.do?1=1&', '1', '4', null, '1');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do?1=1', '1', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '', '0', '2', 'icon-list-alt', '2');

-- ----------------------------
-- Table structure for sys_role
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
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '118', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '118', '1', '34', '18', '1', '38', '2');
INSERT INTO `sys_role` VALUES ('318df4c13a434293b389afe41866a04c', '组长', '50', '4', '0', '0', '0', '0', '318df4c13a434293b389afe41866a04c');
INSERT INTO `sys_role` VALUES ('4', '用户组', '50', '0', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '498', '7', '0', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6');
INSERT INTO `sys_role` VALUES ('6', '客户组', '18', '0', '1', '1', '1', '1', null);
INSERT INTO `sys_role` VALUES ('68f23fc0caee475bae8d52244dea8444', '中级会员', '498', '7', '0', '0', '0', '0', '68f23fc0caee475bae8d52244dea8444');
INSERT INTO `sys_role` VALUES ('7', '会员组', '498', '0', '0', '0', '0', '1', null);
INSERT INTO `sys_role` VALUES ('7de550fd36d84ff8837dac45c5cbdf07', '经理', '50', '4', '1', '1', '1', '1', '7de550fd36d84ff8837dac45c5cbdf07');
INSERT INTO `sys_role` VALUES ('ac66961adaa2426da4470c72ffeec117', '管理员A', '118', '1', '0', '0', '0', '246', 'ac66961adaa2426da4470c72ffeec117');
INSERT INTO `sys_role` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '高级会员', '498', '7', '0', '0', '0', '0', 'b0c77c29dfa140dc9b14a29c056f824f');
INSERT INTO `sys_role` VALUES ('e74f713314154c35bd7fc98897859fe3', '黄金客户', '18', '6', '1', '1', '1', '1', 'e74f713314154c35bd7fc98897859fe3');
INSERT INTO `sys_role` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '初级会员', '498', '7', '1', '1', '1', '1', 'f944a9df72634249bbcb8cb73b0c9b86');

-- ----------------------------
-- Table structure for sys_user
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
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0b3f2ab1896b47c097a81d322697446a', 'zhangsan', 'c4ca4238a0b923820dcc509a6f75849b', '张三', '', '2', '2015-01-02 12:04:51', '127.0.0.1', '0', '小张', 'default', 'wwwwq@qq.com', '1101', '18788888888');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2015-01-02 02:28:34', '127.0.0.1', '0', '最高统治者', 'skin-1', 'admin@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('7cfc9461834541cd9089b66155ddb6df', 'FH', '202cb962ac59075b964b07152d234b70', 'FH', '', '2', '', '', '0', 'ass', 'default', '313596790@qq.com', '1102', '18788888888');
INSERT INTO `sys_user` VALUES ('9502464f9cff4c03bb6b4b690e63e873', 'sidifensen', '202cb962ac59075b964b07152d234b70', '斯蒂芬森', '', '2', '', '', '0', 'sss', 'default', 'asda@qq.com', '2342', '18788888888');
INSERT INTO `sys_user` VALUES ('9e920c4ddfa14e00b2a1c27ad4094562', 'zhangsanshuo', '202cb962ac59075b964b07152d234b70', '张三说', '', '2', '', '', '0', '小张', 'default', 'zhangssdan@www.com', '12321101', '2147483647');
INSERT INTO `sys_user` VALUES ('fb93ac6a67014c1db84bad08127f0215', 'wangwu', '202cb962ac59075b964b07152d234b70', '王五', '', '7de550fd36d84ff8837dac45c5cbdf07', '', '', '0', '小张', 'default', 'zhangsan@www.com', '2222', '18788888888');

-- ----------------------------
-- Table structure for sys_user_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('318df4c13a434293b389afe41866a04c', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('7de550fd36d84ff8837dac45c5cbdf07', '11', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_zidian
-- ----------------------------
DROP TABLE IF EXISTS `sys_zidian`;
CREATE TABLE `sys_zidian` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_zidian
-- ----------------------------
INSERT INTO `sys_zidian` VALUES ('212a6765fddc4430941469e1ec8c8e6c', '人事部', '001', '1', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_001');
INSERT INTO `sys_zidian` VALUES ('3cec73a7cc8a4cb79e3f6ccc7fc8858c', '行政部', '002', '2', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_002');
INSERT INTO `sys_zidian` VALUES ('5a1547632cca449db378fbb9a042b336', '研发部', '004', '4', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_004');
INSERT INTO `sys_zidian` VALUES ('7a4a6d196d6743159b191b773afdf19d', '市场部', '005', '5', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_005');
INSERT INTO `sys_zidian` VALUES ('7f9cd74e60a140b0aea5095faa95cda3', '财务部', '003', '3', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_003');
INSERT INTO `sys_zidian` VALUES ('c067fdaf51a141aeaa56ed26b70de863', '部门', 'BM', '1', '0', '1', 'BM');
INSERT INTO `sys_zidian` VALUES ('cdba0b5ef20e4fc0a5231fa3e9ae246a', '地区', 'DQ', '2', '0', '1', 'DQ');
INSERT INTO `sys_zidian` VALUES ('f30bf95e216d4ebb8169ff0c86330b8f', '客服部', '006', '6', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_006');
