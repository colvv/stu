package com.vv.stu.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class StudentServiceImpl extends BaseService {

	public boolean addStu(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("insertstu", tParams));
			tPubCommitDao.doCommit(new DaoOperator("insertstuinfo", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean delStu(String stu_id) {
		try {
			Map tParams = new HashMap();
			tParams.put("stu_id", stu_id);
			tPubCommitDao.doCommit(new DaoOperator("deletestu", tParams));
			tPubCommitDao.doCommit(new DaoOperator("deletestuinfo", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean modStu(Map tParams) {
		try {
			// 没有考虑 没有学生信息的情况
			tPubCommitDao.doCommit(new DaoOperator("updatestu", tParams));
			tPubCommitDao.doCommit(new DaoOperator("updatestuinfo", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public Map getStu(String stu_id) {
		try {
			return tDefaultQueryDao
					.commonQuery_SQL(
							"SELECT stu.stu_id,stu.stu_name,stu_little_name stu_lt_name,stu_sex,DATE_FORMAT(stu_birthday,'%Y-%m-%d') stu_birthday,stu_kindergarten,stu_address,stu_phone,stu_backinfo FROM vv_student stu LEFT JOIN vv_student_info stu_in ON stu.stu_id=stu_in.stu_id WHERE stu.stu_id='"
									+ stu_id + "'").get(0);
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return null;
	}

}
