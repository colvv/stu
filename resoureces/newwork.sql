/*
SQLyog Ultimate v11.52 (64 bit)
MySQL - 5.5.25 : Database - stu_new
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stu_new` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stu_new`;

/*Table structure for table `vv_class` */

DROP TABLE IF EXISTS `vv_class`;

CREATE TABLE `vv_class` (
  `class_id` varchar(10) NOT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  `class_desc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_class` */

/*Table structure for table `vv_class_rela` */

DROP TABLE IF EXISTS `vv_class_rela`;

CREATE TABLE `vv_class_rela` (
  `class_id` varchar(10) NOT NULL,
  `rela_id` varchar(10) NOT NULL,
  `rela_type` varchar(2) NOT NULL,
  PRIMARY KEY (`class_id`,`rela_id`,`rela_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_class_rela` */

/*Table structure for table `vv_lesson` */

DROP TABLE IF EXISTS `vv_lesson`;

CREATE TABLE `vv_lesson` (
  `LES_ID` varchar(6) NOT NULL,
  `LES_NAME` varchar(40) NOT NULL,
  `LES_TYPE` varchar(2) NOT NULL,
  `LES_DES` varchar(2000) DEFAULT NULL,
  `LES_START_TIME` int(11) DEFAULT NULL,
  `LES_END_TIME` int(11) DEFAULT NULL,
  `LES_LESSON_COUNT` int(11) DEFAULT NULL,
  `LES_LESSON_TIME` int(11) DEFAULT NULL,
  `LES_WEEK_TYPE` varchar(2) DEFAULT NULL,
  `LES_STATE` varchar(2) DEFAULT NULL,
  `LES_CREATE_USER` varchar(20) DEFAULT NULL,
  `LES_CREATE_TIME` datetime DEFAULT NULL,
  `LES_FEE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`LES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_lesson` */

/*Table structure for table `vv_stu_lesson` */

DROP TABLE IF EXISTS `vv_stu_lesson`;

CREATE TABLE `vv_stu_lesson` (
  `STU_LES_SERIALNO` varchar(16) NOT NULL,
  `STU_ID` varchar(10) NOT NULL,
  `LES_ID` varchar(6) NOT NULL,
  `START_DATE` int(11) DEFAULT NULL,
  `END_DATE` int(11) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `AL_LES_TIME` int(11) DEFAULT NULL,
  `AL_LES_COUNT` int(11) DEFAULT NULL,
  `PAY_TYPE` varchar(2) DEFAULT NULL,
  `PAY_TO_DATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`STU_LES_SERIALNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_stu_lesson` */

/*Table structure for table `vv_stu_lesson_detail` */

DROP TABLE IF EXISTS `vv_stu_lesson_detail`;

CREATE TABLE `vv_stu_lesson_detail` (
  `STU_LES_SERIALNO` varchar(16) NOT NULL,
  `STU_LES_DATE` int(11) DEFAULT NULL,
  `STU_LES_STATE` varchar(2) DEFAULT NULL,
  `STU_LES_RELA_ID` int(11) DEFAULT NULL,
  `STU_LES_TEA_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`STU_LES_SERIALNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_stu_lesson_detail` */

/*Table structure for table `vv_student` */

DROP TABLE IF EXISTS `vv_student`;

CREATE TABLE `vv_student` (
  `STU_ID` varchar(10) NOT NULL,
  `STU_NAME` varchar(20) NOT NULL,
  `STU_MAKE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_student` */

insert  into `vv_student`(`STU_ID`,`STU_NAME`,`STU_MAKE_TIME`) values ('2015000001','超','2015-02-25 16:02:14'),('2015000002','级','2015-02-25 16:02:20'),('2015000003','赛','2015-02-25 16:02:26'),('2015000004','亚','2015-02-25 16:02:32'),('2015000005','人','2015-02-25 16:02:37'),('2015000006','抽扯获','2015-02-25 16:13:38'),('2015000007','易水寒','2015-02-26 08:55:40'),('2015000013','易水寒2','2015-02-26 16:45:24'),('2015000014','易水寒3','2015-02-26 16:50:09'),('2015000019','易水寒','2015-02-26 16:54:07'),('2015000020','易水寒','2015-02-26 16:54:11'),('2015000021','易水寒','2015-02-26 16:54:15'),('2015000022','易水寒','2015-02-26 16:54:19'),('2015000023','易水寒','2015-02-26 16:54:24'),('2015000024','易水寒','2015-02-26 16:54:28'),('2015000025','易水寒','2015-02-26 16:54:35'),('2015000026','易水寒','2015-02-26 16:54:39'),('2015000029','巫医','2015-02-26 17:11:08');

/*Table structure for table `vv_student_info` */

DROP TABLE IF EXISTS `vv_student_info`;

CREATE TABLE `vv_student_info` (
  `STU_ID` varchar(10) NOT NULL,
  `STU_LITTLE_NAME` varchar(20) DEFAULT NULL,
  `STU_SEX` varchar(1) DEFAULT NULL,
  `STU_BIRTHDAY` int(11) DEFAULT NULL,
  `STU_KINDERGARTEN` varchar(80) DEFAULT NULL,
  `STU_ADDRESS` varchar(200) DEFAULT NULL,
  `STU_PHONE` varchar(20) DEFAULT NULL,
  `STU_BELONG_TEACHER` varchar(20) DEFAULT NULL,
  `STU_BACKINFO` varchar(400) DEFAULT NULL,
  `STU_SOURCE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`STU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_student_info` */

insert  into `vv_student_info`(`STU_ID`,`STU_LITTLE_NAME`,`STU_SEX`,`STU_BIRTHDAY`,`STU_KINDERGARTEN`,`STU_ADDRESS`,`STU_PHONE`,`STU_BELONG_TEACHER`,`STU_BACKINFO`,`STU_SOURCE`) values ('2015000007','哈哈','0',19891010,'新建路','北大街','13803439351','1','这人很厉害','1'),('2015000013','哈哈','0',19891010,'新建路','北大街','13803439351','1','','1'),('2015000014','哈哈','1',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000019','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000020','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000021','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000022','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000023','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000024','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000025','哈哈','0',19891010,'新建路','北大街','13803439351','1','我擦','1'),('2015000026','哈哈','0',19891010,'新建路','北大街','13803439351','1','','1'),('2015000029','','0',10551010,'','','51515151551','1','我住在那个山啊山啊山','1');

/*Table structure for table `vv_student_info_old` */

DROP TABLE IF EXISTS `vv_student_info_old`;

CREATE TABLE `vv_student_info_old` (
  `STU_ID` varchar(10) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `STU_LITTLE_NAME` varchar(20) NOT NULL,
  `STU_SEX` varchar(1) DEFAULT NULL,
  `STU_BIRTHDAY` int(11) DEFAULT NULL,
  `STU_KINDERGARTEN` varchar(80) DEFAULT NULL,
  `STU_ADDRESS` varchar(200) DEFAULT NULL,
  `STU_PHONE` varchar(20) DEFAULT NULL,
  `STU_BELONG_TEACHER` varchar(20) DEFAULT NULL,
  `STU_BACKINFO` varchar(400) DEFAULT NULL,
  `STU_SOURCE` varchar(2) DEFAULT NULL,
  UNIQUE KEY `IDXU_vv_studenold_STU_ID` (`STU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_student_info_old` */

/*Table structure for table `vv_sys_code` */

DROP TABLE IF EXISTS `vv_sys_code`;

CREATE TABLE `vv_sys_code` (
  `codetype` varchar(40) NOT NULL,
  `code` varchar(20) NOT NULL,
  `codename` varchar(80) DEFAULT NULL,
  `codealias` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codetype`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_code` */

insert  into `vv_sys_code`(`codetype`,`code`,`codename`,`codealias`) values ('lesson_type','01','基础课程',''),('student_state','03','我的世界','我的世界'),('student_state','04','他的世界',''),('student_type','01','系统管理员',NULL),('student_type','02','我擦1',''),('student_type','03','我要你',''),('student_type','043','达到','332121 '),('student_type','06','我靠','大口大口大口啃'),('student_type','09','我去','擦擦啊'),('student_type','099','挖槽','213213'),('student_type','10','haha','误区'),('student_type','11','123','但洒洒'),('student_type','12','要有秩序',''),('student_type','13','排排坐','吃果果'),('student_type','14','误区','达到'),('student_type','213231','213213',''),('student_type','91','213','达到');

/*Table structure for table `vv_sys_code_conf` */

DROP TABLE IF EXISTS `vv_sys_code_conf`;

CREATE TABLE `vv_sys_code_conf` (
  `codetype` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(400) DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  PRIMARY KEY (`codetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_code_conf` */

insert  into `vv_sys_code_conf`(`codetype`,`name`,`desc`,`editable`) values ('lesson_type','课程类型','课程类型 唯一',0),('student_state','学生状态','学生状态枚举',0),('student_type','学生类型','学生类型的枚举项a b c',0);

/*Table structure for table `vv_sys_maxno` */

DROP TABLE IF EXISTS `vv_sys_maxno`;

CREATE TABLE `vv_sys_maxno` (
  `id` varchar(11) NOT NULL,
  `no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_maxno` */

insert  into `vv_sys_maxno`(`id`,`no`) values ('stu_id2015',30),('sysuser',9);

/*Table structure for table `vv_sys_menu` */

DROP TABLE IF EXISTS `vv_sys_menu`;

CREATE TABLE `vv_sys_menu` (
  `menu_id` varchar(10) NOT NULL,
  `menu_name` varchar(40) NOT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `open_power` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_menu` */

insert  into `vv_sys_menu`(`menu_id`,`menu_name`,`menu_url`,`open_power`) values ('101|1','学生报名','bootstrap.do',NULL),('102|1','学生退学',NULL,NULL),('103|1','学生信息','/stu/stuList.do',NULL),('1|0','学生管理',NULL,NULL),('2|0','教师管理','/tea/index.do',NULL),('301|3','系统用户管理','/sys/userIndex.do',NULL),('302|3','菜单管理','/sys/menu/menuIndex.do',NULL),('303|3','用户菜单管理','/sys/menu/userMenuIndex.do',NULL),('304|3','系统枚举','/sys/code/confIndex.do',NULL),('3|0','系统管理',NULL,NULL);

/*Table structure for table `vv_sys_user` */

DROP TABLE IF EXISTS `vv_sys_user`;

CREATE TABLE `vv_sys_user` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `rela_role_id` varchar(10) DEFAULT NULL,
  `user_password` varchar(45) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `user_state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_user` */

insert  into `vv_sys_user`(`user_id`,`user_name`,`user_phone`,`rela_role_id`,`user_password`,`last_login_time`,`user_state`) values ('000002','我擦','13403517100',NULL,'14e1b600b1fd579f47433b88e8d85291',NULL,NULL),('000003','新用户','13403517100',NULL,'2072d493c4fc8bc11b8d2f6f49d178c9',NULL,NULL),('000006','我擦','13403517100',NULL,'',NULL,NULL),('admin','系统管理员','13403517100',NULL,'0c909a141f1f2c0a1cb602b0b2d7d050',NULL,NULL),('sy000001','haha好','13403517105','100','','2015-02-27 10:33:58','01'),('SY000007','wlgq','',NULL,'b626940cf772654ed931b05be5722121',NULL,NULL),('SY000008','王毅','13403517100',NULL,'03557285e0c7dcf73459ef5cbee4551c',NULL,NULL),('SY000009','王毅','',NULL,'03557285e0c7dcf73459ef5cbee4551c',NULL,NULL),('wangyi','王毅','',NULL,'07932f02f3323059544d188be8e847e7','2015-03-04 17:52:38',NULL),('wangyi2','王毅','',NULL,'03557285e0c7dcf73459ef5cbee4551c',NULL,NULL),('wangyi3','213123','13132321321',NULL,'5b32af2e42cbaa6bdcf216b65cd8287c','2015-02-28 16:11:39',NULL),('wcccccc','eddasdsadasd','',NULL,'044e2952bf40ecc61933d8ad16e0074c',NULL,NULL);

/*Table structure for table `vv_teacher` */

DROP TABLE IF EXISTS `vv_teacher`;

CREATE TABLE `vv_teacher` (
  `TEA_ID` varchar(10) NOT NULL,
  `TEA_NAME` varchar(20) NOT NULL,
  `TEA_STATE` varchar(2) DEFAULT NULL,
  `TEA_TYPE` varchar(2) DEFAULT NULL,
  `TEA_SEX` varchar(1) DEFAULT NULL,
  `TEA_BIRTHDAY` int(11) DEFAULT NULL,
  `TEA_PHONE` varchar(20) DEFAULT NULL,
  `TEA_ADDRESS` varchar(200) DEFAULT NULL,
  `TEA_DESC` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`TEA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_teacher` */

insert  into `vv_teacher`(`TEA_ID`,`TEA_NAME`,`TEA_STATE`,`TEA_TYPE`,`TEA_SEX`,`TEA_BIRTHDAY`,`TEA_PHONE`,`TEA_ADDRESS`,`TEA_DESC`) values ('1','wanyi',NULL,'1','s',1,'1340','address','this is describe'),('2','wanyi','st',NULL,'s',1,'1340','address','this is describe'),('3','wanyi','st','1',NULL,1,'1340','address','this is describe'),('4','wanyi','st','1','s',NULL,'1340','address','this is describe'),('5','wanyi','st','1','s',1,NULL,'address','this is describe'),('6','wanyi','st','1','s',1,'1340',NULL,'this is describe'),('7','wanyi','st','1','s',1,'1340','address',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
