/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100121
 Source Host           : localhost:3306
 Source Schema         : employment

 Target Server Type    : MySQL
 Target Server Version : 100121
 File Encoding         : 65001

 Date: 27/05/2023 15:00:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department&&
-- ----------------------------
DROP TABLE IF EXISTS `department&&`;
CREATE TABLE `department&&`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department&&
-- ----------------------------
INSERT INTO `department&&` VALUES (1, '研发部');
INSERT INTO `department&&` VALUES (2, '市场部');
INSERT INTO `department&&` VALUES (3, '客服部');
INSERT INTO `department&&` VALUES (4, '人力资源部');
INSERT INTO `department&&` VALUES (5, '行政部');
INSERT INTO `department&&` VALUES (6, '财务部');
INSERT INTO `department&&` VALUES (7, '采购部');
INSERT INTO `department&&` VALUES (8, '生产部');
INSERT INTO `department&&` VALUES (9, '设计部');
INSERT INTO `department&&` VALUES (10, '测试部');
INSERT INTO `department&&` VALUES (11, '运维部');
INSERT INTO `department&&` VALUES (12, '品牌部');
INSERT INTO `department&&` VALUES (13, '销售部');
INSERT INTO `department&&` VALUES (14, '售后服务部');
INSERT INTO `department&&` VALUES (15, '市场营销部');
INSERT INTO `department&&` VALUES (16, '制造部');
INSERT INTO `department&&` VALUES (17, '信息技术部');
INSERT INTO `department&&` VALUES (18, '教学部');
INSERT INTO `department&&` VALUES (19, '学术部');

-- ----------------------------
-- Table structure for education
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `eduvation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eduvation`(`eduvation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of education
-- ----------------------------
INSERT INTO `education` VALUES (4, '专科');
INSERT INTO `education` VALUES (1, '博士');
INSERT INTO `education` VALUES (3, '本科');
INSERT INTO `education` VALUES (2, '硕士');
INSERT INTO `education` VALUES (5, '高中及以下');

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `phone` int(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱号',
  `register` date DEFAULT NULL COMMENT '注册时间',
  `company` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司名称',
  `people` int(5) DEFAULT NULL COMMENT '员工数量',
  `region` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所在地区',
  `nature` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司性质',
  `company_progile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of enterprise
-- ----------------------------
INSERT INTO `enterprise` VALUES (1, 'user1', 'password1', 2147483647, 'user1@company.com', '2023-05-01', 'ABC科技有限公司', 100, '北京', '民营', 'ABC科技有限公司是一家专注于网站建设和网络推广的公司。我们拥有一支年轻且充满活力的团队，倡导开放、务实、创新的工作氛围，为客户提供优质的服务。');
INSERT INTO `enterprise` VALUES (2, 'user2', 'password2', 2147483647, 'user2@company.com', '2023-04-25', 'XYZ商贸有限公司', 50, '上海', '国有', 'XYZ商贸有限公司成立于1999年，是一家跨境电商企业，旗下拥有多个品牌。我们致力于让中国制造走向世界，为消费者带来更好的购物体验。');
INSERT INTO `enterprise` VALUES (3, 'user3', 'password3', 2147483647, 'user3@company.com', '2023-05-05', 'LMN文化传媒有限公', 30, '广州', '私营', 'LMN文化传媒有限公司是一家专注于影视制作的公司，拥有一支高素质的制作团队。我们秉承“创意为王，质量第一”的宗旨，为客户提供创新、精品的作品。');
INSERT INTO `enterprise` VALUES (4, 'user4', 'password4', 2147483647, 'user4@company.com', '2023-05-10', 'EFG金融集团', 200, '深圳', '民营', 'EFG金融集团是一家综合性金融服务机构，业务涵盖投资、财富管理、信托等多个领域。我们以专业、务实、稳健的风格赢得了广大客户的信赖。');
INSERT INTO `enterprise` VALUES (5, 'user5', 'password5', 2147483647, 'user5@company.com', '2023-04-30', 'PQR科技股份有限公', 80, '杭州', '上市', 'PQR科技股份有限公司成立于2010年，是一家专注于人工智能领域的企业。我们拥有一支研发实力雄厚的团队，致力于为客户提供智慧化、智能化的解决方案。');
INSERT INTO `enterprise` VALUES (6, 'user6', 'password6', 2147483647, 'user6@company.com', '2023-05-01', 'LMN网络科技有限公', 50, '北京', '民营', 'LMN网络科技有限公司是一家专注于软件开发和互联网应用的公司。我们拥有一支充满创造力和热情的团队，努力推动数字化时代的发展。');
INSERT INTO `enterprise` VALUES (7, 'user7', 'password7', 2147483647, 'user7@company.com', '2023-05-02', 'EFG地产集团', 500, '上海', '民营', 'EFG地产集团是一家综合型房地产开发企业。我们致力于建筑美好家园，为城市居民提供高品质的生活环境。');
INSERT INTO `enterprise` VALUES (8, 'user8', 'password8', 2147483647, 'user8@company.com', '2023-05-03', 'PQR生物科技有限公', 150, '广州', '民营', 'PQR生物科技有限公司是一家致力于生物医药领域的创新型企业。我们以技术先进、产品优质为目标，为人类健康事业做出更大的贡献。');
INSERT INTO `enterprise` VALUES (9, 'user9', 'password9', 2147483647, 'user9@company.com', '2023-05-04', 'ABC教育集团', 300, '深圳', '民营', 'ABC教育集团是一家专注于全球教育事业的跨国企业。我们提供各类顶尖教育资源，致力于培养未来社会精英。');
INSERT INTO `enterprise` VALUES (10, 'user10', 'password10', 2147483647, 'user10@company.com', '2023-05-05', 'XYZ文化创意有限公', 80, '杭州', '私营', 'XYZ文化创意有限公司是一家专业从事影视制作、影视投资等业务的文化传媒公司。我们致力于打造一流的文化艺术品牌，推动中国文化事业的发展。');
INSERT INTO `enterprise` VALUES (11, 'user11', 'password11', 2147483647, 'user11@company.com', '2023-05-06', 'LMN汽车集团', 2000, '北京', '上市', 'LMN汽车集团是一家领先的汽车整车及零部件生产商。我们注重技术创新，致力于推动汽车产业的绿色可持续发展。');
INSERT INTO `enterprise` VALUES (12, 'user12', 'password12', 2147483647, 'user12@company.com', '2023-05-07', 'EFG国际贸易有限公', 100, '上海', '国有', 'EFG国际贸易有限公司是一家进出口贸易企业，涉及多个领域，包括机械设备、电子产品、化工原料等。我们以诚信为本，追求共赢。');
INSERT INTO `enterprise` VALUES (13, 'user13', 'password13', 2147483647, 'user13@company.com', '2023-05-08', 'PQR物流有限公司', 500, '广州', '民营', 'PQR物流有限公司是一家综合性物流服务商，提供快递配送、仓储管理、国际货运等服务。我们秉承专业、高效、安全、便捷的服务理念，为客户创造价值。');
INSERT INTO `enterprise` VALUES (14, 'u14', 'password14', 1333333333, '123@156.com', '2001-02-04', 'qwe科技有限公司', 20, '北京', '国企', 'PQR物流有限公司是一家综合性物流服务商，提供快递配送、仓储管理、国际货运等服务。我们秉承专业、高效、安全、便捷的服务理念，为客户创造价值。');

-- ----------------------------
-- Table structure for limit_s
-- ----------------------------
DROP TABLE IF EXISTS `limit_s`;
CREATE TABLE `limit_s`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `limit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作年限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of limit_s
-- ----------------------------
INSERT INTO `limit_s` VALUES (1, '1年以下');
INSERT INTO `limit_s` VALUES (2, '1-2年');
INSERT INTO `limit_s` VALUES (3, '3-5年');
INSERT INTO `limit_s` VALUES (4, '6-10年');
INSERT INTO `limit_s` VALUES (5, '10年以上');

-- ----------------------------
-- Table structure for personage
-- ----------------------------
DROP TABLE IF EXISTS `personage`;
CREATE TABLE `personage`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名字',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `mail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `register` date DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of personage
-- ----------------------------
INSERT INTO `personage` VALUES (1, '张三', 'qwe', 'e10adc3949ba59abbe56', '13888888888', 'john@example.com', '2022-01-01');
INSERT INTO `personage` VALUES (2, '李四', 'asd', 'e10adc3949ba59abbe56', '13999999999', 'mary@example.com', '2022-02-01');
INSERT INTO `personage` VALUES (3, '王五', 'zxc', 'e10adc3949ba59abbe56', '13666666666', 'tom@example.com', '2022-03-01');
INSERT INTO `personage` VALUES (4, '马六', 'rty', 'e10adc3949ba59abbe56', '13800000000', 'zhangsan@example.com', '2022-01-01');
INSERT INTO `personage` VALUES (5, '赵七', 'fgh', 'e10adc3949ba59abbe56', '13911111111', 'lisi@example.com', '2022-01-02');
INSERT INTO `personage` VALUES (6, '吴秀英', 'vbn', 'e10adc3949ba59abbe56', '13622222222', 'wangwu@example.com', '2022-01-03');
INSERT INTO `personage` VALUES (7, '田立新', 'uio', 'e10adc3949ba59abbe56', '13533333333', 'zhaoliu@example.com', '2022-01-04');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(10) NOT NULL COMMENT '外键关联到enterprise表',
  `positions` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '招聘职位',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位类别',
  `region` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作地区',
  `people` int(5) DEFAULT NULL COMMENT '招聘人数',
  `monthly_pay` int(10) DEFAULT NULL COMMENT '月薪',
  `major` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业要求',
  `station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '岗位介绍',
  `eduvation` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历',
  `limit_age` int(5) DEFAULT NULL COMMENT '工作年限',
  `contact_number` int(11) DEFAULT NULL COMMENT '联系电话',
  `nature` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司性质',
  `name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'HR姓名',
  `company_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_position_enterprise_id`(`enterprise_id`) USING BTREE,
  CONSTRAINT `fk_position_enterprise_id` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES (1, 1, 'PHP开发工程师', '技术', '北京', 3, 12000, '计算机科学', '负责公司产品的PHP开发和维护，熟悉LAMP架构，有良好的编程习惯和源码阅读能力。', '本科', 5, 2147483647, '国企', '张女士', '北京狗不理有限公司');
INSERT INTO `positions` VALUES (2, 1, '电商运营专员', '运营', '上海', 5, 10000, '市场营销', '负责公司招商、网店运营和客户服务等工作，具备一定的项目管理能力和团队合作精神。', '本科', 2, 2147483647, '外资', '王女士', '上海狗不理有限公司');
INSERT INTO `positions` VALUES (3, 4, '影视制片人', '文化传媒', '广州', 2, 15000, '影视制作', '负责影视节目策划、制作和推广等工作，具有较强的创意能力和团队协作精神。', '本科', 3, 2147483647, '已上市', '赵先生', '广东狗不理有限公司');
INSERT INTO `positions` VALUES (4, 4, '投资顾问', '金融', '深圳', 10, 20000, '经济学', '负责为客户提供理财、投资等方面的咨询服务，具备一定的分析和决策能力。', '本科', 5, 2147483647, '合资', '李先生', '深圳狗不理有限公司');
INSERT INTO `positions` VALUES (5, 4, '机器学习工程师', '人工智能', '杭州', 3, 18000, '计算机科学', '负责公司智能化项目的研发和实现，具备较强的算法和编程能力，有深度学习经验者优先。', '硕士', 2, 2147483647, '民营', '张先生', '杭州狗不理有限公司');
INSERT INTO `positions` VALUES (6, 3, 'UI设计师', '设计', '成都', 2, 10000, '平面设计', '负责公司产品UI设计和视觉效果设计，熟练使用设计软件如 Photoshop、Sketch 等，有良好的审美能力和设计思路。', '本科', 1, 2147483647, '上市公司', '朱先生', '成都狗不理有限公司');
INSERT INTO `positions` VALUES (7, 3, '运动教练', '健身', '广州', 5, 7000, '体育教育', '负责公司的健身培训业务，具有相关的专业知识和经验，有良好的沟通能力和服务意识。', '大专', 2, 2147483647, '中外合资', '朱女士', '广州狗不理有限公司2');
INSERT INTO `positions` VALUES (8, 2, '客服专员', '客服', '北京', 3, 8000, '英语', '负责公司产品的客户服务，具有良好的沟通能力和服务意识，英语口语流利者优先。', '本科', 1, 2147483647, '外资', '袁先生', '北京狗不理有限公司2');
INSERT INTO `positions` VALUES (9, 2, '证券分析师', '金融', '南京', 2, 20000, '金融学', '负责为客户提供证券投资方面的分析和建议，具备一定的金融理论和实践经验。', '硕士', 5, 2147483647, '民营', '张女士', '南京狗不理有限公司');
INSERT INTO `positions` VALUES (10, 1, 'Android开发工', '技术', '深圳', 3, 15000, '计算机科学', '负责公司产品的Android端开发和维护，熟悉Android SDK、Java 开发、Android 开发模式，有良好的编程习惯和源码阅读能力。', '博士', 3, 2147483647, '国企', '袁先生', '深圳狗不理有限公司2');
INSERT INTO `positions` VALUES (11, 2, '京东店长', '电商', '上海', 2, 12000, '市场营销', '负责公司京东店铺的运营和管理，具有相关的电商运营和团队管理经验。', '博士', 2, 2147483647, '外资', '朱女士', '上海狗不理有限公司2');
INSERT INTO `positions` VALUES (12, 3, '新媒体编辑', '传媒', '北京', 5, 8000, '新闻传播', '负责公司新媒体平台的内容策划和编辑，具备较强的新闻敏感性和文字表达能力，熟悉微信公众号运营。', '博士', 1, 2147483647, '已上市', '袁先生', '北京狗不理有限公司3');
INSERT INTO `positions` VALUES (13, 1, '前端开发工程师', '技术', '广州', 3, 13000, '计算机科学', '负责公司产品的前端开发和维护，熟悉JavaScript、CSS、HTML 等相关技术，有良好的编程习惯和源码阅读能力。', '本科', 2, 2147483647, '国企', '彭女士', '广州狗不理有限公司3');
INSERT INTO `positions` VALUES (14, 4, '银行营销经理', '金融', '重庆', 2, 18000, '市场营销', '负责公司银行业务的营销和销售，具备一定的客户管理和谈判能力，有银行从业资格者优先。', '本科', 3, 2147483647, '合资', '张女士', '重庆狗不理有限公司');
INSERT INTO `positions` VALUES (15, 7, '软件测试工程师', '技术', '武汉', 3, 11000, '计算机科学', '负责公司产品的软件测试和质量保证，熟悉软件测试的各种方法和工具，有良好的问题分析和解决能力。', '大专', 5, 2147483647, '上市公司', '王先生', '武汉狗不理有限公司');
INSERT INTO `positions` VALUES (16, 7, '市场推广专员', '营销', '成都', 5, 9000, '市场营销', '负责公司产品的市场推广和宣传，具备一定的营销策划和执行能力，有互联网行业经验者优先。', '大专', 2, 2147483647, '外资', '朱女士', '成都狗不理有限公司1');
INSERT INTO `positions` VALUES (17, 3, '音乐编曲师', '文化娱乐', '北京', 2, 12000, '音乐制作', '负责公司音乐制作和编曲等工作，具有相关音乐专业知识和经验，熟练操作各类音乐软件。', '本科', 3, 2147483647, '已上市', '彭先生', '北京狗不理有限公司4');
INSERT INTO `positions` VALUES (18, 4, '税务经理', '财务', '上海', 2, 25000, '财务管理', '负责公司税务申报和税务筹划工作，具备相关财务和税务专业知识和经验，有注册会计师等专业资格者优先。', '大专', 5, 2147483647, '民营', '王女士', '伤害狗不理有限公司3');
INSERT INTO `positions` VALUES (19, 1, '数据挖掘工程师', '人工智能', '深圳', 3, 18000, '计算机科学', '负责公司数据挖掘和分析工作，具备相关的统计和机器学习知识，熟练使用各类数据分析软件。', '硕士', 3, 2147483647, '国企', '彭先生', '深圳狗不理有限公司2');
INSERT INTO `positions` VALUES (20, 5, '产品经理', '产品', '北京', 2, 20000, '市场营销', '负责公司产品的规划和策划工作，具有较强的市场敏感性和产品设计能力，有互联网行业经验者优先。', '本科', 3, 2147483647, '上市公司', '朱女士', '北京狗不理有限公司5');
INSERT INTO `positions` VALUES (21, 2, '人力资源专员', '人力资源', '杭州', 5, 8000, '人力资源管理', '负责公司的人力资源招聘和管理工作，具有相关的人力资源管理专业知识和经验，良好的沟通和协调能力。', '大专', 1, 2147483647, '外资', '王女士', '杭州狗不理有限公司2');
INSERT INTO `positions` VALUES (22, 3, '平面设计师', '设计', '广州', 2, 10000, '平面设计', '负责公司平面设计和视觉效果设计，熟练使用设计软件如 Photoshop、Illustrator 等，有良好的审美能力和设计思路。', '本科', 1, 2147483647, '已上市', '彭先生', '广州狗不理有限公司4');
INSERT INTO `positions` VALUES (23, 4, '风控经理', '金融', '深圳', 2, 22000, '金融学', '负责公司风险管理和控制工作，具备相关的金融理论和实践经验，有征信分析、风险评估等方面经验者优先。', '硕士', 5, 2147483647, '民营', '王女士', '深圳狗不理有限公司3');
INSERT INTO `positions` VALUES (24, 8, '技术支持工程师', '技术', '武汉', 3, 9000, '计算机科学', '负责公司产品技术支持和问题处理工作，具备一定的技术储备和问题解决能力，有良好的客户服务态度。', '本科', 1, 2147483647, '上市公司', '彭先生', '武汉狗不理有限公司3');
INSERT INTO `positions` VALUES (25, 2, '电子商务专员', '电商', '广州', 2, 10000, '市场营销', '负责公司电子商务平台营销和运营工作，具有一定的电商行业知识和市场策划能力，熟悉电子商务平台操作。', '本科', 1, 2147483647, '国企', '王女士', '广州狗不理有限公司5');
INSERT INTO `positions` VALUES (26, 6, '前端开发工程师', '传销', '伤害', 4, 12000, '计算机科学', '负责公司产品的前端开发和维护，有良好的编程习惯和源码阅读能力。', '大专', 4, 2147483647, '国企', '老王', '贵州狗不理有限公司');

-- ----------------------------
-- Table structure for qualification
-- ----------------------------
DROP TABLE IF EXISTS `qualification`;
CREATE TABLE `qualification`  (
  `id` int(10) NOT NULL COMMENT '关联到position',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任职资格',
  `welfare` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '福利待遇',
  `company` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司名字',
  `location` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上班地址',
  INDEX `fk_qualification_position_id`(`id`) USING BTREE,
  CONSTRAINT `fk_qualification_position_id` FOREIGN KEY (`id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qualification
-- ----------------------------
INSERT INTO `qualification` VALUES (1, '1、20～27岁之间，统招大专及以上学历；\r\n2、计算机或相关专业（理工科为主），接纳优秀生但好学的人才；\r\n3、较强的自我约束力和工作责任感；\r\n4、对软件开发充满热爱。', '1、7小时工作制，高效的工作环境和氛围，完善的员工内部制度；\r\n2、人性化管理，享受国家规定的带薪年假、各种节假日；\r\n3、良好的晋升机制，广阔的晋升空间。', '北京狗不理有限公司', '北京a地区');
INSERT INTO `qualification` VALUES (1, '1、20～27岁之间，统招大专及以上学历；\r\n2、计算机或相关专业（理工科为主），接纳优秀生但好学的人才；\r\n3、较强的自我约束力和工作责任感；\r\n4、对软件开发充满热爱。', '1、7小时工作制，高效的工作环境和氛围，完善的员工内部制度；\r\n2、人性化管理，享受国家规定的带薪年假、各种节假日；\r\n3、良好的晋升机制，广阔的晋升空间。', '上海狗不理有限公司', '上海a地区');
INSERT INTO `qualification` VALUES (2, '1、本科及以上学历，计算机相关专业优先，3年及以上工作经验；\r\n2、扎实的Java编程基础，熟悉Spring框架和MySQL等数据库技术；\r\n3、具备良好的沟通能力和团队协作精神；\r\n4、具备金融行业从业经验者优先。', '1、五险一金、年终奖、带薪年假、定期体检；\r\n2、轻松的工作环境，开放的公司文化；\r\n3、专业的培训体系，完善的晋升机制。', '广东狗不理有限公司', '广州a地区');
INSERT INTO `qualification` VALUES (3, '1、统招本科及以上学历，计算机相关专业优先；\r\n2、熟练掌握Java或Python编程语言，熟悉SpringBoot等框架；\r\n3、精通MySQL或Oracle等主流关系型数据库；\r\n4、积极沟通，具备团队协作和应变能力。', '1、五险一金、免费班车、商业保险；\r\n2、带薪年假、定期体检、员工活动；\r\n3、丰厚的薪资和晋升发展空间。', '深圳狗不理有限公司', '深圳b地区');
INSERT INTO `qualification` VALUES (4, '1、本科及以上学历，3年以上互联网行业开发经验；\r\n2、熟练掌握Java、Python等编程语言和常用数据结构、算法；\r\n3、掌握SpringBoot、MyBatis等后端开发框架；\r\n4、熟悉MongoDB、Redis等NoSQL数据库；\r\n5、良好的英语阅读能力，能够阅读英文技术文档。', '1、五险一金、节假日福利、带薪年假、带薪病假；\r\n2、弹性工作制，团队活动、年度旅游、技术交流会；\r\n3、免费咖啡、零食、水果等，舒适的工作环境；\r\n4、竞争力的薪资和股权激励计划。', '杭州狗不理有限公司', '杭州q地区');
INSERT INTO `qualification` VALUES (5, '1、本科以上学历，计算机相关专业；\r\n2、5年以上项目开发经验，精通Java/Python/Go等编程语言；\r\n3、熟悉常见大数据框架如Hadoop、Spark等；\r\n4、熟练掌握MySQL、Redis等数据库；\r\n5、具备优秀的系统设计和调优能力，熟悉Linux操作系统。', '1、五险一金、带薪年假、定期体检、员工生日福利；\r\n2、咖啡、茶、饮料、水果、零食免费供应；\r\n3、扁平化管理，优秀的团队氛围；\r\n4、丰富的晋升机会，有竞争力的薪资待遇。', '成都狗不理有限公司', '成都q地区');
INSERT INTO `qualification` VALUES (6, '1、全日制本科及以上学历，计算机或相关专业；\r\n2、熟练掌握C/C++编程语言，熟悉Linux/Unix操作系统；\r\n3、熟悉常用数据结构、算法和网络通信协议；\r\n4、有较强的团队合作精神，良好的沟通表达能力。', '1、五险一金、带薪年假、节日福利；\r\n2、交通补贴、通讯补贴、餐补、免费班车；\r\n3、全方位职业技能培训、定期康复体检、员工活动；\r\n4、多维度的晋升机会和广阔的职业发展空间。', '广州狗不理有限公司2', '广州w地区');
INSERT INTO `qualification` VALUES (7, '1、全日制本科及以上学历，化学相关专业；\r\n2、3年以上相关工作经验，具有项目管理能力；\r\n3、熟悉ISO9001、ISO14001等质量管理体系；\r\n4、具备良好的沟通协调能力和团队合作精神。', '1、五险一金+商业医疗保险；\r\n2、国家法定节假日+年度带薪假期+年度旅游；\r\n3、定期体检+员工生日礼物；\r\n4、完善的培训体系和晋升机制。', '北京狗不理有限公司2', '北京d地区');
INSERT INTO `qualification` VALUES (8, '1、全日制本科及以上学历，金融相关专业；\r\n2、熟悉金融市场规律和经济形势，掌握企业财务、税务等方面知识；\r\n3、良好的业务判断力和风险控制能力；\r\n4、具备优秀的团队领导和管理能力。', '1、年终奖金+五险一金+带薪年假+节日福利；\r\n2、业务培训+管理培训+岗位晋升；\r\n3、国内外优秀券商研究同行交流+商业保险；\r\n4、完善的职业晋升制度。', '南京狗不理有限公司', '南京s地区');
INSERT INTO `qualification` VALUES (9, '1、全日制本科及以上学历，市场营销或相关专业；\r\n2、3年以上广告传媒或品牌推广相关工作经验；\r\n3、熟悉市场渠道建设、品牌推广策略和执行方案等；\r\n4、具备较强的商业敏感度和谈判能力，团队合作精神。', '1、五险一金+商业保险+法定节假日+带薪年假；\r\n2、员工生日福利+定期体检+健身俱乐部福利；\r\n3、专职培训师对业务和管理进行总结和指导；\r\n4、晋升机制明确。', '深圳狗不理有限公司2', '深圳r地区');
INSERT INTO `qualification` VALUES (10, '1、全日制本科及以上学历，人力资源管理或相近专业；\r\n2、5年以上人力资源管理经验，熟悉人力资源管理各项业务和流程；\r\n3、具备人才招聘、培养和激励、绩效管理等方面的能力；\r\n4、具有出色的团队领导和组织协调能力。', '1、五险一金+商业保险+节日福利+公司活动奖励；\r\n2、带薪休假+员工生日福利+员工培训；\r\n3、友好的工作氛围，共享快乐与成长；\r\n4、完善的职业发展路径。', '上海狗不理有限公司2', '上海t地区');
INSERT INTO `qualification` VALUES (11, '1、全日制本科及以上学历，市场营销或相关专业；\r\n2、4年以上市场营销经验，在地产销售或三方广告企业工作经验者优先；\r\n3、熟练掌握市场拓展、活动策划、品牌策划和媒体传播等技术手段；\r\n4、具备较强的沟通能力、团队协作意识和组织协调能力。', '1、五险一金+节日福利+优秀员工奖励+带薪年假；\r\n2、晋升空间+专业培训+技能提升+定期评估；\r\n3、友好的工作氛围、丰富多彩的员工活动；\r\n4、公司旅游+员工生日庆祝+员工子女教育补贴。', '北京狗不理有限公司3', '北京t地区');
INSERT INTO `qualification` VALUES (12, '1、全日制本科及以上学历，化学相关专业；\r\n2、3年以上相关工作经验，熟悉化工流程和相关设备的操作和维护；\r\n3、熟悉化工原材料的基本特性，了解产品生产工艺和质量检验流程；\r\n4、有良好的安全生产意识和团队合作精神。', '1、五险一金+商业医疗保险；\r\n2、国家法定节假日+年度带薪假期+年度旅游；\r\n3、定期体检+员工生日礼物；\r\n4、完善的培训体系和晋升机制。', '广州狗不理有限公司3', '广州e地区');
INSERT INTO `qualification` VALUES (13, '1、全日制本科及以上学历，化学相关专业；\n2、3年以上相关工作经验，熟悉化工流程和相关设备的操作和维护；\n3、熟悉化工原材料的基本特性，了解产品生产工艺和质量检验流程；\n4、有良好的安全生产意识和团队合作精神。', '1、五险一金+商业医疗保险；\n2、国家法定节假日+年度带薪假期+年度旅游；\n3、定期体检+员工生日礼物；\n4、完善的培训体系和晋升机制。', '广州e地区狗不理有限', '广州e地区');
INSERT INTO `qualification` VALUES (14, '1、全日制本科及以上学历，化学相关专业；\n2、3年以上相关工作经验，熟悉化工流程和相关设备的操作和维护；\n3、熟悉化工原材料的基本特性，了解产品生产工艺和质量检验流程；\n4、有良好的安全生产意识和团队合作精神。', '1、五险一金+商业医疗保险；\n2、国家法定节假日+年度带薪假期+年度旅游；\n3、定期体检+员工生日礼物；\n4、完善的培训体系和晋升机制。', '广州e地区狗不理有限', '地区');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `region` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, '北京');
INSERT INTO `region` VALUES (2, '天津');
INSERT INTO `region` VALUES (3, '上海');
INSERT INTO `region` VALUES (4, '重庆');
INSERT INTO `region` VALUES (5, '河北');
INSERT INTO `region` VALUES (6, '山西');
INSERT INTO `region` VALUES (7, '辽宁');
INSERT INTO `region` VALUES (8, '吉林');
INSERT INTO `region` VALUES (9, '黑龙江');
INSERT INTO `region` VALUES (10, '江苏');
INSERT INTO `region` VALUES (11, '浙江');
INSERT INTO `region` VALUES (12, '安徽');
INSERT INTO `region` VALUES (13, '福建');
INSERT INTO `region` VALUES (14, '江西');
INSERT INTO `region` VALUES (15, '山东');
INSERT INTO `region` VALUES (16, '河南');
INSERT INTO `region` VALUES (17, '湖北');
INSERT INTO `region` VALUES (18, '湖南');
INSERT INTO `region` VALUES (19, '广东');
INSERT INTO `region` VALUES (20, '广西');
INSERT INTO `region` VALUES (21, '海南');
INSERT INTO `region` VALUES (22, '四川');
INSERT INTO `region` VALUES (23, '贵州');
INSERT INTO `region` VALUES (24, '云南');
INSERT INTO `region` VALUES (25, '西藏');
INSERT INTO `region` VALUES (26, '陕西');
INSERT INTO `region` VALUES (27, '甘肃');
INSERT INTO `region` VALUES (28, '青海');
INSERT INTO `region` VALUES (29, '宁夏');
INSERT INTO `region` VALUES (30, '新疆');
INSERT INTO `region` VALUES (31, '台湾');
INSERT INTO `region` VALUES (32, '香港');
INSERT INTO `region` VALUES (33, '澳门');

-- ----------------------------
-- Table structure for relevance
-- ----------------------------
DROP TABLE IF EXISTS `relevance`;
CREATE TABLE `relevance`  (
  `id` int(5) NOT NULL COMMENT '这是职位和简历关联的表',
  `position_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位id',
  `resume_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简历id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '需要关联到个人注册列表的id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `sex` int(1) DEFAULT NULL COMMENT '性别 0-女 1-男',
  `irthday` date DEFAULT NULL COMMENT '出生日期',
  `major` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所学专业',
  `education` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历',
  `experience` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作年限',
  `native` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '籍贯',
  `post` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '求职岗位',
  `monthly` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '期望薪资',
  `through` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作经验',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT ' 手机号',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `education`(`education`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (2, '李四', 0, '1992-05-12', '会计学', '本科', '2', '江苏', '财务人员', '8k', '就职于某知名集团公司，主要从事财务报表编制和核对等工作', '21474836471', 'lisi@example.com');
INSERT INTO `resume` VALUES (3, '王五', 1, '1991-09-08', '市场营销', '本科', '4', '广东', '市场推广', '12k', '就职于某知名互联网公司，担任市场推广经理，负责公司品牌宣传和产品推广等工作', '21474836471', 'wangwu@example.com');
INSERT INTO `resume` VALUES (4, '赵六', 0, '2000-02-28', '计算机科学', '本科', '3', '北京', '软件开发', '10k', '哈布垃圾公司', '13333333333', 'qweqwe@163.com');
INSERT INTO `resume` VALUES (5, '请问', 1, '2002-03-02', '计算机软件', '本科', '2', '山东', '软件开发', '10k', '待业', '2222222221', 'qweqwe@143.com');
INSERT INTO `resume` VALUES (6, '请问', 1, '2002-03-02', '计算机软件', '本科', '2', '山东', '软件开发', '10k', '待业', '21474836471', 'qweqwe@143.com');
INSERT INTO `resume` VALUES (7, '请问', 1, '2002-03-02', '计算机软件', '本科', '2', '山东', '软件开发', '10k', '待业', '13036656990', 'qweqwe@143.com');
INSERT INTO `resume` VALUES (8, 'dqw', 1, '2003-02-14', '建组', '本科', '3', '四川', '板砖', '20k', '自由职业', '13322222221', 'fweaf@144.com');
INSERT INTO `resume` VALUES (9, '请问', 1, '2002-03-02', '计算机软件', '本科', '2', '山东', '软件开发', '10k', '待业', '13333333333', 'qweqwe@143.com');
INSERT INTO `resume` VALUES (10, '我不叫', 1, '2002-02-28', '计算机软件', '高中及以下', '2', '山东', '软件开发', '10k', '待业', '13333333333', 'qweqwe@143.com');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `station_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '岗位类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES (1, '销售人员');
INSERT INTO `station` VALUES (2, '客服人员');
INSERT INTO `station` VALUES (3, '行政人员');
INSERT INTO `station` VALUES (4, '人力资源');
INSERT INTO `station` VALUES (5, '财务人员');
INSERT INTO `station` VALUES (6, '市场推广');
INSERT INTO `station` VALUES (7, 'IT 技术支持');
INSERT INTO `station` VALUES (8, '软件开发工程师');
INSERT INTO `station` VALUES (9, '硬件工程师');
INSERT INTO `station` VALUES (10, '网络安全');
INSERT INTO `station` VALUES (11, '数据分析师');
INSERT INTO `station` VALUES (12, '产品经理');
INSERT INTO `station` VALUES (13, '项目经理');
INSERT INTO `station` VALUES (14, '运营管理');
INSERT INTO `station` VALUES (15, '物流管理');
INSERT INTO `station` VALUES (16, '采购管理');
INSERT INTO `station` VALUES (17, '供应链管理');
INSERT INTO `station` VALUES (18, '生产管理');
INSERT INTO `station` VALUES (19, '品质管理');

SET FOREIGN_KEY_CHECKS = 1;
