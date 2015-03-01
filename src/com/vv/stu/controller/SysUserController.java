package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.BusinessException;
import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.SysUserServiceImpl;

@Controller
@RequestMapping("/sys")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserServiceImpl tSysUserServiceImpl;

	@RequestMapping("/userIndex")
	public ModelAndView userIndex() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.setViewName("sys/sysuser_complex");
		return tModelAndView;
	}

	@RequestMapping("/addSysUser")
	@ResponseBody
	public String addSysUser() {
		try {
			Map tParams = PubFun.parseReuest_all(request);
			// 2015-2-28 @wangyi : 用户名自己生成
			// String user_id = tCommonServiceImpl.createMaxNo("sysuser", 6);
			// tParams.put("user_id", "SY"+user_id);
			return tSysUserServiceImpl.addSysUser(tParams) ? "0" : "1";
		} catch (BusinessException e) {
			// @wangyi 2015-3-1 捕获bussiness异常
			return "1|" + e.getMessage();
		}
	}

	@RequestMapping("/modSysUser")
	@ResponseBody
	public String modSysUser() {
		Map tParams = PubFun.parseReuest_all(request);
		return tSysUserServiceImpl.modSysUser(tParams) ? "0" : "1";
	}

	@RequestMapping("/delSysUser")
	@ResponseBody
	public String delSysUser() {
		Map tParams = PubFun.parseReuest_all(request);
		return tSysUserServiceImpl.delSysUser(tParams) ? "0" : "1";
	}

	@RequestMapping("/model/addModel")
	public ModelAndView addModel() {
		ModelAndView tModelAndView = new ModelAndView("sys/model/sysUserModel");
		tModelAndView.addObject("form_action", "/sys/addSysUser.do");
		tModelAndView.addObject("password_check", "required|password|maxlen=20|minlen=5");
		return tModelAndView;
	}

	@RequestMapping("/model/modModel")
	public ModelAndView modModel() {
		ModelAndView tModelAndView = new ModelAndView("sys/model/sysUserModel");
		Map tParams = PubFun.parseReuest_all(request);
		tModelAndView.addAllObjects(tSysUserServiceImpl.getSysUser(tParams));
		tModelAndView.addObject("mod_flag", "1");
		tModelAndView.addObject("form_action", "/sys/modSysUser.do");
		tModelAndView.addObject("password_check", "password|maxlen=20|minlen=5");
		return tModelAndView;
	}

}
