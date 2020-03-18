/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2020-03-17 09:16:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `salary` decimal(10,2) DEFAULT NULL,
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('546654.45', '2', '张飞', '1056', '2020-02-18 18:47:39', '男');
INSERT INTO `person` VALUES ('9999.00', '3', '刘备', '1059', '2020-02-20 13:56:39', '男');
INSERT INTO `person` VALUES ('486.00', '4', '关羽', '1534', '2020-02-11 13:57:02', '男');
INSERT INTO `person` VALUES ('21313.00', '5', '大乔', '1515', '2020-02-04 13:57:32', '女');
INSERT INTO `person` VALUES ('135.00', '6', '小乔', '513', '2020-02-07 13:57:49', '女');
INSERT INTO `person` VALUES ('123.00', '7', '关仓', '213', '2020-02-05 13:58:08', '男');
INSERT INTO `person` VALUES ('56.00', '8', '李白', '213', '2020-02-26 13:58:25', '男');
INSERT INTO `person` VALUES ('213.00', '9', '王伟', '456', '2020-02-19 13:58:39', '男');
INSERT INTO `person` VALUES ('456.00', '10', '哪吒', '456', '2020-03-07 13:58:55', '女');
INSERT INTO `person` VALUES ('456.00', '11', '张伟', '26', '2020-02-05 13:59:11', '男');
INSERT INTO `person` VALUES ('54333.00', '12', '蒙奇·D·路飞', '16', '2020-02-19 13:59:44', '男');
INSERT INTO `person` VALUES ('45466.00', '13', '罗罗诺亚·索隆', '20', '2020-02-19 14:00:04', '男');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '张三', '18');
INSERT INTO `student` VALUES ('2', '李四', '20');

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL COMMENT '管理员id',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `profile` text COMMENT '简述',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sign` varchar(50) DEFAULT NULL COMMENT '个性签名',
  `imageName` varchar(50) DEFAULT NULL COMMENT '头像名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'c15955bcc3a43cf7f65514a378269323\r\nc15955bcc3a43cf7f65514a378269323\r\nc15955bcc3a43cf7f65514a378269323', null, '管理员111', '我是管理员', 'admin.jpg', '17726484598', '4567891234@qq.com');

-- ----------------------------
-- Table structure for `t_blog`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `title` varchar(200) DEFAULT NULL COMMENT '博客标题',
  `summary` varchar(400) DEFAULT NULL COMMENT '摘要',
  `releaseDate` datetime DEFAULT NULL COMMENT '发布日期',
  `clickHit` int(11) DEFAULT NULL COMMENT '点击量',
  `replyHit` int(11) DEFAULT NULL COMMENT '回复量',
  `content` text COMMENT '内容',
  `typeId` int(11) DEFAULT NULL COMMENT '类型名',
  `keyWord` varchar(200) DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `t_blog_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `t_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('74', 'MySQL', '1.查看数据库，选中使用数据库，并查看数据库表，具体操作命令如下：show databases;use student;show tables;', '2019-09-11 11:12:48', '13', '4', '<p style=\"margin-top: 0px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">1.查看数据库，选中使用数据库，并查看数据库表，具体操作命令如下：</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">show databases;</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">use student;</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">show tables;</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p><br/></p>', '2', 'MySQL   数据库');
INSERT INTO `t_blog` VALUES ('75', 'Java创建字符串类对象', ' String和StringBuffer、StringBuilder的区别。答：相同点：他们都是字符串缓冲区不同点：1、出现的时机不同（StringBuffer最早出现，String用于字符串操作，StringBuilder单线程，StringBuffer适用于多线程，）2、String是线程安全的；Stri', '2020-02-29 14:00:13', '5', '2', '<p style=\"margin-left:28px\"><span style=\"font:9px &#39;Times New Roman&#39;\">&nbsp;</span><span style=\"font-size:19px\">String</span><span style=\"font-size:19px;font-family:宋体\">和</span><span style=\"font-size:19px\">StringBuffer</span><span style=\"font-size:19px;font-family:宋体\">、</span><span style=\"font-size:19px\">StringBuilder</span><span style=\"font-size:19px;font-family:宋体\">的区别。</span></p><p><span style=\";font-family:宋体\">答：</span></p><p><span style=\"font-size:16px;font-family:宋体\">相同点：他们都是字符串缓冲区</span></p><p><span style=\"font-size:16px;font-family:宋体\">不同点：</span></p><p><span style=\"font-size:16px\">1</span><span style=\"font-size:16px;font-family:宋体\">、出现的时机不同（</span><span style=\"font-size:16px\">StringBuffer</span><span style=\"font-size:16px;font-family:宋体\">最早出现，</span><span style=\"font-size:16px\">String</span><span style=\"font-size:16px;font-family:宋体\">用于字符串操作，</span><span style=\"font-size:16px\">StringBuilder</span><span style=\"font-size: 16px;font-family:宋体\">单线程，</span><span style=\"font-size:16px\">StringBuffer</span><span style=\"font-size: 16px;font-family:宋体\">适用于多线程，）</span></p><p><span style=\"font-size:16px\">2</span><span style=\"font-size:16px;font-family:宋体\">、</span><span style=\"font-size:16px\">String</span><span style=\"font-size:16px;font-family:宋体\">是线程安全的；</span><span style=\"font-size: 16px\">StringBuffer</span><span style=\"font-size:16px;font-family:宋体\">是线程安全的，效率低；</span><span style=\"font-size:16px\">StringBuilder</span><span style=\"font-size: 16px;font-family:宋体\">是线程不安全的，效率高；</span></p><p><span style=\"font-size:16px\">String</span><span style=\"font-size:16px;font-family:宋体\">对象是不可变的，</span><span style=\"font-size:16px\">StringBuffer</span><span style=\"font-size:16px;font-family:宋体\">和</span><span style=\"font-size:16px\">StringBuilder</span><span style=\"font-size: 16px;font-family:宋体\">对象可变</span></p><p><br/></p>', '1', 'java、String、StringBuilder、StringBuffer');
INSERT INTO `t_blog` VALUES ('76', 'Java单列集合', '  List和Set分别有哪些实现类？各个实现类有什么特点。答：LIst的实现类:ArrayList和LinkedList。Set:的实现类:HashSet 和TreeSet。ArrayList :  底层类似于数组结构，向ArrayList中插入与删除元素的速度慢，查询速度快。LinkedList: 底层采', '2020-02-29 14:17:24', '3', '1', '<p style=\"margin-left:28px\"><span style=\"font:9px &#39;Times New Roman&#39;\">&nbsp;&nbsp;</span><span style=\"font-size:19px\">List</span><span style=\"font-size:19px;font-family:宋体\">和</span><span style=\"font-size:19px\">Set</span><span style=\"font-size:19px;font-family:宋体\">分别有哪些实现类？各个实现类有什么特点。</span></p><p><span style=\";font-family:宋体\">答：</span></p><p><span style=\"font-size:16px\">LIst</span><span style=\"font-size:16px;font-family:宋体\">的实现类</span><span style=\"font-size: 16px\">:ArrayList</span><span style=\"font-size:16px;font-family:宋体\">和</span><span style=\"font-size:16px\">LinkedList</span><span style=\"font-size: 16px;font-family:宋体\">。</span></p><p><span style=\"font-size:16px\">Set:</span><span style=\"font-size:16px;font-family:宋体\">的实现类</span><span style=\"font-size: 16px\">:HashSet </span><span style=\"font-size:16px;font-family:宋体\">和</span><span style=\"font-size:16px\">TreeSet</span><span style=\"font-size:16px;font-family:宋体\">。</span></p><p style=\"margin-left:80px\"><span style=\"font-size:16px\">ArrayList&nbsp;: &nbsp;</span><span style=\"font-size:16px;font-family:宋体\">底层类似于数组结构，向</span><span style=\"font-size:16px\">ArrayList</span><span style=\"font-size: 16px;font-family:宋体\">中插入与删除元素的速度慢，查询速度快。</span></p><p><span style=\"font-size:16px\">LinkedList: </span><span style=\"font-size:16px;font-family:宋体\">底层采用链表数据结构，插入和删除速度快，但查询速度慢。</span></p><p><span style=\"font-size:16px\">HashSet</span><span style=\"font-size:16px;font-family:宋体\">：</span><span style=\"font-size:16px\"> &nbsp;HashSet</span><span style=\"font-size:16px;font-family: 宋体\">按照哈希算法来存取集合中的对象，存取速度比较快。</span></p><p><span style=\"font-size:16px\">TreeSet&nbsp;</span><span style=\"font-size:16px;font-family:宋体\">：</span><span style=\"font-size:16px\"> TreeSet</span><span style=\"font-size:16px;font-family:宋体\">实现了</span><span style=\"font-size:16px\">SortedSet</span><span style=\"font-size: 16px;font-family:宋体\">接口，能够对集合中的对象进行排序。</span></p><p><br/></p>', '1', 'ArrayList LinkedLIst');
INSERT INTO `t_blog` VALUES ('77', 'Java中的==与equals（）方法', '1.        ==和equals()的区别。答：==  可以比较所有的数据类型（基本数据类型：比较数值大小；引用数据类型：比较的是对象的地址值大小）equals():只能比较引用数据类型的对象若类中没有重写equals（）方法： 调用就是父类[Object]中的equals方法比较的是地址值 。若类中重', '2020-02-29 14:19:04', '4', '1', '<p style=\"margin-left:28px\">1.<span style=\"font:9px &#39;Times New Roman&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"font-size:19px\">==</span><span style=\"font-size:19px;font-family:宋体\">和</span><span style=\"font-size:19px\">equals()</span><span style=\"font-size:19px;font-family:宋体\">的区别。</span></p><p><span style=\";font-family:宋体\">答：</span><span style=\"font-size:16px\">==&nbsp; </span><span style=\"font-size:16px;font-family:宋体\">可以比较所有的数据类型（基本数据类型：比较数值大小；引用数据类型：比较的是对象的地址值大小）</span></p><p style=\"text-indent:8px\"><span style=\"font-size:16px\">equals():</span><span style=\"font-size: 16px;font-family:宋体\">只能比较引用数据类型的对象</span></p><p style=\"text-indent:8px\"><span style=\"font-size:16px;font-family:宋体\">若类中没有重写</span><span style=\"font-size: 16px\">equals</span><span style=\"font-size:16px;font-family:宋体\">（）方法：</span> <span style=\"font-size:16px;font-family:宋体\">调用就是父类</span><span style=\"font-size: 16px\">[Object]</span><span style=\"font-size:16px;font-family:宋体\">中的</span><span style=\"font-size:16px\">equals</span><span style=\"font-size:16px;font-family: 宋体\">方法比较的是地址值</span> <span style=\"font-size:16px;font-family: 宋体\">。</span></p><p style=\"text-indent:8px\"><span style=\"font-size:16px;font-family:宋体\">若类中重写</span><span style=\"font-size: 16px\">equals</span><span style=\"font-size:16px;font-family:宋体\">（）方法：比较的是对象中属性的内容值是否一致</span> <span style=\"font-size:16px;font-family: 宋体\">。</span></p><p><br/></p>', '1', 'java equals');
INSERT INTO `t_blog` VALUES ('78', 'MySQL', '创建数据库usercreate database user;修改数据库修复数据库的字符集    alter database user default character set utf8;删除数据库drop database admin_user;', '2020-02-29 16:04:14', '1', '0', '<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>创建数据库user</p><p><span style=\"font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; background-color: rgb(255, 255, 255);\">create database user;</span></p></li><li><p>修改数据库</p></li><li>修复数据库的字符集&nbsp;&nbsp;&nbsp;&nbsp;alter database user&nbsp;default character set utf8;</li><li><p>删除数据库</p><p>drop database admin_user;<p><br/></p></p></li></ol>', '2', 'MySQL   数据库创建、修改、删除');
INSERT INTO `t_blog` VALUES ('79', 'MySQL', '创建数据库usercreate database user;修改数据库修复数据库的字符集    alter database user default character set utf8;删除数据库drop database admin_user;', '2020-02-29 16:08:34', '5', '2', '<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>创建数据库user</p><p><span style=\"font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; background-color: rgb(255, 255, 255);\">create database user;</span></p></li><li><p>修改数据库</p></li><li>修复数据库的字符集&nbsp;&nbsp;&nbsp;&nbsp;alter database user&nbsp;default character set utf8;</li><li><p>删除数据库</p><p>drop database admin_user;<p><img src=\"/Blog/static/userImages/20200229/1582963580146074610.jpg\" title=\"1582963580146074610.jpg\" alt=\"0.jpg\"/><br/></p></p></li></ol>', '2', 'MySQL   数据库创建、修改、删除');
INSERT INTO `t_blog` VALUES ('80', '111', '1111111111111', '2020-03-16 11:18:39', '1', '0', '<p>1111111111111</p>', '1', '1');
INSERT INTO `t_blog` VALUES ('81', '线程', '线程休眠：Thread.sleep(long time):使开始的线程休眠多长时间，以ms为单位是静态方法', '2020-03-16 17:07:11', '2', '1', '<p>线程休眠：<br/></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>Thread.sleep(long time):使开始的线程休眠多长时间，以ms为单位</p></li><li><p>是静态方法<img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\" title=\"1584349579009003533.png\" alt=\"hao.png\"/></p></li></ol>', '1', '线程');

-- ----------------------------
-- Table structure for `t_blogger`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogger`;
CREATE TABLE `t_blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博主id',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` char(100) DEFAULT NULL COMMENT '密码',
  `birth` varchar(30) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `registerTime` datetime DEFAULT NULL COMMENT '注册时间',
  `profile` text COMMENT '简介',
  `nickName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sign` varchar(50) DEFAULT NULL COMMENT '个性签名',
  `imageName` varchar(100) DEFAULT NULL COMMENT '图像名',
  `userType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogger
-- ----------------------------
INSERT INTO `t_blogger` VALUES ('1', '风的等待', '6d8ec72ff4e1f92aee2271eebf38a84b', '1995-01-03', null, '123456789@qq.com', null, '<p>我是一名热情开朗的老男孩</p>', '风的等待', '心情真好', '20200229043659.jpg', '2');
INSERT INTO `t_blogger` VALUES ('2', 'hao1', '6d8ec72ff4e1f92aee2271eebf38a84b', '1992-06-11', null, '15647832415@qq.com', null, null, 'hao11', '世界真大，我想去看看', 'right_hand.png', '1');
INSERT INTO `t_blogger` VALUES ('3', 'user1', 'dd8c0d65fc5b77009c89be0dba9e5279', null, null, 'giao@giao.com', null, null, 'giaogiao', null, null, '2');
INSERT INTO `t_blogger` VALUES ('4', 'user2', '97e476a891c2ac7a4a07592caf330c5d', null, null, 'hah@qq.com', null, null, null, null, null, '2');
INSERT INTO `t_blogger` VALUES ('6', 'user3', '33c455b664d6c9dc71b3fff8f5525021', null, null, 'sss', null, null, null, null, null, '2');
INSERT INTO `t_blogger` VALUES ('7', '88', 'cc4133dc4d76b57dd7d1f2066ade24a6', null, null, 'rayfoo@qq.com', null, null, null, null, null, '2');
INSERT INTO `t_blogger` VALUES ('9', 'user4', 'c15955bcc3a43cf7f65514a378269323', null, null, '1234555789@qq.com', null, null, null, null, null, '2');
INSERT INTO `t_blogger` VALUES ('10', 'user5', '6d8ec72ff4e1f92aee2271eebf38a84b', null, null, '123455579@qq.com', null, null, null, null, null, '2');

-- ----------------------------
-- Table structure for `t_blogtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogtype`;
CREATE TABLE `t_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客类别id',
  `typeName` varchar(30) DEFAULT NULL COMMENT '类别名',
  `orderNo` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogtype
-- ----------------------------
INSERT INTO `t_blogtype` VALUES ('1', 'Java核心基础', '1');
INSERT INTO `t_blogtype` VALUES ('2', 'MySQL', '2');
INSERT INTO `t_blogtype` VALUES ('3', 'Tomcat', '3');
INSERT INTO `t_blogtype` VALUES ('4', 'C', '6');
INSERT INTO `t_blogtype` VALUES ('5', 'C++', '7');
INSERT INTO `t_blogtype` VALUES ('7', 'Shiro', '4');
INSERT INTO `t_blogtype` VALUES ('9', 'J2EE', '5');
INSERT INTO `t_blogtype` VALUES ('10', 'JS', '4');
INSERT INTO `t_blogtype` VALUES ('11', 'Mybatis', '5');
INSERT INTO `t_blogtype` VALUES ('12', 'maven', '5');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博文Id',
  `userIp` varchar(50) DEFAULT NULL COMMENT '用户ip',
  `blogId` int(11) DEFAULT NULL COMMENT '博客id',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `commentDate` datetime DEFAULT NULL COMMENT '日期',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('339', '0:0:0:0:0:0:0:1', '74', '安安', '2019-09-15 16:32:55', '1');
INSERT INTO `t_comment` VALUES ('340', '0:0:0:0:0:0:0:1', '74', 'csc', '2019-10-05 15:49:15', '2');
INSERT INTO `t_comment` VALUES ('341', '0:0:0:0:0:0:0:1', '74', 'aa1', '2020-02-26 21:57:30', '2');
INSERT INTO `t_comment` VALUES ('342', '0:0:0:0:0:0:0:1', '75', '讲的比较透彻啊', '2020-02-29 14:01:44', '1');
INSERT INTO `t_comment` VALUES ('343', '0:0:0:0:0:0:0:1', '75', 'String创建的对象为值不可改变！', '2020-02-29 14:03:12', '1');
INSERT INTO `t_comment` VALUES ('344', '0:0:0:0:0:0:0:1', '77', 'good', '2020-02-29 14:21:11', '1');
INSERT INTO `t_comment` VALUES ('345', '0:0:0:0:0:0:0:1', '76', '懂了', '2020-02-29 14:21:48', '1');
INSERT INTO `t_comment` VALUES ('346', '0:0:0:0:0:0:0:1', '79', '过程讲的很细致哦，赞！', '2020-02-29 16:47:40', '1');
INSERT INTO `t_comment` VALUES ('347', '0:0:0:0:0:0:0:1', '79', 'sda', '2020-03-16 11:17:55', '1');
INSERT INTO `t_comment` VALUES ('348', '0:0:0:0:0:0:0:1', '81', '优秀', '2020-03-16 17:13:43', '0');

-- ----------------------------
-- Table structure for `t_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '链接id',
  `linkName` varchar(100) DEFAULT NULL COMMENT '链接名',
  `linkUrl` varchar(200) DEFAULT NULL COMMENT '链接网址',
  `orderNo` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES ('1', 'Java知识分享网', 'http://www.java1234.com/', '1');
INSERT INTO `t_link` VALUES ('2', '百度云搜索引擎', 'http://pan.java1234.com/', '2');
INSERT INTO `t_link` VALUES ('3', '小图标下载', 'http://www.easyicon.net/', '3');
INSERT INTO `t_link` VALUES ('5', '免费logo在线制作', 'http://www.uugai.com/', '5');
