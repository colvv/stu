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
}
