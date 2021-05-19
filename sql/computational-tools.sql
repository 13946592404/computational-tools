/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : computational-tools

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 19/05/2021 22:56:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alldata
-- ----------------------------
DROP TABLE IF EXISTS `alldata`;
CREATE TABLE `alldata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `1-1` decimal(6, 2) NULL DEFAULT 0.00,
  `1-2` decimal(6, 2) NULL DEFAULT 0.00,
  `1-3` decimal(6, 2) NULL DEFAULT 0.00,
  `1-4` decimal(6, 2) NULL DEFAULT 0.00,
  `2-1` decimal(6, 2) NULL DEFAULT 0.00,
  `2-2` decimal(6, 2) NULL DEFAULT 0.00,
  `2-3` decimal(6, 2) NULL DEFAULT 0.00,
  `3-1` decimal(6, 2) NULL DEFAULT 0.00,
  `3-2` decimal(6, 2) NULL DEFAULT 0.00,
  `3-3` decimal(6, 2) NULL DEFAULT 0.00,
  `4-1` decimal(6, 2) NULL DEFAULT 0.00,
  `4-2` decimal(6, 2) NULL DEFAULT 0.00,
  `4-3` decimal(6, 2) NULL DEFAULT 0.00,
  `4-4` decimal(6, 2) NULL DEFAULT 0.00,
  `5-1` decimal(6, 2) NULL DEFAULT 0.00,
  `5-2` decimal(6, 2) NULL DEFAULT 0.00,
  `5-3` decimal(6, 2) NULL DEFAULT 0.00,
  `6-1` decimal(6, 2) NULL DEFAULT 0.00,
  `6-2` decimal(6, 2) NULL DEFAULT 0.00,
  `7-1` decimal(6, 2) NULL DEFAULT 0.00,
  `7-2` decimal(6, 2) NULL DEFAULT 0.00,
  `8-1` decimal(6, 2) NULL DEFAULT 0.00,
  `8-2` decimal(6, 2) NULL DEFAULT 0.00,
  `8-3` decimal(6, 2) NULL DEFAULT 0.00,
  `9-1` decimal(6, 2) NULL DEFAULT 0.00,
  `9-2` decimal(6, 2) NULL DEFAULT 0.00,
  `9-3` decimal(6, 2) NULL DEFAULT 0.00,
  `10-1` decimal(6, 2) NULL DEFAULT 0.00,
  `10-2` decimal(6, 2) NULL DEFAULT 0.00,
  `10-3` decimal(6, 2) NULL DEFAULT 0.00,
  `11-1` decimal(6, 2) NULL DEFAULT 0.00,
  `11-2` decimal(6, 2) NULL DEFAULT 0.00,
  `11-3` decimal(6, 2) NULL DEFAULT 0.00,
  `12-1` decimal(6, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `alldata_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alldata
-- ----------------------------
INSERT INTO `alldata` VALUES (1, 1, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (2, 2, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (3, 3, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (4, 4, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (5, 5, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (6, 6, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (7, 7, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (8, 8, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (9, 9, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (10, 10, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (11, 11, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);
INSERT INTO `alldata` VALUES (12, 12, 0.64, 0.68, 0.70, 0.65, 0.61, 0.69, 0.75, 0.71, 0.73, 0.72, 0.62, 0.69, 0.69, 0.61, 0.67, 0.83, 0.73, 0.63, 0.69, 0.69, 0.79, 0.89, 0.68, 0.66, 0.72, 0.76, 0.65, 0.63, 0.62, 0.69, 0.73, 0.63, 0.69, 0.62);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `name_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称-i18n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '高等数学A', 'Advanced Mathematics A');
INSERT INTO `course` VALUES (2, '线性代数A', 'Linear Algebra A');
INSERT INTO `course` VALUES (3, '离散数学', 'Discrete Mathematics');
INSERT INTO `course` VALUES (4, '概率论与数理统计', 'Probability Theory and Statistics');
INSERT INTO `course` VALUES (5, '大学物理B', 'College Physics B');
INSERT INTO `course` VALUES (6, '计算机导论', 'Introduction to Computer Science');
INSERT INTO `course` VALUES (7, '编程导论', 'ntroduction to Programming');
INSERT INTO `course` VALUES (8, '数据结构', 'Data Structures');
INSERT INTO `course` VALUES (9, '计算机组成与结构', 'Computer Organization and Architecture');
INSERT INTO `course` VALUES (10, '操作系统', 'Operating Systems');
INSERT INTO `course` VALUES (11, '数据库系统原理', 'Principles of Database System');
INSERT INTO `course` VALUES (12, '人工智能', 'Artificial Intelligence');
INSERT INTO `course` VALUES (13, '计算机网络', 'Computer Networks');
INSERT INTO `course` VALUES (14, '编译原理', 'Compiler Construction');
INSERT INTO `course` VALUES (15, '嵌入式系统原理', 'Principles of Embedded Systems');
INSERT INTO `course` VALUES (16, '信息系统安全', 'Introduction to Information and Systems Security');
INSERT INTO `course` VALUES (17, '面向对象程序设计', 'The practice of object oriented programming');
INSERT INTO `course` VALUES (18, '分布式课程', '分布式课程');
INSERT INTO `course` VALUES (19, '数字逻辑及实验', 'Digital Logic & Laboratory');
INSERT INTO `course` VALUES (20, '通用学术英语听说', 'Listening and Speaking for General Academic Purposes');
INSERT INTO `course` VALUES (21, '学术英语写作', 'Writing for General Academic Purposes');
INSERT INTO `course` VALUES (22, '通识核心', '通识核心');
INSERT INTO `course` VALUES (23, '编译原理实践', 'Compiler Construction Laboratory');
INSERT INTO `course` VALUES (24, '毕业设计', '毕业设计');
INSERT INTO `course` VALUES (25, '数据库系统实践', 'Database Systems Laboratory');
INSERT INTO `course` VALUES (26, '程序设计能力实训', 'Practice of Programming');
INSERT INTO `course` VALUES (27, '计算机组成与结构实践', 'Computer Architecture Laboratory');
INSERT INTO `course` VALUES (28, '毕业论文', 'Thesis for Bachelor\'s Degree');
INSERT INTO `course` VALUES (29, '思想政治教育课程', '思想政治教育课程');
INSERT INTO `course` VALUES (30, '公共体育课程', '公共体育课程');

-- ----------------------------
-- Table structure for coursetosubgoal
-- ----------------------------
DROP TABLE IF EXISTS `coursetosubgoal`;
CREATE TABLE `coursetosubgoal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `subgoal_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '外码',
  `course_id` int(11) NOT NULL COMMENT '外码',
  `percent` int(11) NOT NULL COMMENT '比例',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subgoal_id`(`subgoal_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `coursetosubgoal_ibfk_1` FOREIGN KEY (`subgoal_id`) REFERENCES `subgoal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coursetosubgoal_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coursetosubgoal
-- ----------------------------
INSERT INTO `coursetosubgoal` VALUES (1, '1-1', 1, 15);
INSERT INTO `coursetosubgoal` VALUES (2, '1-1', 2, 5);
INSERT INTO `coursetosubgoal` VALUES (3, '1-1', 3, 5);
INSERT INTO `coursetosubgoal` VALUES (4, '1-1', 4, 10);
INSERT INTO `coursetosubgoal` VALUES (5, '1-1', 5, 5);
INSERT INTO `coursetosubgoal` VALUES (6, '1-1', 6, 4);
INSERT INTO `coursetosubgoal` VALUES (7, '1-1', 7, 4);
INSERT INTO `coursetosubgoal` VALUES (8, '1-1', 8, 6);
INSERT INTO `coursetosubgoal` VALUES (9, '1-1', 9, 6);
INSERT INTO `coursetosubgoal` VALUES (10, '1-1', 10, 6);
INSERT INTO `coursetosubgoal` VALUES (11, '1-1', 11, 5);
INSERT INTO `coursetosubgoal` VALUES (12, '1-1', 12, 5);
INSERT INTO `coursetosubgoal` VALUES (13, '1-1', 13, 5);
INSERT INTO `coursetosubgoal` VALUES (14, '1-1', 14, 5);
INSERT INTO `coursetosubgoal` VALUES (15, '1-1', 15, 5);
INSERT INTO `coursetosubgoal` VALUES (16, '1-1', 16, 4);
INSERT INTO `coursetosubgoal` VALUES (18, '1-2', 6, 5);
INSERT INTO `coursetosubgoal` VALUES (19, '1-2', 7, 5);
INSERT INTO `coursetosubgoal` VALUES (20, '1-2', 8, 10);
INSERT INTO `coursetosubgoal` VALUES (21, '1-2', 9, 10);
INSERT INTO `coursetosubgoal` VALUES (22, '1-2', 10, 10);
INSERT INTO `coursetosubgoal` VALUES (23, '1-2', 11, 10);
INSERT INTO `coursetosubgoal` VALUES (24, '1-2', 12, 10);
INSERT INTO `coursetosubgoal` VALUES (25, '1-2', 13, 10);
INSERT INTO `coursetosubgoal` VALUES (26, '1-2', 14, 10);
INSERT INTO `coursetosubgoal` VALUES (27, '1-2', 17, 10);
INSERT INTO `coursetosubgoal` VALUES (28, '1-2', 18, 10);
INSERT INTO `coursetosubgoal` VALUES (29, '1-3', 7, 10);
INSERT INTO `coursetosubgoal` VALUES (30, '1-3', 8, 15);
INSERT INTO `coursetosubgoal` VALUES (31, '1-3', 10, 10);
INSERT INTO `coursetosubgoal` VALUES (32, '1-3', 11, 15);
INSERT INTO `coursetosubgoal` VALUES (33, '1-3', 12, 15);
INSERT INTO `coursetosubgoal` VALUES (34, '1-3', 13, 15);
INSERT INTO `coursetosubgoal` VALUES (35, '1-3', 14, 10);
INSERT INTO `coursetosubgoal` VALUES (36, '1-3', 17, 10);
INSERT INTO `coursetosubgoal` VALUES (37, '1-4', 8, 20);
INSERT INTO `coursetosubgoal` VALUES (38, '1-4', 11, 20);
INSERT INTO `coursetosubgoal` VALUES (39, '1-4', 12, 20);
INSERT INTO `coursetosubgoal` VALUES (40, '1-4', 14, 10);
INSERT INTO `coursetosubgoal` VALUES (41, '1-4', 16, 10);
INSERT INTO `coursetosubgoal` VALUES (42, '1-4', 17, 20);
INSERT INTO `coursetosubgoal` VALUES (43, '2-1', 1, 15);
INSERT INTO `coursetosubgoal` VALUES (44, '2-1', 2, 5);
INSERT INTO `coursetosubgoal` VALUES (45, '2-1', 3, 5);
INSERT INTO `coursetosubgoal` VALUES (46, '2-1', 4, 15);
INSERT INTO `coursetosubgoal` VALUES (47, '2-1', 5, 5);
INSERT INTO `coursetosubgoal` VALUES (48, '2-1', 7, 5);
INSERT INTO `coursetosubgoal` VALUES (49, '2-1', 8, 5);
INSERT INTO `coursetosubgoal` VALUES (50, '2-1', 9, 5);
INSERT INTO `coursetosubgoal` VALUES (51, '2-1', 10, 5);
INSERT INTO `coursetosubgoal` VALUES (52, '2-1', 11, 5);
INSERT INTO `coursetosubgoal` VALUES (53, '2-1', 12, 5);
INSERT INTO `coursetosubgoal` VALUES (54, '2-1', 15, 5);
INSERT INTO `coursetosubgoal` VALUES (55, '2-1', 17, 5);
INSERT INTO `coursetosubgoal` VALUES (56, '2-1', 18, 5);
INSERT INTO `coursetosubgoal` VALUES (57, '2-1', 19, 5);
INSERT INTO `coursetosubgoal` VALUES (58, '2-1', 22, 5);
INSERT INTO `coursetosubgoal` VALUES (59, '2-2', 8, 15);
INSERT INTO `coursetosubgoal` VALUES (60, '2-2', 9, 10);
INSERT INTO `coursetosubgoal` VALUES (61, '2-2', 10, 10);
INSERT INTO `coursetosubgoal` VALUES (62, '2-2', 11, 15);
INSERT INTO `coursetosubgoal` VALUES (63, '2-2', 12, 15);
INSERT INTO `coursetosubgoal` VALUES (64, '2-2', 15, 15);
INSERT INTO `coursetosubgoal` VALUES (65, '2-2', 17, 10);
INSERT INTO `coursetosubgoal` VALUES (66, '2-2', 19, 10);
INSERT INTO `coursetosubgoal` VALUES (67, '2-3', 18, 15);
INSERT INTO `coursetosubgoal` VALUES (68, '2-3', 20, 15);
INSERT INTO `coursetosubgoal` VALUES (69, '2-3', 21, 15);
INSERT INTO `coursetosubgoal` VALUES (70, '2-3', 22, 15);
INSERT INTO `coursetosubgoal` VALUES (71, '2-3', 23, 10);
INSERT INTO `coursetosubgoal` VALUES (72, '2-3', 24, 20);
INSERT INTO `coursetosubgoal` VALUES (73, '2-3', 25, 10);
INSERT INTO `coursetosubgoal` VALUES (74, '3-1', 15, 30);
INSERT INTO `coursetosubgoal` VALUES (75, '3-1', 23, 20);
INSERT INTO `coursetosubgoal` VALUES (76, '3-1', 24, 30);
INSERT INTO `coursetosubgoal` VALUES (77, '3-1', 25, 20);
INSERT INTO `coursetosubgoal` VALUES (78, '3-2', 15, 30);
INSERT INTO `coursetosubgoal` VALUES (79, '3-2', 23, 10);
INSERT INTO `coursetosubgoal` VALUES (80, '3-2', 24, 30);
INSERT INTO `coursetosubgoal` VALUES (81, '3-2', 25, 20);
INSERT INTO `coursetosubgoal` VALUES (82, '3-2', 26, 10);
INSERT INTO `coursetosubgoal` VALUES (83, '3-3', 15, 30);
INSERT INTO `coursetosubgoal` VALUES (84, '3-3', 23, 10);
INSERT INTO `coursetosubgoal` VALUES (85, '3-3', 24, 30);
INSERT INTO `coursetosubgoal` VALUES (86, '3-3', 25, 10);
INSERT INTO `coursetosubgoal` VALUES (87, '3-3', 26, 20);
INSERT INTO `coursetosubgoal` VALUES (88, '4-1', 18, 25);
INSERT INTO `coursetosubgoal` VALUES (89, '4-1', 20, 25);
INSERT INTO `coursetosubgoal` VALUES (90, '4-1', 21, 25);
INSERT INTO `coursetosubgoal` VALUES (91, '4-1', 22, 25);
INSERT INTO `coursetosubgoal` VALUES (92, '4-2', 15, 20);
INSERT INTO `coursetosubgoal` VALUES (93, '4-2', 19, 20);
INSERT INTO `coursetosubgoal` VALUES (94, '4-2', 23, 10);
INSERT INTO `coursetosubgoal` VALUES (95, '4-2', 26, 10);
INSERT INTO `coursetosubgoal` VALUES (96, '4-2', 27, 20);
INSERT INTO `coursetosubgoal` VALUES (97, '4-2', 28, 20);
INSERT INTO `coursetosubgoal` VALUES (98, '4-3', 15, 20);
INSERT INTO `coursetosubgoal` VALUES (99, '4-3', 19, 15);
INSERT INTO `coursetosubgoal` VALUES (100, '4-3', 23, 15);
INSERT INTO `coursetosubgoal` VALUES (101, '4-3', 26, 20);
INSERT INTO `coursetosubgoal` VALUES (102, '4-3', 27, 15);
INSERT INTO `coursetosubgoal` VALUES (103, '4-3', 28, 15);
INSERT INTO `coursetosubgoal` VALUES (104, '4-4', 15, 20);
INSERT INTO `coursetosubgoal` VALUES (105, '4-4', 19, 10);
INSERT INTO `coursetosubgoal` VALUES (106, '4-4', 23, 10);
INSERT INTO `coursetosubgoal` VALUES (107, '4-4', 26, 20);
INSERT INTO `coursetosubgoal` VALUES (108, '4-4', 27, 10);
INSERT INTO `coursetosubgoal` VALUES (109, '4-4', 28, 30);
INSERT INTO `coursetosubgoal` VALUES (110, '5-1', 10, 20);
INSERT INTO `coursetosubgoal` VALUES (111, '5-1', 11, 15);
INSERT INTO `coursetosubgoal` VALUES (112, '5-1', 13, 20);
INSERT INTO `coursetosubgoal` VALUES (113, '5-1', 15, 15);
INSERT INTO `coursetosubgoal` VALUES (114, '5-1', 16, 15);
INSERT INTO `coursetosubgoal` VALUES (115, '5-1', 26, 15);
INSERT INTO `coursetosubgoal` VALUES (116, '5-2', 10, 20);
INSERT INTO `coursetosubgoal` VALUES (117, '5-2', 11, 15);
INSERT INTO `coursetosubgoal` VALUES (118, '5-2', 13, 20);
INSERT INTO `coursetosubgoal` VALUES (119, '5-2', 15, 15);
INSERT INTO `coursetosubgoal` VALUES (120, '5-2', 16, 15);
INSERT INTO `coursetosubgoal` VALUES (121, '5-2', 26, 15);
INSERT INTO `coursetosubgoal` VALUES (122, '5-3', 12, 30);
INSERT INTO `coursetosubgoal` VALUES (123, '5-3', 24, 50);
INSERT INTO `coursetosubgoal` VALUES (124, '5-3', 26, 20);
INSERT INTO `coursetosubgoal` VALUES (125, '6-1', 6, 50);
INSERT INTO `coursetosubgoal` VALUES (126, '6-1', 16, 50);
INSERT INTO `coursetosubgoal` VALUES (127, '6-2', 6, 50);
INSERT INTO `coursetosubgoal` VALUES (128, '6-2', 16, 50);
INSERT INTO `coursetosubgoal` VALUES (129, '7-1', 18, 20);
INSERT INTO `coursetosubgoal` VALUES (130, '7-1', 19, 30);
INSERT INTO `coursetosubgoal` VALUES (131, '7-1', 22, 20);
INSERT INTO `coursetosubgoal` VALUES (132, '7-1', 27, 30);
INSERT INTO `coursetosubgoal` VALUES (133, '7-2', 19, 50);
INSERT INTO `coursetosubgoal` VALUES (134, '7-2', 27, 50);
INSERT INTO `coursetosubgoal` VALUES (135, '8-1', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (136, '8-1', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (137, '8-2', 16, 60);
INSERT INTO `coursetosubgoal` VALUES (138, '8-2', 22, 40);
INSERT INTO `coursetosubgoal` VALUES (139, '8-3', 29, 100);
INSERT INTO `coursetosubgoal` VALUES (140, '9-1', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (141, '9-1', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (142, '9-2', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (143, '9-2', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (144, '9-3', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (145, '9-3', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (146, '10-1', 18, 20);
INSERT INTO `coursetosubgoal` VALUES (147, '10-1', 20, 20);
INSERT INTO `coursetosubgoal` VALUES (148, '10-1', 21, 20);
INSERT INTO `coursetosubgoal` VALUES (149, '10-1', 22, 20);
INSERT INTO `coursetosubgoal` VALUES (150, '10-1', 29, 20);
INSERT INTO `coursetosubgoal` VALUES (151, '10-2', 18, 25);
INSERT INTO `coursetosubgoal` VALUES (152, '10-2', 20, 25);
INSERT INTO `coursetosubgoal` VALUES (153, '10-2', 21, 25);
INSERT INTO `coursetosubgoal` VALUES (154, '10-2', 22, 25);
INSERT INTO `coursetosubgoal` VALUES (155, '10-3', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (156, '10-3', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (157, '11-1', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (158, '11-1', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (159, '11-2', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (160, '11-2', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (161, '11-3', 18, 50);
INSERT INTO `coursetosubgoal` VALUES (162, '11-3', 22, 50);
INSERT INTO `coursetosubgoal` VALUES (163, '12-1', 18, 40);
INSERT INTO `coursetosubgoal` VALUES (164, '12-1', 22, 40);
INSERT INTO `coursetosubgoal` VALUES (165, '12-1', 30, 20);
INSERT INTO `coursetosubgoal` VALUES (201, '1-1', 17, 5);

-- ----------------------------
-- Table structure for opencourse
-- ----------------------------
DROP TABLE IF EXISTS `opencourse`;
CREATE TABLE `opencourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `course_id` int(11) NOT NULL COMMENT '外码',
  `teacher_id` int(11) NOT NULL COMMENT '外码',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opencourse_ibfk_1`(`course_id`) USING BTREE,
  INDEX `opencourse_ibfk_2`(`teacher_id`) USING BTREE,
  CONSTRAINT `opencourse_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `opencourse_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opencourse
-- ----------------------------
INSERT INTO `opencourse` VALUES (1, 1, 1, '2021-03-09 17:54:12');
INSERT INTO `opencourse` VALUES (31, 3, 1, '2021-04-05 16:27:49');
INSERT INTO `opencourse` VALUES (32, 4, 1, '2021-04-05 16:27:52');
INSERT INTO `opencourse` VALUES (33, 5, 1, '2021-04-05 16:27:55');
INSERT INTO `opencourse` VALUES (34, 6, 1, '2021-04-05 16:27:59');
INSERT INTO `opencourse` VALUES (35, 7, 1, '2021-04-05 16:28:02');
INSERT INTO `opencourse` VALUES (36, 8, 1, '2021-04-05 16:28:05');
INSERT INTO `opencourse` VALUES (37, 9, 1, '2021-04-05 16:28:08');
INSERT INTO `opencourse` VALUES (38, 10, 1, '2021-04-05 16:28:11');
INSERT INTO `opencourse` VALUES (39, 11, 1, '2021-04-05 16:28:13');
INSERT INTO `opencourse` VALUES (40, 12, 1, '2021-04-05 16:28:16');
INSERT INTO `opencourse` VALUES (41, 13, 1, '2021-04-05 16:28:19');
INSERT INTO `opencourse` VALUES (42, 14, 1, '2021-04-05 16:28:21');
INSERT INTO `opencourse` VALUES (43, 15, 1, '2021-04-05 16:28:24');
INSERT INTO `opencourse` VALUES (44, 16, 1, '2021-04-05 16:28:26');
INSERT INTO `opencourse` VALUES (45, 17, 1, '2021-04-05 16:28:28');
INSERT INTO `opencourse` VALUES (46, 18, 1, '2021-04-05 16:28:31');
INSERT INTO `opencourse` VALUES (47, 19, 1, '2021-04-05 16:28:34');
INSERT INTO `opencourse` VALUES (48, 20, 1, '2021-04-05 16:28:38');
INSERT INTO `opencourse` VALUES (49, 21, 1, '2021-04-05 16:28:41');
INSERT INTO `opencourse` VALUES (50, 22, 1, '2021-04-05 16:28:44');
INSERT INTO `opencourse` VALUES (51, 23, 1, '2021-04-05 16:28:47');
INSERT INTO `opencourse` VALUES (52, 24, 1, '2021-04-05 16:28:49');
INSERT INTO `opencourse` VALUES (53, 25, 1, '2021-04-05 16:28:51');
INSERT INTO `opencourse` VALUES (54, 26, 1, '2021-04-05 16:28:54');
INSERT INTO `opencourse` VALUES (55, 27, 1, '2021-04-05 16:28:57');
INSERT INTO `opencourse` VALUES (58, 29, 1, '2021-04-05 16:28:11');
INSERT INTO `opencourse` VALUES (65, 5, 1, '2021-04-05 22:06:20');
INSERT INTO `opencourse` VALUES (68, 2, 1, '2021-04-05 22:18:01');

-- ----------------------------
-- Table structure for opencourseform
-- ----------------------------
DROP TABLE IF EXISTS `opencourseform`;
CREATE TABLE `opencourseform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `openCourse_id` int(11) NOT NULL COMMENT '外码',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '指标名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opencourseform_ibfk_1`(`openCourse_id`) USING BTREE,
  INDEX `target`(`target`) USING BTREE,
  CONSTRAINT `opencourseform_ibfk_1` FOREIGN KEY (`openCourse_id`) REFERENCES `opencourse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opencourseform
-- ----------------------------
INSERT INTO `opencourseform` VALUES (1, 1, 'final_exam');
INSERT INTO `opencourseform` VALUES (2, 1, 'mid_exam');
INSERT INTO `opencourseform` VALUES (3, 31, '月考');
INSERT INTO `opencourseform` VALUES (4, 31, '小测');
INSERT INTO `opencourseform` VALUES (5, 31, '考勤');
INSERT INTO `opencourseform` VALUES (6, 31, '机考');
INSERT INTO `opencourseform` VALUES (7, 31, '期中考试');
INSERT INTO `opencourseform` VALUES (8, 31, '期末考试');
INSERT INTO `opencourseform` VALUES (9, 31, '随机测验');
INSERT INTO `opencourseform` VALUES (15, 32, '期中考试');

-- ----------------------------
-- Table structure for opencoursetosubgoal
-- ----------------------------
DROP TABLE IF EXISTS `opencoursetosubgoal`;
CREATE TABLE `opencoursetosubgoal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `openCourseForm_id` int(11) NOT NULL COMMENT '外码',
  `courseToSubgoal_id` int(11) NOT NULL COMMENT '外码',
  `percent` int(11) NOT NULL COMMENT '比例',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openCourseForm_id`(`openCourseForm_id`) USING BTREE,
  INDEX `courseToSubgoal_id`(`courseToSubgoal_id`) USING BTREE,
  CONSTRAINT `opencoursetosubgoal_ibfk_1` FOREIGN KEY (`openCourseForm_id`) REFERENCES `opencourseform` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `opencoursetosubgoal_ibfk_2` FOREIGN KEY (`courseToSubgoal_id`) REFERENCES `coursetosubgoal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opencoursetosubgoal
-- ----------------------------
INSERT INTO `opencoursetosubgoal` VALUES (1, 1, 1, 30);
INSERT INTO `opencoursetosubgoal` VALUES (2, 3, 3, 15);
INSERT INTO `opencoursetosubgoal` VALUES (3, 4, 3, 30);
INSERT INTO `opencoursetosubgoal` VALUES (4, 5, 3, 55);
INSERT INTO `opencoursetosubgoal` VALUES (5, 6, 45, 25);
INSERT INTO `opencoursetosubgoal` VALUES (6, 7, 45, 25);
INSERT INTO `opencoursetosubgoal` VALUES (7, 8, 45, 25);
INSERT INTO `opencoursetosubgoal` VALUES (8, 9, 45, 25);

-- ----------------------------
-- Table structure for requirement
-- ----------------------------
DROP TABLE IF EXISTS `requirement`;
CREATE TABLE `requirement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `title_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题i18n',
  `statement` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述',
  `statement_EN` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述i18n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of requirement
-- ----------------------------
INSERT INTO `requirement` VALUES (1, '工程知识', 'Engineering Knowledge', '能够将数学、自然科学、工程基础和专业知识用于解决复杂工程问题', 'Able to apply mathematics, science, engineering fundamentals and expertise to solve complex engineering problems');
INSERT INTO `requirement` VALUES (2, '问题分析', 'Problem Analysis', '能够应用数学、自然科学和工程科学的基本原理，识别、表达、并通过文献研究分析复杂工程问题，以获得有效结论', 'Ability to apply fundamental principles of mathematics, natural science and engineering science to identify, express, and analyze complex engineering problems through literature research to reach valid conclusions');
INSERT INTO `requirement` VALUES (3, '设计/开发解决方案', 'Design/Develop Solution', '能够设计针对复杂工程问题的解决方案，设计满足特定需求的系统、单元（部件）或工艺流程，并能够在设计环节中体现创新意', 'Can design solutions to complex engineering problems, design systems, units (components) or processes to meet specific needs, and demonstrate innovation in the design process');
INSERT INTO `requirement` VALUES (4, '研究', 'Research', '能够基于科学原理并采用科学方法对复杂工程问题进行研究，包括设计实验、分析与解释数据、并通过信息综合得到合理有效的结论', 'Able to study complex engineering problems based on scientific principles and using scientific methods, including designing experiments, analyzing and interpreting data, and synthesizing information to arrive at reasonable and effective conclusions');
INSERT INTO `requirement` VALUES (5, '使用现代工具', 'Using Modern Tools', '能够针对复杂工程问题，开发、选择与使用恰当的技术、资源、现代工程工具和信息技术工具，包括对复杂工程问题的预测与模拟，并能够理解其局限性', 'Able to develop, select and use appropriate technologies, resources, modern engineering tools and information technology tools for complex engineering problems, including prediction and simulation of complex engineering problems, and understanding their limitations');
INSERT INTO `requirement` VALUES (6, '工程与社会', 'Engineering And Society', '能够基于工程相关背景知识进行合理分析，评价专业工程实践和复杂工程问题解决方案对社会、健康、安全、法律以及文化的影响，并理解应承担的责任', 'Able to conduct rational analysis based on engineering background knowledge, evaluate the social, health, safety, legal and cultural impact of professional engineering practices and solutions to complex engineering problems, and understand the responsibilities to be undertaken');
INSERT INTO `requirement` VALUES (7, '环境和可持续发展', 'Environment and Sustainable Development', '能够理解和评价针对复杂工程问题的工程实践对环境、社会可持续发展的影响', 'Able to understand and evaluate the impact of engineering practices on environmental and social sustainability of complex engineering problems');
INSERT INTO `requirement` VALUES (8, '职业规范', 'Professional Norms', '具有人文社会科学素养、社会责任感，能够在工程实践中理解并遵守工程职业道德和规范，履行责任', 'With humanistic and social science literacy, social responsibility, able to understand and abide by engineering professional ethics and norms in engineering practice, to fulfill responsibilities');
INSERT INTO `requirement` VALUES (9, '个人和团队', 'Individual And Team', '能够在多学科背景下的团队中承担个体、团队成员以及负责人的角色', 'Able to act as an individual, team member, and leader in a multidisciplinary team');
INSERT INTO `requirement` VALUES (10, '沟通', 'Communication', '能够就复杂工程问题与业界同行及社会公众进行有效沟通和交流，包括撰写报告和设计文稿、陈述发言、清晰表达或回应指令。并具备一定的国际视野，能够在跨文化背景下进行沟通和交流', 'Able to effectively communicate and communicate with industry colleagues and the public on complex engineering issues, including writing reports and design documents, making presentations, and clearly expressing or responding to instructions. With a certain international perspective and the ability to communicate and communicate in a cross-cultural context');
INSERT INTO `requirement` VALUES (11, '项目管理', 'Project Management', '理解并掌握工程管理原理与经济决策方法，并能在多学科环境中应用', 'Understand and grasp the principles of project management and economic decision-making methods and be able to apply them in a multidisciplinary environment');
INSERT INTO `requirement` VALUES (12, '终身学习', 'Lifelong Learning', '具有自主学习和终身学习的意识，有不断学习和适应发展的能力', 'Have the consciousness of independent learning and lifelong learning, and I have the ability to continuously learn and adapt to development');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 学号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'test_stu_1');
INSERT INTO `student` VALUES (2, 'test_stu_2');
INSERT INTO `student` VALUES (3, 'abc');
INSERT INTO `student` VALUES (4, 'def');
INSERT INTO `student` VALUES (5, 'ghi');
INSERT INTO `student` VALUES (6, 'jkl');
INSERT INTO `student` VALUES (7, 'mno');
INSERT INTO `student` VALUES (8, 'pqr');
INSERT INTO `student` VALUES (9, 'stu');
INSERT INTO `student` VALUES (10, 'vwx');
INSERT INTO `student` VALUES (11, 'yz');
INSERT INTO `student` VALUES (12, 'hello');

-- ----------------------------
-- Table structure for studycourse
-- ----------------------------
DROP TABLE IF EXISTS `studycourse`;
CREATE TABLE `studycourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `openCourse_id` int(11) NOT NULL COMMENT '外码',
  `student_id` int(11) NOT NULL COMMENT '外码',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `studycourse_ibfk_1`(`openCourse_id`) USING BTREE,
  INDEX `studycourse_ibfk_2`(`student_id`) USING BTREE,
  CONSTRAINT `studycourse_ibfk_1` FOREIGN KEY (`openCourse_id`) REFERENCES `opencourse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `studycourse_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studycourse
-- ----------------------------
INSERT INTO `studycourse` VALUES (1, 1, 1, '2021-03-09 18:01:07');
INSERT INTO `studycourse` VALUES (2, 1, 2, '2021-03-09 18:01:16');
INSERT INTO `studycourse` VALUES (3, 31, 2, '2021-05-18 20:40:47');
INSERT INTO `studycourse` VALUES (4, 31, 3, '2021-05-18 20:40:51');
INSERT INTO `studycourse` VALUES (5, 31, 4, '2021-05-18 20:40:53');
INSERT INTO `studycourse` VALUES (6, 31, 5, '2021-05-18 20:40:56');
INSERT INTO `studycourse` VALUES (7, 31, 6, '2021-05-18 20:40:59');
INSERT INTO `studycourse` VALUES (8, 31, 7, '2021-05-18 22:32:14');
INSERT INTO `studycourse` VALUES (9, 32, 1, '2021-05-19 22:56:17');

-- ----------------------------
-- Table structure for studycourseform
-- ----------------------------
DROP TABLE IF EXISTS `studycourseform`;
CREATE TABLE `studycourseform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `studyCourse_id` int(11) NOT NULL COMMENT '外码',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '外码 指标名',
  `grade` int(11) NULL DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `studyCourse_id`(`studyCourse_id`) USING BTREE,
  INDEX `target`(`target`) USING BTREE,
  CONSTRAINT `studycourseform_ibfk_1` FOREIGN KEY (`studyCourse_id`) REFERENCES `studycourse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `studycourseform_ibfk_2` FOREIGN KEY (`target`) REFERENCES `opencourseform` (`target`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studycourseform
-- ----------------------------
INSERT INTO `studycourseform` VALUES (1, 1, 'final_exam', 60);
INSERT INTO `studycourseform` VALUES (2, 1, 'mid_exam', 90);
INSERT INTO `studycourseform` VALUES (3, 2, 'final_exam', 75);
INSERT INTO `studycourseform` VALUES (4, 2, 'mid_exam', 80);

-- ----------------------------
-- Table structure for subgoal
-- ----------------------------
DROP TABLE IF EXISTS `subgoal`;
CREATE TABLE `subgoal`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主码 字串',
  `father_id` int(11) NOT NULL COMMENT '外码',
  `statement` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述',
  `statement_EN` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述-i18n',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subgoal_ibfk_1`(`father_id`) USING BTREE,
  CONSTRAINT `subgoal_ibfk_1` FOREIGN KEY (`father_id`) REFERENCES `requirement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subgoal
-- ----------------------------
INSERT INTO `subgoal` VALUES ('1-1', 1, '掌握数学、自然科学、工程科学和计算机专业的基础知识、原理和方法', 'Master the basic knowledge, principles and methods of mathematics, natural science, engineering science and computer science');
INSERT INTO `subgoal` VALUES ('1-2', 1, '能使用数学、自然科学、工程科学和计算机专业的语言工具表述计算机领域的复杂工程问题并求解', 'Can use the language tools of mathematics, natural science, engineering science and computer science to express and solve complex engineering problems in the computer field');
INSERT INTO `subgoal` VALUES ('1-3', 1, '能利用相关知识和数学模型方法推演、分析计算机领域的复杂工程问题', 'Can use relevant knowledge and mathematical modeling methods to deduce and analyze complex engineering problems in the computer field');
INSERT INTO `subgoal` VALUES ('1-4', 1, '能利用相关知识比较、综合和优化计算机工程问题的解决方案', 'Solutions that compare, synthesize, and optimize computer engineering problems using relevant knowledge');
INSERT INTO `subgoal` VALUES ('10-1', 10, '能就计算机领域专业问题，以口头、文稿、图表等方式，准确表达自己的观点，回应质疑，理解与业界同行和社会公众交流的差异性', 'Can accurately express my views, respond to questions, and understand the differences in communication with peers and the public on professional issues in the computer field by oral, written, and graphic methods');
INSERT INTO `subgoal` VALUES ('10-2', 10, '关注全球性问题，理解和尊重世界不同文化的差异性和多样性，理解计算机领域的国际发展趋势、研究热点', 'Focus on global issues, understand and respect the differences and diversity of different cultures in the world, understand the international development trends and research hotspots in the field of computer');
INSERT INTO `subgoal` VALUES ('10-3', 10, '具有款文化的语言和书面交流能力，能救计算机领域专业问题，在款文化的背景下机型基本的沟通和交流', 'Able to communicate in language and in writing in different cultures, capable of solving professional problems in the computer field, and basic communication and communication in the context of different cultures');
INSERT INTO `subgoal` VALUES ('11-1', 11, '理解计算机领域工程及产品全周期、全流程的成本构成中涉及构成管理与经济决策问题', 'Understand the construction management and economic decision-making issues involved in the cost structure of the whole cycle and process of engineering and products in the field of computer');
INSERT INTO `subgoal` VALUES ('11-2', 11, '掌握计算机领域工程项目中涉及的管理与经济决策方法、项目管理知识与管理工具', 'Master management and economic decision-making methods, project management knowledge and management tools involved in engineering projects in the computer field');
INSERT INTO `subgoal` VALUES ('11-3', 11, '能在多学科环境中，应用计算机工程管理与经济决策方法', 'Able to apply computer engineering management and economic decision-making methods in a multidisciplinary environment');
INSERT INTO `subgoal` VALUES ('12-1', 12, '具有自主学习和终身学习的意识， 具有不断学习和适应发展的能力', 'Have the consciousness of independent learning and lifelong learning, and have the ability to continuously learn and adapt to development');
INSERT INTO `subgoal` VALUES ('2-1', 2, '掌握数学、自然科学和工程科学的基本原理，掌握文献检索与研究的方法和技巧', 'Master the basic principles of mathematics, natural science and engineering science, master the methods and skills of literature retrieval and research');
INSERT INTO `subgoal` VALUES ('2-2', 2, '能应用数学、自然科学和工程科学的基本原理识别计算机领域复杂工程问题的关键环节，能正确表述复杂的计算机工程问题', 'Can apply the basic principles of mathematics, natural science and engineering science to identify the key links of complex engineering problems in the field of computer, and can correctly describe complex computer engineering problems');
INSERT INTO `subgoal` VALUES ('2-3', 2, '能应用基本原理，会借助文献研究、分析、解决工程问题，获得多种可选的解决方案', 'Able to apply basic principles and develop alternative solutions to engineering problems through literature research, analysis, and problem-solving');
INSERT INTO `subgoal` VALUES ('3-1', 3, '掌握计算机领域工程设计与产品开发全周期、全流程的基本设计/开发方法和，了解影响设计目标和技术方案的各种因素', 'Master the basic design/development methods of the whole cycle and process of engineering design and product development in the field of computer, and understand the various factors that affect the design objectives and technical solutions');
INSERT INTO `subgoal` VALUES ('3-2', 3, '针对计算机领域复杂工程问题，设计满足特定需求的系统、单元或流程的能力', 'Able to design systems, units, or processes that meet specific requirements for complex engineering problems in the computer domain');
INSERT INTO `subgoal` VALUES ('3-3', 3, '在计算机领域设计环节中体现创新意识，并综合考虑社会、健康、安全、法律、文化以及环境等因素的能力', 'Able to demonstrate a sense of innovation in the design process in the computer field, taking into account social, health, safety, legal, cultural, and environmental factors');
INSERT INTO `subgoal` VALUES ('4-1', 4, '通过文献研究或相关方法，调研和分析计算机领域复杂工程问题的解决方案', 'Investigate and analyze solutions to complex engineering problems in the computer field through literature research or related methods');
INSERT INTO `subgoal` VALUES ('4-2', 4, '能够根据计算机领域对象特征，选择研究路线，设计实验方案', 'Able to select research routes and design experimental schemes according to the characteristics of objects in the computer field');
INSERT INTO `subgoal` VALUES ('4-3', 4, '能够根据实验方案构建计算机领域实验系统，安全地开展实验，科学地采集实验数据', 'Can build the computer field experimental system according to the experimental scheme, safely carry out experiments, and scientifically collect experimental data');
INSERT INTO `subgoal` VALUES ('4-4', 4, '能对实验结果进行分析和解释，并通过信息综合得到合理有效地结论', 'Can analyze and explain the experimental results, and draw reasonable and effective conclusions through information synthesis');
INSERT INTO `subgoal` VALUES ('5-1', 5, '了解计算机领域常用的现代仪器、信息技术工具、工程工具和模拟软件的使用原理和方法，并理解其局限性', 'Understand the use principles and methods of modern instruments, information technology tools, engineering tools and simulation software commonly used in the computer field, and understand their limitations');
INSERT INTO `subgoal` VALUES ('5-2', 5, '能够选择与使用恰当的仪器、信息资源、工程工具和专业模拟软件，对计算机领域复杂工程问题进行分析、计算与设计', 'Can select and use appropriate instruments, information resources, engineering tools and professional simulation software to analyze, calculate and design complex engineering problems in the field of computer');
INSERT INTO `subgoal` VALUES ('5-3', 5, '能够针对计算机领域具体的对象，开发或选用满足特定需求的现代工具，模拟和预测专业问题，并能够分析其局限性', 'Able to develop or select modern tools to meet specific needs for specific objects in the computer field, to simulate and predict professional problems, and to analyze their limitations');
INSERT INTO `subgoal` VALUES ('6-1', 6, '了解计算机专业相关领域的技术标准体系、知识产权、产业政策和法律法规，不同社会文化对工程活动的影响', 'Understand the technical standard system, intellectual property rights, industrial policies, laws and regulations in the field related to computer science, and the influence of different social cultures on engineering activities');
INSERT INTO `subgoal` VALUES ('6-2', 6, '能分析和评价计算机领域专业实践对社会、健康、安全、法律以及文化的影响，并理解应承担的责任', 'Able to analyze and evaluate the social, health, safety, legal, and cultural implications of professional practice in the field of computer science, and to understand the responsibilities that should be taken');
INSERT INTO `subgoal` VALUES ('7-1', 7, '知晓和理解环境保护和可持续发展的理念和内涵', 'Know and understand the concept and connotation of environmental protection and sustainable development');
INSERT INTO `subgoal` VALUES ('7-2', 7, '能够站在环境保护和可持续发展的角度思考计算机领域专业工程实践的可持续性，评价产品周期中可能对人类和环境在城的损害和隐患', 'Can consider the sustainability of professional engineering practice in the field of computer from the perspective of environmental protection and sustainable development, and evaluate the possible damage and hidden danger to human and environment in the city during the product cycle');
INSERT INTO `subgoal` VALUES ('8-1', 8, '有正确的价值观，理解个人与社会的关系，了解中国国情', 'Have correct values, understand the relationship between individuals and society, and understand China\'s national conditions');
INSERT INTO `subgoal` VALUES ('8-2', 8, '理解诚实公正、诚信守则的过程职业道德规范，并能在计算机领域工程实践中自觉遵守', 'Understand the principles of integrity, fairness and integrity in the process of professional ethics and be able to consciously observe them in the engineering practice in the computer field');
INSERT INTO `subgoal` VALUES ('8-3', 8, '理解并遵守计算机领域工程职业道德和规范', 'Understand and adhere to the Engineering Ethics and Code of Ethics in the Computer Field');
INSERT INTO `subgoal` VALUES ('9-1', 9, '能与其他学科的成员有效沟通，合作共享', 'Able to communicate effectively and collaboratively with members of other disciplines');
INSERT INTO `subgoal` VALUES ('9-2', 9, '能够在计算机领域团队中独立或合作开展工作', 'Able to work independently or collaboratively in a computer field team');
INSERT INTO `subgoal` VALUES ('9-3', 9, '能够组织、协调和指挥计算机领域团队开展工作', 'Able to organize, coordinate and direct the work of computer field teams');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主码 自增',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '管理员权限',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `name_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名-i18n',
  `TEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `id_teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 1, 'admin', 'changeme', '管理员', 'admin', '13946592404', '13946592404@163.com', '123456', '计算机学院');
INSERT INTO `teacher` VALUES (2, 0, 'admin1', 'changeme', '', '', '', '', 'null', '');

-- ----------------------------
-- View structure for coursetosubgoalview
-- ----------------------------
DROP VIEW IF EXISTS `coursetosubgoalview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `coursetosubgoalview` AS select `coursetosubgoal`.`id` AS `id`,`coursetosubgoal`.`subgoal_id` AS `subgoal_id`,`course`.`id` AS `course_id`,`course`.`name` AS `name`,`course`.`name_EN` AS `name_EN`,`coursetosubgoal`.`percent` AS `percent` from (`coursetosubgoal` join `course` on((`coursetosubgoal`.`course_id` = `course`.`id`))) order by `coursetosubgoal`.`subgoal_id`;

-- ----------------------------
-- View structure for opencoursetosubgoalview
-- ----------------------------
DROP VIEW IF EXISTS `opencoursetosubgoalview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `opencoursetosubgoalview` AS select `opencoursetosubgoal`.`id` AS `id`,`coursetosubgoal`.`course_id` AS `course_id`,`opencourseform`.`openCourse_id` AS `opencourse_id`,`opencoursetosubgoal`.`openCourseForm_id` AS `openCourseForm_id`,`opencourseform`.`target` AS `target`,`coursetosubgoal`.`subgoal_id` AS `subgoal_id`,`opencoursetosubgoal`.`courseToSubgoal_id` AS `coursetosubgoal_id`,`opencoursetosubgoal`.`percent` AS `percent` from ((`opencoursetosubgoal` join `opencourseform` on((`opencoursetosubgoal`.`openCourseForm_id` = `opencourseform`.`id`))) join `coursetosubgoal` on((`opencoursetosubgoal`.`courseToSubgoal_id` = `coursetosubgoal`.`id`)));

-- ----------------------------
-- View structure for opencourseview
-- ----------------------------
DROP VIEW IF EXISTS `opencourseview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `opencourseview` AS select `course`.`id` AS `course_id`,`opencourse`.`id` AS `opencourse_id`,`opencourse`.`teacher_id` AS `teacher_id`,`course`.`name` AS `name`,`course`.`name_EN` AS `name_EN`,`opencourse`.`time` AS `time` from (`opencourse` join `course` on((`opencourse`.`course_id` = `course`.`id`)));

-- ----------------------------
-- View structure for studycourseview
-- ----------------------------
DROP VIEW IF EXISTS `studycourseview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `studycourseview` AS select `studycourse`.`id` AS `id`,`studycourse`.`openCourse_id` AS `openCourse_id`,`studycourse`.`student_id` AS `student_id`,`student`.`name` AS `name`,`studycourse`.`time` AS `time` from (`studycourse` join `student` on((`studycourse`.`student_id` = `student`.`id`)));

SET FOREIGN_KEY_CHECKS = 1;
