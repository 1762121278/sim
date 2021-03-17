/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : prometion

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 17/03/2021 21:54:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `deptno` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `local` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门位置',
  PRIMARY KEY (`deptno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '开发部', '北京');
INSERT INTO `dept` VALUES (2, '研发部', '上海');
INSERT INTO `dept` VALUES (3, '公关部', '深圳');
INSERT INTO `dept` VALUES (4, '市场部', '广州');
INSERT INTO `dept` VALUES (5, '总裁办', '天山上');
INSERT INTO `dept` VALUES (6, '测试部', '合肥');
INSERT INTO `dept` VALUES (7, '工程部', '任丘');
INSERT INTO `dept` VALUES (8, '安全部', '河北');

-- ----------------------------
-- Table structure for emp_role
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role`  (
  `erid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_fk` int(11) DEFAULT NULL COMMENT '角色表的关联外键',
  `emp_fk` int(11) DEFAULT NULL COMMENT '员工表的关联外键',
  `erdis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预留字段没有实际意义',
  PRIMARY KEY (`erid`) USING BTREE,
  INDEX `emp_fk`(`emp_fk`) USING BTREE,
  INDEX `role_fk`(`role_fk`) USING BTREE,
  CONSTRAINT `emp_role_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_role_ibfk_2` FOREIGN KEY (`role_fk`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp_role
-- ----------------------------
INSERT INTO `emp_role` VALUES (1, 16, 1, NULL);
INSERT INTO `emp_role` VALUES (2, 17, 6, NULL);
INSERT INTO `emp_role` VALUES (3, 17, 7, NULL);
INSERT INTO `emp_role` VALUES (4, 18, 8, NULL);
INSERT INTO `emp_role` VALUES (5, 18, 9, NULL);
INSERT INTO `emp_role` VALUES (6, 17, 10, NULL);
INSERT INTO `emp_role` VALUES (7, 16, 11, NULL);
INSERT INTO `emp_role` VALUES (8, 17, 12, NULL);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号（主键）',
  `ename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `esex` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `eage` int(11) DEFAULT NULL COMMENT '年龄',
  `telephone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `hiredate` date DEFAULT NULL COMMENT '入职日期',
  `pnum` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号码',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `dfk` int(11) DEFAULT NULL COMMENT '部门表的外键',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`eid`) USING BTREE,
  INDEX `dfk`(`dfk`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dfk`) REFERENCES `dept` (`deptno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '明王', '男', 43, '110', '2020-03-02', '0011', '110', '123', '权利操纵者', 5, 'a9.jpg');
INSERT INTO `employee` VALUES (6, '王三', '男', 26, '123', '2020-08-11', NULL, '123', '123', '独守空房王', 2, 'a1.jpg');
INSERT INTO `employee` VALUES (7, '李四', '男', 25, '324', '2020-08-03', NULL, '324', '123', '的收发快捷酒店', 2, 'a2.jpg');
INSERT INTO `employee` VALUES (8, '王五', '男', 32, '34', '2020-08-10', NULL, '34', '123', '开发股份两个', 3, 'a3.jpg');
INSERT INTO `employee` VALUES (9, '王刘', '男', 35, '435', '2020-08-09', NULL, '435', '123', '看过了梵蒂冈', 4, 'a4.jpg');
INSERT INTO `employee` VALUES (10, '赵四', '男', 31, '45435', '2020-08-03', NULL, '123456', '123', '放大看价格咖啡馆', 4, 'a5.jpg');
INSERT INTO `employee` VALUES (11, 'A', '男', 23, '120', '2020-08-12', '110', '321', '123', 'dsflkjdslkfjdsfl', 2, 'a6.jpg');
INSERT INTO `employee` VALUES (12, 'B', '女', 23, '120', '2020-08-12', '110', '456', '123', '第三方第三方的', 3, 'a7.jpg');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `roledis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  `status` int(11) DEFAULT 0 COMMENT '是否启用(0 禁用 1启用)',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (16, 'VIPee', '很萌ee', 1);
INSERT INTO `role` VALUES (17, 'VVIP', '超级强', 1);
INSERT INTO `role` VALUES (18, 'ppp', '宇宙无敌', 1);
INSERT INTO `role` VALUES (23, 'svip', '超级会员', 1);

-- ----------------------------
-- Table structure for role_sources
-- ----------------------------
DROP TABLE IF EXISTS `role_sources`;
CREATE TABLE `role_sources`  (
  `rsid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键字段',
  `rsdis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预留字段无实际意义',
  `resources_fk` int(11) DEFAULT NULL COMMENT '权限表的关联字段',
  `role_fk` int(11) DEFAULT NULL COMMENT '角色表的关联字段',
  PRIMARY KEY (`rsid`) USING BTREE,
  INDEX `roleid`(`role_fk`) USING BTREE,
  INDEX `sid`(`resources_fk`) USING BTREE,
  CONSTRAINT `role_sources_ibfk_1` FOREIGN KEY (`resources_fk`) REFERENCES `sources` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_sources_ibfk_2` FOREIGN KEY (`role_fk`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_sources
-- ----------------------------
INSERT INTO `role_sources` VALUES (22, NULL, 1, 17);
INSERT INTO `role_sources` VALUES (23, NULL, 2, 17);
INSERT INTO `role_sources` VALUES (24, NULL, 9, 17);
INSERT INTO `role_sources` VALUES (25, NULL, 10, 17);
INSERT INTO `role_sources` VALUES (26, NULL, 11, 17);
INSERT INTO `role_sources` VALUES (27, NULL, 12, 17);
INSERT INTO `role_sources` VALUES (28, NULL, 13, 17);
INSERT INTO `role_sources` VALUES (29, NULL, 3, 17);
INSERT INTO `role_sources` VALUES (30, NULL, 14, 17);
INSERT INTO `role_sources` VALUES (31, NULL, 15, 17);
INSERT INTO `role_sources` VALUES (32, NULL, 16, 17);
INSERT INTO `role_sources` VALUES (33, NULL, 17, 17);
INSERT INTO `role_sources` VALUES (34, NULL, 18, 17);
INSERT INTO `role_sources` VALUES (35, NULL, 19, 17);
INSERT INTO `role_sources` VALUES (36, NULL, 20, 17);
INSERT INTO `role_sources` VALUES (37, NULL, 21, 17);
INSERT INTO `role_sources` VALUES (38, NULL, 4, 17);
INSERT INTO `role_sources` VALUES (39, NULL, 27, 17);
INSERT INTO `role_sources` VALUES (40, NULL, 31, 17);
INSERT INTO `role_sources` VALUES (41, NULL, 32, 17);
INSERT INTO `role_sources` VALUES (42, NULL, 33, 17);
INSERT INTO `role_sources` VALUES (43, NULL, 46, 17);
INSERT INTO `role_sources` VALUES (44, '', 47, 17);
INSERT INTO `role_sources` VALUES (45, NULL, 34, 17);
INSERT INTO `role_sources` VALUES (107, NULL, 1, 16);
INSERT INTO `role_sources` VALUES (108, NULL, 3, 16);
INSERT INTO `role_sources` VALUES (109, NULL, 16, 16);
INSERT INTO `role_sources` VALUES (110, NULL, 19, 16);
INSERT INTO `role_sources` VALUES (111, NULL, 21, 16);
INSERT INTO `role_sources` VALUES (112, NULL, 4, 16);
INSERT INTO `role_sources` VALUES (113, NULL, 27, 16);
INSERT INTO `role_sources` VALUES (114, NULL, 31, 16);
INSERT INTO `role_sources` VALUES (115, NULL, 32, 16);
INSERT INTO `role_sources` VALUES (116, NULL, 33, 16);
INSERT INTO `role_sources` VALUES (117, NULL, 28, 16);
INSERT INTO `role_sources` VALUES (118, NULL, 29, 16);
INSERT INTO `role_sources` VALUES (183, NULL, 1, 23);
INSERT INTO `role_sources` VALUES (184, NULL, 2, 23);
INSERT INTO `role_sources` VALUES (185, NULL, 9, 23);
INSERT INTO `role_sources` VALUES (186, NULL, 10, 23);
INSERT INTO `role_sources` VALUES (187, NULL, 11, 23);
INSERT INTO `role_sources` VALUES (188, NULL, 12, 23);
INSERT INTO `role_sources` VALUES (189, NULL, 13, 23);
INSERT INTO `role_sources` VALUES (190, NULL, 3, 23);
INSERT INTO `role_sources` VALUES (191, NULL, 14, 23);
INSERT INTO `role_sources` VALUES (192, NULL, 15, 23);
INSERT INTO `role_sources` VALUES (193, NULL, 16, 23);
INSERT INTO `role_sources` VALUES (194, NULL, 17, 23);
INSERT INTO `role_sources` VALUES (195, NULL, 18, 23);
INSERT INTO `role_sources` VALUES (196, NULL, 19, 23);
INSERT INTO `role_sources` VALUES (197, NULL, 20, 23);
INSERT INTO `role_sources` VALUES (198, NULL, 21, 23);
INSERT INTO `role_sources` VALUES (199, NULL, 4, 23);
INSERT INTO `role_sources` VALUES (200, NULL, 27, 23);
INSERT INTO `role_sources` VALUES (201, NULL, 31, 23);
INSERT INTO `role_sources` VALUES (202, NULL, 32, 23);
INSERT INTO `role_sources` VALUES (203, NULL, 33, 23);
INSERT INTO `role_sources` VALUES (204, NULL, 28, 23);
INSERT INTO `role_sources` VALUES (205, NULL, 29, 23);
INSERT INTO `role_sources` VALUES (206, NULL, 34, 23);
INSERT INTO `role_sources` VALUES (207, NULL, 39, 23);
INSERT INTO `role_sources` VALUES (208, NULL, 40, 23);
INSERT INTO `role_sources` VALUES (209, NULL, 41, 23);
INSERT INTO `role_sources` VALUES (210, NULL, 35, 23);
INSERT INTO `role_sources` VALUES (211, NULL, 42, 23);
INSERT INTO `role_sources` VALUES (212, NULL, 43, 23);
INSERT INTO `role_sources` VALUES (213, NULL, 44, 23);
INSERT INTO `role_sources` VALUES (214, NULL, 36, 23);
INSERT INTO `role_sources` VALUES (215, NULL, 45, 23);

-- ----------------------------
-- Table structure for sources
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源路径',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源备注',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sources
-- ----------------------------
INSERT INTO `sources` VALUES (1, 'oa办公协同系统', NULL, '系统名称', NULL, NULL);
INSERT INTO `sources` VALUES (2, '项目管理', 'table.jsp', '项目管理', 1, NULL);
INSERT INTO `sources` VALUES (3, '日常办公', 'table.jsp', '日常办公', 1, NULL);
INSERT INTO `sources` VALUES (4, '消息管理', 'table.jsp', '信息箱', 1, NULL);
INSERT INTO `sources` VALUES (9, '基本信息管理', 'project-base.jsp', '项目基本信息', 2, NULL);
INSERT INTO `sources` VALUES (10, '需求信息管理', 'project-need.jsp', '项目需求分析', 2, NULL);
INSERT INTO `sources` VALUES (11, '模块管理', 'project-model.jsp', '模块管理', 2, NULL);
INSERT INTO `sources` VALUES (12, '功能管理', 'project-function.jsp', '功能管理', 2, NULL);
INSERT INTO `sources` VALUES (13, '附件管理', 'project-file.jsp', '附件管理', 2, NULL);
INSERT INTO `sources` VALUES (14, '创建任务', 'task-add.jsp', '创建任务', 3, NULL);
INSERT INTO `sources` VALUES (15, '任务信息', 'task.jsp', '任务信息', 3, NULL);
INSERT INTO `sources` VALUES (16, '我的任务', 'task-my.jsp', '我的任务', 3, NULL);
INSERT INTO `sources` VALUES (17, '通知公告', 'notice.jsp', '通知公告', 3, NULL);
INSERT INTO `sources` VALUES (18, '档案管理', 'archives.jsp', '档案管理', 3, NULL);
INSERT INTO `sources` VALUES (19, '我的档案', 'myarchives.jsp', '我的档案', 3, NULL);
INSERT INTO `sources` VALUES (20, '报销审批', 'baoxiao-task.jsp', '报销审批', 3, NULL);
INSERT INTO `sources` VALUES (21, '我的报销', 'mybaoxiao-base.jsp', '我的报销', 3, NULL);
INSERT INTO `sources` VALUES (27, '发送邮件', 'email-send.jsp', '仅仅使用javamail发送邮件就ok啦', 4, NULL);
INSERT INTO `sources` VALUES (28, '客户信息管理', 'table.jsp', '管理客户信息', 1, NULL);
INSERT INTO `sources` VALUES (29, '客户信息', 'customer.jsp', '客户信息的统计', 28, NULL);
INSERT INTO `sources` VALUES (31, '发件箱', 'email.jsp', '发件箱', 4, NULL);
INSERT INTO `sources` VALUES (32, '消息推送', 'message-give.jsp', '消息推送', 4, NULL);
INSERT INTO `sources` VALUES (33, '论坛', 'forum.jsp', '论坛', 4, NULL);
INSERT INTO `sources` VALUES (34, '系统管理', 'table.jsp', '系统管理', 1, NULL);
INSERT INTO `sources` VALUES (35, '对标管理', 'table.jsp', '对标管理', 1, NULL);
INSERT INTO `sources` VALUES (36, '个人信息', 'table.jsp', '曾经沧海难为水,除却巫山不是云', 1, NULL);
INSERT INTO `sources` VALUES (39, '人员管理', '/employee/showEmployeeInfo', '人员管理', 34, NULL);
INSERT INTO `sources` VALUES (40, '权限维护', 'table.jsp', '权限维护', 34, NULL);
INSERT INTO `sources` VALUES (41, '角色管理', '/role/showRoleInfo', '角色管理', 34, NULL);
INSERT INTO `sources` VALUES (42, '数据采集', 'duibiao-base.jsp', '数据采集', 35, NULL);
INSERT INTO `sources` VALUES (43, '设定指标', 'indexvalue-base.jsp', '设定指标', 35, NULL);
INSERT INTO `sources` VALUES (44, '目标营业额分析', 'duibiao-result.jsp', '目标营业额分析', 35, NULL);
INSERT INTO `sources` VALUES (45, '信息检索', 'info.jsp', '信息查看', 36, NULL);
INSERT INTO `sources` VALUES (46, '部门管理', '/dept/showDeptInfo', '部门管理', 34, NULL);
INSERT INTO `sources` VALUES (47, '菜单资源管理', 'list-resources.jsp', '菜单资源管理', 34, NULL);

SET FOREIGN_KEY_CHECKS = 1;
