package com.vv.stu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class StudentServiceImpl extends BaseService {

	public boolean addStu(String stu_no, String stu_name) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("INSERT INTO vv_student (STU_ID, STU_NAME, STU_MAKE_TIME) VALUES ('" + stu_no + "', '"
					+ stu_name + "', NOW())", DaoOperator.INSERT));
			tPubCommitDao
					.doCommit(new DaoOperator(
							"INSERT INTO vv_student_info (STU_ID, STU_LITTLE_NAME, STU_SEX, STU_BIRTHDAY, STU_KINDERGARTEN, STU_ADDRESS, STU_PHONE, STU_BELONG_TEACHER, STU_BACKINFO, STU_SOURCE) VALUES ('"
									+ stu_no + "', '" + stu_name + "', '1', 1, '1', '1', '1', '1', '1', '1');", DaoOperator.INSERT));
			return true;
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}

}
