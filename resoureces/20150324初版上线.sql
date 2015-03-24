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
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_class` */

/*Table structure for table `vv_class_lesson` */

DROP TABLE IF EXISTS `vv_class_lesson`;

CREATE TABLE `vv_class_lesson` (
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
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LES_FEE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`LES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_class_lesson` */

/*Table structure for table `vv_class_rela` */

DROP TABLE IF EXISTS `vv_class_rela`;

CREATE TABLE `vv_class_rela` (
  `class_id` varchar(10) NOT NULL,
  `rela_id` varchar(10) NOT NULL,
  `rela_type` varchar(2) NOT NULL,
  PRIMARY KEY (`class_id`,`rela_id`,`rela_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_class_rela` */

/*Table structure for table `vv_finance` */

DROP TABLE IF EXISTS `vv_finance`;

CREATE TABLE `vv_finance` (
  `fin_id` varchar(20) NOT NULL,
  `fin_create_type` varchar(2) DEFAULT NULL,
  `fin_rela_id` varchar(40) DEFAULT NULL,
  `fin_date` int(11) DEFAULT NULL,
  `fin_type` varchar(10) DEFAULT NULL,
  `fin_money` decimal(20,2) DEFAULT NULL,
  `fin_rela_user` varchar(10) DEFAULT NULL,
  `fin_user` varchar(10) DEFAULT NULL,
  `fin_record_time` datetime DEFAULT NULL,
  `fin_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_finance` */

/*Table structure for table `vv_lesson` */

DROP TABLE IF EXISTS `vv_lesson`;

CREATE TABLE `vv_lesson` (
  `LES_ID` varchar(6) DEFAULT NULL,
  `LES_NAME` varchar(40) DEFAULT NULL,
  `LES_TYPE` varchar(2) DEFAULT NULL,
  `LES_TYPE2` varchar(2) DEFAULT NULL,
  `LES_TYPE3` varchar(2) DEFAULT NULL,
  `LES_TYPE4` varchar(2) DEFAULT NULL,
  `LES_DESC` varchar(2000) DEFAULT NULL,
  `LES_STATE` varchar(2) DEFAULT NULL,
  `LES_STATE2` varchar(2) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
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
  `codeorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`codetype`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_code` */

insert  into `vv_sys_code`(`codetype`,`code`,`codename`,`codealias`,`codeorder`) values ('date_choicer','hand','手动选择',NULL,3),('date_choicer','month','最近一月',NULL,1),('date_choicer','week','最近一周',NULL,0),('date_choicer','year','最近一年',NULL,2),('fin_oi_type','0','收入类',NULL,NULL),('fin_oi_type','1','支出类',NULL,NULL),('fin_type','001','学费',NULL,NULL),('fin_type','002','教材费用',NULL,NULL),('fin_type','003','餐费',NULL,NULL),('fin_type','004','文具费','',NULL),('fin_type','005',' 增加测试','',NULL),('fin_type','099','其他','',NULL),('fin_type','101','采购器材',NULL,NULL),('fin_type','102','采购教材',NULL,NULL),('fin_type','103','教师工资',NULL,NULL),('fin_type','104','活动费用',NULL,NULL),('fin_type','199','其他','',NULL),('frequency_choicer','day','日',NULL,0),('frequency_choicer','month','月',NULL,2),('frequency_choicer','week','周',NULL,1);

/*Table structure for table `vv_sys_code_conf` */

DROP TABLE IF EXISTS `vv_sys_code_conf`;

CREATE TABLE `vv_sys_code_conf` (
  `codetype` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(400) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_code_conf` */

insert  into `vv_sys_code_conf`(`codetype`,`name`,`desc`,`editable`) values ('fin_type','收支类型','0开头的为收入类1开头的为支出类',0),('lesson_type','课程类型','课程类型 唯一',0),('student_state','学生状态','学生状态枚举',0),('student_type','学生类型','学生类型的枚举项a b c',0);

/*Table structure for table `vv_sys_maxno` */

DROP TABLE IF EXISTS `vv_sys_maxno`;

CREATE TABLE `vv_sys_maxno` (
  `id` varchar(11) NOT NULL,
  `no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_maxno` */

/*Table structure for table `vv_sys_menu` */

DROP TABLE IF EXISTS `vv_sys_menu`;

CREATE TABLE `vv_sys_menu` (
  `menu_id` varchar(10) NOT NULL,
  `menu_name` varchar(40) NOT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `open_power` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_menu` */

insert  into `vv_sys_menu`(`menu_id`,`menu_name`,`menu_url`,`open_power`) values ('103|1','学生信息','/stu/stuList.do',NULL),('1|0','学生管理',NULL,NULL),('301|3','系统用户管理','/sys/userIndex.do',NULL),('302|3','菜单管理','/sys/menu/menuIndex.do',NULL),('304|3','系统枚举','/sys/code/confIndex.do',NULL),('3|0','系统管理',NULL,NULL),('401|4','新建收支','/fin/createFinance.do',NULL),('402|4','收支信息','/fin/recentFinance.do',NULL),('4|0','财务管理',NULL,NULL),('501|5','课程管理','/les/lessonIndex.do',NULL),('502|5','班级管理','/class/classIndex.do',NULL),('5|0','班级课程管理',NULL,NULL);

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

insert  into `vv_sys_user`(`user_id`,`user_name`,`user_phone`,`rela_role_id`,`user_password`,`last_login_time`,`user_state`) values ('admin','王毅','13403517100',NULL,'646763b8f3769adc073bedb21d83e47b',NULL,NULL);

/*Table structure for table `vv_sys_user_menu` */

DROP TABLE IF EXISTS `vv_sys_user_menu`;

CREATE TABLE `vv_sys_user_menu` (
  `user_id` varchar(20) NOT NULL,
  `menu_id` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vv_sys_user_menu` */

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
