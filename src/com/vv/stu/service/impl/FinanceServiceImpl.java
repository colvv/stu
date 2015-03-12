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
			List<Map> tResult = tDefaultQueryDao.commonQuery_SQL(new DaoOperator("chart_finance_001", tParams));
			StringBuffer tContent = new StringBuffer(512);
			StringBuffer tContent2 = new StringBuffer(256);
			tContent.append("[[");
			tContent2.append(",[");
			for (Map tData : tResult) {
				tContent.append("[").append(tData.get("fin_date_stamp")).append(",").append(tData.get("inmoney")).append("],");
				tContent2.append("[").append(tData.get("fin_date_stamp")).append(",").append(tData.get("outmoney")).append("],");
			}
			tContent.append("]");
			tContent2.append("]]");
			tContent.append(tContent2);
			return tContent.toString();
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return null;
	}
}
