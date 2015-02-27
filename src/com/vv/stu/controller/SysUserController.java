package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		Map tParams = PubFun.parseReuest_all(request);
		String user_id = tCommonServiceImpl.createMaxNo("sysuser", 6);
		tParams.put("user_id", user_id);
		return tSysUserServiceImpl.addSysUser(tParams) ? "0" : "1";
	}

	@RequestMapping("/model/addModel")
	public ModelAndView addModel() {
		ModelAndView tModelAndView = new ModelAndView("sys/model/sysUserModel");
		tModelAndView.addObject("form_action", "/sys/addSysUser.do");
		return tModelAndView;
	}

	@RequestMapping("/model/modModel")
	public ModelAndView modModel() {
		ModelAndView tModelAndView = new ModelAndView("sys/model/sysUserModel");
		String stu_id = request.getParameter("stu_id");
		// tModelAndView.addAllObjects(tStudentServiceImpl.getStu(stu_id));
		tModelAndView.addObject("form_action", "/sys/modSysUser.do");
		return tModelAndView;
	}

}
