package com.vv.stu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;

@Service
public class StudentServiceImpl extends BaseService {

	public boolean addStu(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("insertstu", tParams));
			tPubCommitDao.doCommit(new DaoOperator("insertstuinfo", tParams));
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

	public boolean modStu(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("updatestu", tParams));
			tPubCommitDao.doCommit(new DaoOperator("updatestuinfo", tParams));
			return true;
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}

	public Map getStu(String stu_id) {
		try {
			return tDefaultQueryDao
					.commonQuery_SQL(
							"SELECT stu.stu_id,stu.stu_name,stu_little_name stu_lt_name,stu_sex,DATE_FORMAT(stu_birthday,'%Y-%m-%d') stu_birthday,stu_kindergarten,stu_address,stu_phone,stu_backinfo FROM vv_student stu LEFT JOIN vv_student_info stu_in ON stu.stu_id=stu_in.stu_id WHERE stu.stu_id='"
									+ stu_id + "'").get(0);
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}

}
