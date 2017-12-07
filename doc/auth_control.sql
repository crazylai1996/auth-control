/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : auth_control

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-12-07 11:34:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `bPermissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `vPermissionDesc` varchar(30) DEFAULT NULL,
  `vUrl` varchar(30) DEFAULT NULL,
  `tIsNavi` tinyint(4) DEFAULT '0',
  `vPermissionCode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bPermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', '用户列表', '/user/list', '1', 'user:list');
INSERT INTO `auth_permission` VALUES ('2', '添加新用户', '', '0', 'user:add');
INSERT INTO `auth_permission` VALUES ('3', '删除用户', '', '0', 'user:delete');
INSERT INTO `auth_permission` VALUES ('4', '查看用户角色', '', '0', 'user:showroles');
INSERT INTO `auth_permission` VALUES ('5', '添加用户角色关联', '', '0', 'user:corelationrole');
INSERT INTO `auth_permission` VALUES ('6', '角色列表', '/role/list', '1', 'role:list');
INSERT INTO `auth_permission` VALUES ('7', '添加新角色', '', '0', 'role:add');
INSERT INTO `auth_permission` VALUES ('8', '删除角色', '', '0', 'role:delete');
INSERT INTO `auth_permission` VALUES ('9', '查看角色信息', '', '0', 'role:findinfo');
INSERT INTO `auth_permission` VALUES ('10', '添加角色权限关联', '', '0', 'role:corelationperm');
INSERT INTO `auth_permission` VALUES ('11', '查看角色权限', '', '0', 'role:showperms');
INSERT INTO `auth_permission` VALUES ('12', '权限列表', '/perm/list', '1', 'perm:list');
INSERT INTO `auth_permission` VALUES ('13', '添加新权限', '', '0', 'perm:add');
INSERT INTO `auth_permission` VALUES ('14', '删除权限', '', '0', 'perm:delete');
INSERT INTO `auth_permission` VALUES ('15', '更新权限信息', '', '0', 'perm:update');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `bRoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `vRoleName` varchar(15) DEFAULT NULL,
  `vRoleDesc` varchar(30) DEFAULT NULL,
  `vRoleCode` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`bRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('8', '用户管理员', '用户管理', 'userAdmin');
INSERT INTO `auth_role` VALUES ('9', '类目管理员', '类目管理', 'classAdmin');
INSERT INTO `auth_role` VALUES ('10', '商品管理员', '商品管理', 'commodityAdmin');
INSERT INTO `auth_role` VALUES ('11', '评论管理员', '评论管理', 'commentAdmin');

-- ----------------------------
-- Table structure for auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission`;
CREATE TABLE `auth_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bRoleId` bigint(20) DEFAULT NULL,
  `bPermissionId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`bRoleId`),
  KEY `FK_Reference_4` (`bPermissionId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`bRoleId`) REFERENCES `auth_role` (`bRoleId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`bPermissionId`) REFERENCES `auth_permission` (`bPermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_permission
-- ----------------------------
INSERT INTO `auth_role_permission` VALUES ('25', '8', '1');
INSERT INTO `auth_role_permission` VALUES ('26', '8', '2');
INSERT INTO `auth_role_permission` VALUES ('27', '8', '3');
INSERT INTO `auth_role_permission` VALUES ('28', '8', '4');
INSERT INTO `auth_role_permission` VALUES ('29', '8', '5');
INSERT INTO `auth_role_permission` VALUES ('30', '8', '6');
INSERT INTO `auth_role_permission` VALUES ('31', '8', '7');
INSERT INTO `auth_role_permission` VALUES ('32', '8', '8');
INSERT INTO `auth_role_permission` VALUES ('33', '8', '9');
INSERT INTO `auth_role_permission` VALUES ('34', '8', '10');
INSERT INTO `auth_role_permission` VALUES ('35', '8', '11');
INSERT INTO `auth_role_permission` VALUES ('36', '8', '12');
INSERT INTO `auth_role_permission` VALUES ('37', '8', '13');
INSERT INTO `auth_role_permission` VALUES ('38', '8', '14');
INSERT INTO `auth_role_permission` VALUES ('39', '8', '15');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `bUserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `vUserName` varchar(15) DEFAULT NULL,
  `cPassword` char(32) DEFAULT NULL,
  `cPasswordSalt` char(32) DEFAULT NULL,
  PRIMARY KEY (`bUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'sisu', '05be14bd7947b8ee42f2f5aed24fada1', '35fcf26ebc6db17471d33ae21dab1f16');
INSERT INTO `auth_user` VALUES ('6', 'lailai', '0e04ce8cf9e1dfa071940aac54fb7d87', '4eb75ed8d81b48a0e6e612694ee91582');
INSERT INTO `auth_user` VALUES ('13', 'mingming', 'e1ad6a808a8bddbd858c98befc16b763', '90ccceaeff871d1c764f51574961b244');
INSERT INTO `auth_user` VALUES ('14', 'admin', '1637fcf8b38df9216beeab1ee78cabb8', '84012b1f7ab582eb1a0eb46ed08fb5a9');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bUserId` bigint(20) DEFAULT NULL,
  `bRoleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`bUserId`),
  KEY `FK_Reference_2` (`bRoleId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`bUserId`) REFERENCES `auth_user` (`bUserId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`bRoleId`) REFERENCES `auth_role` (`bRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('17', '1', '8');
INSERT INTO `auth_user_role` VALUES ('18', '1', '9');
INSERT INTO `auth_user_role` VALUES ('19', '1', '10');
INSERT INTO `auth_user_role` VALUES ('20', '1', '11');
INSERT INTO `auth_user_role` VALUES ('27', '13', '9');
INSERT INTO `auth_user_role` VALUES ('28', '13', '10');
INSERT INTO `auth_user_role` VALUES ('29', '13', '11');
INSERT INTO `auth_user_role` VALUES ('30', '14', '8');
INSERT INTO `auth_user_role` VALUES ('31', '14', '9');
INSERT INTO `auth_user_role` VALUES ('32', '14', '10');
INSERT INTO `auth_user_role` VALUES ('33', '14', '11');
