/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : computational-tools

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 02/03/2021 14:12:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名',
  `name_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程名i18n',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '教师',
  `teacher_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '教师i18n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of courses
-- ----------------------------
BEGIN;
INSERT INTO `courses` VALUES (1, '高等数学A', 'Advanced Mathematics A', '未知', 'unknown');
INSERT INTO `courses` VALUES (2, '线性代数A', 'Linear Algebra A', '未知', 'unknown');
INSERT INTO `courses` VALUES (3, '离散数学', 'Discrete Mathematics', '未知', 'unknown');
INSERT INTO `courses` VALUES (4, '概率论与数理统计', 'Probability Theory and Statistics', '未知', 'unknown');
INSERT INTO `courses` VALUES (5, '大学物理B', 'College Physics B', '未知', 'unknown');
INSERT INTO `courses` VALUES (6, '计算机导论', 'Introduction to Computer Science', '未知', 'unknown');
INSERT INTO `courses` VALUES (7, '编程导论', 'ntroduction to Programming', '未知', 'unknown');
INSERT INTO `courses` VALUES (8, '数据结构', 'Data Structures', '未知', 'unknown');
INSERT INTO `courses` VALUES (9, '计算机组成与结构', 'Computer Organization and Architecture', '未知', 'unknown');
INSERT INTO `courses` VALUES (10, '操作系统', 'Operating Systems', '未知', 'unknown');
INSERT INTO `courses` VALUES (11, '数据库系统原理', 'Principles of Database System', '未知', 'unknown');
INSERT INTO `courses` VALUES (12, '人工智能', 'Artificial Intelligence', '未知', 'unknown');
INSERT INTO `courses` VALUES (13, '计算机网络', 'Computer Networks', '未知', 'unknown');
INSERT INTO `courses` VALUES (14, '编译原理', 'Compiler Construction', '未知', 'unknown');
INSERT INTO `courses` VALUES (15, '嵌入式系统原理', 'Principles of Embedded Systems', '未知', 'unknown');
INSERT INTO `courses` VALUES (16, '信息系统安全', 'Introduction to Information and Systems Security', '未知', 'unknown');
INSERT INTO `courses` VALUES (17, '面向对象程序设计', 'The practice of object oriented programming', '未知', 'unknown');
INSERT INTO `courses` VALUES (18, '分布式课程', '分布式课程', '未知', 'unknown');
INSERT INTO `courses` VALUES (19, '数字逻辑及实验', 'Digital Logic & Laboratory', '未知', 'unknown');
INSERT INTO `courses` VALUES (20, '通用学术英语听说', 'Listening and Speaking for General Academic Purposes', '未知', 'unknown');
INSERT INTO `courses` VALUES (21, '学术英语写作', 'Writing for General Academic Purposes', '未知', 'unknown');
INSERT INTO `courses` VALUES (22, '通识核心', '通识核心', '未知', 'unknown');
INSERT INTO `courses` VALUES (23, '编译原理实践', 'Compiler Construction Laboratory', '未知', 'unknown');
INSERT INTO `courses` VALUES (24, '毕业设计', '毕业设计', '未知', 'unknown');
INSERT INTO `courses` VALUES (25, '数据库系统实践', 'Database Systems Laboratory', '未知', 'unknown');
INSERT INTO `courses` VALUES (26, '程序设计能力实训', 'Practice of Programming', '未知', 'unknown');
INSERT INTO `courses` VALUES (27, '计算机组成与结构实践', 'Computer Architecture Laboratory', '未知', 'unknown');
INSERT INTO `courses` VALUES (28, '毕业论文', 'Thesis for Bachelor\'s Degree', '未知', 'unknown');
INSERT INTO `courses` VALUES (29, '思想政治教育课程', '思想政治教育课程', '未知', 'unknown');
INSERT INTO `courses` VALUES (30, '公共体育课程', '公共体育课程', '未知', 'unknown');
COMMIT;

-- ----------------------------
-- Table structure for CoursesToSubgoals
-- ----------------------------
DROP TABLE IF EXISTS `CoursesToSubgoals`;
CREATE TABLE `CoursesToSubgoals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id 用来排序',
  `subgoal_id` varchar(255) NOT NULL COMMENT '外键 子目标',
  `course_id` int(11) NOT NULL COMMENT '外键 课程',
  `percent` int(11) NOT NULL COMMENT '占比',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CoursesToSubgoals
-- ----------------------------
BEGIN;
INSERT INTO `CoursesToSubgoals` VALUES (1, '1-1', 1, 15);
INSERT INTO `CoursesToSubgoals` VALUES (2, '1-1', 2, 5);
INSERT INTO `CoursesToSubgoals` VALUES (3, '1-1', 3, 5);
INSERT INTO `CoursesToSubgoals` VALUES (4, '1-1', 4, 10);
INSERT INTO `CoursesToSubgoals` VALUES (5, '1-1', 5, 5);
INSERT INTO `CoursesToSubgoals` VALUES (6, '1-1', 6, 4);
INSERT INTO `CoursesToSubgoals` VALUES (7, '1-1', 7, 4);
INSERT INTO `CoursesToSubgoals` VALUES (8, '1-1', 8, 6);
INSERT INTO `CoursesToSubgoals` VALUES (9, '1-1', 9, 6);
INSERT INTO `CoursesToSubgoals` VALUES (10, '1-1', 10, 6);
INSERT INTO `CoursesToSubgoals` VALUES (11, '1-1', 11, 5);
INSERT INTO `CoursesToSubgoals` VALUES (12, '1-1', 12, 5);
INSERT INTO `CoursesToSubgoals` VALUES (13, '1-1', 13, 5);
INSERT INTO `CoursesToSubgoals` VALUES (14, '1-1', 14, 5);
INSERT INTO `CoursesToSubgoals` VALUES (15, '1-1', 15, 5);
INSERT INTO `CoursesToSubgoals` VALUES (16, '1-1', 16, 4);
INSERT INTO `CoursesToSubgoals` VALUES (17, '1-1', 17, 5);
INSERT INTO `CoursesToSubgoals` VALUES (18, '1-2', 6, 5);
INSERT INTO `CoursesToSubgoals` VALUES (19, '1-2', 7, 5);
INSERT INTO `CoursesToSubgoals` VALUES (20, '1-2', 8, 10);
INSERT INTO `CoursesToSubgoals` VALUES (21, '1-2', 9, 10);
INSERT INTO `CoursesToSubgoals` VALUES (22, '1-2', 10, 10);
INSERT INTO `CoursesToSubgoals` VALUES (23, '1-2', 11, 10);
INSERT INTO `CoursesToSubgoals` VALUES (24, '1-2', 12, 10);
INSERT INTO `CoursesToSubgoals` VALUES (25, '1-2', 13, 10);
INSERT INTO `CoursesToSubgoals` VALUES (26, '1-2', 14, 10);
INSERT INTO `CoursesToSubgoals` VALUES (27, '1-2', 17, 10);
INSERT INTO `CoursesToSubgoals` VALUES (28, '1-2', 18, 10);
INSERT INTO `CoursesToSubgoals` VALUES (29, '1-3', 7, 10);
INSERT INTO `CoursesToSubgoals` VALUES (30, '1-3', 8, 15);
INSERT INTO `CoursesToSubgoals` VALUES (31, '1-3', 10, 10);
INSERT INTO `CoursesToSubgoals` VALUES (32, '1-3', 11, 15);
INSERT INTO `CoursesToSubgoals` VALUES (33, '1-3', 12, 15);
INSERT INTO `CoursesToSubgoals` VALUES (34, '1-3', 13, 15);
INSERT INTO `CoursesToSubgoals` VALUES (35, '1-3', 14, 10);
INSERT INTO `CoursesToSubgoals` VALUES (36, '1-3', 17, 10);
INSERT INTO `CoursesToSubgoals` VALUES (37, '1-4', 8, 20);
INSERT INTO `CoursesToSubgoals` VALUES (38, '1-4', 11, 20);
INSERT INTO `CoursesToSubgoals` VALUES (39, '1-4', 12, 20);
INSERT INTO `CoursesToSubgoals` VALUES (40, '1-4', 14, 10);
INSERT INTO `CoursesToSubgoals` VALUES (41, '1-4', 16, 10);
INSERT INTO `CoursesToSubgoals` VALUES (42, '1-4', 17, 20);
INSERT INTO `CoursesToSubgoals` VALUES (43, '2-1', 1, 15);
INSERT INTO `CoursesToSubgoals` VALUES (44, '2-1', 2, 5);
INSERT INTO `CoursesToSubgoals` VALUES (45, '2-1', 3, 5);
INSERT INTO `CoursesToSubgoals` VALUES (46, '2-1', 4, 15);
INSERT INTO `CoursesToSubgoals` VALUES (47, '2-1', 5, 5);
INSERT INTO `CoursesToSubgoals` VALUES (48, '2-1', 7, 5);
INSERT INTO `CoursesToSubgoals` VALUES (49, '2-1', 8, 5);
INSERT INTO `CoursesToSubgoals` VALUES (50, '2-1', 9, 5);
INSERT INTO `CoursesToSubgoals` VALUES (51, '2-1', 10, 5);
INSERT INTO `CoursesToSubgoals` VALUES (52, '2-1', 11, 5);
INSERT INTO `CoursesToSubgoals` VALUES (53, '2-1', 12, 5);
INSERT INTO `CoursesToSubgoals` VALUES (54, '2-1', 15, 5);
INSERT INTO `CoursesToSubgoals` VALUES (55, '2-1', 17, 5);
INSERT INTO `CoursesToSubgoals` VALUES (56, '2-1', 18, 5);
INSERT INTO `CoursesToSubgoals` VALUES (57, '2-1', 19, 5);
INSERT INTO `CoursesToSubgoals` VALUES (58, '2-1', 22, 5);
INSERT INTO `CoursesToSubgoals` VALUES (59, '2-2', 8, 15);
INSERT INTO `CoursesToSubgoals` VALUES (60, '2-2', 9, 10);
INSERT INTO `CoursesToSubgoals` VALUES (61, '2-2', 10, 10);
INSERT INTO `CoursesToSubgoals` VALUES (62, '2-2', 11, 15);
INSERT INTO `CoursesToSubgoals` VALUES (63, '2-2', 12, 15);
INSERT INTO `CoursesToSubgoals` VALUES (64, '2-2', 15, 15);
INSERT INTO `CoursesToSubgoals` VALUES (65, '2-2', 17, 10);
INSERT INTO `CoursesToSubgoals` VALUES (66, '2-2', 19, 10);
INSERT INTO `CoursesToSubgoals` VALUES (67, '2-3', 18, 15);
INSERT INTO `CoursesToSubgoals` VALUES (68, '2-3', 20, 15);
INSERT INTO `CoursesToSubgoals` VALUES (69, '2-3', 21, 15);
INSERT INTO `CoursesToSubgoals` VALUES (70, '2-3', 22, 15);
INSERT INTO `CoursesToSubgoals` VALUES (71, '2-3', 23, 10);
INSERT INTO `CoursesToSubgoals` VALUES (72, '2-3', 24, 20);
INSERT INTO `CoursesToSubgoals` VALUES (73, '2-3', 25, 10);
INSERT INTO `CoursesToSubgoals` VALUES (74, '3-1', 15, 30);
INSERT INTO `CoursesToSubgoals` VALUES (75, '3-1', 23, 20);
INSERT INTO `CoursesToSubgoals` VALUES (76, '3-1', 24, 30);
INSERT INTO `CoursesToSubgoals` VALUES (77, '3-1', 25, 20);
INSERT INTO `CoursesToSubgoals` VALUES (78, '3-2', 15, 30);
INSERT INTO `CoursesToSubgoals` VALUES (79, '3-2', 23, 10);
INSERT INTO `CoursesToSubgoals` VALUES (80, '3-2', 24, 30);
INSERT INTO `CoursesToSubgoals` VALUES (81, '3-2', 25, 20);
INSERT INTO `CoursesToSubgoals` VALUES (82, '3-2', 26, 10);
INSERT INTO `CoursesToSubgoals` VALUES (83, '3-3', 15, 30);
INSERT INTO `CoursesToSubgoals` VALUES (84, '3-3', 23, 10);
INSERT INTO `CoursesToSubgoals` VALUES (85, '3-3', 24, 30);
INSERT INTO `CoursesToSubgoals` VALUES (86, '3-3', 25, 10);
INSERT INTO `CoursesToSubgoals` VALUES (87, '3-3', 26, 20);
INSERT INTO `CoursesToSubgoals` VALUES (88, '4-1', 18, 25);
INSERT INTO `CoursesToSubgoals` VALUES (89, '4-1', 20, 25);
INSERT INTO `CoursesToSubgoals` VALUES (90, '4-1', 21, 25);
INSERT INTO `CoursesToSubgoals` VALUES (91, '4-1', 22, 25);
INSERT INTO `CoursesToSubgoals` VALUES (92, '4-2', 15, 20);
INSERT INTO `CoursesToSubgoals` VALUES (93, '4-2', 19, 20);
INSERT INTO `CoursesToSubgoals` VALUES (94, '4-2', 23, 10);
INSERT INTO `CoursesToSubgoals` VALUES (95, '4-2', 26, 10);
INSERT INTO `CoursesToSubgoals` VALUES (96, '4-2', 27, 20);
INSERT INTO `CoursesToSubgoals` VALUES (97, '4-2', 28, 20);
INSERT INTO `CoursesToSubgoals` VALUES (98, '4-3', 15, 20);
INSERT INTO `CoursesToSubgoals` VALUES (99, '4-3', 19, 15);
INSERT INTO `CoursesToSubgoals` VALUES (100, '4-3', 23, 15);
INSERT INTO `CoursesToSubgoals` VALUES (101, '4-3', 26, 20);
INSERT INTO `CoursesToSubgoals` VALUES (102, '4-3', 27, 15);
INSERT INTO `CoursesToSubgoals` VALUES (103, '4-3', 28, 15);
INSERT INTO `CoursesToSubgoals` VALUES (104, '4-4', 15, 20);
INSERT INTO `CoursesToSubgoals` VALUES (105, '4-4', 19, 10);
INSERT INTO `CoursesToSubgoals` VALUES (106, '4-4', 23, 10);
INSERT INTO `CoursesToSubgoals` VALUES (107, '4-4', 26, 20);
INSERT INTO `CoursesToSubgoals` VALUES (108, '4-4', 27, 10);
INSERT INTO `CoursesToSubgoals` VALUES (109, '4-4', 28, 30);
INSERT INTO `CoursesToSubgoals` VALUES (110, '5-1', 10, 20);
INSERT INTO `CoursesToSubgoals` VALUES (111, '5-1', 11, 15);
INSERT INTO `CoursesToSubgoals` VALUES (112, '5-1', 13, 20);
INSERT INTO `CoursesToSubgoals` VALUES (113, '5-1', 15, 15);
INSERT INTO `CoursesToSubgoals` VALUES (114, '5-1', 16, 15);
INSERT INTO `CoursesToSubgoals` VALUES (115, '5-1', 26, 15);
INSERT INTO `CoursesToSubgoals` VALUES (116, '5-2', 10, 20);
INSERT INTO `CoursesToSubgoals` VALUES (117, '5-2', 11, 15);
INSERT INTO `CoursesToSubgoals` VALUES (118, '5-2', 13, 20);
INSERT INTO `CoursesToSubgoals` VALUES (119, '5-2', 15, 15);
INSERT INTO `CoursesToSubgoals` VALUES (120, '5-2', 16, 15);
INSERT INTO `CoursesToSubgoals` VALUES (121, '5-2', 26, 15);
INSERT INTO `CoursesToSubgoals` VALUES (122, '5-3', 12, 30);
INSERT INTO `CoursesToSubgoals` VALUES (123, '5-3', 24, 50);
INSERT INTO `CoursesToSubgoals` VALUES (124, '5-3', 26, 20);
INSERT INTO `CoursesToSubgoals` VALUES (125, '6-1', 6, 50);
INSERT INTO `CoursesToSubgoals` VALUES (126, '6-1', 16, 50);
INSERT INTO `CoursesToSubgoals` VALUES (127, '6-2', 6, 50);
INSERT INTO `CoursesToSubgoals` VALUES (128, '6-2', 16, 50);
INSERT INTO `CoursesToSubgoals` VALUES (129, '7-1', 18, 20);
INSERT INTO `CoursesToSubgoals` VALUES (130, '7-1', 19, 30);
INSERT INTO `CoursesToSubgoals` VALUES (131, '7-1', 22, 20);
INSERT INTO `CoursesToSubgoals` VALUES (132, '7-1', 27, 30);
INSERT INTO `CoursesToSubgoals` VALUES (133, '7-2', 19, 50);
INSERT INTO `CoursesToSubgoals` VALUES (134, '7-2', 27, 50);
INSERT INTO `CoursesToSubgoals` VALUES (135, '8-1', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (136, '8-1', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (137, '8-2', 16, 60);
INSERT INTO `CoursesToSubgoals` VALUES (138, '8-2', 22, 40);
INSERT INTO `CoursesToSubgoals` VALUES (139, '8-3', 29, 100);
INSERT INTO `CoursesToSubgoals` VALUES (140, '9-1', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (141, '9-1', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (142, '9-2', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (143, '9-2', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (144, '9-3', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (145, '9-3', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (146, '10-1', 18, 20);
INSERT INTO `CoursesToSubgoals` VALUES (147, '10-1', 20, 20);
INSERT INTO `CoursesToSubgoals` VALUES (148, '10-1', 21, 20);
INSERT INTO `CoursesToSubgoals` VALUES (149, '10-1', 22, 20);
INSERT INTO `CoursesToSubgoals` VALUES (150, '10-1', 29, 20);
INSERT INTO `CoursesToSubgoals` VALUES (151, '10-2', 18, 25);
INSERT INTO `CoursesToSubgoals` VALUES (152, '10-2', 20, 25);
INSERT INTO `CoursesToSubgoals` VALUES (153, '10-2', 21, 25);
INSERT INTO `CoursesToSubgoals` VALUES (154, '10-2', 22, 25);
INSERT INTO `CoursesToSubgoals` VALUES (155, '10-3', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (156, '10-3', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (157, '11-1', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (158, '11-1', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (159, '11-2', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (160, '11-2', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (161, '11-3', 18, 50);
INSERT INTO `CoursesToSubgoals` VALUES (162, '11-3', 22, 50);
INSERT INTO `CoursesToSubgoals` VALUES (163, '12-1', 18, 40);
INSERT INTO `CoursesToSubgoals` VALUES (164, '12-1', 22, 40);
INSERT INTO `CoursesToSubgoals` VALUES (165, '12-1', 30, 20);
INSERT INTO `CoursesToSubgoals` VALUES (168, '1-1', 25, 60);
COMMIT;

-- ----------------------------
-- Table structure for requirements
-- ----------------------------
DROP TABLE IF EXISTS `requirements`;
CREATE TABLE `requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `title_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题i18n',
  `statement` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述',
  `statement_EN` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述i18n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of requirements
-- ----------------------------
BEGIN;
INSERT INTO `requirements` VALUES (1, '工程知识', 'Engineering Knowledge', '能够将数学、自然科学、工程基础和专业知识用于解决复杂工程问题', 'Able to apply mathematics, science, engineering fundamentals and expertise to solve complex engineering problems');
INSERT INTO `requirements` VALUES (2, '问题分析', 'Problem Analysis', '能够应用数学、自然科学和工程科学的基本原理，识别、表达、并通过文献研究分析复杂工程问题，以获得有效结论', 'Ability to apply fundamental principles of mathematics, natural science and engineering science to identify, express, and analyze complex engineering problems through literature research to reach valid conclusions');
INSERT INTO `requirements` VALUES (3, '设计/开发解决方案', 'Design/Develop Solution', '能够设计针对复杂工程问题的解决方案，设计满足特定需求的系统、单元（部件）或工艺流程，并能够在设计环节中体现创新意', 'Can design solutions to complex engineering problems, design systems, units (components) or processes to meet specific needs, and demonstrate innovation in the design process');
INSERT INTO `requirements` VALUES (4, '研究', 'Research', '能够基于科学原理并采用科学方法对复杂工程问题进行研究，包括设计实验、分析与解释数据、并通过信息综合得到合理有效的结论', 'Able to study complex engineering problems based on scientific principles and using scientific methods, including designing experiments, analyzing and interpreting data, and synthesizing information to arrive at reasonable and effective conclusions');
INSERT INTO `requirements` VALUES (5, '使用现代工具', 'Using Modern Tools', '能够针对复杂工程问题，开发、选择与使用恰当的技术、资源、现代工程工具和信息技术工具，包括对复杂工程问题的预测与模拟，并能够理解其局限性', 'Able to develop, select and use appropriate technologies, resources, modern engineering tools and information technology tools for complex engineering problems, including prediction and simulation of complex engineering problems, and understanding their limitations');
INSERT INTO `requirements` VALUES (6, '工程与社会', 'Engineering And Society', '能够基于工程相关背景知识进行合理分析，评价专业工程实践和复杂工程问题解决方案对社会、健康、安全、法律以及文化的影响，并理解应承担的责任', 'Able to conduct rational analysis based on engineering background knowledge, evaluate the social, health, safety, legal and cultural impact of professional engineering practices and solutions to complex engineering problems, and understand the responsibilities to be undertaken');
INSERT INTO `requirements` VALUES (7, '环境和可持续发展', 'Environment and Sustainable Development', '能够理解和评价针对复杂工程问题的工程实践对环境、社会可持续发展的影响', 'Able to understand and evaluate the impact of engineering practices on environmental and social sustainability of complex engineering problems');
INSERT INTO `requirements` VALUES (8, '职业规范', 'Professional Norms', '具有人文社会科学素养、社会责任感，能够在工程实践中理解并遵守工程职业道德和规范，履行责任', 'With humanistic and social science literacy, social responsibility, able to understand and abide by engineering professional ethics and norms in engineering practice, to fulfill responsibilities');
INSERT INTO `requirements` VALUES (9, '个人和团队', 'Individual And Team', '能够在多学科背景下的团队中承担个体、团队成员以及负责人的角色', 'Able to act as an individual, team member, and leader in a multidisciplinary team');
INSERT INTO `requirements` VALUES (10, '沟通', 'Communication', '能够就复杂工程问题与业界同行及社会公众进行有效沟通和交流，包括撰写报告和设计文稿、陈述发言、清晰表达或回应指令。并具备一定的国际视野，能够在跨文化背景下进行沟通和交流', 'Able to effectively communicate and communicate with industry colleagues and the public on complex engineering issues, including writing reports and design documents, making presentations, and clearly expressing or responding to instructions. With a certain international perspective and the ability to communicate and communicate in a cross-cultural context');
INSERT INTO `requirements` VALUES (11, '项目管理', 'Project Management', '理解并掌握工程管理原理与经济决策方法，并能在多学科环境中应用', 'Understand and grasp the principles of project management and economic decision-making methods and be able to apply them in a multidisciplinary environment');
INSERT INTO `requirements` VALUES (12, '终身学习', 'Lifelong Learning', '具有自主学习和终身学习的意识，有不断学习和适应发展的能力', 'Have the consciousness of independent learning and lifelong learning, and I have the ability to continuously learn and adapt to development');
COMMIT;

-- ----------------------------
-- Table structure for subGoals
-- ----------------------------
DROP TABLE IF EXISTS `subGoals`;
CREATE TABLE `subGoals` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'a-b格式索引',
  `father_id` int(11) NOT NULL COMMENT '父要求索引 外键',
  `statement` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述',
  `statement_EN` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述i18n',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `father_id` (`father_id`),
  CONSTRAINT `subgoals_ibfk_1` FOREIGN KEY (`father_id`) REFERENCES `requirements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of subGoals
-- ----------------------------
BEGIN;
INSERT INTO `subGoals` VALUES ('1-1', 1, '掌握数学、自然科学、工程科学和计算机专业的基础知识、原理和方法', 'Master the basic knowledge, principles and methods of mathematics, natural science, engineering science and computer science');
INSERT INTO `subGoals` VALUES ('1-2', 1, '能使用数学、自然科学、工程科学和计算机专业的语言工具表述计算机领域的复杂工程问题并求解', 'Can use the language tools of mathematics, natural science, engineering science and computer science to express and solve complex engineering problems in the computer field');
INSERT INTO `subGoals` VALUES ('1-3', 1, '能利用相关知识和数学模型方法推演、分析计算机领域的复杂工程问题', 'Can use relevant knowledge and mathematical modeling methods to deduce and analyze complex engineering problems in the computer field');
INSERT INTO `subGoals` VALUES ('1-4', 1, '能利用相关知识比较、综合和优化计算机工程问题的解决方案', 'Solutions that compare, synthesize, and optimize computer engineering problems using relevant knowledge');
INSERT INTO `subGoals` VALUES ('10-1', 10, '能就计算机领域专业问题，以口头、文稿、图表等方式，准确表达自己的观点，回应质疑，理解与业界同行和社会公众交流的差异性', 'Can accurately express my views, respond to questions, and understand the differences in communication with peers and the public on professional issues in the computer field by oral, written, and graphic methods');
INSERT INTO `subGoals` VALUES ('10-2', 10, '关注全球性问题，理解和尊重世界不同文化的差异性和多样性，理解计算机领域的国际发展趋势、研究热点', 'Focus on global issues, understand and respect the differences and diversity of different cultures in the world, understand the international development trends and research hotspots in the field of computer');
INSERT INTO `subGoals` VALUES ('10-3', 10, '具有款文化的语言和书面交流能力，能救计算机领域专业问题，在款文化的背景下机型基本的沟通和交流', 'Able to communicate in language and in writing in different cultures, capable of solving professional problems in the computer field, and basic communication and communication in the context of different cultures');
INSERT INTO `subGoals` VALUES ('11-1', 11, '理解计算机领域工程及产品全周期、全流程的成本构成中涉及构成管理与经济决策问题', 'Understand the construction management and economic decision-making issues involved in the cost structure of the whole cycle and process of engineering and products in the field of computer');
INSERT INTO `subGoals` VALUES ('11-2', 11, '掌握计算机领域工程项目中涉及的管理与经济决策方法、项目管理知识与管理工具', 'Master management and economic decision-making methods, project management knowledge and management tools involved in engineering projects in the computer field');
INSERT INTO `subGoals` VALUES ('11-3', 11, '能在多学科环境中，应用计算机工程管理与经济决策方法', 'Able to apply computer engineering management and economic decision-making methods in a multidisciplinary environment');
INSERT INTO `subGoals` VALUES ('12-1', 12, '具有自主学习和终身学习的意识， 具有不断学习和适应发展的能力', 'Have the consciousness of independent learning and lifelong learning, and have the ability to continuously learn and adapt to development');
INSERT INTO `subGoals` VALUES ('2-1', 2, '掌握数学、自然科学和工程科学的基本原理，掌握文献检索与研究的方法和技巧', 'Master the basic principles of mathematics, natural science and engineering science, master the methods and skills of literature retrieval and research');
INSERT INTO `subGoals` VALUES ('2-2', 2, '能应用数学、自然科学和工程科学的基本原理识别计算机领域复杂工程问题的关键环节，能正确表述复杂的计算机工程问题', 'Can apply the basic principles of mathematics, natural science and engineering science to identify the key links of complex engineering problems in the field of computer, and can correctly describe complex computer engineering problems');
INSERT INTO `subGoals` VALUES ('2-3', 2, '能应用基本原理，会借助文献研究、分析、解决工程问题，获得多种可选的解决方案', 'Able to apply basic principles and develop alternative solutions to engineering problems through literature research, analysis, and problem-solving');
INSERT INTO `subGoals` VALUES ('3-1', 3, '掌握计算机领域工程设计与产品开发全周期、全流程的基本设计/开发方法和，了解影响设计目标和技术方案的各种因素', 'Master the basic design/development methods of the whole cycle and process of engineering design and product development in the field of computer, and understand the various factors that affect the design objectives and technical solutions');
INSERT INTO `subGoals` VALUES ('3-2', 3, '针对计算机领域复杂工程问题，设计满足特定需求的系统、单元或流程的能力', 'Able to design systems, units, or processes that meet specific requirements for complex engineering problems in the computer domain');
INSERT INTO `subGoals` VALUES ('3-3', 3, '在计算机领域设计环节中体现创新意识，并综合考虑社会、健康、安全、法律、文化以及环境等因素的能力', 'Able to demonstrate a sense of innovation in the design process in the computer field, taking into account social, health, safety, legal, cultural, and environmental factors');
INSERT INTO `subGoals` VALUES ('4-1', 4, '通过文献研究或相关方法，调研和分析计算机领域复杂工程问题的解决方案', 'Investigate and analyze solutions to complex engineering problems in the computer field through literature research or related methods');
INSERT INTO `subGoals` VALUES ('4-2', 4, '能够根据计算机领域对象特征，选择研究路线，设计实验方案', 'Able to select research routes and design experimental schemes according to the characteristics of objects in the computer field');
INSERT INTO `subGoals` VALUES ('4-3', 4, '能够根据实验方案构建计算机领域实验系统，安全地开展实验，科学地采集实验数据', 'Can build the computer field experimental system according to the experimental scheme, safely carry out experiments, and scientifically collect experimental data');
INSERT INTO `subGoals` VALUES ('4-4', 4, '能对实验结果进行分析和解释，并通过信息综合得到合理有效地结论', 'Can analyze and explain the experimental results, and draw reasonable and effective conclusions through information synthesis');
INSERT INTO `subGoals` VALUES ('5-1', 5, '了解计算机领域常用的现代仪器、信息技术工具、工程工具和模拟软件的使用原理和方法，并理解其局限性', 'Understand the use principles and methods of modern instruments, information technology tools, engineering tools and simulation software commonly used in the computer field, and understand their limitations');
INSERT INTO `subGoals` VALUES ('5-2', 5, '能够选择与使用恰当的仪器、信息资源、工程工具和专业模拟软件，对计算机领域复杂工程问题进行分析、计算与设计', 'Can select and use appropriate instruments, information resources, engineering tools and professional simulation software to analyze, calculate and design complex engineering problems in the field of computer');
INSERT INTO `subGoals` VALUES ('5-3', 5, '能够针对计算机领域具体的对象，开发或选用满足特定需求的现代工具，模拟和预测专业问题，并能够分析其局限性', 'Able to develop or select modern tools to meet specific needs for specific objects in the computer field, to simulate and predict professional problems, and to analyze their limitations');
INSERT INTO `subGoals` VALUES ('6-1', 6, '了解计算机专业相关领域的技术标准体系、知识产权、产业政策和法律法规，不同社会文化对工程活动的影响', 'Understand the technical standard system, intellectual property rights, industrial policies, laws and regulations in the field related to computer science, and the influence of different social cultures on engineering activities');
INSERT INTO `subGoals` VALUES ('6-2', 6, '能分析和评价计算机领域专业实践对社会、健康、安全、法律以及文化的影响，并理解应承担的责任', 'Able to analyze and evaluate the social, health, safety, legal, and cultural implications of professional practice in the field of computer science, and to understand the responsibilities that should be taken');
INSERT INTO `subGoals` VALUES ('7-1', 7, '知晓和理解环境保护和可持续发展的理念和内涵', 'Know and understand the concept and connotation of environmental protection and sustainable development');
INSERT INTO `subGoals` VALUES ('7-2', 7, '能够站在环境保护和可持续发展的角度思考计算机领域专业工程实践的可持续性，评价产品周期中可能对人类和环境在城的损害和隐患', 'Can consider the sustainability of professional engineering practice in the field of computer from the perspective of environmental protection and sustainable development, and evaluate the possible damage and hidden danger to human and environment in the city during the product cycle');
INSERT INTO `subGoals` VALUES ('8-1', 8, '有正确的价值观，理解个人与社会的关系，了解中国国情', 'Have correct values, understand the relationship between individuals and society, and understand China\'s national conditions');
INSERT INTO `subGoals` VALUES ('8-2', 8, '理解诚实公正、诚信守则的过程职业道德规范，并能在计算机领域工程实践中自觉遵守', 'Understand the principles of integrity, fairness and integrity in the process of professional ethics and be able to consciously observe them in the engineering practice in the computer field');
INSERT INTO `subGoals` VALUES ('8-3', 8, '理解并遵守计算机领域工程职业道德和规范', 'Understand and adhere to the Engineering Ethics and Code of Ethics in the Computer Field');
INSERT INTO `subGoals` VALUES ('9-1', 9, '能与其他学科的成员有效沟通，合作共享', 'Able to communicate effectively and collaboratively with members of other disciplines');
INSERT INTO `subGoals` VALUES ('9-2', 9, '能够在计算机领域团队中独立或合作开展工作', 'Able to work independently or collaboratively in a computer field team');
INSERT INTO `subGoals` VALUES ('9-3', 9, '能够组织、协调和指挥计算机领域团队开展工作', 'Able to organize, coordinate and direct the work of computer field teams');
COMMIT;

-- ----------------------------
-- View structure for coursestosubgoalsview
-- ----------------------------
DROP VIEW IF EXISTS `coursestosubgoalsview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `coursestosubgoalsview` AS select `coursestosubgoals`.`id` AS `id`,`coursestosubgoals`.`subgoal_id` AS `subgoal_id`,`courses`.`id` AS `course_id`,`courses`.`name` AS `name`,`courses`.`name_EN` AS `name_EN`,`coursestosubgoals`.`percent` AS `percent` from (`coursestosubgoals` join `courses` on((`coursestosubgoals`.`course_id` = `courses`.`id`))) order by `coursestosubgoals`.`subgoal_id` asc;

SET FOREIGN_KEY_CHECKS = 1;
