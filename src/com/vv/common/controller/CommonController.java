package com.vv.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseController;
import com.vv.common.service.impl.CommonServiceImpl;
import com.vv.common.util.PubFun;

@Controller
public class CommonController extends BaseController {
	@Autowired
	private CommonServiceImpl tCommonServiceImpl;

	@RequestMapping("/loadTable/{table_id}")
	@ResponseBody
	public String loadTable(@PathVariable String table_id) {
		try {
			return JSONObject.toJSONString(tCommonServiceImpl.loadTableData(table_id, PubFun.parseReuest_all(request)));
		} catch (ServiceException e) {
			logger.debug("service层处理失败");
		} catch (Exception e) {
			logger.error("controller出现异常：" + e.toString());
		}
		return "";
	}

	@RequestMapping("/directView")
	public String directView() {
		return request.getParameter("viewName");
	}

	@RequestMapping("/loadSelection")
	@ResponseBody
	public String loadSelection() {
		try {
			return JSONObject.toJSONString(tCommonServiceImpl.loadSelection(PubFun.parseReuest_all(request)));
		} catch (ServiceException e) {
			logger.debug("service层处理失败");
		} catch (Exception e) {
			logger.error("controller出现异常：" + e.toString());
		}
		return "";
	}
}
