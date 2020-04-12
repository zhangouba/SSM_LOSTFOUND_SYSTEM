/*
Navicat MySQL Data Transfer

Source Server         : linux_mysq
Source Server Version : 50646
Source Host           : 192.168.222.128:3306
Source Database       : ssm_lostfind

Target Server Type    : MYSQL
Target Server Version : 50646
File Encoding         : 65001

Date: 2020-04-07 17:33:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_aboutus
-- ----------------------------
DROP TABLE IF EXISTS `tb_aboutus`;
CREATE TABLE `tb_aboutus` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '信息标题',
  `us_text` text NOT NULL COMMENT '关于我们正文',
  `images` varchar(255) DEFAULT NULL COMMENT '图片',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_aboutus
-- ----------------------------

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL COMMENT '物品分类名',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '钱包', '2018-12-09 21:20:35', '2018-12-09 21:20:38');
INSERT INTO `tb_category` VALUES ('2', '钥匙', '2018-12-09 21:20:59', '2018-12-09 21:21:01');
INSERT INTO `tb_category` VALUES ('3', '宠物', '2018-12-09 21:21:16', '2018-12-09 21:21:18');
INSERT INTO `tb_category` VALUES ('4', '卡类/证书', '2018-12-09 21:21:43', '2018-12-09 21:21:45');
INSERT INTO `tb_category` VALUES ('5', '数码产品', '2018-12-09 21:22:01', '2018-12-09 21:22:04');
INSERT INTO `tb_category` VALUES ('6', '手袋/挎包', '2018-12-09 21:22:26', '2018-12-09 21:22:29');
INSERT INTO `tb_category` VALUES ('7', '衣服/鞋帽', '2018-12-09 21:22:53', '2018-12-09 21:22:56');
INSERT INTO `tb_category` VALUES ('8', '首饰/挂饰', '2018-12-09 21:23:12', '2018-12-09 21:23:15');
INSERT INTO `tb_category` VALUES ('9', '行李/包裹', '2018-12-09 21:23:36', '2018-12-09 21:23:38');
INSERT INTO `tb_category` VALUES ('10', '书籍/文件', '2018-12-09 21:23:53', '2018-12-09 21:23:59');
INSERT INTO `tb_category` VALUES ('11', '其他', '2018-12-09 21:24:12', '2018-12-09 21:24:15');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '物品ID',
  `comment_text` text NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166830142462742880 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('1', '154752159872591', '清晨午后黄昏的巴黎，一直是我记忆中最美的瞬间', '2019-01-17 17:54:28', '2019-01-17 17:54:31', '2019-01-17 17:54:33');
INSERT INTO `tb_comment` VALUES ('2', '154752432618431', '往后余生 吃不胖的是你 巨有钱的是你 拥有一切美好的 还是你', '2019-01-17 17:55:17', '2019-01-17 17:55:20', '2019-01-17 17:55:23');
INSERT INTO `tb_comment` VALUES ('3', '154752221029729', '离乱中寻觅一张安静的书桌，未曾向洋已经砺就了锋锷。受命之日，寝不安席，当年吴钩，申城淬火，十月出塞，大器初成。一句嘱托，许下了一生;一声巨响，惊诧了世界;一个名字，荡涤了人心。', '2019-01-17 17:56:15', '2019-01-17 17:56:18', '2019-01-17 17:56:21');
INSERT INTO `tb_comment` VALUES ('4', '154752383719702', '亲戚或余悲，他人亦已歌，斯人虽逝，但星空，将与世长存。', '2019-01-17 17:57:01', '2019-01-17 17:57:04', '2019-01-17 17:57:07');
INSERT INTO `tb_comment` VALUES ('5', '154752432618431', '总会有一个人，即使你满身是刺，也会张开双手拥抱你', '2019-01-18 17:24:59', '2019-01-18 17:25:02', '2019-01-18 17:25:06');
INSERT INTO `tb_comment` VALUES ('6', '154752432618431', '等你长大就会发现，当你满身是刺，依然会爱你拥抱你的，只有家人。', '2019-01-18 17:25:42', '2019-01-18 17:25:44', '2019-01-18 17:25:46');
INSERT INTO `tb_comment` VALUES ('7', '154752432618431', '“对于有社交恐惧的人来说，他们的自学能力都来自于不好意思开口问别人” ​​​​', '2019-01-18 17:27:51', '2019-01-18 17:27:55', '2019-01-18 17:27:57');
INSERT INTO `tb_comment` VALUES ('8', '154752432618431', '感谢父母给我的一首好牌。', '2019-01-18 17:29:05', '2019-01-18 17:29:09', '2019-01-18 17:29:12');
INSERT INTO `tb_comment` VALUES ('9', '154752432618431', '“他那么小你让着他怎么了？”，有时候特别讨厌这句话，不是年纪小就可以是非不分。心疼台上和台下的两个小女孩。 ​​​​', '2019-01-18 17:30:52', '2019-01-18 17:30:54', '2019-01-18 17:30:57');
INSERT INTO `tb_comment` VALUES ('10', '154752432618431', '你不知道我当年受过的苦，就不要劝我大度。', '2019-01-18 17:31:28', '2019-01-18 17:31:30', '2019-01-18 17:31:33');
INSERT INTO `tb_comment` VALUES ('7544406749069924', '155117471786043', 'adsfwesadfesd', '2019-02-27 15:56:38', '2019-02-27 15:56:38', '2019-02-27 15:56:38');
INSERT INTO `tb_comment` VALUES ('7570312108605347', '154859009886768', 'dxfbgsrefx dr', '2019-02-27 16:00:57', '2019-02-27 16:00:57', '2019-02-27 16:00:57');
INSERT INTO `tb_comment` VALUES ('11812177952265255', '154858977146124', '成年人情绪稳定的秘诀之一：总是把对他人的期待放到最低。', '2019-02-14 19:21:20', '2019-02-14 19:21:20', '2019-02-14 19:21:20');
INSERT INTO `tb_comment` VALUES ('166394754873962191', '154752432618431', '“你的人生只有你是主角，没关系，一定会很顺利的。” ​​​​', '2019-01-18 19:09:54', '2019-01-18 19:09:54', '2019-01-18 19:09:54');
INSERT INTO `tb_comment` VALUES ('166403130552262600', '154752432618431', '每个人又忙又累，又没有感觉真的得到什么。这种巨大的疲惫感和虚无感总是不间断地出现，凶狠地笼罩着这个世界。', '2019-01-18 19:11:18', '2019-01-18 19:11:18', '2019-01-18 19:11:18');
INSERT INTO `tb_comment` VALUES ('166419454930839932', '154752383719702', '像我这样冷漠不爱社交懒得回消息的人，如果每天都会和你说一大堆的废话，一定是非常喜欢你了', '2019-01-18 19:14:01', '2019-01-18 19:14:01', '2019-01-18 19:14:01');
INSERT INTO `tb_comment` VALUES ('166517153001397562', '154752221029729', '人们的疲劳通常不是由于工作本身，而是由于忧虑、紧张和不快。', '2019-01-18 19:30:18', '2019-01-18 19:30:18', '2019-01-18 19:30:18');
INSERT INTO `tb_comment` VALUES ('166683153169422468', '154752432618431', '这个世界还有很多你未曾体验的美好，所以你千万不要放弃，最好的东西，总是压轴的。', '2019-01-18 19:57:58', '2019-01-18 19:57:58', '2019-01-18 19:57:58');
INSERT INTO `tb_comment` VALUES ('166709212212275075', '154752383719702', '超过一定的年龄之后，所谓人生，无非是一个不断丧失的过程而已。宝贵的东西，便会像梳子豁了齿一样从手中滑落下去。你所爱的人就会一个接着一个，从身旁悄然消逝。\n\n——村上春树 ​​​​', '2019-01-18 20:02:19', '2019-01-18 20:02:19', '2019-01-18 20:02:19');
INSERT INTO `tb_comment` VALUES ('166713903200812246', '154752221029729', '“我在自己周围筑起高墙，没有哪个人能够入内，也尽量不放自己出去。”\n\n——村上春树 ​​​​', '2019-01-18 20:03:06', '2019-01-18 20:03:06', '2019-01-18 20:03:06');
INSERT INTO `tb_comment` VALUES ('166736011955897025', '154752432618431', '我喜欢我的懦弱，痛苦和难堪也喜欢。\n喜欢夏天的光照，风的气息，蝉的鸣叫，\n喜欢这些，喜欢得不得了。\n\n——村上春树 ​​​​', '2019-01-18 20:06:47', '2019-01-18 20:06:47', '2019-01-18 20:06:47');
INSERT INTO `tb_comment` VALUES ('166816131294454597', '154781364597976', '“我们要去变得更好\n不要总是回头 ​” ​​​​', '2019-01-18 20:20:08', '2019-01-18 20:20:08', '2019-01-18 20:20:08');
INSERT INTO `tb_comment` VALUES ('166821549148243374', '154781392231049', '熟悉又温暖的，还是这人间烟火啊 ​​​​', '2019-01-18 20:21:02', '2019-01-18 20:21:02', '2019-01-18 20:21:02');
INSERT INTO `tb_comment` VALUES ('166825620060179330', '154781380741737', '很多人都说你很懂事，但是没人问你快不快乐', '2019-01-18 20:21:43', '2019-01-18 20:21:43', '2019-01-18 20:21:43');
INSERT INTO `tb_comment` VALUES ('166830142462742879', '154781351248543', '这个世界沒有什么好畏懼的，\n反正我们只来一次。 ​​​​', '2019-01-18 20:22:28', '2019-01-18 20:22:28', '2019-01-18 20:22:28');

-- ----------------------------
-- Table structure for tb_found
-- ----------------------------
DROP TABLE IF EXISTS `tb_found`;
CREATE TABLE `tb_found` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '物品分类',
  `found_place` varchar(50) NOT NULL,
  `found_time` datetime NOT NULL,
  `infoTitle` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `images` varchar(255) DEFAULT NULL COMMENT '物品图片',
  `status` int(1) NOT NULL COMMENT '0/未审核，1/审核通过，2/审核未通过',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `QQ` varchar(50) DEFAULT NULL COMMENT '联系QQ',
  `email` varchar(50) NOT NULL COMMENT '联系邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `password` varchar(20) NOT NULL COMMENT '删除、修改密码',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id2` (`category_id`),
  CONSTRAINT `category_id2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_found
-- ----------------------------
INSERT INTO `tb_found` VALUES ('154752221029729', '5', '二餐三楼', '2020-03-02 00:00:00', '小米手机一部', '于3月2日在二餐三楼拾取', 'images/2020/03/31/202003311648221754263.jpg.jpg', '1', '王先生', '123456', '77777', '123456@qq.com', null, '1', '2020-03-02 00:00:00', '2020-03-02 00:00:00');
INSERT INTO `tb_found` VALUES ('154752383719702', '1', '大学路西大侧门', '2020-03-02 00:00:00', '招领钱包', '昨晚在大学路西大侧门酒店停车场拾获钱包1个，内有身份证、社保卡等多样物品。身份证姓名为马青兰。', 'images/2020/03/31/01.jpg', '1', '卢维明', '123456', '77777', '123456@qq.com', '', '2', '2019-01-15 11:43:57', '2019-01-24 22:08:01');
INSERT INTO `tb_found` VALUES ('154781364597976', '4', '二餐一楼取款机', '2020-03-02 00:00:00', '银行卡', '在二餐一楼取款机上捡到银行卡一张，失主请联系我', 'images/2020/03/31/202003311656277341764.jpg.jpg', '1', '王一凡', '123456', '77777', 'bineawu@163.com', '', '3', '2019-01-18 20:14:06', '2019-01-18 20:14:06');
INSERT INTO `tb_found` VALUES ('154859042291358', '4', '书包', '2020-03-02 00:00:00', '书包', '在三餐一楼捡到书包一个，失主看到请联系我', 'images/2020/02/26/87128087011500857.jpg', '1', 'Tae Yeon', '657456', '77777', '3244532@qq.com', null, '6', '2019-01-27 20:00:23', '2019-01-27 20:00:23');
INSERT INTO `tb_found` VALUES ('155135328848635', '1', '二教阶梯202', '2020-02-25 18:36:05', '臂力器', '在一教阶梯202下课得时候忘了带走臂力器', 'images/2020/02/25/19594044326500056.jpg', '1', '张伟', '18340082902', '9808709', '12123@qq.com', '山东淄博淄川区小屯村', '15', '2020-02-25 18:39:01', '2020-02-25 22:22:36');
INSERT INTO `tb_found` VALUES ('158263786112454', '5', '机电楼B401', '2020-02-24 00:00:00', '耳机', '在机电楼发现一枚BEAST耳机，有失主看到请联系我', 'images/2020/02/25/17588561282499424.jpg', '1', '张浩', '18340082902', '12312133123', '1139861012@qq.com', '23号宿舍楼615', '12', '2020-02-25 21:37:41', '2020-02-25 21:49:13');
INSERT INTO `tb_found` VALUES ('158625163598467', '8', '机电楼B401', '2020-04-07 00:00:00', '丢失一只手表DW的', '丢失一只手表DW的', 'images/2020/04/07/202004071727110101543.jpg.jpg', '1', '李晓雪', '1097898792', '123312321', '123@qq.com', 'admin', '158625163598467', '2020-04-07 17:27:16', '2020-04-07 17:27:16');

-- ----------------------------
-- Table structure for tb_log_login
-- ----------------------------
DROP TABLE IF EXISTS `tb_log_login`;
CREATE TABLE `tb_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_log_login
-- ----------------------------
INSERT INTO `tb_log_login` VALUES ('1', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 17:35:50');
INSERT INTO `tb_log_login` VALUES ('2', '徐小胖-xumingjie', '0:0:0:0:0:0:0:1', '2020-02-27 17:38:17');
INSERT INTO `tb_log_login` VALUES ('3', '小猪猪-zhangouba', '0:0:0:0:0:0:0:1', '2020-02-27 17:51:42');
INSERT INTO `tb_log_login` VALUES ('4', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-27 17:53:15');
INSERT INTO `tb_log_login` VALUES ('5', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 17:54:01');
INSERT INTO `tb_log_login` VALUES ('6', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 19:53:28');
INSERT INTO `tb_log_login` VALUES ('7', '小猪猪-zhangouba', '0:0:0:0:0:0:0:1', '2020-02-27 20:20:08');
INSERT INTO `tb_log_login` VALUES ('8', '小猪猪-zhangouba', '0:0:0:0:0:0:0:1', '2020-02-27 20:20:24');
INSERT INTO `tb_log_login` VALUES ('9', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 20:20:34');
INSERT INTO `tb_log_login` VALUES ('10', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 20:25:45');
INSERT INTO `tb_log_login` VALUES ('11', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 20:27:26');
INSERT INTO `tb_log_login` VALUES ('12', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 20:30:27');
INSERT INTO `tb_log_login` VALUES ('13', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 21:13:28');
INSERT INTO `tb_log_login` VALUES ('14', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 21:41:12');
INSERT INTO `tb_log_login` VALUES ('15', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 21:44:04');
INSERT INTO `tb_log_login` VALUES ('16', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 21:47:16');
INSERT INTO `tb_log_login` VALUES ('17', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:15:28');
INSERT INTO `tb_log_login` VALUES ('18', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:22:57');
INSERT INTO `tb_log_login` VALUES ('19', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:26:07');
INSERT INTO `tb_log_login` VALUES ('20', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:30:28');
INSERT INTO `tb_log_login` VALUES ('21', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:37:26');
INSERT INTO `tb_log_login` VALUES ('22', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:39:34');
INSERT INTO `tb_log_login` VALUES ('23', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:41:28');
INSERT INTO `tb_log_login` VALUES ('24', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-27 22:53:46');
INSERT INTO `tb_log_login` VALUES ('25', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 11:23:01');
INSERT INTO `tb_log_login` VALUES ('26', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 11:53:15');
INSERT INTO `tb_log_login` VALUES ('27', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:04:04');
INSERT INTO `tb_log_login` VALUES ('28', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:08:53');
INSERT INTO `tb_log_login` VALUES ('29', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:12:48');
INSERT INTO `tb_log_login` VALUES ('30', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:14:15');
INSERT INTO `tb_log_login` VALUES ('31', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:16:51');
INSERT INTO `tb_log_login` VALUES ('32', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:18:15');
INSERT INTO `tb_log_login` VALUES ('33', '小猪猪-zhuge', '127.0.0.1', '2020-02-28 12:18:21');
INSERT INTO `tb_log_login` VALUES ('34', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:20:12');
INSERT INTO `tb_log_login` VALUES ('35', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:27:21');
INSERT INTO `tb_log_login` VALUES ('36', '小猪猪-zhuge', '0:0:0:0:0:0:0:1', '2020-02-28 12:29:56');
INSERT INTO `tb_log_login` VALUES ('37', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 12:30:48');
INSERT INTO `tb_log_login` VALUES ('38', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 12:32:30');
INSERT INTO `tb_log_login` VALUES ('39', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 12:39:53');
INSERT INTO `tb_log_login` VALUES ('40', '王亚妮-wangyani', '0:0:0:0:0:0:0:1', '2020-02-28 12:45:42');
INSERT INTO `tb_log_login` VALUES ('41', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 12:50:47');
INSERT INTO `tb_log_login` VALUES ('42', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 12:52:55');
INSERT INTO `tb_log_login` VALUES ('43', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 13:23:04');
INSERT INTO `tb_log_login` VALUES ('44', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 13:57:51');
INSERT INTO `tb_log_login` VALUES ('45', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 14:56:40');
INSERT INTO `tb_log_login` VALUES ('46', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 15:26:05');
INSERT INTO `tb_log_login` VALUES ('47', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 15:39:08');
INSERT INTO `tb_log_login` VALUES ('48', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 15:47:35');
INSERT INTO `tb_log_login` VALUES ('49', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 15:51:51');
INSERT INTO `tb_log_login` VALUES ('50', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 16:02:17');
INSERT INTO `tb_log_login` VALUES ('51', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 16:53:43');
INSERT INTO `tb_log_login` VALUES ('52', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 17:03:04');
INSERT INTO `tb_log_login` VALUES ('53', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 17:21:59');
INSERT INTO `tb_log_login` VALUES ('54', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 17:27:31');
INSERT INTO `tb_log_login` VALUES ('55', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 17:31:40');
INSERT INTO `tb_log_login` VALUES ('56', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 17:39:28');
INSERT INTO `tb_log_login` VALUES ('57', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 18:35:02');
INSERT INTO `tb_log_login` VALUES ('58', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:26:43');
INSERT INTO `tb_log_login` VALUES ('59', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:28:11');
INSERT INTO `tb_log_login` VALUES ('60', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:32:07');
INSERT INTO `tb_log_login` VALUES ('61', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:35:28');
INSERT INTO `tb_log_login` VALUES ('62', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:37:44');
INSERT INTO `tb_log_login` VALUES ('63', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:49:05');
INSERT INTO `tb_log_login` VALUES ('64', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 19:56:03');
INSERT INTO `tb_log_login` VALUES ('65', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 20:02:25');
INSERT INTO `tb_log_login` VALUES ('66', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 20:27:49');
INSERT INTO `tb_log_login` VALUES ('67', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 20:54:57');
INSERT INTO `tb_log_login` VALUES ('68', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 21:36:45');
INSERT INTO `tb_log_login` VALUES ('69', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-28 22:21:45');
INSERT INTO `tb_log_login` VALUES ('70', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 11:27:27');
INSERT INTO `tb_log_login` VALUES ('71', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 11:32:15');
INSERT INTO `tb_log_login` VALUES ('72', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 13:25:48');
INSERT INTO `tb_log_login` VALUES ('73', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 13:27:43');
INSERT INTO `tb_log_login` VALUES ('74', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 13:35:05');
INSERT INTO `tb_log_login` VALUES ('75', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 13:54:16');
INSERT INTO `tb_log_login` VALUES ('76', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 14:59:54');
INSERT INTO `tb_log_login` VALUES ('77', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 15:11:22');
INSERT INTO `tb_log_login` VALUES ('78', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 15:19:12');
INSERT INTO `tb_log_login` VALUES ('79', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 15:29:04');
INSERT INTO `tb_log_login` VALUES ('80', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 16:16:27');
INSERT INTO `tb_log_login` VALUES ('81', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 16:21:34');
INSERT INTO `tb_log_login` VALUES ('82', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 16:24:09');
INSERT INTO `tb_log_login` VALUES ('83', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 16:27:47');
INSERT INTO `tb_log_login` VALUES ('84', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 18:17:45');
INSERT INTO `tb_log_login` VALUES ('85', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 18:48:09');
INSERT INTO `tb_log_login` VALUES ('86', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 19:09:53');
INSERT INTO `tb_log_login` VALUES ('87', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 20:36:45');
INSERT INTO `tb_log_login` VALUES ('88', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 20:45:41');
INSERT INTO `tb_log_login` VALUES ('89', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 21:02:07');
INSERT INTO `tb_log_login` VALUES ('90', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 21:15:34');
INSERT INTO `tb_log_login` VALUES ('91', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 22:39:42');
INSERT INTO `tb_log_login` VALUES ('92', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-02-29 22:39:46');
INSERT INTO `tb_log_login` VALUES ('93', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 08:23:19');
INSERT INTO `tb_log_login` VALUES ('94', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 08:28:05');
INSERT INTO `tb_log_login` VALUES ('95', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 08:29:34');
INSERT INTO `tb_log_login` VALUES ('96', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 08:33:12');
INSERT INTO `tb_log_login` VALUES ('97', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 08:34:33');
INSERT INTO `tb_log_login` VALUES ('98', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 08:36:42');
INSERT INTO `tb_log_login` VALUES ('99', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:10:44');
INSERT INTO `tb_log_login` VALUES ('100', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:14:36');
INSERT INTO `tb_log_login` VALUES ('101', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:23:56');
INSERT INTO `tb_log_login` VALUES ('102', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:25:11');
INSERT INTO `tb_log_login` VALUES ('103', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:30:48');
INSERT INTO `tb_log_login` VALUES ('104', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:39:01');
INSERT INTO `tb_log_login` VALUES ('105', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:51:22');
INSERT INTO `tb_log_login` VALUES ('106', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:52:16');
INSERT INTO `tb_log_login` VALUES ('107', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:54:35');
INSERT INTO `tb_log_login` VALUES ('108', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 09:59:11');
INSERT INTO `tb_log_login` VALUES ('109', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:01:36');
INSERT INTO `tb_log_login` VALUES ('110', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:03:31');
INSERT INTO `tb_log_login` VALUES ('111', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:05:28');
INSERT INTO `tb_log_login` VALUES ('112', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:08:14');
INSERT INTO `tb_log_login` VALUES ('113', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:10:28');
INSERT INTO `tb_log_login` VALUES ('114', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:21:41');
INSERT INTO `tb_log_login` VALUES ('115', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:28:10');
INSERT INTO `tb_log_login` VALUES ('116', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:28:51');
INSERT INTO `tb_log_login` VALUES ('117', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 10:45:07');
INSERT INTO `tb_log_login` VALUES ('118', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 11:32:17');
INSERT INTO `tb_log_login` VALUES ('119', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 15:12:59');
INSERT INTO `tb_log_login` VALUES ('120', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 15:32:06');
INSERT INTO `tb_log_login` VALUES ('121', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 15:36:57');
INSERT INTO `tb_log_login` VALUES ('122', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 15:41:04');
INSERT INTO `tb_log_login` VALUES ('123', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 16:11:34');
INSERT INTO `tb_log_login` VALUES ('124', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 16:16:55');
INSERT INTO `tb_log_login` VALUES ('125', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 16:18:45');
INSERT INTO `tb_log_login` VALUES ('126', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 16:53:12');
INSERT INTO `tb_log_login` VALUES ('127', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 16:59:01');
INSERT INTO `tb_log_login` VALUES ('128', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 17:18:14');
INSERT INTO `tb_log_login` VALUES ('129', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 17:20:51');
INSERT INTO `tb_log_login` VALUES ('130', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 17:27:37');
INSERT INTO `tb_log_login` VALUES ('131', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 18:09:05');
INSERT INTO `tb_log_login` VALUES ('132', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 18:12:32');
INSERT INTO `tb_log_login` VALUES ('133', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 18:14:31');
INSERT INTO `tb_log_login` VALUES ('134', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 18:15:32');
INSERT INTO `tb_log_login` VALUES ('135', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 18:34:06');
INSERT INTO `tb_log_login` VALUES ('136', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-01 18:34:54');
INSERT INTO `tb_log_login` VALUES ('137', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-02 15:29:11');
INSERT INTO `tb_log_login` VALUES ('138', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-02 21:56:33');
INSERT INTO `tb_log_login` VALUES ('139', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-24 10:12:53');
INSERT INTO `tb_log_login` VALUES ('140', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-24 10:33:44');
INSERT INTO `tb_log_login` VALUES ('141', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-24 13:32:17');
INSERT INTO `tb_log_login` VALUES ('142', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-24 15:09:18');
INSERT INTO `tb_log_login` VALUES ('143', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-24 15:52:41');
INSERT INTO `tb_log_login` VALUES ('144', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-24 19:19:06');
INSERT INTO `tb_log_login` VALUES ('145', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-31 16:44:59');
INSERT INTO `tb_log_login` VALUES ('146', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-31 17:28:53');
INSERT INTO `tb_log_login` VALUES ('147', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-31 17:51:08');
INSERT INTO `tb_log_login` VALUES ('148', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-31 19:41:38');
INSERT INTO `tb_log_login` VALUES ('149', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-03-31 20:51:13');
INSERT INTO `tb_log_login` VALUES ('150', '张浩-admin', '0:0:0:0:0:0:0:1', '2020-04-07 17:06:37');

-- ----------------------------
-- Table structure for tb_lost
-- ----------------------------
DROP TABLE IF EXISTS `tb_lost`;
CREATE TABLE `tb_lost` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '物品分类ID',
  `lost_place` varchar(50) NOT NULL COMMENT '丢失地点',
  `lost_time` datetime NOT NULL COMMENT '丢失日期',
  `infoTitle` varchar(100) NOT NULL COMMENT '信息标题',
  `rewards` varchar(100) DEFAULT NULL COMMENT '报酬方式',
  `description` text NOT NULL COMMENT '详情描述',
  `images` varchar(255) DEFAULT NULL COMMENT '物品图片',
  `status` int(1) NOT NULL COMMENT '0/未审核，1/审核通过，2/审核未通过',
  `contacts` varchar(255) DEFAULT '' COMMENT '联系人',
  `tel` varchar(50) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL COMMENT 'QQ号码',
  `email` varchar(50) NOT NULL COMMENT '联系邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `password` varchar(20) NOT NULL COMMENT '删除、修改密码',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lost
-- ----------------------------
INSERT INTO `tb_lost` VALUES ('158263288647682', '1', '操场', '2020-02-20 00:00:00', '钱包', '10', '在操场跑完步，发现钱包丢失，有捡到得小伙伴请联系我', 'images/2020/02/25/11806731972100802.jpg', '1', '郑彦', '18340082912', '1133123312312', '11323@qq.com', 'admin', '3', '2020-02-25 20:14:47', '2020-03-23 16:58:33');
INSERT INTO `tb_lost` VALUES ('158270813881538', '6', '在公交楼2楼jt401', '2020-02-22 00:00:00', '丢失书包', '20', '在在公交楼2楼jt401上课，下可忘记带走，有过有捡到得小伙伴请联系我', 'images/2020/02/26/87128087011500857.jpg', '1', '徐明杰', '21332132123', '23112312323', '321123312@qq.com', 'admin', '7', '2020-02-25 17:08:59', '2020-03-23 16:58:33');
INSERT INTO `tb_lost` VALUES ('158564466325335', '5', '机电楼', '2020-03-31 00:00:00', '寻找小米手机', '200', '下课落在教室了，好心人捡到联系我', 'images/2020/03/31/202003311648221754263.jpg.jpg', '1', '小李', '19340089287', '12341321', '312312@qq.com', '23号楼', '1', '2020-03-31 16:51:03', '2020-03-31 16:51:03');
INSERT INTO `tb_lost` VALUES ('158564475836808', '11', '操场', '2020-03-31 00:00:00', '网球拍', '0', '上完体育课忘记带走，捡到的同学联系我', 'images/2020/03/31/202003311652034884756.jpg.jpg', '1', '小孙', '213123321', '231312312', '321321@qq.com', '13号楼', '1', '2020-03-31 16:52:38', '2020-03-31 16:52:38');
INSERT INTO `tb_lost` VALUES ('158564486261606', '11', '操场', '2020-03-31 00:00:00', '丢失篮球', '10', '丢失篮球捡到的同学私聊我', 'images/2020/03/31/202003311653486318905.jpg.jpg', '1', '小张', '123123321', '123321132', '321213@qq.com', 'admin', '1', '2020-03-31 16:54:23', '2020-03-31 16:54:23');
INSERT INTO `tb_lost` VALUES ('158564494489546', '4', '二餐', '2020-03-31 00:00:00', '饭卡', '0', '吃完饭忘记带走，捡到的同学联系我', 'images/2020/03/31/202003311655060248227.jpg.jpg', '1', '小王', '123', '321', '312@qq.com', '9号宿舍楼', '1', '2020-03-31 16:55:45', '2020-03-31 16:55:45');
INSERT INTO `tb_lost` VALUES ('158564502154148', '4', '三餐自动取款机', '2020-03-31 00:00:00', '银行卡', '100', '取完钱忘记带走，捡到的同学联系我', 'images/2020/03/31/202003311656277341764.jpg.jpg', '1', '赵四', '123321123', '231321', '213321@qaq.com', '22好宿舍楼', '1', '2020-03-31 16:57:02', '2020-03-31 16:57:02');
INSERT INTO `tb_lost` VALUES ('158564510615381', '11', '20号楼底', '2020-03-31 00:00:00', '电动车', '500', '电动车放在楼下被偷了，由看到的同学联系我有重谢!', 'images/2020/03/31/202003311657407983307.jpg.jpg', '1', '王文强', '123321321', '321321', '213@qq.com', '20号楼615', '1', '2020-03-31 16:58:26', '2020-03-31 16:58:26');
INSERT INTO `tb_lost` VALUES ('158564523714077', '10', '机电楼', '2020-03-31 00:00:00', '思修书', '0', '下可忘记带走，捡到的同学联系我', 'images/2020/03/31/202003311700298394585.jpg.jpg', '1', '小冯', '1433234324', '231123', '2@qq.com', '8haolou', '1', '2020-03-31 17:00:37', '2020-03-31 17:00:37');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `spread` int(255) DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `available` int(255) DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '0', '校园失物招领网', null, '1', null, '&#xe68e;', '1');
INSERT INTO `tb_menu` VALUES ('2', '1', '审核管理', '', '0', '', '&#xe653;', '1');
INSERT INTO `tb_menu` VALUES ('3', '1', '业务管理', '', '0', '', '&#xe663;', '1');
INSERT INTO `tb_menu` VALUES ('4', '1', '系统管理', '', '0', '', '&#xe716;', '1');
INSERT INTO `tb_menu` VALUES ('5', '1', '统计分析', '', '1', '', '&#xe629;', '1');
INSERT INTO `tb_menu` VALUES ('6', '2', '招领审核', '../check/toFoundCheck.action', '0', '', '&#xe770;', '1');
INSERT INTO `tb_menu` VALUES ('7', '2', '寻物审核', '../check/toLostCheck.action', '0', '', '&#xe657;', '1');
INSERT INTO `tb_menu` VALUES ('8', '3', '招领管理', '../business/toFoundManager.action', '0', '', '&#xe65b;', '1');
INSERT INTO `tb_menu` VALUES ('9', '3', '寻物管理', '../business/toLostManager.action', '0', '', '&#xe6b2;', '1');
INSERT INTO `tb_menu` VALUES ('10', '3', '目录管理', '../business/toCategoryManager.action', '0', '', '&#xe65a;', '1');
INSERT INTO `tb_menu` VALUES ('11', '3', '评论管理', '../business/toRemarkManager.action', '0', '', '&#xe705;', '1');
INSERT INTO `tb_menu` VALUES ('12', '4', '菜单管理', '../sys/toMenuManager.action', '0', null, '&#xe60f;', '1');
INSERT INTO `tb_menu` VALUES ('13', '4', '角色管理', '../sys/toRoleManager.action', '0', '', '&#xe66f;', '1');
INSERT INTO `tb_menu` VALUES ('14', '4', '用户管理', '../sys/toUserManager.action', '0', '', '&#xe770;', '1');
INSERT INTO `tb_menu` VALUES ('15', '4', '日志管理', '../sys/toLogInfoManager.action', '0', '', '&#xe655;', '1');
INSERT INTO `tb_menu` VALUES ('16', '4', '公告管理', '../sys/toNewsManager.action', '0', '', '&#xe645;', '1');
INSERT INTO `tb_menu` VALUES ('17', '4', '数据源监控', '../druid/', '0', '', '&#xe857;', '1');
INSERT INTO `tb_menu` VALUES ('18', '5', '失物类别统计', '../admin/reardataCount.action', '0', '', '&#xe63c;', '1');
INSERT INTO `tb_menu` VALUES ('19', '5', '招领类别统计', '../admin/rearFounddataCount.action', '0', '', '&#xe62c;', '1');
INSERT INTO `tb_menu` VALUES ('21', '1', '我的发布', null, '0', null, '&#xe66f;', '1');
INSERT INTO `tb_menu` VALUES ('22', '21', '发布的招领', '../myself/toMyFound.action', '0', null, '&#xe65b;', '1');
INSERT INTO `tb_menu` VALUES ('23', '21', '发布的寻找', '../myself/toMyLost.action', '0', null, '&#xe6b2;', '1');

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES ('5', '关于系统V1.0发布公告', '<p>关于系统V1.5升级公告关于系统V1.5升级公告关于系统V1.5升级公告关于系统V1.5升级公告关于系统V1.5升级公告			</p>', '2018-06-14 18:05:22', '习大大');
INSERT INTO `tb_news` VALUES ('22', '关于“拾金不昧”的法律条文', '<p><span>《物权法》规定，权利人领取遗失物时，应当向拾得人或者有关部门支付保管遗失物等支出的必要费用。权利人悬赏寻找遗失物的，领取遗失物时应当按照承诺履行义务。</span><br><br><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 拾得人侵占遗失物的，无权请求保管遗失物等支出的费用，也无权请求权利人按照承诺履行义务。</span><br><br><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 遗失物自发布招领公告之日起六个月内无人认领的，归国家所有。</span><br><br><span>　　拾得漂流物、发现埋藏物或者隐藏物的，参照拾得遗失物的有关规定。文物保护法等法律另有规定的，依照其规定。</span><br><br><span>　　拾得人隐匿遗失物据为己有的，构成侵犯所有权。遗失物所有人可以请拾得人偿还，公安机关可以责令拾得人缴出。拾得人丧失报酬和费用请求权。拾得人将数额较大的遗失物占为己有，拒不交出的，构成犯罪，依刑法惩处。</span></p>', '2020-03-01 18:48:23', '张浩');
INSERT INTO `tb_news` VALUES ('23', '失物招领信息登记须知', '<p><span>无论您是拾者还是失主，请务必认真阅读以下须知并慎待之。如一旦同意在本网站上发布相关信息，本站将视您对以下须知为完全理解并自愿接受相关条款的约束。</span><br><br><strong>拾者须知</strong><br><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如您拾获了他人不慎遗失的物品，首先请在本网站“寻物启事”栏内查找有无相关对应信息后再决定是否登记。需要登记的请将拾获物品的详细情况(类别、特征、拾得的时间地点）通过网上登记方式告诉我们，我们将予第一时间在本网站上发布招领信息，但您必须保证所招领物品为合法所得。如一旦因招领物品的来路问题与失主产生法律纠纷，本站不承担任何连带责任，一切后果由您独立承担。 本网站暂不接受对拾获物的托管。当有失主已确认失物时，本站可作为中间桥梁，帮助拾主物归原主。</span><br><br><strong>失主须知</strong><br><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果您不慎遗失了贵重物品，首先请在本网站“招领启事”栏内查找有无相关对应信息后再决定是否登记。需要登记的请将遗失物品的详细情况(类别、特征、遗失时间地点）及您自愿支付的酬金标准通过网上登记方式告诉我们，我们将于第一时间在本网站上免费为您发布寻物启事，但您必须保证所寻物品为本人（或本人所在单位）所有，如因冒领或误领而发生的一切法律后果由您本人独立承担，本网站不承担任何连带责任。&nbsp;</span></p>', '2020-03-01 18:50:34', '张浩');
INSERT INTO `tb_news` VALUES ('24', '身份证丢失有哪些危害?', '<p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\"><span><strong>黑市公然售卖丢失被盗身份证</strong></span></p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　记者调查发现，大量丢失、被盗二代身份证通过网络黑市被公然售卖。记者用QQ搜索“二代证”，轻易找到上百个售卖“二代身份证”的QQ群，一些群的参与成员达数百上千人。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　记者通过QQ联系到销售二代身份证的陈女士，发现其QQ空间展示着203张女性和近千张男性身份证照，350元一张。在另一个“身份证贩子”的QQ空间，展示着118张女性和147张男性身份证照片。老板表示，在售身份证都是真证，300元一张，可通过淘宝交易。老板随后发来淘宝链接，内容为“海参干货批发50克”，单价300元。从交易记录可看到，该网店在半个月之内已经销售40余次，进账上万元。被盗二代身份证能顺利使用吗？天津市民小王无意中捡到一张二代身份证，姓名为朱某某。在记者陪同下，小王开始了身份证的“闯关实验”。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　银行。按照规定，个人在银行开立银行卡时，必须出示本人身份证。小王持朱某某身份证来到天津市南开区的工、农、中、建四大国有银行支行，各银行大堂经理和柜员均未认真核对身份证与本人是否一致，就同意给小王开卡。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　运营商。我国从2013年9月1日开始已实行手机实名制。小王来到天津联通王顶堤营业厅、天津移动王顶堤指定专营店和天津电信复康路营业厅，其中仅天津电信复康路营业厅工作人员以人证不一致为由拒绝了小王开立手机卡的要求，另外两家营业厅的工作人员均痛快答应了。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　铁路。我国从2012年元旦起已对全国所有旅客列车实行车票实名制。小王从12306铁路购票网站冒名订购了一张由天津站驶往北京南站的城际车票，进站时天津站工作人员仅拿身份证刷了一下读取设备即表示“可以进去了”。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　宾馆。按照规定，旅客住宿需实名登记。小王来到北京市的汉庭酒店西单店，前台工作人员以人证不一致为由拒绝了小王的开房要求。小王随后来到附近一家规模较小的旅店，工作人员在读取身份证后立即同意给小王开房。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">天津市公安局东丽分局副分局长李建满说，我国每年电信诈骗数十万起，金额几十上百亿元。巨额诈骗得手后，一般都会迅速将资金分散到成百上千张银行卡中，通过ATM机取现。不仅实施诈骗的银行卡是冒开的，转账、取现银行卡都是冒开的，有时一张被盗身份证被冒开上百张银行卡。冒名开立的银行卡极大增加了破案难度，许多省市电信诈骗破案率甚至不足5％。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　天津市一位基层刑警说，查案发现，许多不法分子以被盗身份证主人的身份“隐身作案”，从事电信诈骗、毒品交易、赌博洗钱、虚开发票等多种不法行为。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　2012年9月，新疆破获一起虚开发票案，犯罪嫌疑人李某冒用17张他人身份证，虚开发票200余份，金额近3000万元，非法获利120万元。2014年12月14日，惠州市警方打掉一个诈骗团伙，犯罪嫌疑人黄某网购他人身份证冒名注册五金公司，案发前已行骗96宗，非法获利30多万元。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　此外，记者发现许多地方曾出现二代身份证被冒用，导致身份证主人无端被抓、无端背债等现象，给当事人带来极大困扰。2013年11月，一名湖南女子因“涉嫌在青海盗窃”被捕，并在被拘留12天后移交青海警方。经核查，该女子实系二代身份证被冒用。尽管随后警方释放该女子并公开道歉，但此事对该女子及其亲人造成的心理伤害难以弥补。</p><p class=\"one-p\" font-size:=\"\" hiragino=\"\" micro=\"\" microsoft=\"\" sans=\"\" segoe=\"\" wenquanyi=\"\">　　多地都曾出现身份证丢失后被冒名开立信用卡，身份证主人被银行催债的案例。2013年9月，一名深圳男子在丢失二代身份证后，莫名其妙成为刘某某的“借款担保人”，被银行要求为已失联的刘某某的未偿还贷款负责。</p>', '2020-03-01 18:55:28', '张浩');
INSERT INTO `tb_news` VALUES ('25', '我们是否保管失物?', '<p><span>不保管,本站只提供失物招领与寻物启事的发布,并匹配信息.</span></p>', '2020-03-01 18:56:10', '张浩');
INSERT INTO `tb_news` VALUES ('26', '联系人信息会得到怎样的保护?', '<h2><strong><a href=\"http://www.swzl.com/article_88.html\">联系人信息会得到怎样的保护?</a></strong></h2><div>&nbsp;他人只能通过手机短信来接收发布者的联系方式</div><div>&nbsp;</div><div>&nbsp;我们在发送时会提醒接收者冒领他人财物是违法行为,</div><div>&nbsp;</div><div>&nbsp;并告知我们会记录他的手机号,电脑IP地址,接收时间等信息,并在必要时向警方提供</div><div>&nbsp;</div><div>&nbsp;一个手机号在24小时之内只能查看一条联系人信息;</div><div>&nbsp;</div><div>&nbsp;被他人举报为冒领者的手机号码将无法接收任何联系人信息</div>', '2020-03-01 18:57:22', '张浩');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `roleid` int(100) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) NOT NULL,
  `roledesc` varchar(255) NOT NULL,
  `available` int(100) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('0', '普通用户', '查看信息', '1');
INSERT INTO `tb_role` VALUES ('1', '管理员', '日常管理用户数据和请求', '1');
INSERT INTO `tb_role` VALUES ('2', '超级管理者', '除了赋予超级管理员权限剩下的一切权限', '1');
INSERT INTO `tb_role` VALUES ('3', 'OA', '拥有最高权限(包括赋予超级管理员权限)', '1');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('0', '1');
INSERT INTO `tb_role_menu` VALUES ('0', '21');
INSERT INTO `tb_role_menu` VALUES ('0', '22');
INSERT INTO `tb_role_menu` VALUES ('0', '23');
INSERT INTO `tb_role_menu` VALUES ('1', '1');
INSERT INTO `tb_role_menu` VALUES ('1', '2');
INSERT INTO `tb_role_menu` VALUES ('1', '3');
INSERT INTO `tb_role_menu` VALUES ('1', '4');
INSERT INTO `tb_role_menu` VALUES ('1', '5');
INSERT INTO `tb_role_menu` VALUES ('1', '6');
INSERT INTO `tb_role_menu` VALUES ('1', '7');
INSERT INTO `tb_role_menu` VALUES ('1', '8');
INSERT INTO `tb_role_menu` VALUES ('1', '9');
INSERT INTO `tb_role_menu` VALUES ('1', '11');
INSERT INTO `tb_role_menu` VALUES ('1', '16');
INSERT INTO `tb_role_menu` VALUES ('1', '18');
INSERT INTO `tb_role_menu` VALUES ('1', '19');
INSERT INTO `tb_role_menu` VALUES ('1', '20');
INSERT INTO `tb_role_menu` VALUES ('1', '21');
INSERT INTO `tb_role_menu` VALUES ('1', '22');
INSERT INTO `tb_role_menu` VALUES ('1', '23');
INSERT INTO `tb_role_menu` VALUES ('2', '1');
INSERT INTO `tb_role_menu` VALUES ('2', '2');
INSERT INTO `tb_role_menu` VALUES ('2', '3');
INSERT INTO `tb_role_menu` VALUES ('2', '4');
INSERT INTO `tb_role_menu` VALUES ('2', '5');
INSERT INTO `tb_role_menu` VALUES ('2', '6');
INSERT INTO `tb_role_menu` VALUES ('2', '7');
INSERT INTO `tb_role_menu` VALUES ('2', '8');
INSERT INTO `tb_role_menu` VALUES ('2', '9');
INSERT INTO `tb_role_menu` VALUES ('2', '10');
INSERT INTO `tb_role_menu` VALUES ('2', '11');
INSERT INTO `tb_role_menu` VALUES ('2', '14');
INSERT INTO `tb_role_menu` VALUES ('2', '15');
INSERT INTO `tb_role_menu` VALUES ('2', '16');
INSERT INTO `tb_role_menu` VALUES ('2', '17');
INSERT INTO `tb_role_menu` VALUES ('2', '18');
INSERT INTO `tb_role_menu` VALUES ('2', '19');
INSERT INTO `tb_role_menu` VALUES ('2', '20');
INSERT INTO `tb_role_menu` VALUES ('2', '21');
INSERT INTO `tb_role_menu` VALUES ('2', '22');
INSERT INTO `tb_role_menu` VALUES ('2', '23');
INSERT INTO `tb_role_menu` VALUES ('3', '1');
INSERT INTO `tb_role_menu` VALUES ('3', '2');
INSERT INTO `tb_role_menu` VALUES ('3', '3');
INSERT INTO `tb_role_menu` VALUES ('3', '4');
INSERT INTO `tb_role_menu` VALUES ('3', '5');
INSERT INTO `tb_role_menu` VALUES ('3', '6');
INSERT INTO `tb_role_menu` VALUES ('3', '7');
INSERT INTO `tb_role_menu` VALUES ('3', '8');
INSERT INTO `tb_role_menu` VALUES ('3', '9');
INSERT INTO `tb_role_menu` VALUES ('3', '10');
INSERT INTO `tb_role_menu` VALUES ('3', '11');
INSERT INTO `tb_role_menu` VALUES ('3', '12');
INSERT INTO `tb_role_menu` VALUES ('3', '13');
INSERT INTO `tb_role_menu` VALUES ('3', '14');
INSERT INTO `tb_role_menu` VALUES ('3', '15');
INSERT INTO `tb_role_menu` VALUES ('3', '16');
INSERT INTO `tb_role_menu` VALUES ('3', '17');
INSERT INTO `tb_role_menu` VALUES ('3', '18');
INSERT INTO `tb_role_menu` VALUES ('3', '19');
INSERT INTO `tb_role_menu` VALUES ('3', '20');
INSERT INTO `tb_role_menu` VALUES ('3', '21');
INSERT INTO `tb_role_menu` VALUES ('3', '22');
INSERT INTO `tb_role_menu` VALUES ('3', '23');

-- ----------------------------
-- Table structure for tb_role_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_users`;
CREATE TABLE `tb_role_users` (
  `rid` int(255) NOT NULL,
  `uid` int(255) NOT NULL,
  PRIMARY KEY (`rid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_users
-- ----------------------------
INSERT INTO `tb_role_users` VALUES ('0', '4');
INSERT INTO `tb_role_users` VALUES ('0', '6');
INSERT INTO `tb_role_users` VALUES ('0', '7');
INSERT INTO `tb_role_users` VALUES ('0', '8');
INSERT INTO `tb_role_users` VALUES ('0', '9');
INSERT INTO `tb_role_users` VALUES ('0', '10');
INSERT INTO `tb_role_users` VALUES ('0', '11');
INSERT INTO `tb_role_users` VALUES ('0', '12');
INSERT INTO `tb_role_users` VALUES ('0', '13');
INSERT INTO `tb_role_users` VALUES ('0', '14');
INSERT INTO `tb_role_users` VALUES ('0', '15');
INSERT INTO `tb_role_users` VALUES ('2', '2');
INSERT INTO `tb_role_users` VALUES ('2', '3');
INSERT INTO `tb_role_users` VALUES ('3', '1');

-- ----------------------------
-- Table structure for tb_soulmate
-- ----------------------------
DROP TABLE IF EXISTS `tb_soulmate`;
CREATE TABLE `tb_soulmate` (
  `id` bigint(11) NOT NULL,
  `infoTitle` varchar(50) NOT NULL COMMENT '信息标题',
  `meet_time` datetime NOT NULL COMMENT '相遇时间',
  `meet_place` varchar(100) NOT NULL COMMENT '相遇地点',
  `description` text NOT NULL COMMENT '详细描述',
  `photo` varchar(255) DEFAULT NULL COMMENT '照片',
  `contactWay` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `email` varchar(50) NOT NULL COMMENT '联系邮箱',
  `password` varchar(20) NOT NULL COMMENT '管理密码',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_soulmate
-- ----------------------------

-- ----------------------------
-- Table structure for tb_textinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_textinfo`;
CREATE TABLE `tb_textinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '物品ID',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `page_view` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT '状态：0/寻找中，1/已失效',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_textinfo
-- ----------------------------
INSERT INTO `tb_textinfo` VALUES ('1', '154752159872591', '2019-01-15 11:06:39', '59', '0', '2019-01-15 11:06:39', '2020-02-25 21:32:42');
INSERT INTO `tb_textinfo` VALUES ('2', '154752221029729', '2019-01-15 11:16:50', '26', '0', '2019-01-15 11:16:50', '2020-04-07 17:24:53');
INSERT INTO `tb_textinfo` VALUES ('4', '154752383719702', '2019-01-15 11:43:57', '29', '0', '2019-01-15 11:43:57', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('5', '154752432618431', '2019-01-15 11:52:06', '81', '0', '2019-01-15 11:52:06', '2019-02-14 19:26:33');
INSERT INTO `tb_textinfo` VALUES ('6', '154781351248543', '2019-01-18 20:11:52', '33', '0', '2019-01-18 20:11:52', '2020-02-27 14:46:13');
INSERT INTO `tb_textinfo` VALUES ('7', '154781364597976', '2019-01-18 20:14:06', '14', '0', '2019-01-18 20:14:06', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('8', '154781380741737', '2019-01-18 20:16:47', '90', '0', '2019-01-18 20:16:47', '2019-02-26 17:38:08');
INSERT INTO `tb_textinfo` VALUES ('9', '154781392231049', '2019-01-18 20:18:42', '88', '0', '2019-01-18 20:18:42', '2020-02-25 21:23:41');
INSERT INTO `tb_textinfo` VALUES ('18', '154858964259491', '2019-01-27 19:47:23', '0', '0', '2019-01-27 19:47:23', '2019-01-27 19:47:23');
INSERT INTO `tb_textinfo` VALUES ('19', '154858977146124', '2019-01-27 19:49:31', '13', '0', '2019-01-27 19:49:31', '2019-02-26 20:17:24');
INSERT INTO `tb_textinfo` VALUES ('20', '154858988208910', '2019-01-27 19:51:22', '3', '0', '2019-01-27 19:51:22', '2019-02-02 22:18:38');
INSERT INTO `tb_textinfo` VALUES ('21', '154858999172743', '2019-01-27 19:53:12', '1', '0', '2019-01-27 19:53:12', '2019-01-28 11:31:06');
INSERT INTO `tb_textinfo` VALUES ('22', '154859009886768', '2019-01-27 19:54:59', '5', '0', '2019-01-27 19:54:59', '2019-02-27 16:00:57');
INSERT INTO `tb_textinfo` VALUES ('23', '154859029628249', '2019-01-27 19:58:16', '2', '0', '2019-01-27 19:58:16', '2019-01-27 20:16:50');
INSERT INTO `tb_textinfo` VALUES ('24', '154859042291358', '2019-01-27 20:00:23', '1', '0', '2019-01-27 20:00:23', '2019-01-27 20:17:50');
INSERT INTO `tb_textinfo` VALUES ('25', '154859054097473', '2019-01-27 20:02:21', '5', '0', '2019-01-27 20:02:21', '2019-02-14 18:57:58');
INSERT INTO `tb_textinfo` VALUES ('26', '154859063562834', '2019-01-27 20:03:56', '5', '0', '2019-01-27 20:03:56', '2020-03-24 10:41:44');
INSERT INTO `tb_textinfo` VALUES ('27', '154859074815160', '2019-01-27 20:05:48', '0', '0', '2019-01-27 20:05:48', '2019-01-27 20:05:48');
INSERT INTO `tb_textinfo` VALUES ('28', '154859087790528', '2019-01-27 20:07:58', '1', '0', '2019-01-27 20:07:58', '2019-01-27 20:15:11');
INSERT INTO `tb_textinfo` VALUES ('29', '154859098696882', '2019-01-27 20:09:47', '10', '0', '2019-01-27 20:09:47', '2020-03-24 10:39:24');
INSERT INTO `tb_textinfo` VALUES ('34', '155014196786079', '2019-02-14 18:59:28', '5', '1', '2019-02-14 18:59:28', '2019-02-14 22:00:15');
INSERT INTO `tb_textinfo` VALUES ('35', '155014204225454', '2019-02-14 19:00:42', '0', '1', '2019-02-14 19:00:42', '2019-02-14 19:00:42');
INSERT INTO `tb_textinfo` VALUES ('36', '155014251353177', '2019-02-14 19:08:34', '2', '0', '2019-02-14 19:08:34', '2019-02-14 21:57:37');
INSERT INTO `tb_textinfo` VALUES ('37', '155014258308778', '2019-02-14 19:09:43', '5', '1', '2019-02-14 19:09:43', '2019-02-14 21:57:12');
INSERT INTO `tb_textinfo` VALUES ('38', '155014291853561', '2019-02-14 19:15:19', '4', '1', '2019-02-14 19:15:19', '2019-02-14 21:57:05');
INSERT INTO `tb_textinfo` VALUES ('39', '155015241205863', '2019-02-14 21:53:32', '5', '0', '2019-02-14 21:53:32', '2020-03-24 11:03:41');
INSERT INTO `tb_textinfo` VALUES ('40', '155117471786043', '2019-02-26 17:51:58', '7', '0', '2019-02-26 17:51:58', '2020-03-24 11:04:04');
INSERT INTO `tb_textinfo` VALUES ('41', '155117488493455', '2019-02-26 17:54:45', '12', '0', '2019-02-26 17:54:45', '2020-03-24 11:09:42');
INSERT INTO `tb_textinfo` VALUES ('42', '155125414704809', '2019-02-27 15:55:47', '1', '0', '2019-02-27 15:55:47', '2019-02-28 10:35:43');
INSERT INTO `tb_textinfo` VALUES ('44', '155132223957266', '2019-02-28 10:50:40', '0', '0', '2019-02-28 10:50:40', '2019-02-28 10:50:40');
INSERT INTO `tb_textinfo` VALUES ('45', '155132231837260', '2019-02-28 10:51:58', '0', '0', '2019-02-28 10:51:58', '2019-02-28 10:51:58');
INSERT INTO `tb_textinfo` VALUES ('46', '155135290568968', '2019-02-28 19:21:46', '0', '0', '2019-02-28 19:21:46', '2019-02-28 19:21:46');
INSERT INTO `tb_textinfo` VALUES ('47', '155135325402358', '2019-02-28 19:27:34', '11', '0', '2019-02-28 19:27:34', '2020-02-29 16:47:01');
INSERT INTO `tb_textinfo` VALUES ('48', '155135328848634', '2019-02-28 19:28:08', '7', '0', '2019-02-28 19:28:08', '2020-02-25 21:30:07');
INSERT INTO `tb_textinfo` VALUES ('49', '158263288647682', '2020-02-25 20:14:46', '7', '0', '2020-02-25 20:14:46', '2020-03-24 13:32:20');
INSERT INTO `tb_textinfo` VALUES ('50', '158263786112454', '2020-02-25 21:37:41', '16', '0', '2020-02-25 21:37:41', '2020-03-24 11:01:10');
INSERT INTO `tb_textinfo` VALUES ('52', '155135328848635', '2020-02-25 21:42:25', '18', '0', '2020-02-24 21:43:38', '2020-02-28 15:43:44');
INSERT INTO `tb_textinfo` VALUES ('53', '158270813881538', '2020-02-26 17:08:59', '5', '0', '2020-02-26 17:08:59', '2020-03-24 13:34:39');
INSERT INTO `tb_textinfo` VALUES ('54', '158296671339656', '2020-02-29 16:58:33', '0', '0', '2020-02-29 16:58:33', '2020-02-29 16:58:33');
INSERT INTO `tb_textinfo` VALUES ('55', '158297160261050', '2020-02-29 18:20:03', '0', '0', '2020-02-29 18:20:03', '2020-02-29 18:20:03');
INSERT INTO `tb_textinfo` VALUES ('56', '158297195788273', '2020-02-29 18:25:58', '0', '0', '2020-02-29 18:25:58', '2020-02-29 18:25:58');
INSERT INTO `tb_textinfo` VALUES ('57', '158297353990510', '2020-02-29 18:52:20', '0', '0', '2020-02-29 18:52:20', '2020-02-29 18:52:20');
INSERT INTO `tb_textinfo` VALUES ('58', '158297464884431', '2020-02-29 19:10:49', '0', '0', '2020-02-29 19:10:49', '2020-02-29 19:10:49');
INSERT INTO `tb_textinfo` VALUES ('59', '158297500292655', '2020-02-29 19:16:43', '0', '0', '2020-02-29 19:16:43', '2020-02-29 19:16:43');
INSERT INTO `tb_textinfo` VALUES ('60', '158297566004569', '2020-02-29 19:27:40', '4', '0', '2020-02-29 19:27:40', '2020-02-29 19:37:26');
INSERT INTO `tb_textinfo` VALUES ('61', '158297614311256', '2020-02-29 19:35:43', '14', '0', '2020-02-29 19:35:43', '2020-03-24 11:00:52');
INSERT INTO `tb_textinfo` VALUES ('62', '158297652497473', '2020-02-29 19:42:05', '14', '0', '2020-02-29 19:42:05', '2020-03-24 11:09:19');
INSERT INTO `tb_textinfo` VALUES ('63', '158298069662788', '2020-02-29 20:51:37', '0', '0', '2020-02-29 20:51:37', '2020-02-29 20:51:37');
INSERT INTO `tb_textinfo` VALUES ('64', '158298104339141', '2020-02-29 20:57:23', '0', '0', '2020-02-29 20:57:23', '2020-02-29 20:57:23');
INSERT INTO `tb_textinfo` VALUES ('65', '158298287526616', '2020-02-29 21:27:55', '0', '0', '2020-02-29 21:27:55', '2020-02-29 21:27:55');
INSERT INTO `tb_textinfo` VALUES ('66', '158298288277498', '2020-02-29 21:28:03', '0', '0', '2020-02-29 21:28:03', '2020-02-29 21:28:03');
INSERT INTO `tb_textinfo` VALUES ('67', '158298305010178', '2020-02-29 21:30:50', '0', '0', '2020-02-29 21:30:50', '2020-02-29 21:30:50');
INSERT INTO `tb_textinfo` VALUES ('68', '158564466325335', '2020-03-31 16:51:03', '2', '0', '2020-03-31 16:51:03', '2020-04-07 17:24:47');
INSERT INTO `tb_textinfo` VALUES ('69', '158564475836808', '2020-03-31 16:52:38', '0', '0', '2020-03-31 16:52:38', '2020-03-31 16:52:38');
INSERT INTO `tb_textinfo` VALUES ('70', '158564486261606', '2020-03-31 16:54:23', '0', '0', '2020-03-31 16:54:23', '2020-03-31 16:54:23');
INSERT INTO `tb_textinfo` VALUES ('71', '158564494489546', '2020-03-31 16:55:45', '0', '0', '2020-03-31 16:55:45', '2020-03-31 16:55:45');
INSERT INTO `tb_textinfo` VALUES ('72', '158564502154148', '2020-03-31 16:57:02', '0', '0', '2020-03-31 16:57:02', '2020-03-31 16:57:02');
INSERT INTO `tb_textinfo` VALUES ('73', '158564510615381', '2020-03-31 16:58:26', '0', '0', '2020-03-31 16:58:26', '2020-03-31 16:58:26');
INSERT INTO `tb_textinfo` VALUES ('74', '158564523714077', '2020-03-31 17:00:37', '0', '0', '2020-03-31 17:00:37', '2020-03-31 17:00:37');
INSERT INTO `tb_textinfo` VALUES ('75', '158625163598467', '2020-04-07 17:27:16', '1', '0', '2020-04-07 17:27:16', '2020-04-07 17:27:39');

-- ----------------------------
-- Table structure for tb_thanks
-- ----------------------------
DROP TABLE IF EXISTS `tb_thanks`;
CREATE TABLE `tb_thanks` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '感谢信标题',
  `thanks_text` text NOT NULL COMMENT '感谢信正文',
  `images` varchar(255) DEFAULT NULL COMMENT '图片',
  `letter_view` int(11) NOT NULL COMMENT '浏览次数',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_thanks
-- ----------------------------

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `realname` varchar(255) NOT NULL,
  `type` int(10) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` int(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `available` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1', 'admin', '111111', '19854194579', 'zhanghao2902@163.com', '2018-12-13 21:36:10', '2020-02-24 20:10:36', '张浩', '3', '山东莱州', '1', 'images/2020/03/31/202003311645464267779.jpg', '1');
INSERT INTO `tb_users` VALUES ('2', 'user', '222222', '654321', '1120857854@qq.com', '2018-12-13 21:36:47', '2018-12-13 21:36:52', '张伟', '2', '山东临沂', '1', 'images/timg.jpg', '1');
INSERT INTO `tb_users` VALUES ('3', 'zhuge', 'xiaozhuge', '19854194579', 'zhanghao2902@163.com', '2020-02-27 11:37:31', '2020-02-27 11:37:31', '小猪猪', '2', null, null, 'images/timg.jpg', '1');
INSERT INTO `tb_users` VALUES ('4', 'zhangouba', 'xiaozhuge', '19854194579', 'zhanghao2902@163.com', '2020-02-27 11:39:27', '2020-02-27 11:39:27', '小猪猪', '0', null, null, 'images/timg.jpg', '1');
INSERT INTO `tb_users` VALUES ('6', 'jupengfei', '123456', '18340082912', 'zhanghao2902@163.com', '2020-02-28 12:41:20', '2020-02-28 12:41:20', '鞠鹏飞', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('7', 'wangguixiang', '123456', '19854194579', 'wangguixiang@163.com', '2020-02-28 12:42:27', '2020-02-28 12:42:27', '王桂祥', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('8', 'quguodong', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:42:48', '2020-02-28 12:42:48', '曲国栋', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('9', 'meishuo', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:43:07', '2020-02-28 12:43:07', '梅硕', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('10', 'sunyue', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:43:32', '2020-02-28 12:43:32', '孙越', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('11', 'duyupeng', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:43:53', '2020-02-28 12:43:53', '杜玉鹏', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('12', 'lizifu', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:44:10', '2020-02-28 12:44:10', '李自富', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('13', 'jiangrenning', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:44:22', '2020-02-28 12:44:22', '姜仁宁', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('14', 'yinzhuanglei', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:44:36', '2020-02-28 12:44:36', '尹桩磊', '0', null, null, 'images/timg.jpg', null);
INSERT INTO `tb_users` VALUES ('15', 'wangyani', '123456', '19854194579', 'zhanghao2902@163.com', '2020-02-28 12:44:52', '2020-02-28 12:44:52', '王亚妮', '0', null, null, 'images/timg.jpg', null);

-- ----------------------------
-- Event structure for change_text_status
-- ----------------------------
DROP EVENT IF EXISTS `change_text_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `change_text_status` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_textinfo SET status=1,updated=SYSDATE() WHERE publish_time NOT BETWEEN DATE_SUB(CURDATE(),INTERVAL 6 MONTH) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_comment_halfYear
-- ----------------------------
DROP EVENT IF EXISTS `delete_comment_halfYear`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_comment_halfYear` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_comment WHERE comment_time NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_found_sixMonth
-- ----------------------------
DROP EVENT IF EXISTS `delete_found_sixMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_found_sixMonth` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_found WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_lost_sixMonth
-- ----------------------------
DROP EVENT IF EXISTS `delete_lost_sixMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_lost_sixMonth` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_lost WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_text_halfYear
-- ----------------------------
DROP EVENT IF EXISTS `delete_text_halfYear`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_text_halfYear` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_textinfo WHERE publish_time NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for update_found_threeMonth
-- ----------------------------
DROP EVENT IF EXISTS `update_found_threeMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_found_threeMonth` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_found SET contacts="已保密",tel="已保密",QQ="已保密",email="已保密",address="已保密" 
WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 6 MONTH) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for update_lost_threeMonth
-- ----------------------------
DROP EVENT IF EXISTS `update_lost_threeMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_lost_threeMonth` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_lost SET contacts="已保密",tel="已保密",QQ="已保密",email="已保密",address="已保密"
WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 6 MONTH) AND SYSDATE()
;;
DELIMITER ;
