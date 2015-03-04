package com.vv.stu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.BusinessException;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class SysConfServiceImpl extends BaseService {

	/**
	 * 
	 * @return like <li class="list-group-item"><span class="badge">14</span>
	 *         Cras justo odio</li>...
	 * @author wangyi 2015-3-4
	 */
	public String loadCodesHtml() {
		try {
			List<Map> tConfs = tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectExistCodes", new HashMap()));
			StringBuffer tHtml = new StringBuffer(256);
			for (Map tConf : tConfs) {
				tHtml.append("<li class=\"list-group-item cursor-p\"><span class=\"badge\" name=\"org_badge\">")
						.append(tConf.get("codecount")).append("</span>").append(tConf.get("name"))
						.append("<input type=\"hidden\" name=\"codetype\" value=\"").append(tConf.get("codetype")).append("\"></li>");
			}
			return tHtml.toString();
		} catch (Exception e) {
			// 2015-3-4 @wangyi : 集中处理
			PubFun.throwServiceException(e);
		}
		return "";
	}
	@SuppressWarnings("rawtypes") 
	public Map loadCodeAreaInfo(Map tParams) {
		Map tMap = new HashMap<>();
		try {
			tMap.put("sys_code_conf", tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectExistCodes", tParams)).get(0));
			tMap.put("sys_codes", JSONObject.toJSONString(tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectTargetCodes", tParams))));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return tMap;
	}
	public boolean saveSysCodeConf(Map tParams){
		try {
			tPubCommitDao.doCommit(new DaoOperator("updateSysCodeConf", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean insertSysCode(Map tParams) throws BusinessException{
		try {
			tPubCommitDao.doCommit(new DaoOperator("insertSysCode", tParams));
		} catch (DuplicateKeyException e) {
			throw new BusinessException("系统编码重复，请更换");
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}
	
}
