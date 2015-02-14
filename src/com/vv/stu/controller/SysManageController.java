package com.vv.stu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;

@Controller
@RequestMapping("/sys")
public class SysManageController extends BaseController {

	@RequestMapping("/userIndex")
	public ModelAndView userIndex() {
		ModelAndView tModelAndView = new ModelAndView();
		
		tModelAndView.setViewName("sys/sysuser_complex");
		return tModelAndView;
	}
}
