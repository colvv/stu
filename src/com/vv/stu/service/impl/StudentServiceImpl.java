package com.vv.stu.service.impl;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;

@Service
public class StudentServiceImpl extends BaseService {

	public boolean addStu(String stu_id, String stu_name) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("INSERT INTO vv_student (STU_ID, STU_NAME, STU_MAKE_TIME) VALUES ('" + stu_id + "', '"
					+ stu_name + "', NOW())", DaoOperator.INSERT));
			tPubCommitDao
					.doCommit(new DaoOperator(
							"INSERT INTO vv_student_info (STU_ID, STU_LITTLE_NAME, STU_SEX, STU_BIRTHDAY, STU_KINDERGARTEN, STU_ADDRESS, STU_PHONE, STU_BELONG_TEACHER, STU_BACKINFO, STU_SOURCE) VALUES ('"
									+ stu_id + "', '" + stu_name + "', '1', 1, '1', '1', '1', '1', '1', '1');", DaoOperator.INSERT));
			return true;
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}

	public boolean delStu(String stu_id) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("DELETE FROM vv_student WHERE stu_id='" + stu_id + "'", DaoOperator.DELETE));
			tPubCommitDao.doCommit(new DaoOperator("DELETE FROM vv_student_info WHERE stu_id='" + stu_id + "'", DaoOperator.DELETE));
			return true;
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}

}
