package com.vv.stu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.BusinessException;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;
import com.vv.stu.model.SysUser;

@Service
public class SysLoginServiceImpl extends BaseService {

	/**
	 * <li><a href="#">iOS</a></li> <li><a href="#">SVN</a></li> <li class="dropdown">
	 * <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Java <b
	 * class="caret"></b> </a>
	 * <ul class="dropdown-menu">
	 * <li><a href="#">jmeter</a></li>
	 * <li><a href="#">EJB</a></li>
	 * <li><a href="#">Jasper Report</a></li>
	 * <li class="divider"></li>
	 * <li><a href="#">分离的链接</a></li>
	 * <li class="divider"></li>
	 * <li><a href="#">另一个分离的链接</a></li>
	 * </ul>
	 * </li> <li class="dropdown"><a href="#" class="dropdown-toggle"
	 * data-toggle="dropdown"> Java <b class="caret"></b> </a>
	 * <ul class="dropdown-menu">
	 * <li><a href="#">jmeter</a></li>
	 * <li><a href="#">EJB2</a></li>
	 * <li><a href="#">Jasper Report</a></li>
	 * <li class="divider"></li>
	 * <li><a href="#">分离的链接3</a></li>
	 * <li class="divider"></li>
	 * <li><a href="#">另一个分离的链接</a></li>
	 * </ul>
	 * </li>
	 * 
	 * 
	 * 目前只是二层菜单
	 * 
	 * @return
	 * @author wangyi 2015-2-11
	 */
	public String loadMenuHtml(Map tParams) {

		try {
			List<Map> tMenus = tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectSysMenu", tParams));
			// 2015-2-11 @wangyi : 一次sql查询，通过java代码进行处理层级关系
			String tMenu_ID;
			String[] tempArray;
			String ID;
			String pID;
			String tInnerHtml;
			StringBuffer sb = new StringBuffer(512);
			// FIXME @wangyi 2015-3-3 PubFun is available ,后续如果实际需要进行替换
			// PubFun.formatTree(tMenus, "0", "menu_id");
			for (Map tMenu : tMenus) {
				tMenu_ID = (String) tMenu.get("menu_id");
				tempArray = tMenu_ID.split("\\|");
				ID = tempArray[0];
				pID = tempArray[1];
				if ("0".equals(pID)) {
					tInnerHtml = "";
					for (Map innerMap : tMenus) {
						if (ID.equals(((String) innerMap.get("menu_id")).split("\\|")[1])) {
							// 2015-2-11 @wangyi : son
							tInnerHtml += "<li><a href='" + PubFun.getNullToEmpty(innerMap.get("menu_url")) + "' id='stu_menu_"
									+ tMenu.get("menu_id") + "'>" + innerMap.get("menu_name") + "</a></li>";
						}
					}
					if ("".equals(tInnerHtml)) {
						// 2015-2-11 @wangyi : no son
						sb.append("<li><a href='").append(PubFun.getNullToEmpty(tMenu.get("menu_url"))).append("' id='stu_menu_")
								.append(tMenu.get("menu_id")).append("'>").append(tMenu.get("menu_name")).append("</a></li> ");
					} else {
						// 2015-2-11 @wangyi : have son
						sb.append("<li class='dropdown'><a href='").append(PubFun.getNullToEmpty(tMenu.get("menu_url")))
								.append("' id='stu_menu_").append(tMenu.get("menu_id"))
								.append("'  class='dropdown-toggle' data-toggle='dropdown'>").append(tMenu.get("menu_name"))
								.append("<b class='caret'></b></a><ul class='dropdown-menu'>");
						sb.append(tInnerHtml);
						sb.append("</ul></li>");
					}
				}

			}
			return sb.toString();
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			e.printStackTrace();
			throw new ServiceException("数据处理失败");
		}
	}

	public SysUser sysLogin(Map tParams) {

		try {
			List<Map> tUser = tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectSysUser", tParams));
			if (tUser.size() != 1) {
				return null;
			}
			// 2015-2-28 @wangyi : 更新用户登录时间
			tPubCommitDao.doCommit(new DaoOperator("updateLastLogin", tParams));
			SysUser tSysUser = new SysUser();
			tSysUser.setUser_id((String) tUser.get(0).get("user_id"));
			tSysUser.setUser_name((String) tUser.get(0).get("user_name"));
			tSysUser.setUser_phone((String) tUser.get(0).get("user_phone"));
			tSysUser.setUser_state((String) tUser.get(0).get("user_state"));
			tSysUser.setRela_role_id((String) tUser.get(0).get("rela_role_id"));
			// if ("true".equals(tParams.get("auto_login"))) {
			// Cookie cookie1 = new Cookie("SESSION_LOGIN_USERNAME", (String)
			// tParams.get("user_id")); // 保存用户名到Cookie
			// cookie1.setPath("/");
			// cookie1.setMaxAge(24 * 60 * 60 * 7);// 设置有效期，单位为秒，这里为1周
			// response.addCookie(cookie1);
			// Cookie cookie2 = new Cookie("SESSION_LOGIN_PASSWORD", (String)
			// tParams.get("user_password")); // 保存密码到Cookie
			// cookie2.setPath("/");
			// cookie2.setMaxAge(24 * 60 * 60 * 7);// 设置有效期，单位为秒，这里为1周
			// response.addCookie(cookie2);
			// }
			return tSysUser;
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			e.printStackTrace();
			throw new ServiceException("数据处理失败");
		}
	}

	public boolean changePwdConfrim(Map tParams) throws BusinessException {
		if (tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectSysUser", tParams)).size() == 1) {
			Map tParam = new HashMap<>();
			tParam.put("user_password", tParams.get("user_password_new"));
			tParam.put("user_id", tParams.get("user_id"));
			tPubCommitDao.doCommit(new DaoOperator("updateSysUser", tParam));
			return true;
		} else {
			throw new BusinessException("原始密码输入不正确，请检查");
		}

	}

}
