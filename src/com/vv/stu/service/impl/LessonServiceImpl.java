package com.vv.stu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class LessonServiceImpl extends BaseService {

	public boolean insertLesson(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("insertLesson", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}
	public Map selectLesson(Map tParams) {
		try {
			return tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectLesson", tParams)).get(0);
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return null;
	}
	public boolean updateLesson(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("updateLesson", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}
}
