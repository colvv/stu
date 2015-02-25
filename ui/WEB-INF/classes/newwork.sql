/*
SQLyog Ultimate v11.52 (64 bit)
MySQL - 5.5.25 : Database - stu_new
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
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

insert  into `vv_student`(`STU_ID`,`STU_NAME`,`STU_MAKE_TIME`) values ('2008000001','王毅','2015-02-13 10:39:58'),('2008000002','王唲','2015-02-13 15:24:17');

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

insert  into `vv_student_info`(`STU_ID`,`STU_LITTLE_NAME`,`STU_SEX`,`STU_BIRTHDAY`,`STU_KINDERGARTEN`,`STU_ADDRESS`,`STU_PHONE`,`STU_BELONG_TEACHER`,`STU_BACKINFO`,`STU_SOURCE`) values ('2008000001','牛牛','0',20150213,'育蕾幼儿园','030001','13403517100',NULL,'哈哈',NULL),('2008000002','二二',NULL,NULL,'我擦',NULL,NULL,NULL,NULL,NULL);

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

/*Table structure for table `vv_sys_maxno` */

DROP TABLE IF EXISTS `vv_sys_maxno`;

CREATE TABLE `vv_sys_maxno` (
  `id` int(11) NOT NULL,
  `no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_maxno` */

insert  into `vv_sys_maxno`(`id`,`no`) values (33,2),(333,3);

/*Table structure for table `vv_sys_menu` */

DROP TABLE IF EXISTS `vv_sys_menu`;

CREATE TABLE `vv_sys_menu` (
  `menu_id` varchar(10) NOT NULL,
  `menu_name` varchar(40) NOT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_menu` */

insert  into `vv_sys_menu`(`menu_id`,`menu_name`,`menu_url`) values ('101|1','学生报名','bootstrap.do'),('102|1','学生退学',NULL),('103|1','学生信息','/stu/stuList.do'),('1|0','学生管理',NULL),('2|0','教师管理','/tea/index.do'),('301|3','系统用户管理','/sys/userIndex.do'),('3|0','系统管理',NULL);

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
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
