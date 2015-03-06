package com.vv.stu.service.impl;

import java.util.ArrayList;
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

	public String loadMenuZtree() {
		try {
			List<Map> tMenus = tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectSysMenu", new HashMap()));
			List<String> tElements = new ArrayList<>();
			tElements.add("menu_id");
			return PubFun.getZtreeHtml(tMenus, "menu_id", "menu_name", tElements);
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return "";
	}

	public String loadMenuZtreeChecked(Map tParams) {
		try {
			List<Map> tMenus = tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectCheckedSysMenu", tParams));
			StringBuffer tList = new StringBuffer(256);
			tList.append("[");
			String menu_id;
			String[] id_pid;
			for (Map tData : tMenus) {
				menu_id = (String) tData.get("menu_id");
				id_pid = menu_id.split("\\|");
				if (id_pid.length != 2) {
					continue;
				}
				tList.append("{id:'" + id_pid[0] + "',");
				tList.append("pId:'" + id_pid[1] + "',");
				tList.append("name:'" + (String) tData.get("menu_name") + "',");
				// 2015-1-26 @wangyi : 增强用户体验，一级的默认打开
				if ("0".equals(id_pid[1])) {
					tList.append("open:true,");
				}
				if (!"1".equals(tData.get("open_power"))) {
					tList.append("checked:true,");
					tList.append("chkDisabled:true,");
				} else if ("0".equals(tData.get("user_select"))) {
					tList.append("checked:true,");
				}
				tList.append("menu_id" + ":'" + menu_id + "',");
				// tList = new StringBuffer(tList.substring(0, tList.length() -
				// 1));
				tList.append("},");
			}
			tList.append("]");
			return tList.toString();
		} catch (Exception e) {
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

	@SuppressWarnings("rawtypes")
	public Map loadMenuAreaInfo(Map tParams) {
		Map tMap = new HashMap<>();
		try {
			tMap.put("sys_menu", tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectSysMenu", tParams)).get(0));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return tMap;
	}

	public boolean saveSysCodeConf(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("updateSysCodeConf", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean insertSysCode(Map tParams) throws BusinessException {
		try {
			tPubCommitDao.doCommit(new DaoOperator("insertSysCode", tParams));
		} catch (DuplicateKeyException e) {
			throw new BusinessException("系统编码重复，请更换");
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean saveMenuInfo(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("updateMenuInfo", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean updateUserMenu(Map tParams) {
		try {
			String tMenus = (String) tParams.get("menus");
			tPubCommitDao.doCommit(new DaoOperator("deleteUserMenu", tParams));
			for (String tMenu : tMenus.split(",")) {
				tParams.put("menu_id", tMenu);
				tPubCommitDao.doCommit(new DaoOperator("insertUserMenu", tParams));
			}
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;

	}

}
