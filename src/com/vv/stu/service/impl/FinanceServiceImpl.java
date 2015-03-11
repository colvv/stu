package com.vv.stu.service.impl;

import java.util.List;
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

	public String makeChart(Map tParams) {
		try {
			List<Map> tResult =  tDefaultQueryDao.commonQuery_SQL(new DaoOperator("chart_finance_001", tParams));
			StringBuffer tTitle  = new StringBuffer(128);
			StringBuffer tContent  = new StringBuffer(256);
			StringBuffer tContent2  = new StringBuffer(256);
			tTitle.append("[");
			tContent.append(",[");
			tContent2.append(",[");
			for (Map tData : tResult) {
				tTitle.append("'").append(tData.get("fin_date")).append("',");
				tContent.append("'").append(tData.get("inmoney")).append("',");
				tContent2.append("'").append(tData.get("outmoney")).append("',");
				
				
			}
			
			
			
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return null;
	}
}
