package com.vv.stu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class TeacherServiceImpl extends BaseService {

	public Map selectTeacher(Map tParams) {
		try {
			return tDefaultQueryDao.commonQuery_SQL(new DaoOperator("tea_001", tParams)).get(0);
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return null;
	}

	public boolean insertTeacher(Map tParams) {
		try {
			if (1 != tPubCommitDao.doCommit(new DaoOperator("insertTeacher", tParams))) {
				return false;
			}
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean updateTeacher(Map tParams) {
		try {
			if (1 != tPubCommitDao.doCommit(new DaoOperator("updateTeacher", tParams))) {
				return false;
			}
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;

	}

	public boolean deleteTeacher(Map tParams) {
		try {
			if (1 != tPubCommitDao.doCommit(new DaoOperator("deleteTeacher", tParams))) {
				return false;
			}
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;

	}
}
