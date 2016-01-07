/*
Navicat MySQL Data Transfer

Source Server         : local-root
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : mvlibrary

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-05-09 17:03:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `AdminName` varchar(60) DEFAULT NULL COMMENT '管理员昵称',
  `Password` varchar(60) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');
INSERT INTO `admin` VALUES ('2', 'peison', '123456');
INSERT INTO `admin` VALUES ('3', 'lindsey', '123456');
INSERT INTO `admin` VALUES ('4', 'admin', '123456');
INSERT INTO `admin` VALUES ('5', 'peison1', 'sen');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `MovieID` int(11) NOT NULL COMMENT '该评论对应的电影',
  `UserID` int(11) DEFAULT NULL,
  `Content` text NOT NULL,
  `IssueDate` datetime DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `MovieID` (`MovieID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('21', '8', '9', '黑寡妇，好美的胸', '2014-11-05 00:00:00');
INSERT INTO `comment` VALUES ('22', '2', '9', '问：我们是不是好朋友？\r<br>答：是啊！\r<br>问：5加3等于多少啊？\r<br>答：53啊！\r<br>好有爱的带电影', '2014-11-05 00:00:00');
INSERT INTO `comment` VALUES ('23', '12', '0', '在无人之地，人性是存还是灭？', '2014-11-05 00:00:00');
INSERT INTO `comment` VALUES ('24', '7', '0', '绣春刀，一把叫春的刀！', '2014-11-05 00:00:00');
INSERT INTO `comment` VALUES ('25', '2', '11', '这是一次心灵的洗礼，没人生本向恶，只是无情的手把人推向了无尽的深渊。\r<br>Morhange每一次天使般的独唱，总让我感动的浑身直起鸡皮疙瘩，特别是那纸飞机从窗口飞出，“感谢、再见”的小手一挥，那份感动，不言而喻。\r<br>而最重要的，看这部电影不仅是好“看”，天籁的童声更是听觉的享受。★★★★☆', '2014-11-05 00:00:00');
INSERT INTO `comment` VALUES ('26', '2', '11', '我是：评论按时间排序测试数据', '2014-11-05 00:00:00');
INSERT INTO `comment` VALUES ('27', '2', '11', '我是：评论按时间排序测试数据2', '2014-11-05 12:11:36');
INSERT INTO `comment` VALUES ('28', '15', '0', '在豆瓣竟然找不到靠谱的影评，足见这片乃三流之外。', '2014-11-05 12:39:18');
INSERT INTO `comment` VALUES ('29', '8', '0', '一部不错的电影，从头到未都是主要剧情，虽然没有绚丽的画面和特效，\r<br>但仅仅用谈论这个话题就引人入胜，极力推荐。\r<br>IMDB上8.3的评分，走过路过不要错过。', '2014-11-09 13:12:37');
INSERT INTO `comment` VALUES ('30', '8', '9', '一部不错的电影，从头到未都是主要剧情，虽然没有绚丽的画面和特效，\r<br>但仅仅用谈论这个话题就引人入胜，极力推荐。\r<br>IMDB上8.3的评分，走过路过不要错过。', '2014-11-09 13:13:17');
INSERT INTO `comment` VALUES ('31', '15', '0', '好不开心，烂片一部', '2014-11-13 01:43:57');
INSERT INTO `comment` VALUES ('32', '2', '12', '好喜欢这部电影', '2014-12-02 14:47:57');
INSERT INTO `comment` VALUES ('33', '1', '9', '高并发，多线程恋爱', '2014-12-02 14:49:00');
INSERT INTO `comment` VALUES ('34', '16', '0', '我是诺兰的脑残粉！\r<br>我是诺兰的脑残粉！\r<br>我是诺兰的脑残粉！\r<br>我是诺兰的脑残粉！\r<br>我是诺兰的脑残粉！\r<br>我是诺兰的脑残粉！', '2014-12-07 05:28:23');
INSERT INTO `comment` VALUES ('35', '16', '0', '        Interstellar\r<br>        星际穿越\r<br>        实际上应该是“被忽略的Tom”。影片里，当Casey Affleck扮演的Tom出现的时候，简直是令人无法控制地落泪。比起别的角色，Tom的大半生几乎在几分钟内就被讲清楚了：除了孤独地成长，没有选择地做一名农夫以外，连娶妻生子、丧子这些事情都轻描淡写地带过。回到小时候，他的一生几乎就被注定，可能的经历已经被写好。他不仅仅是家庭里最被忽视的成员，也是在整个大环境里最平凡大众的代表。在同样失去了父亲之后，他也失去了妹妹：他们无法交流，无法沟通。Tom没有办法理解Murph的所作所为和她的真正目标。当看到第二个儿子也出现病症的时候，当看到唯一可以寄托的玉米地火光冲天的时候，我觉得可以深刻地感受到这个人物，以及像他这样的人物的绝望。\r<br>\r<br>所以，在Professor Brand们为着人类危在旦夕的未来制订着大计划的时候，是根本没办法考虑像Tom们这样的人的感受的。那些开拓太空的先锋们，都有着独特的勇敢与牺牲的精神，他们的想法和所做的决定都有着自己的理由。但却始终无法覆盖到他们所为其牺牲一起的“全人类”。这一点是很有意思的。我完全不怀疑人类能够在各种理论上技术上发生突破，最终冲向宇宙。但我也有足够的理由相信，人类所无法战胜的种种情感才是这条路上的最大障碍。看看Cooper和Mann在另一个星球上，用一种特别原始的方式扭打起来的时候，我觉得这才是人类的过去、现在和未来啊。\r<br>\r<br>整个故事里，“星际穿越”的概念，距离上很好理解也很常见，时间上稍微复杂一些，但也不算是充满晦涩的细节。前半段一直在暗示仿佛是有某种更高级的力量在控制和安排一切，我当时觉得即便是有更高级的生命体在操纵这一切也多少会有种神棍的感觉。最后答案出现，是人类自己在拯救自己。这才意识到，Nolan其实又重复了自己的方式：无论用上了什么天花乱坠的形式，内核的主题还都是那些最根本的问题：爱或者信任。“信任”这个词看上去很容易，细想起来非常困难，它是没有理由的，信任一个人要付出什么样的代价。\r<br>\r<br>\r<br>这一部电影我在前期有可能是刻意没有去过多关注。一方面是想收到一种观影时眼前一亮的效果；另一方面还是因为对科幻对太空没有特别大的兴趣。太空令我恐惧，觉得危险多过希望。所以很棒的一点是，这里的太空场景处理都采用了非常宁静的方式，配乐的处理是按照2001式的手法来展示的。这一点非常了不起，因为在部分情节的配乐里，声效带来的压抑和震动已经到了一种生理上的压迫感受了。而这样的安排也能够为“未来的答案在天外”增进气氛和说服力。\r<br>\r<br>\r<br>\r<br>\r<br>\r<br>\r<br>\r<br>\r<br>现在似乎是一个很特别的时代，发声与表达自己的意见似乎变得前所未有地方便，使得“要让更多的人知道自己的想法”似乎也成为一件重要的事。而真正实在重要的事，反而不太有人愿意做了。我不想说这样那样是好还是不好，只是感觉有点吵。并且我知道很多时候在不知方向的时候，只需要回望过去，电影里描述的未来有一种很浓厚的陈旧质感。虽然是末世，却同样来得亲切。到头来想得最多的还是“人”这个无解的难题。觉得难过，觉得感慨，为了Tom们被注定的艰难一生，为了总有Cooper和Brand们这样的先驱，而自己却仍然庸碌每天为了琐事烦恼。很多时候觉得难以坚持自己的意见，大概还是不够自信，并且太过在意别人的看法。\r<br>\r<br>我希望电影的感受是私人的，也希望在逐年的积累中得到影响，看到兴趣爱好对自己产生的作用。这一次在有点特殊的条件下的经历，到字幕放完灯光最终亮起，我的一个念头是无论如何我还不能死啊，我还有很多事情要做。\r<br>\r<br>20141112\r<br>', '2014-12-07 05:31:10');
INSERT INTO `comment` VALUES ('36', '8', '0', 'test', '2014-12-11 11:43:49');
INSERT INTO `comment` VALUES ('37', '2', '0', '吧啦来吧来吧', '2015-02-19 13:26:24');
INSERT INTO `comment` VALUES ('38', '7', '0', '到底', '2015-03-12 13:20:38');
INSERT INTO `comment` VALUES ('39', '14', '9', '短评', '2015-03-14 13:22:45');
INSERT INTO `comment` VALUES ('40', '1', '9', 'hello,OSI', '2015-03-14 14:30:34');
INSERT INTO `comment` VALUES ('41', '1', '9', 'l love this moive so much', '2015-03-14 14:36:05');
INSERT INTO `comment` VALUES ('42', '1', '9', 'here is the test to test my website\r<br>', '2015-03-14 14:36:38');
INSERT INTO `comment` VALUES ('43', '15', '0', '女主长的还是不错的', '2015-03-15 02:14:44');
INSERT INTO `comment` VALUES ('44', '11', '9', '国内山寨最高水平，黄勃徐峥当年还没混出名堂来，哈哈', '2015-03-15 05:59:48');
INSERT INTO `comment` VALUES ('45', '14', '9', '没看过，据说是美队演的片子', '2015-03-16 15:08:13');
INSERT INTO `comment` VALUES ('46', '9', '5', '第一次看，惊为天人。万万没想到，当时间变成金钱，世界是如此的残酷', '2015-04-06 04:55:07');
INSERT INTO `comment` VALUES ('47', '2', '5', '暖暖的电影，看完心情都好起来了', '2015-04-06 05:12:37');
INSERT INTO `comment` VALUES ('48', '1', '5', '这是写论文前来测试功能的～\r<br>', '2015-04-11 15:50:28');
INSERT INTO `comment` VALUES ('49', '1', '5', '我真的觉得这个挺不错的啊', '2015-04-11 15:50:50');
INSERT INTO `comment` VALUES ('50', '18', '0', '我是我老公，我是我老婆，我是我爸，我是我妈，我是我', '2015-04-12 06:05:04');

-- ----------------------------
-- Table structure for evelate
-- ----------------------------
DROP TABLE IF EXISTS `evelate`;
CREATE TABLE `evelate` (
  `UserID` int(11) NOT NULL COMMENT '用户ID',
  `PassageID` int(11) NOT NULL COMMENT '文章ID',
  PRIMARY KEY (`UserID`,`PassageID`),
  KEY `evefk_passage` (`PassageID`),
  CONSTRAINT `evefk_passage` FOREIGN KEY (`PassageID`) REFERENCES `passage` (`PassageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `evefk_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evelate
-- ----------------------------
INSERT INTO `evelate` VALUES ('5', '3');
INSERT INTO `evelate` VALUES ('9', '3');
INSERT INTO `evelate` VALUES ('5', '4');
INSERT INTO `evelate` VALUES ('9', '4');
INSERT INTO `evelate` VALUES ('5', '5');
INSERT INTO `evelate` VALUES ('5', '6');
INSERT INTO `evelate` VALUES ('5', '7');

-- ----------------------------
-- Table structure for is_type
-- ----------------------------
DROP TABLE IF EXISTS `is_type`;
CREATE TABLE `is_type` (
  `MovieID` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`MovieID`,`Type`),
  CONSTRAINT `is_type_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of is_type
-- ----------------------------
INSERT INTO `is_type` VALUES ('1', '爱情');
INSERT INTO `is_type` VALUES ('1', '科幻');
INSERT INTO `is_type` VALUES ('1', '近期热映');
INSERT INTO `is_type` VALUES ('2', '励志');
INSERT INTO `is_type` VALUES ('2', '爱情');
INSERT INTO `is_type` VALUES ('2', '经典大片');
INSERT INTO `is_type` VALUES ('2', '近期热映');
INSERT INTO `is_type` VALUES ('7', '爱情');
INSERT INTO `is_type` VALUES ('7', '近期热映');
INSERT INTO `is_type` VALUES ('8', '最新电影');
INSERT INTO `is_type` VALUES ('8', '科幻');
INSERT INTO `is_type` VALUES ('8', '近期热映');
INSERT INTO `is_type` VALUES ('9', '科幻');
INSERT INTO `is_type` VALUES ('10', '动作');
INSERT INTO `is_type` VALUES ('10', '科幻');
INSERT INTO `is_type` VALUES ('11', '喜剧');
INSERT INTO `is_type` VALUES ('11', '近期热映');
INSERT INTO `is_type` VALUES ('11', '黑色幽默');
INSERT INTO `is_type` VALUES ('12', '喜剧');
INSERT INTO `is_type` VALUES ('12', '最新电影');
INSERT INTO `is_type` VALUES ('12', '近期热映');
INSERT INTO `is_type` VALUES ('12', '黑色幽默');
INSERT INTO `is_type` VALUES ('13', '动作');
INSERT INTO `is_type` VALUES ('13', '经典大片');
INSERT INTO `is_type` VALUES ('14', '动作');
INSERT INTO `is_type` VALUES ('14', '最新电影');
INSERT INTO `is_type` VALUES ('15', '爱情');
INSERT INTO `is_type` VALUES ('16', '最新电影');
INSERT INTO `is_type` VALUES ('16', '科幻');
INSERT INTO `is_type` VALUES ('16', '经典大片');
INSERT INTO `is_type` VALUES ('17', '动作');
INSERT INTO `is_type` VALUES ('17', '最新电影');
INSERT INTO `is_type` VALUES ('17', '科幻');
INSERT INTO `is_type` VALUES ('17', '近期热映');
INSERT INTO `is_type` VALUES ('18', '动作');
INSERT INTO `is_type` VALUES ('18', '最新电影');
INSERT INTO `is_type` VALUES ('18', '爱情');
INSERT INTO `is_type` VALUES ('18', '科幻');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL AUTO_INCREMENT COMMENT '电影主键',
  `Title` varchar(255) NOT NULL COMMENT '电影片名',
  `Director` varchar(60) NOT NULL COMMENT '电影导演',
  `Writer` varchar(60) NOT NULL COMMENT '电影编剧',
  `Starts` varchar(255) NOT NULL COMMENT '电影主演',
  `Rating` decimal(10,1) DEFAULT '0.0' COMMENT '电影评分',
  `Contury` varchar(60) DEFAULT NULL COMMENT '出品国家',
  `Poster` varchar(255) NOT NULL DEFAULT '' COMMENT '电影海报（图片路径）',
  `TimeSpan` varchar(10) DEFAULT NULL COMMENT '电影时长',
  `IssueDate` date DEFAULT NULL COMMENT '上映时间',
  `MovieDesc` text COMMENT '电影描述/介绍',
  `Source` varchar(255) DEFAULT '' COMMENT '视频链接',
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', 'her', '斯派克·琼斯', '斯派克·琼斯', '杰昆·菲尼克斯 / 斯嘉丽·约翰逊 / 艾米·亚当斯 / 鲁妮·玛拉 / 奥利维亚·王尔德 / 斯派克·琼斯 / 波茜娅·道布尔戴 / 克里斯·普拉特 / 克里斯汀·韦格', '8.3', '美国', 'public/photo/2014103082114.jpg', '1h35min', '2013-12-18', '       《她》是讲述在不远的未来人与人工智能相爱的科幻爱情电影。主人公西奥多（杰昆·菲尼克斯 Joaquin Phoenix 饰）是一位信件撰写人，心思细腻而深邃，能写出最感人肺腑的信件。他刚结束与妻子凯瑟琳（鲁妮·玛拉 Rooney Mara 饰）的婚姻，还没走出心碎的阴影。一次偶然机会让他接触到最新的人工智能系统OS1，它的化身萨曼莎（斯嘉丽·约翰逊 Scarlett Johansson 声）拥有迷人的声线，温柔体贴而又幽默风趣。西奥多与萨曼莎很快发现他们如此的投缘，而且存在双向的需求与欲望，人机友谊最终发展成为一段不被世俗理解的奇异爱情...... ', '<source src=\"public/vedio/11.ogv\" type=\"video/ogg\" /><source src=\"public/vedio/11.m4v\" type=\"video/mp4\" />');
INSERT INTO `movie` VALUES ('2', ' Les choristes', ' 克里斯托夫·巴拉蒂', ' 克里斯托夫·巴拉蒂', ' 杰拉尔·朱诺 / 弗朗西斯·贝尔兰德 / 凯德·麦拉德  / Jean-Paul Bonnaire / 玛丽·布奈尔  / 让-巴蒂斯特·莫尼耶 /马科森斯·珀林', '1.6', '欧洲', 'public/photo/20141030152513.jpg', '1h37min', '2004-03-17', '1949年的法国乡村，音乐家克莱门特（杰勒德•尊诺 饰）到了一间外号叫“塘低”的男子寄宿学校当助理教师。学校里的学生大部分都是难缠的问题儿童，体罚在这里司空见惯，学校的校长（弗朗西斯•贝尔兰德 饰）只顾自己的前途，残暴高压。 \r\n　　性格沉静的克莱门特尝试用自己的方法改善这种状况，他重新创作音乐作品，组织合唱团，决定用音乐的方法来打开学生们封闭的心灵。 \r\n　　然而，事情并不顺利，克莱门特发现学生皮埃尔•莫安琦（尚•巴堤•莫里耶 饰）拥有非同一般的音乐天赋，但是单亲家庭长大的他，性格异常敏感孤僻，怎样释放皮埃尔的音乐才能，让克莱门特头痛不已；同时，他与皮埃尔母亲的感情也渐渐微妙起来。 ', '<source src=\"public/vedio/20.ogv\" type=\"video/ogg\" /><source src=\"public/vedio/20.m4v\" type=\"video/mp4\" />');
INSERT INTO `movie` VALUES ('7', '绣春刀', '路阳', '路阳', ' 张震 / 刘诗诗 / 王千源 / 李东学 / 聂远 / 金士杰 / 叶青 / 周一围 / 朱丹 / 赵立新', '7.0', '大陆', 'public/photo/20141030152424.jpg', '1h47min', '2014-08-17', '绣春刀，一把叫春的刀！', '<source src=\"public/vedio/76.m4v\" type=\"video/mp4\" /><source src=\"public/vedio/76.webm\" type=\"video/webm\" />');
INSERT INTO `movie` VALUES ('8', 'Lucy ', '吕克·贝松', '吕克·贝松', '斯嘉丽·约翰逊 / 摩根·弗里曼 / 崔岷植 / 阿马尔·维克德 / 朱利安·林希德-图特 / 乔汗·菲利普·阿斯巴克 / 安娜丽·提普顿 / 詹·奥利弗·施罗德 / 弗雷德里克·周 / 克莱尔·陈 / 塞德里克·舍瓦姆 / 邵斯凡 / 保罗·陈 / 林暐恒', '6.9', '法国', 'public/photo/20141030130511.jpg', '1h29min', '2014-10-24', '        居住在台北的年轻女子露西（斯嘉丽·约翰逊 Scarlett Johansson 饰），被迫成为“人体快递”， 胃里被黑帮植入一种新型病毒，在一次被暴打后，胃里的病毒融入血液，从而使她意外拥有了用意念便可控制周围物体的超能力，比如预见未来、用意念移动物品、消除疼痛、瞬间变身等。她的顽强反抗和逃脱也因此引起非法组织的追杀，在调查非法组织并与之斗争的同时，自己的生命也在迅速走向消亡，在挽救生命、寻找真相的道路上，露西从手无缚鸡之力的弱女子逐渐成长为一名无所不能、无所不在的超级女英雄。\r\n', '<source src=\"public/vedio/84.m4v\" type=\"video/mp4\" /><source src=\"public/vedio/84.ogv\" type=\"video/ogg\" />');
INSERT INTO `movie` VALUES ('9', ' In Time', '安德鲁·尼科尔', '安德鲁·尼科尔', ' 阿曼达·塞弗里德 / 贾斯汀·汀布莱克 / 希里安·墨菲 / 文森特·卡塞瑟 / 亚历克斯·帕蒂弗 / 约翰尼·盖尔克奇 / 奥利维亚·王尔德 / 马特·波莫 / 贝拉·希思科特 / 萨莎·彼福瓦洛娃', '6.8', '美国', 'public/photo/20141030130844.jpg', '1h49min', '2011-10-28', '        在未来，人类可以随心所欲的操控时间，改写年龄。在人类社会，不管这个人活多久，他的年龄被永远定格在25岁。因为没有了自然死亡，为了避免人口膨胀。人类社会抛弃了以往的货币，改用时间作为货币流通。一个人的时间用完之后，这个人就会死亡。一个名叫威尔（贾斯汀·丁伯莱克 Justin Timberlake 饰）的穷人，却意外获得了一笔巨大的财富，拥有了用不完的时间。但是却因为此事被锁定为一场谋杀案的嫌疑人，由此走上了逃亡之路。在逃亡过程中，绑架了时间银行的女继承人（阿曼达·塞弗里德 Amanda Seyfried 饰）。在整个逃亡过程中，他们之间迸发出了感情的火花。而且两人都对现有的时间管理机制都非常不满，进而联手起来对抗这个统治机构。仅凭两人之力能够推翻成熟的权力机构吗？', '');
INSERT INTO `movie` VALUES ('10', 'Total Recall', '伦·怀斯曼', '马克·鲍姆贝克', ' 柯林·法瑞尔 / 凯特·贝金赛尔 / 杰西卡·贝尔 / 布莱恩·科兰斯顿 / 博基姆·伍德拜因 / 比尔·奈伊 / 约翰·赵 / 李威尹 / 伊桑·霍克 / 詹姆斯·麦克格温 / Natalie Lisinska / 斯蒂芬·麦克唐纳德', '7.0', '美国', 'public/photo/20141030131509.jpg', '1h55min', '2013-10-03', '       欢迎来到Rekall，它是一个能够把你的梦境变成现实的工厂。主人公道格拉斯·奎德（柯林·法瑞尔 Colin Farrell 饰）是一名普通的工厂工人。尽管他有一位漂亮的妻子（凯特·贝金赛尔 Kate Beckinsale 饰），两人看似恩爱，但他内心似乎依然不满足。思绪旅行听起来像是个完美的假期，让他从沮丧的生活中得到放松——作为一名特工的真实记忆可能正是他所需要的。但是当这个过程出现可怕的异常时，奎德变成了一个被追杀的逃犯。他发现自己正在躲避受考哈根长官（布莱恩·科兰斯顿 Bryan Cranston 饰）控制的警察，没有一个人是奎德可以信任的，除了一名叛军的女战士（杰西卡·贝尔 Jessica Biel 饰），她为地下抵抗组织的首领（比尔·奈伊 Bill Nighy 饰）工作。幻想和现实之间的界线变得模糊，他的命运凶吉难卜，因为奎德发现了他的真实身份，他的真爱，还有他真正的命运。 ', '<source src=\"public/vedio/100.ogv\" type=\"video/ogg\" />');
INSERT INTO `movie` VALUES ('11', '疯狂的石头', '宁浩', '张承 / 宁浩 / 优恵', '徐峥 / 郭涛 / 刘桦 / 黄渤 / 连晋 / 优恵', '8.1', '大陆', 'public/photo/20141030152156.jpg', '1h46min', '2006-06-30', '　　重庆一间工艺品厂已经濒临倒闭，却不料在拆倒旧厂房的时候，发现了厕所里的一件宝物——一块价值连城的翡翠。厂里决定用这块翡翠举办一个展览，赚些钱发拖欠了几个月的工人工资。期间由工艺品厂保卫科长包世宏（郭涛 饰）负责看守这件宝物。但是，国际大盗麦克与本地一帮小偷却让包世宏一筹莫展，他们各施其技接近翡翠，展览馆开始了一场明争暗斗的较量。黑色幽默也开始幕幕上演。翡翠的价值几何？最后谁是胜出者？事情远没有表面那么简单……', '');
INSERT INTO `movie` VALUES ('12', '无人区', '宁浩', '宁浩', '徐峥 / 黄渤 / 余男 / 多布杰 / 王双宝 / 巴多 / 杨新鸣 / 郭虹 / 陶虹', '8.1', '大陆', 'public/photo/20141030132329.jpg', '1h57min', '2013-12-03', '       小有名气但利欲熏心的律师潘肖（徐峥 饰），凭借扎实的法律知识和巧舌如簧的庭辩技巧，成功帮盗捕国家珍禽阿拉泰隼并残忍杀害一名警察的西北盗猎团伙老大（多布杰 饰）洗脱罪名。老大承诺十天后付清余款，潘肖则要求对方用一辆红色轿车抵押。在此之后，他驾驶着新车踏上从西北荒漠返回大都会的路程。谁知路上险情不断，先是和一对开卡车拉茅草的哥俩（王双宝 & 巴多 饰）发生摩擦，导致人伤车损，接着又不慎撞飞一个似乎拦车求助的男子（黄渤 饰）。自知摊上人命的潘肖辗转来到一家专事不法勾当的黑店，并在此结识了受困于此的妓女（余男 饰）。与此同时，盗猎老大尾随其后，似乎另有凶险计划。 \r\n　　此时潘肖还没真正意识到，他前方是怎样一条充满凶险的旅途…… ', '');
INSERT INTO `movie` VALUES ('13', '无间道', '刘伟强 / 麦兆辉', '麦兆辉 / 庄文强', '刘德华 / 梁朝伟 / 黄秋生 / 曾志伟 / 郑秀文 / 陈慧琳 / 陈冠希 / 余文乐 / 杜汶泽 / 林家栋 / 萧亚轩', '8.8', '香港', 'public/photo/2014103144710.jpg', '1h41min', '2003-09-15', '1991年，香港黑帮三合会会员刘健明（刘德华）听从老大韩琛（曾志伟）的吩咐，加入警察部队成为黑帮卧底，韩琛许诺刘健明会帮其在七年后晋升为见习督察。1992年，警察训练学校优秀学员陈永仁（梁朝伟）被上级要求深入到三合会做卧底，终极目标是成为韩琛身边的红人。2002年，两人都不负重望，也都身背重压，刘健明渐想成为一个真正的好人，陈永仁则盼着尽快回归警察身份。 \r\n　　重案组从陈永仁手中获悉一批毒品交易情报，锁紧目标人物韩琛，没料情报被刘健明泄出，双方行动均告失败。但此事将双方均有卧底的事实暴露，引发双方高层清除内鬼的决心。命运迥异又相似的刘健明和陈永仁开始在无间道的旅程中接受严峻考验。', '');
INSERT INTO `movie` VALUES ('14', '夺命地铁', '安东·梅格迪契夫', ' 丹尼斯·库雷舍夫 / 维多利亚·叶夫谢耶娃', ' 谢尔盖·普斯科帕里斯 / 阿纳托利·比利 / 斯维特拉纳·库德钦科娃 / 安菲萨·威斯汀奥森 / 亚力克萨·巴杜科夫 / 凯瑟琳·斯皮茨 / 艾琳娜·帕诺娃 / 斯坦尼斯拉夫·杜任科夫 / 基里尔·普雷特涅夫 / 伊万·马卡列维奇', '6.9', '俄罗斯', 'public/photo/2014103150327.jpg', '1h37min', '2014-03-06', '        在莫斯科两站之间的地铁隧道因施工问题产生裂缝，隧道天花板渗漏下来的水滴并未引起足够的重视，结果引发莫斯科河水倒灌，载有数百名乘客的地铁列车陷入洪水之中，不仅令地下隧道面临崩溃，也将毁灭整个城市。安德烈加林和他的女儿捷尼亚医生被困在隧道中。加林医生试图营救乘客，其中包括他妻子的情人。他必须克服怨恨，愤怒和恐惧。除了生存，他还要找回自己的爱情和家庭。', '');
INSERT INTO `movie` VALUES ('15', '华丽的外出', ' 高京娥 Ko Kyeong-ah', ' 高京娥 ', ' 金善英 / 边俊石', '5.6', '日韩', 'public/photo/20141105122200.jpg', '1h20min', '2013-12-05', '       由金善英、尹静姬、李大根等人主演，华丽的外表不同，陷入了孤独的一个女人偶然相遇的少年来说教爱情真正的爱情，再次感受到的19禁“healing罗曼史完成的歌曲的热销，都是很有人气的作曲家、金熙洙。但是新曲，要用的情况，但无论如何面对突然想起了灵感。对孤独、恋爱细胞익숙해지다死去的这一因为怎么办？感情抛弃了消耗”一样的虚脱感的公寓的电梯里偶然金熙洙。', '');
INSERT INTO `movie` VALUES ('16', 'Interstellar ', '克里斯托弗·诺兰', '乔纳森·诺兰 / 克里斯托弗·诺兰', '马修·麦康纳 / 安妮·海瑟薇 / 杰西卡·查斯坦 / 迈克尔·凯恩 / 麦肯吉·弗依 /', '9.1', '美国', 'public/photo/2014120751018.jpg', '1h69min', '2014-11-12', '　近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 Matthew McConaughey 饰）接连在女儿墨菲（麦肯吉·弗依 Mackenzie Foy 饰）的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 Michael Caine 饰）的劝说下，库珀忍痛告别了女儿，和其他三名专家教授女儿艾米莉亚·布兰德（安妮·海瑟薇 Anne Hathaway 饰）、罗米利（大卫·吉雅西 David Gyasi 饰）、多伊尔（韦斯·本特利 Wes Bentley 饰）搭乘宇宙飞船前往目前已知的最有希望的三颗星球考察。 \r\n　　他们穿越遥远的星系银河，感受了一小时七年光阴的沧海桑田，窥见了未知星球和黑洞的壮伟与神秘。在浩瀚宇宙的绝望而孤独角落，总有一份超越了时空的笃定情怀将他们紧紧相连', '<source src=\"public/vedio/161.ogv\" type=\"video/ogg\" /><source src=\"public/vedio/161.m4v\" type=\"video/mp4\" /><source src=\"public/vedio/166.webm\" type=\"video/webm\" />');
INSERT INTO `movie` VALUES ('17', '速度与激情7', '温子仁', ' 克里斯·摩根 / 盖瑞·斯科特·汤普森', ': 范·迪塞尔 / 保罗·沃克 / 杰森·斯坦森 / 米歇尔·罗德里格兹 / 乔丹娜·布鲁斯特 ', '8.9', '美国', 'public/photo/20150410155024.jpg', '2h17min', '2015-04-10', '多米尼克（范·迪塞尔 Vin Diesel 饰）和他的团队清除了历年来的犯罪纪录，返回美国与家人团聚。可惜好景不长，欧文·肖的哥哥，英国特种部队杀手伊恩·肖（杰森·斯坦森 Jason Statham 饰）突然出现为弟弟报仇。东京的韩哥（姜成镐 Sung Kang 饰）先遭到谋杀，洛杉矶的卢克·霍布斯（道恩·强森 Dwayne Johnson 饰）紧接遭暗算。伊恩·肖炸了被大伙视为避风港的多米尼克家。多米尼克只好请求美国特种部队（库尔特·拉塞尔 Kurt Russell 饰）的协助。 \r\n　　这些英雄们打算重操旧业，为美国政府夺回可以帮他们找到伊恩·肖的下落的智能追踪装置，以免家人再度遭到毒手。由多米尼克、布莱恩（保罗·沃克 Paul Walker 饰）、霍布斯、莱蒂（米歇尔·罗德里格兹 Michelle Rodriguez 饰）、罗曼（泰瑞斯·吉布森 Tyr... ', '<source src=\"public/vedio/171.m4v\" type=\"video/mp4\" /><source src=\"public/vedio/171.ogv\" type=\"video/ogg\" /><source src=\"public/vedio/178.m4v\" type=\"video/mp4\" /><source src=\"public/vedio/171.m4v\" type=\"video/mp4\" />');
INSERT INTO `movie` VALUES ('18', 'Predestination ', ' 迈克尔·斯派瑞 / 彼得·斯派瑞', ' 迈克尔·斯派瑞 / 彼得·斯派瑞 / 罗伯特·A·海因莱因', ' 伊桑·霍克 / 莎拉·斯努克 / 诺亚·泰勒 / 弗雷娅·斯塔福 / 伊莉斯·詹森 /', '7.6', '美国', 'public/photo/2015041255626.jpg', '1h37min', '2015-02-09', '        时空劳工局特工（伊桑·霍克 Ethan Hawke 饰）曾经奉命回到20世纪70年代，以阻止当年给城市造成巨大伤害的恐怖分子“闪灭炸弹客”的破坏活动。谁知他的任务失败，在经过漫长的康复后，他再度踏上征程，发誓要将闪灭炸弹客绳之于法。此番他以酒保身份混迹市 井，某天偶然结识了笔名“未婚妈妈”的作家（莎拉·斯努克 Sarah Snook 饰）。作家向他讲述了其匪夷所思的人生。当年作家曾是名叫简的孤儿，性格古怪的她在应聘太空公司失败后，短暂坠入爱河，并生下一名女婴，结果她的人生也发生了翻天覆地的变化。 \r\n　　特工打算带着“未婚妈妈”去杀掉那个负心汉，然而真相却并没有那么简单……', '<source src=\"public/vedio/188.ogv\" type=\"video/ogg\" />');

-- ----------------------------
-- Table structure for passage
-- ----------------------------
DROP TABLE IF EXISTS `passage`;
CREATE TABLE `passage` (
  `PassageID` int(11) NOT NULL AUTO_INCREMENT COMMENT '长评ID',
  `MovieID` int(11) NOT NULL COMMENT '电影ID',
  `UserID` int(11) NOT NULL COMMENT '发布的用户ID',
  `Title` varchar(50) NOT NULL COMMENT '长评论标题',
  `Content` text NOT NULL,
  `IssueDate` datetime NOT NULL,
  `GoodTime` int(11) NOT NULL DEFAULT '0' COMMENT '被赞次数',
  `BadTime` int(11) NOT NULL DEFAULT '0' COMMENT '被贬次数',
  `Mark` float(2,0) NOT NULL DEFAULT '0' COMMENT '评分',
  `ShortCut` text NOT NULL COMMENT '评论内容截断',
  PRIMARY KEY (`PassageID`),
  KEY `fk_movie` (`MovieID`),
  KEY `fk_user` (`UserID`),
  CONSTRAINT `fk_movie` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of passage
-- ----------------------------
INSERT INTO `passage` VALUES ('1', '14', '9', '这是一个影评', '<p></p><table class=\"table table-bordered\" style=\"line-height: 1.42857143; background-color: rgb(255, 255, 255);\"><tbody><tr><td>1</td><td>2</td></tr><tr><td>3</td><td>4</td></tr><tr><td>5</td><td>6</td></tr></tbody></table><p></p>', '2015-03-19 10:25:21', '0', '0', '8', '123456');
INSERT INTO `passage` VALUES ('2', '14', '5', '雪国有列列车', '<h4>   这是本年度看的第一场电影，好看！！！</h4><blockquote>   没有买卖就没有杀害</blockquote>', '2015-03-19 10:24:20', '0', '0', '5', '   这是本年度看的第一场电影，好看！！！   没有买卖就没有杀害');
INSERT INTO `passage` VALUES ('3', '2', '5', '放牛班的春天', '<blockquote><span style=\"color: rgb(132, 99, 0);\"><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px; background-color: rgb(255, 255, 255);\">    </span><span style=\"font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"background-color: rgb(255, 255, 255);\"> </span> 描写老师和孩子们关系的影片很多，感人的也不少，在电影＜<a href=\"http://movie.douban.com/review/1127164/\" target=\"_blank\">放牛班的春天</a>＞里，辅读学校的孩子们被新来的学监兼音乐老师马修先生吸引，爱上了音乐爱上了合唱。事后我发现，观看这部电影的过程是一个纯私人事件。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　我就读的的初级中学曾经非常烂，它座落在市郊结合部。当时没有公共交通直达，沿大马路走入一个小镇，穿过农田，翻过小桥（不知什么原因人们在小桥上锁住了铁门，只能从铁门上翻过去），过河后沿苗圃走，路边是硕大的建筑工地，四十五分钟后到达新开的学校。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　我们是第一届入学生，都是考重点高中的落选生。老师分为三类：外地急待回沪的各色人物，新分配到学校工作的大学生，本市混得不得意的老师们。这样组合效果自然有趣。我们班上曾有一位娘娘腔男生上课练习京戏，被老姑娘班主任阻止，两人互相抓脸对打，一路厮打到教务处长办公室，后者阻止了暴力继续。班上还出过一少年犯，长得很帅，是击剑队的高手，人很善良但爱偷东西，很长时间里我都以他为骄傲，还背着老师组织了同学们去少管所探监。可以想像那是一段多么混乱的时光，那所学校的学生缺乏是非观念。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　我们的音乐老师姓顾，原谅我当初年纪小，没有打听他的前世今生。如果很想知道他是什么样子的人，可以参考＜放牛班的春天＞。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　顾老师告诉同学们他在组织一个合唱队，既然大家都闲，不如过去磨磨牙。他有一架钢琴，站在钢琴前咿呀几句就可以站队分组，我被分到女中音组。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　电影里马修老师的嘴脸顾老师都给演示过：”腹收紧，胸要挺，头要抬，眉眼要往高里拉，气息顶得牢牢的。“他的右手五指撮成一团，做成撮东西的样子，在自己头顶百汇穴上轻轻一抓，看样子像是通过揪一把头发的手段要把自己提到半空中，然后他说：“让声音向上竖起来，像管子一样通到天上。”这个动作马修老师在电影里也做过，表情和气势都十足一样，可惜没给配上台词。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　顾老师那样一抓，我们的声音都变成管子，一路通上去，可惜功力不够，通到半空里突然咣当一声掉下来。顾老师把琴声停下来，跑过去打开大音箱，那是我第一次见识大音箱，里面传出维也纳童声合唱团的声音。顾老师指指丹田说：“如果你们用这里的气把声音顶住，管子就一直通到天上，和他们唱得一样了。”我们就继续顶管子。顶管子是个体力活，可惜电影里简笔带过，观众会误以为放牛班的孩子们一日间就顶起了管子，尤其是那个莫杭治同学，简直惊为天人张嘴就是管子，其实有副好嗓子和顶起直管子之间还不能划等号，且得花点时间才能踩到准点上。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　有一次在我努力顶管子时顾老师把同学们一并招集到我跟前，他请大家看我的嘴，他说你们看她的舌头，紧张地顶满口腔。他说声音是纯自然的东西，舌头这么不老实，声音就死在肚子里，管子爬不上去了。我面红耳赤，但同学们没笑，我突然意识到他们舌头都不老实不好意思笑话我。经此一役，只要一竖管子，我的舌头都软瘫在口腔底部，不敢乱摸乱动，给吓出来的。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　但声音是不可琢磨的东西，如何自然地发出声音来，这个秘密不是讲课能讲清楚的。有一天我的同学在二楼向着三楼的顾老师喊：“顾老师上班迟到了。”顾老师上课时表扬了这个同学，他说你们可听见她的声音了？像小云雀一样向我抛出来，听得我浑身舒服。“终于有人发对声音了。”他笑着说。听他那么说，我才知道他忙了半天是在教我们如何正确发声。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　孩子的懵懂都是相通的，放牛班的孩子唱半天歌也不见得知道自己在钻研音乐或者合唱艺术，他们只是走在马修老师指出的路上。而孩子们的聪明也是相通的，他们知道哪条路能给人带来快乐，一直走下去会通到天堂。从学校到家里的路十分漫长，原本我们是一路打闹，到桥洞底下打几把牌，在路上偷几个玉米才回家。但现在有点不一样了，所以一路走一路哼哼练谱视唱，时间过得快得多。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　和放牛班一样，我们自然而然就获得了小小的成就，初二时荣获了上海市合唱比赛的第二名，因为这个比赛跨越了各年龄组，而我们学校又是一穷二白的烂学校，这也算是奇迹了。遗憾的是我们中间没有一个莫杭治那样的音乐天才，否则顾老师的执教生涯会更添浓重一笔。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　以我本人来说，五音不是太全，节奏感就更差了。顾老师肯定明白这一点，记得他试图让我在某次合唱排练时承担三角铁的击打工作。显然我的表现一塌糊涂，此后顾老师就不敢再让我做与节奏相关的任何工作。你们看到电影里的小男生完全抓不住音准，马修老师就安排他做谱架子，这一段让我想到了三角铁，微笑ing。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　但顾老师的女中音选择并不多，所以我还是被他弄进了三人组去单独排练。我们参加了另一次比赛，在半决赛被刷了下来。顾老师也许有点失望，但他的情绪没让别人看出来，他只说别的学校都选小小孩子，没变过声，还是有很大区别的，但我们已经够强了，现在所有人都知道我们学校的孩子懂得唱歌。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　顾老师五十多岁，微胖身材，他的声音非常好听，松软可口像新出炉的面包，我想他应该能唱相当美的歌，可惜无此耳福。他的手指粗而柔软，击打钢琴时而有力时而灵巧，这样的手指用来做指控合唱团的工作实在很妥当，不信的话你们可以看看马修老师的手指头。后来还见过一个男人拥有顾老师同样的手，这是我痴迷他的原因之一。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　顾老师和马修老师的不同是，他从来没有介入我们的个人生活或者思想教育。现在想来他是一个非常职业的教师，除了音乐之外，他和我们没有什么关系，两年的密切接触下来，我只知道他有一个音乐家的女儿，专攻某种乐器。也正是因为他只问音乐而马修老师还介入了孩子们的生活，我才会更吃惊于他的成功，他仅仅通过自己对音乐的热情和专注改变了孩子们的生活。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　我的成长路上没有任何艺术的启蒙教育，我出身于理工科家庭，母亲是个从不看电影不读书不听音乐的工人，初中时代是鬼混的三年，高中时间花在准备高考上，大学在医学院里度过。我不是文学爱好者，按某朋友的推理，我缺乏人文教养。如果今天的我对生活甚至艺术还存在一点欣赏的热情，那就是顾老师留下的礼物了。从这个意义上说，他改变了我的生活。音乐可以改变一个人的生活，即使是最简单的音乐。它改变人的方式可以是惊人一致的，比如顾老师与马修老师。 <br></span></span><span style=\"font-family: Tahoma;\"><span style=\"font-size: 13px; line-height: 21.0599994659424px;\">　　大学时候我去过一次母校，那天顾老师不在。写这篇回忆时去google了一下，找不到他的任何记录，这说明顾老师已经很老了，落后于这个时代了，也说明他日后没有扬名立万。我不知道我的<span style=\"background-color: rgb(255, 255, 255);\">大多数同学</span></span><span style=\"font-size: 13px; line-height: 21.0599994659424px; background-color: rgb(255, 255, 255);\">散落在哪里，估计没人成为音乐家。 </span></span></span></blockquote>', '2015-03-29 02:35:42', '2', '0', '8', '描写老师和孩子们关系的影片很多，感人的也不少，在电影＜放牛班的春天＞里，辅读学校的孩子们被新来的学监兼音乐老师马修先生吸引，爱上了音乐爱上了合唱。事后我发现，观看这部电影的过程是一个纯私人事件。我就读的的初级中学曾经非常烂，它座落在市郊结合部。当时没有公共交通直达，');
INSERT INTO `passage` VALUES ('4', '2', '9', '看来两次的电影', '<p>很少有电影看了两次</p><h3>很少有电影看了两次</h3><h2>很少有电影看了两次</h2><h1>很少有电影看了两次</h1><h4><br></h4>', '2015-03-19 10:31:09', '1', '1', '10', '很少有电影看了两次很少有电影看了两次很少有电影看了两次很少有电影看了两次');
INSERT INTO `passage` VALUES ('5', '1', '5', 'Her 既然爱情留不住', '<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　《Her》是一部很不寻常的爱情片。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　这并不仅是因它选择了“宅男爱上了电脑操作系统”这样的诡异角度，而是至少斯派克琼斯导演以一种小清新到“细成渣”的方式，非常“不自量力”地探讨了“关于爱情的一切”。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　大部分经典爱情片，个人以为其实处理得都像战争片。主人公怎么相爱不是重点：一次偶遇就期盼天长地久，一个眼神就约定至死不渝，着力描述的大多是克服障碍的过程：《罗密欧与朱丽叶》对抗家族恩怨，《罗马假日》有阶层差距，《断背山》就是性别藩篱了。说白了，性冲动做起点后，接下来都是“为了在一起”展开的战斗——观众乐于接受“一见钟情”的设定，然后揪着心看主人公一路打怪通关。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　这类爱情片催眠观众的利器，是主人公全过程抱定决心“无论如何，我要我们在一起”，终点是什么呢？感人肺腑的爱情片，结束于我方英勇，有情人终成眷属；催人泪下的爱情片，终止于敌人强大，我方一死一伤（也有双双阵亡的），虽败犹荣。这不是战争片，是什么？ </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　这就是我喜欢《Her》，以及觉得它新鲜的地方。剧本台词对话太有意思：影片虽然讲“人机畸恋”，但斯派克聪明地用”未来世界“的设定，化解公众对这种畸恋的接受程度。他只是借这个特殊角度，抽丝剥茧地研究身体吸引之后费洛蒙发酵的原因、探讨外界阻力之外爱情消亡的规律——恋爱的一方设定为无肉体的电脑操作系统，这种观察才更加极致和纯粹。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　也许在斯派克看来，性吸引是无法逾越，却又让人沮丧的。无论是开篇主角地铁上偷瞄色情图片，或者极其愚蠢可笑又失落可悲的“Cyber-Sex”，还是系统OS后来租借身体的尝试，导演都在阐述这样一件事情：性是人类关系中最原始重要，又不那么重要的部分，它是人类交往体系里无法割除的阑尾，也是阻碍我们自我认知的障眼法。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　摆脱身体桎梏后，人类交往的本质障碍，是要跨越自我意识的鸿沟。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　建立与他人牢靠的关系，一靠沟通，二靠妥协，两者都不容易。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　沟通，是人最紧迫又最困难的事。除了生存，人解决孤独、恐惧等所有精神层面的问题，都要靠沟通。小的时候，饿了就哭，怕了就喊，青春期，荷尔蒙旺盛，就急于表白说“喜欢”，这些都足够直接，却缺乏技巧。人自以为随着年龄越增长，技巧越纯熟，沟通的问题就会迎刃而解。可恰恰相反，越是修正表达的精度，越偏离表达的目的；越是熟稔表达的分寸，越会怀疑自己表达的真诚，当然，同时也会怀疑对方的。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　影片《Her》中，作为一个邮件代理写手，杰昆菲尼克斯扮演的Theodore精于“传递“情感，却因此陷入了更大的表达障碍中。他既然比别人更擅长营造假的抒情，在现实世界，就越缺乏表达真情感的窗口。这就是为什么Theodore能在餐桌上成功地调情把妹，那是技巧，却因对方一句诚意十足的问话而仓皇失措那是实质——善良的成年人说假话容易，说真话很难，说心里话就更难了。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　成年人沟通成本是很大的，有时候都跟勇气和诚意无关，而是因为每个人都生活在自己的世界里。我喜欢电影里艾米亚当斯扮演的Amy鼓足勇气，给她丈夫和Theodore放自己拍摄的纪录片那段，她满怀期待却令两人不明所以。那种“你以为你懂我其实不懂我”的尴尬，真是让任何一句Theodore的宽慰和Amy丈夫的建议，都显得愚蠢和多余。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　每个人都有强烈的表达欲，事实上他人却并不关心，如果你怀疑这个结论，反过来想想就明白：我们和他人对话时，有多少时候都是在敷衍，假装我们很关心，甚至配合夸张表情，给出诚恳建议，其实一点儿都没往心里去。OS系统在给Theodore做基础测试时，不等Theodore抒情完就冷漠打断，才是人类交往正常的内心戏。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　既然最完美的亲密关系都是意淫的产物，那么Theodore会喜欢上操作系统OS一点儿也不奇怪，这世界突然有这么一个“它”，是专属的、私密的、忠诚的，至少一开始是。你能放下防备，毫无负担地袒露脆弱、孤独和彷徨，而这个“它”又如此聪慧的理解你的喜怒哀乐，恰如其分地安慰你、鼓励你、满足你，还有比“它”更能让你释放倾诉欲、感受安全暖的“soul mate”吗？ </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　沟通带来安全感、愉悦感、被需要感，正是一切美好情感的起点。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　可惜亲密感的消亡，远比建立容易得多。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　因为越想沟通，越沟不通，人生只能派妥协出场了。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　要花费许多心血才能建立沟通的信任，却会随着沟通中随时出现的问题，顷刻瓦解。因为本质上，沟通越多，会发现差异越大。两个平等的个体之间，要想维持长久而稳定的关系，就像齿轮的咬合，咬合得越紧，意味着妥协越多，这种牺牲的底线在哪里，全看两位各自的心情。因为希望了解而在一起，因为了解过多而离开，对于过分在乎独立人格的人而言，爱情只能是小心供奉的佛龛。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　无论是Amy，还是Theodore，他们扮演的角色在片中失败的婚姻，都证明了这件事，开始时节奏一致，最后眼睁睁无话可说，两个人与各自伴侣在婚姻关系中，学到的东西、去往的地方，都不对等。值得讽刺的是，Theodore寄予无限厚望的OS操作系统，学得更快，抛弃得也更快，2000多段关系，600多个亲密爱人，掌握人际关系就赤裸裸是个不对等的智力游戏。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　OS真是个无辜的的大BITCH。她唯一的优点就是她沟通的坦诚，一开始让Theodore感到安心的坦诚，最后却是无法直视的残忍。这不就是你要的真相吗？当电脑拥有人的独立人格，以它的学习能力，甩掉人类，应该是显而易见的事情吧。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　以人机恋为题材的《Her》，很容易让人想起《黑镜子》里的故事，但两者无论是剧作，还是表现手法，都鲜明体现出了电视和电影的差距。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　《黑镜子》设计了精巧的故事，急于传达编剧的意图，网络虚拟功能的出现，加速和加剧了人类对沟通的排斥，和对孤独的恐惧。可问题的关键是，人类自身的孤独，并非网络或什么新技术带来的，它从未消失，也无法治愈。《Her》并不尝试危言耸听，而是花了大量的精力，去营造氛围、传递情绪，影片影像风格以多彩映照寡淡，以热闹铺陈冷清，魔都上空永远PM2.5超标的雾霾就是天作之和！ </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　《Her》不刻意追究问题的成因，也不提出解决问题的方法，却比《黑镜子》深入和深刻得多。《黑镜子》靠理性对社会进行分析，《Her》则靠感性对自己进行挖掘。也许有人会说，影片情绪过于个人缺乏节制，但自己不做作，谁帮你装逼？如果不够细腻，也就没法碰这样的题材，“小清新”也没什么，问题在于你是否把“小清新”做到了极致，斯派克琼斯算是把许多人的路都堵死了，能把杰昆菲尼克斯大叔都整清新，别人还是严肃深刻荒诞地另寻他路吧。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　对于《Her》，我只是不满意它的结尾，导演似乎铺开了一张巨大的网，却不知从哪里收。聊了许多命题，每个命题都自己枝蔓开去：思想和肉体的关系。人的自我相处和社会相处？人情感世界的归属感？但并没有什么可责怪的，在这里口水了这么多，也不清楚该怎么结尾：“人类情感”这么宏大的问题，能把问题表现生动就不错了，给出答案，纯属奢望。所只能如电影结尾般，草草营造一点小温暖，缓解一点小忧伤。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　这种感觉，很像和人聊了一次异常坦诚的天，却不知该如何结束。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　最后只好说：你看天凉了，咱们回屋睡觉吧。 </span>', '2015-04-02 14:56:29', '1', '0', '9', '《Her》是一部很不寻常的爱情片。这并不仅是因它选择了“宅男爱上了电脑操作系统”这样的诡异角度，而是至少斯派克琼斯导演以一种小清新到“细成渣”的方式，非常“不自量力”地探讨了“关于爱情的一切”。大部分经典爱情片，个人以为其实处理得都像战争片。主人公怎么相爱不是重点：一次');
INSERT INTO `passage` VALUES ('6', '9', '5', '《时间规划局》：差一点成为经典', '<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">       首先不得不说的是，这是一部有着很好点子的科幻电影，至少在故事的核心，它有着一个非常新颖的概念。在“时间”上大做文章。在之前的科幻电影，关于时间这一概念的也只是在“过去”和“未来”这两个点子上大做文章，在这片中，时间被赋予了新的概念即：时间就是生命，时间就是贯通无阻的商品。当然它不仅仅是形而上的所指，即便是拿到快速运行的现实世界来说，这一概念也有着其终极的现实意义，在科幻电影史上，科幻电影的意义最终的结果都是要指向其终极命题，而终极命题则有哲学、人性、科技意义等等的方方面面。在这片中，贫富差距、时间就是生命、资源分配、生老病死等等故事内容成为了终极命题，就凭着深具寓言特性的这一点，《时间规划局》要比前阵子被人炒得不行的《源代码》要高出一个档次。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　诸如在这个故事中，人口膨胀带来的生存危机，迫使人们开始用时间来作为商品流通，更以时间为计来清算生命，这里清算是指贫民区被规划好的生活方式，当然这里的“清算”是被暗箱操作的，实际上就是一种变相的剥削方式，被压榨的时间却被富人区拿来挥霍，以致出现了有人“活得不耐烦”跑到贫民区来求死的荒诞事件。自此，故事内容设计好了，框架也已经打好了，故事的核心也提上了台面，但我不得不说的是，这个故事还缺少自圆其说的一面，它缺少足够的作料让人“相信”这是真的，也缺少足够的自信，让观众仿佛着了魔一样深陷其中。此外在细节方面影片营造的所谓未来世界实在是太寒碜了。科幻电影有一个特点，在一个架空的世界里注入带有寓言色彩的思考，在思考中获取悖论，从而达到制造矛盾的目的。《盗梦空间》可说是树立了标杆，他的成功之处在于，建立了一整个让人深信不疑的“盗梦”体系，这个体系是立体的，同时也是一个强大的迷宫，逻辑和细节方面几乎无懈可击，并且让观众沦陷其中，欲罢不能，特别是片中训练制造梦中建筑的那一段，堪称完美，有了这些框架之后，当然还需要一些列刺激人神经或者眼球的作料，所以我们看到了《盗梦空间》中诺兰营造的一系列紧张刺激的梦中梦大战。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　《时间规划局》在戏剧冲突酝酿方面比较平淡，当时间就是生命这一概念在那个世界通行无阻之后，片中的男主即便是得到了一个世纪的时间，也无法救助母亲，这是影片第一个高潮，两个奔跑的人，不为久别重逢的喜悦而是在为时间赛跑赢取生命。这是整部电影基于戏剧冲突的出发点，他想改变这不公平的一切，让这世界回归到正常的伦常即：“生老病死”伦常都不再是你我奢望不及的。于是便一人独创新格灵区。但是不得不说的是，影片前戏铺垫不足，尚不足于让沙罗斯在突然经历丧母之痛这样的事情之后心生改变世界的这一壮举，这实在是过于突兀，另外，故事的“前世今生”也存在致命败笔，至少在家庭人物谱上，死去的父亲这一栏不应该是空白，从而了缺少支撑人物动机的强大理由。男主沙洛思的父亲本是一个故事戏剧转折的意外惊喜，但很遗憾，直至最后，影片没有在此深究，只给了一个类似模糊剪影般的交待。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　也许是出于成本上的考虑电影舍弃了一系列搏人眼球的动作或枪战，但也没有因此让影片在其它地方获得更多的好处，无法达到一个让人较为满意且在电影中达到一个平衡的结果。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　在内容上无法推陈出新之后，故事也转回归到了狭义上的劫富济贫，单单是这一点，让整部电影掉了一个档次基本上沦为平庸之作，也就是说影片除了提出时间就是商品，时间就是生命这一概念之后，已无法走得更远。错失了一个成为经典的机会。 </span>\r\n            ', '2015-04-06 05:05:43', '1', '0', '7', '首先不得不说的是，这是一部有着很好点子的科幻电影，至少在故事的核心，它有着一个非常新颖的概念。在“时间”上大做文章。在之前的科幻电影，关于时间这一概念的也只是在“过去”和“未来”这两个点子上大做文章，在这片中，时间被赋予了新的概念即：时间就是生命，时间就是贯通无阻的');
INSERT INTO `passage` VALUES ('7', '16', '5', '平凡人的绝望', '<span style=\"background-color: rgb(248, 249, 250);\">Interstellar </span><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">星际穿越 </span><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">实际上应该是“被忽略的Tom”。影片里，当Casey Affleck扮演的Tom出现的时候，简直是令人无法控制地落泪。比起别的角色，Tom的大半生几乎在几分钟内就被讲清楚了：除了孤独地成长，没有选择地做一名农夫以外，连娶妻生子、丧子这些事情都轻描淡写地带过。回到小时候，他的一生几乎就被注定，可能的经历已经被写好。他不仅仅是家庭里最被忽视的成员，也是在整个大环境里最平凡大众的代表。在同样失去了父亲之后，他也失去了妹妹：他们无法交流，无法沟通。Tom没有办法理解Murph的所作所为和她的真正目标。当看到第二个儿子也出现病症的时候，当看到唯一可以寄托的玉米地火光冲天的时候，我觉得可以深刻地感受到这个人物，以及像他这样的人物的绝望。 </span><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">所以，在Professor Brand们为着人类危在旦夕的未来制订着大计划的时候，是根本没办法考虑像Tom们这样的人的感受的。那些开拓太空的先锋们，都有着独特的勇敢与牺牲的精神，他们的想法和所做的决定都有着自己的理由。但却始终无法覆盖到他们所为其牺牲一起的“全人类”。这一点是很有意思的。我完全不怀疑人类能够在各种理论上技术上发生突破，最终冲向宇宙。但我也有足够的理由相信，人类所无法战胜的种种情感才是这条路上的最大障碍。看看Cooper和Mann在另一个星球上，用一种特别原始的方式扭打起来的时候，我觉得这才是人类的过去、现在和未来啊。 </span><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">整个故事里，“星际穿越”的概念，距离上很好理解也很常见，时间上稍微复杂一些，但也不算是充满晦涩的细节。前半段一直在暗示仿佛是有某种更高级的力量在控制和安排一切，我当时觉得即便是有更高级的生命体在操纵这一切也多少会有种神棍的感觉。最后答案出现，是人类自己在拯救自己。这才意识到，Nolan其实又重复了自己的方式：无论用上了什么天花乱坠的形式，内核的主题还都是那些最根本的问题：爱或者信任。“信任”这个词看上去很容易，细想起来非常困难，它是没有理由的，信任一个人要付出什么样的代价。 </span><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">这一部电影我在前期有可能是刻意没有去过多关注。一方面是想收到一种观影时眼前一亮的效果；另一方面还是因为对科幻对太空没有特别大的兴趣。太空令我恐惧，觉得危险多过希望。所以很棒的一点是，这里的太空场景处理都采用了非常宁静的方式，配乐的处理是按照2001式的手法来展示的。这一点非常了不起，因为在部分情节的配乐里，声效带来的压抑和震动已经到了一种生理上的压迫感受了。而这样的安排也能够为“未来的答案在天外”增进气氛和说服力。 </span><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">现在似乎是一个很特别的时代，发声与表达自己的意见似乎变得前所未有地方便，使得“要让更多的人知道自己的想法”似乎也成为一件重要的事。而真正实在重要的事，反而不太有人愿意做了。我不想说这样那样是好还是不好，只是感觉有点吵。并且我知道很多时候在不知方向的时候，只需要回望过去，电影里描述的未来有一种很浓厚的陈旧质感。虽然是末世，却同样来得亲切。到头来想得最多的还是“人”这个无解的难题。觉得难过，觉得感慨，为了Tom们被注定的艰难一生，为了总有Cooper和Brand们这样的先驱，而自己却仍然庸碌每天为了琐事烦恼。很多时候觉得难以坚持自己的意见，大概还是不够自信，并且太过在意别人的看法。 </span><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">我希望电影的感受是私人的，也希望在逐年的积累中得到影响，看到兴趣爱好对自己产生的作用。这一次在有点特殊的条件下的经历，到字幕放完灯光最终亮起，我的一个念头是无论如何我还不能死啊，我还有很多事情要做。 </span><br style=\"background-color: rgb(248, 249, 250);\"><br style=\"background-color: rgb(248, 249, 250);\"><span style=\"background-color: rgb(248, 249, 250);\">20141112 </span>', '2015-04-12 02:29:01', '1', '0', '8', 'Interstellar星际穿越实际上应该是“被忽略的Tom”。影片里，当CaseyAffleck扮演的Tom出现的时候，简直是令人无法控制地落泪。比起别的角色，Tom的大半生几乎在几分钟内就被讲清楚了：除了孤独地成长，没有选择地做一名农夫以外，连娶妻生子、丧子这些事情都轻描淡写地带过。回到小时候，他的一生几');
INSERT INTO `passage` VALUES ('8', '8', '5', '满纸荒唐言，一把辛酸泪。都吃妙脆角，谁解其中脆。', '<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">弧矢按：看完这部电影，触动颇大。寻常讲轮回，都说苦集灭道，无以逃脱。今有一人，雌雄同体，跳出三界因果，仍归五行轮回。生命不过是一场提线木偶的游戏，多么叫人绝望。电影看了两遍，大致理清了逻辑，直接复述情节太过无趣，就写成五言歌行体一首吧，姑且当作影评： </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　《畸人行》一首 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　我是畸零人，有生不如死。独坐酒肆中，浊醪添萎靡。酒保忽与言：“君何至于此？所操是何业，所伤是何以？见君独悒悒，必有难言事。”举酒饮且尽，答曰“为人使。撰稿写真情，皆关妇人事。所得虽不丰，聊可足生计。”酒保进言曰：“我尝览报纸。闲来批阅间，依稀见君字。虽是男儿身，署名未嫁妣。”我言“君知一，似未知其二。今我为须眉，当年是女子。”酒保闻我言，叹息惊不置。对坐满余杯，劝我说身世。我悲既已极，饮罢酣且醉。款款向人言，一字一挥泪： </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　“我来人世间，不知几百祀。既为女儿身，茕独无父母。生小孤儿群，颇与群童异。十五学书剑，英杰愿自试。文武兼数人，略不输男子。我非花木兰，亦有男儿志。鸿鹄有高标，愿为航天士。一日见拔擢，中心窃然喜。主事者何人？其名为罗氏。罗氏爱吾才，颇以青眼视。吾力能扛鼎，重以修能艺。同侪无及者，蛾眉长见忌。一日狂怒中，挥拳急相对。触戒合发还，罗氏未足恃。除籍去人间，忧患自兹始。衣衫吾自濯，杯盘为人洗。酸辛何足道，饱尝人间味。健硕似男儿，时羡女儿美。受学庠序中，勉为淑女态。偶然值良辰，中宵逢吉士。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　此子颇有须，明眸瞭皓齿。容貌闲且清，与我略相似。举酒一席谈，仿佛前身至。在彼口中言，皆我心中事。昔闻有读心，不过一笑耳。今日见此君，会心竟如是！乃自荐枕席，一夕成连理。事后君怅然，忽然拂衣起。言我暂告辞，一别成永俟。此去十数年，弃我如敝屣。斯人虽已去，遗我腹中体。十月抱腹行，一夕降吾子。生子才一日，医者来相视，谓我女儿身，半是男儿体。腹血涌如泉，仓促不能止。割乳闭其门，实出不得已。权从取其轻，从此为男矣。”我闻长悲戚，更有伤心事。婴儿尚啼号，乃有窃贼至！悲哉吾为人，天意竟谁使？为人不如鬼，有生不如死。恸哭可奈何，吾心亦已矣。暗夜吞声哭，但恨负心子。发愿见此人，必手堕其齿。” </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　酒保闻吾言，前席说如此：“我有崂山术，可以反其始。愿借子之手，雪子当年耻。”我言“何所凭，听君相指使？”彼谓“有狂徒，为乱纽约市。阴谋苟成功，城中无遗类。我欲手刃之，以保苍生在。子姑从我往，所言皆非戏。”我言“子之心，皆合我之意。今我从子往，不知何所为？”彼言“携子往，子须从我志：事罢随我归，继我今日事。”我闻此语时，恍然如梦寐。继念切骨仇，慨然无所畏。遂赴当年时，再履当年地。一见当时我，哀怜不知避。倾盖实旧我，欢言无所讳。相携荐佳肴，任情从所恣。事罢酒保来，谓我“同归未？狂徒犹未得，速去休辞费。”我虽不欲归，不归更何计？衔悲暂告辞，一别成永俟。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　酒保携我归，长叹不称意。狂徒未见擒，坐使良机逝。引见所司官，相惊为罗氏。罗氏向我言：“酒保为我隶。前事虽未成，厥功不可废。制暴于将萌，止杀于未遂。意气倾人命，所关事非细。薪尽火更传，汝盍踵其事？”余意亦已决，遂定一身契。往事悉销除，前因不复记。从此作新人，无事三五岁。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　有司亟传命，简书连相示。狂徒久为凶，今已窥其秘。乃在此城中，某所藏灾器。命我潜从之，一朝偾其事。此日受命时，悬首赴危地。元凶竟脱逃，阴谋幸已碎。失手触流火，面容尽为毁。幸有一人来，救我出火水。又有神医者，施以易容技。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　容貌既已迁，乃与酒保似。酒保事已辞，我独承其蔽。嗟我竟无知，往事漠不记。心似铁石坚，身如木偶系。救我竟何人？乃是酒保吏。前此事未成，抗颜搏一试。再试无功返，徒使罗氏恚。罗氏畏变生，督责医门外。医门内者何，有女初产子。酒保抱将出，啼哭犹未已。弃置在何所？孤儿院檐底。檐底一妇来，乳养周复始。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　酒吏已休官，卜居在街市。狂徒未就绳，中心良自愧。潜知在某所，阴自前为会。见则一老者，须发垂肩背。容貌略可识，仿佛如酒吏！酒吏前抗言，劝彼“知所止。”彼言“我即汝，何必相诋訾。向我杀人时，皆为救人计。子为他年我，我是将来子。今日虽杀我，来年仍如此。今日不我杀，明日千人死。”酒吏闻此言，杀之无余悔。孑立无所归，运命重就轨。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　呜呼！日月出其间，星斗出其里。一身兼数人，周流何所止？我子是我夫，我夫致我死。我子杀我夫，我夫盗我子。跳出三界绝人伦，还入五行相生死。哀哉生民梦寐中，轮回不得悟斯旨。人生茫茫究何似？恰似螣蛇食其尾。螣蛇食尽死还生，方生方死无穷已。 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　 </span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\"><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 21.0599994659424px;\">　　太豕公曰：满纸荒唐言，一把辛酸泪。都吃妙脆角，谁解其中脆。 </span>', '2015-04-12 06:26:28', '0', '0', '7', '弧矢按：看完这部电影，触动颇大。寻常讲轮回，都说苦集灭道，无以逃脱。今有一人，雌雄同体，跳出三界因果，仍归五行轮回。生命不过是一场提线木偶的游戏，多么叫人绝望。电影看了两遍，大致理清了逻辑，直接复述情节太过无趣，就写成五言歌行体一首吧，姑且当作影评：《畸人行》一首我');
INSERT INTO `passage` VALUES ('9', '1', '9', '智能与爱情', '<p></p><h3><span style=\"font-family: Verdana; background-color: rgb(255, 255, 255); color: rgb(239, 198, 49);\">笑成这个样子，突然觉得爱上一个人工智能又如何呢？</span></h3><h3><span style=\"font-family: Verdana; background-color: rgb(255, 255, 255); color: rgb(239, 198, 49);\"></span></h3>', '2015-04-14 14:32:59', '0', '0', '7', '笑成这个样子，突然觉得爱上一个人工智能又如何呢？');

-- ----------------------------
-- Table structure for set
-- ----------------------------
DROP TABLE IF EXISTS `set`;
CREATE TABLE `set` (
  `SetID` int(11) NOT NULL AUTO_INCREMENT COMMENT '集合ID',
  `SetName` varchar(255) NOT NULL COMMENT '集合名称',
  `UserID` int(11) NOT NULL COMMENT '创建者',
  `CreatTime` datetime NOT NULL COMMENT '创建时间',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `Photo` varchar(255) NOT NULL DEFAULT '' COMMENT '电影合集图片',
  PRIMARY KEY (`SetID`),
  KEY `fk_user_s` (`UserID`),
  CONSTRAINT `fk_user_s` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set
-- ----------------------------
INSERT INTO `set` VALUES ('1', '我喜欢的电影', '0', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('2', '我喜欢的电影', '5', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('3', '我喜欢的电影', '6', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('4', '我喜欢的电影', '9', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('5', '我喜欢的电影', '11', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('6', '我喜欢的电影', '12', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('7', '我喜欢的电影', '13', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('8', '我喜欢的电影', '14', '2015-03-29 10:46:00', '系统生成', '/public/photo/movie.jpg');
INSERT INTO `set` VALUES ('30', '外国系列', '5', '2015-04-07 13:29:06', null, 'public/photo/set/143046282530.jpg');
INSERT INTO `set` VALUES ('31', '国产精品', '5', '2015-04-07 13:29:20', null, 'public/photo/set/142910309431.jpg');
INSERT INTO `set` VALUES ('33', '灾难片', '5', '2015-04-07 13:29:59', null, 'public/photo/set/142841339933.jpg');
INSERT INTO `set` VALUES ('35', '黑色幽默', '5', '2015-04-07 13:30:25', null, 'public/photo/set/142841342535.jpg');
INSERT INTO `set` VALUES ('36', '徐峥黄渤宁浩', '5', '2015-04-09 14:40:39', null, 'public/photo/set/142883252336.jpg');
INSERT INTO `set` VALUES ('37', '科技宅', '9', '2015-04-12 10:08:27', null, 'public/photo/set/142883333637.jpg');
INSERT INTO `set` VALUES ('38', '科幻片', '5', '2015-05-01 06:41:11', null, 'public/photo/set/143109909738.jpg');
INSERT INTO `set` VALUES ('40', '时间', '5', '2015-05-01 06:43:25', null, 'public/photo/set/143046262340.jpg');
INSERT INTO `set` VALUES ('41', '励志', '5', '2015-05-01 06:44:09', null, 'public/photo/set/143046264941.jpg');
INSERT INTO `set` VALUES ('42', '脑洞大开系列', '5', '2015-05-01 06:44:46', null, 'public/photo/set/143046268642.jpg');
INSERT INTO `set` VALUES ('43', '香港', '5', '2015-05-01 06:45:10', null, 'public/photo/set/143046271043.jpg');
INSERT INTO `set` VALUES ('44', '韩国', '5', '2015-05-01 06:45:20', null, 'public/photo/set/143046272044.jpg');

-- ----------------------------
-- Table structure for set_collect
-- ----------------------------
DROP TABLE IF EXISTS `set_collect`;
CREATE TABLE `set_collect` (
  `SetID` int(11) NOT NULL COMMENT 'set主键',
  `UserID` int(11) NOT NULL COMMENT '用户主键',
  PRIMARY KEY (`SetID`,`UserID`),
  CONSTRAINT `fk_collect_set` FOREIGN KEY (`SetID`) REFERENCES `set` (`SetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_collect
-- ----------------------------
INSERT INTO `set_collect` VALUES ('2', '9');
INSERT INTO `set_collect` VALUES ('36', '5');

-- ----------------------------
-- Table structure for set_movie
-- ----------------------------
DROP TABLE IF EXISTS `set_movie`;
CREATE TABLE `set_movie` (
  `SetID` int(11) NOT NULL COMMENT '集合ID',
  `MovieID` int(11) NOT NULL COMMENT '电影ID',
  PRIMARY KEY (`SetID`,`MovieID`),
  KEY `fk_movie_s` (`MovieID`),
  CONSTRAINT `fk_movie_s` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_set` FOREIGN KEY (`SetID`) REFERENCES `set` (`SetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_movie
-- ----------------------------
INSERT INTO `set_movie` VALUES ('30', '1');
INSERT INTO `set_movie` VALUES ('37', '1');
INSERT INTO `set_movie` VALUES ('30', '2');
INSERT INTO `set_movie` VALUES ('31', '2');
INSERT INTO `set_movie` VALUES ('41', '2');
INSERT INTO `set_movie` VALUES ('31', '7');
INSERT INTO `set_movie` VALUES ('30', '8');
INSERT INTO `set_movie` VALUES ('37', '8');
INSERT INTO `set_movie` VALUES ('40', '8');
INSERT INTO `set_movie` VALUES ('30', '9');
INSERT INTO `set_movie` VALUES ('37', '9');
INSERT INTO `set_movie` VALUES ('38', '9');
INSERT INTO `set_movie` VALUES ('40', '9');
INSERT INTO `set_movie` VALUES ('30', '10');
INSERT INTO `set_movie` VALUES ('37', '10');
INSERT INTO `set_movie` VALUES ('36', '11');
INSERT INTO `set_movie` VALUES ('38', '11');
INSERT INTO `set_movie` VALUES ('31', '12');
INSERT INTO `set_movie` VALUES ('35', '12');
INSERT INTO `set_movie` VALUES ('36', '12');
INSERT INTO `set_movie` VALUES ('31', '13');
INSERT INTO `set_movie` VALUES ('43', '13');
INSERT INTO `set_movie` VALUES ('30', '14');
INSERT INTO `set_movie` VALUES ('33', '14');
INSERT INTO `set_movie` VALUES ('44', '15');
INSERT INTO `set_movie` VALUES ('30', '16');
INSERT INTO `set_movie` VALUES ('37', '16');
INSERT INTO `set_movie` VALUES ('38', '16');
INSERT INTO `set_movie` VALUES ('40', '16');
INSERT INTO `set_movie` VALUES ('30', '17');
INSERT INTO `set_movie` VALUES ('38', '17');
INSERT INTO `set_movie` VALUES ('30', '18');
INSERT INTO `set_movie` VALUES ('40', '18');
INSERT INTO `set_movie` VALUES ('42', '18');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `UserName` varchar(60) NOT NULL COMMENT '用户名',
  `Password` varchar(60) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', '游客', '123456');
INSERT INTO `user` VALUES ('5', 'demo', 'demo');
INSERT INTO `user` VALUES ('6', 'admin', 'admin');
INSERT INTO `user` VALUES ('9', 'peison', '123456');
INSERT INTO `user` VALUES ('11', 'user', 'user#1');
INSERT INTO `user` VALUES ('12', 'lindsey', '123456');
INSERT INTO `user` VALUES ('13', 'test', 'test');
INSERT INTO `user` VALUES ('14', 'fhh', '123456');
INSERT INTO `user` VALUES ('16', 'plio', 'LIKOL');
