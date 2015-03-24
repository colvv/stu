DELETE FROM vv_sys_maxno; #  删除流水
DELETE FROM vv_sys_user; #  删除用户插入管理员
INSERT INTO `vv_sys_user` (`user_id`, `user_name`, `user_phone`, `rela_role_id`, `user_password`, `last_login_time`, `user_state`) VALUES('admin','王毅','13403517100',NULL,'646763b8f3769adc073bedb21d83e47b',NULL,NULL);
DELETE FROM vv_student; # 删除学生
DELETE FROM vv_student_info;
DELETE FROM vv_finance; #删除财务
DELETE FROM vv_sys_code WHERE codetype IN ('11');
DELETE FROM vv_sys_user_menu; #菜单权限
DELETE FROM vv_teacher; #老师
DELETE FROM vv_lesson; #课程
UPDATE vv_sys_menu SET open_power = NULL;


