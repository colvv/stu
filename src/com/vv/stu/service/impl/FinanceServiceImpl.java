package com.vv.stu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class FinanceServiceImpl extends BaseService {

	public boolean addFinance(Map tParams) {
		try {
			if (tPubCommitDao.doCommit(new DaoOperator("insertFinaceInfo", tParams)) != 1) {
				return false;
			}
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

}
