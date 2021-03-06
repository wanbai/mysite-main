/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : app_rayzy1991

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2013-06-28 09:39:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add log entry', '6', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('17', 'Can change log entry', '6', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete log entry', '6', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('19', 'Can add image', '7', 'add_image');
INSERT INTO `auth_permission` VALUES ('20', 'Can change image', '7', 'change_image');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete image', '7', 'delete_image');
INSERT INTO `auth_permission` VALUES ('22', 'Can add tag', '8', 'add_tag');
INSERT INTO `auth_permission` VALUES ('23', 'Can change tag', '8', 'change_tag');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete tag', '8', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('25', 'Can add article', '9', 'add_article');
INSERT INTO `auth_permission` VALUES ('26', 'Can change article', '9', 'change_article');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete article', '9', 'delete_article');
INSERT INTO `auth_permission` VALUES ('28', 'Can add comment', '10', 'add_comment');
INSERT INTO `auth_permission` VALUES ('29', 'Can change comment', '10', 'change_comment');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete comment', '10', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('31', 'Can add trend', '11', 'add_trend');
INSERT INTO `auth_permission` VALUES ('32', 'Can change trend', '11', 'change_trend');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete trend', '11', 'delete_trend');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'ray', '', '', 'rayzy1991@163.com', 'pbkdf2_sha256$10000$wXNaYTPF62qp$nbLmzUFCwFHnEMJdEVx8bnazRIlC+v+nynye1EHAnoc=', '1', '1', '1', '2013-06-27 12:56:29', '2013-06-27 12:56:29');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'image', 'image', 'image');
INSERT INTO `django_content_type` VALUES ('8', 'tag', 'article', 'tag');
INSERT INTO `django_content_type` VALUES ('9', 'article', 'article', 'article');
INSERT INTO `django_content_type` VALUES ('10', 'comment', 'article', 'comment');
INSERT INTO `django_content_type` VALUES ('11', 'trend', 'trend', 'trend');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_articles`
-- ----------------------------
DROP TABLE IF EXISTS `ms_articles`;
CREATE TABLE `ms_articles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `desc` varchar(256) default NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) default NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ms_articles_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_2986dbd1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_articles
-- ----------------------------
INSERT INTO `ms_articles` VALUES ('0', '关于我', '关于我', '2013-06-27 12:57:59', '2013-06-28 01:24:56', '1', '1', '<p>我是张杨，91年1月生，江苏徐州人，2012年6月大学毕业，学得嵌入式专业，可是大学光玩了，也没学好。</p><p>2011年底，大学没有学到实在的技能，<span style=\"line-height: 1.6em;\">直接走向社会等于自取灭亡</span><span style=\"line-height: 1.6em;\">，所以我去参加了一个JavaEE开发的培训，当时没想别的，就是掌握一个技术，抱上铁饭碗，这样，我也算是误打误撞进入了IT行业。</span></p><p>在培训期间，我无时不刻都在挖掘自身的潜力，由于花了大量的学费，再加上紧迫与使命感，我对软件技术的热情以及自身的技能在不断增长着，就这样，我也算是圆满的完成了培训的课程，毕业时基本掌握了基于Spring的WEB技术体系。</p><p>2012年3月在天津，加入了一个创业互联网公司（canditu.com），做JavaWEB开发，当时包揽了该网站所有的技术工作。创业互联网公司，每天都需要研究各种新技术，尝试各种新鲜玩意，而且还需要自己参加产品设计，包括UI和交互。在同年，我通过各种渠道接触了“前端工程师”这一职业定义，由于自身有美术功底，加上特别钟爱设计，结合自身的职业特点，我确定，“前端”这个职业是我所爱的。</p><p>现在，我在南京做WEB前端工程师，负责前端开发和UX设计。</p><p>我使用Java和Python两种后端语言，致力于前端开发，专攻HTML5与JavaScript。我主要使用Spring和django两个WEB框架。我是一个以产品为导向的人，任何技术与设计的价值在我的概念里都体现在解决市场需求。我反对沉溺于技术，我觉得那是不实际的做法，但我不会丢掉技术情怀，因为技术始终是我的立身之本，经过了两年的锤炼，现在的我技术功底很扎实，与传统的软件工程师比起来，我对自己的评价更是“产品工程师”。</p>');

-- ----------------------------
-- Table structure for `ms_articles_imgs`
-- ----------------------------
DROP TABLE IF EXISTS `ms_articles_imgs`;
CREATE TABLE `ms_articles_imgs` (
  `id` int(11) NOT NULL auto_increment,
  `article_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `article_id` (`article_id`,`image_id`),
  KEY `ms_articles_imgs_30525a19` (`article_id`),
  KEY `ms_articles_imgs_6682136` (`image_id`),
  CONSTRAINT `article_id_refs_id_6e69f723` FOREIGN KEY (`article_id`) REFERENCES `ms_articles` (`id`),
  CONSTRAINT `image_id_refs_id_5440f64a` FOREIGN KEY (`image_id`) REFERENCES `ms_images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_articles_imgs
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_articles_tags`
-- ----------------------------
DROP TABLE IF EXISTS `ms_articles_tags`;
CREATE TABLE `ms_articles_tags` (
  `id` int(11) NOT NULL auto_increment,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `ms_articles_tags_30525a19` (`article_id`),
  KEY `ms_articles_tags_3747b463` (`tag_id`),
  CONSTRAINT `article_id_refs_id_43331332` FOREIGN KEY (`article_id`) REFERENCES `ms_articles` (`id`),
  CONSTRAINT `tag_id_refs_id_198faa48` FOREIGN KEY (`tag_id`) REFERENCES `ms_tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_articles_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_comments`
-- ----------------------------
DROP TABLE IF EXISTS `ms_comments`;
CREATE TABLE `ms_comments` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `desc` varchar(256) default NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) default NULL,
  `article_id` int(11) default NULL,
  `komment_id` int(11) default NULL,
  `root_komment_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ms_comments_403f60f` (`user_id`),
  KEY `ms_comments_30525a19` (`article_id`),
  KEY `ms_comments_3685aac4` (`komment_id`),
  KEY `ms_comments_660555d6` (`root_komment_id`),
  CONSTRAINT `article_id_refs_id_1f97a6a6` FOREIGN KEY (`article_id`) REFERENCES `ms_articles` (`id`),
  CONSTRAINT `komment_id_refs_id_6d42e7c9` FOREIGN KEY (`komment_id`) REFERENCES `ms_comments` (`id`),
  CONSTRAINT `root_komment_id_refs_id_6d42e7c9` FOREIGN KEY (`root_komment_id`) REFERENCES `ms_comments` (`id`),
  CONSTRAINT `user_id_refs_id_1de7bc2a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_images`
-- ----------------------------
DROP TABLE IF EXISTS `ms_images`;
CREATE TABLE `ms_images` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `desc` varchar(256) default NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `path` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_images
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_tags`
-- ----------------------------
DROP TABLE IF EXISTS `ms_tags`;
CREATE TABLE `ms_tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `desc` varchar(256) default NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_trends`
-- ----------------------------
DROP TABLE IF EXISTS `ms_trends`;
CREATE TABLE `ms_trends` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `desc` varchar(256) default NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `path` varchar(200) default NULL,
  `content` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ms_trends
-- ----------------------------
