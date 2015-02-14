package com.vv.stu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Service;

import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

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
	public String loadMenuHtml() {

		try {
			List<Map> tMenus = tDefaultQueryDao.commonQuery_SQL("SELECT menu_id,menu_name,menu_url FROM vv_sys_menu ");
			// 2015-2-11 @wangyi : 一次sql查询，通过java代码进行处理层级关系
			String tMenu_ID;
			String[] tempArray;
			String ID;
			String pID;
			String tInnerHtml;
			StringBuffer sb = new StringBuffer(512);
			for (Map tMenu : tMenus) {
				tMenu_ID = (String) tMenu.get("menu_id");
				tempArray = tMenu_ID.split("\\|");
				ID = tempArray[0];
				pID = tempArray[1];
				if ("0".equals(pID)) {
					tInnerHtml = "";
					for (Map innerMap : tMenus) {
						if (ID.equals(((String) innerMap.get("menu_id")).split("\\|")[1])) {
							// 2015-2-11 @wangyi :  son
							tInnerHtml += "<li><a href='" + PubFun.getNullToEmpty(innerMap.get("menu_url")) + "' id='stu_menu_" + tMenu.get("menu_id") + "'>"
									+ innerMap.get("menu_name") + "</a></li>";
						}
					}
					if ("".equals(tInnerHtml)) {
						// 2015-2-11 @wangyi :  no son
						sb.append("<li><a href='").append(PubFun.getNullToEmpty(tMenu.get("menu_url"))).append("' id='stu_menu_").append(tMenu.get("menu_id"))
								.append("'>").append(tMenu.get("menu_name")).append("</a></li> ");
					} else {
						// 2015-2-11 @wangyi :  have son
						sb.append("<li class='dropdown'><a href='").append(PubFun.getNullToEmpty(tMenu.get("menu_url"))).append("' id='stu_menu_")
								.append(tMenu.get("menu_id")).append("'  class='dropdown-toggle' data-toggle='dropdown'>")
								.append(tMenu.get("menu_name")).append("<b class='caret'></b></a><ul class='dropdown-menu'>");
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
}
