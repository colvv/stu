/*
-- Query: select * from vv_sys_menu
LIMIT 0, 1000

-- Date: 2015-03-16 00:29
*/
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('101|1','学生报名','bootstrap.do','1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('102|1','学生退学',NULL,'1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('103|1','学生信息','/stu/stuList.do','1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('1|0','学生管理',NULL,'0');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('2|0','教师管理','/tea/index.do','1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('301|3','系统用户管理','/sys/userIndex.do','1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('302|3','菜单管理','/sys/menu/menuIndex.do','1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('304|3','系统枚举','/sys/code/confIndex.do','1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('3|0','系统管理',NULL,'1');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('401|4','新建收支','/fin/createFinance.do',NULL);
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('402|4','收支信息','/fin/recentFinance.do',NULL);
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('4|0','财务管理',NULL,'0');
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('501|5','课程管理','/lesson/lessonIndex.do',NULL);
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('502|5','班级管理','/class/classIndex.do',NULL);
INSERT INTO `vv_sys_menu` (`menu_id`,`menu_name`,`menu_url`,`open_power`) VALUES ('5|0','班级课程管理',NULL,NULL);
