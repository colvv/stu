package com.vv.stu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;
import com.vv.stu.model.SysUser;

@RequestMapping("/fin")
@Controller
public class FinanceController extends BaseController {

	@RequestMapping("/createFinance")
	public ModelAndView createFinance() {
		ModelAndView tModelAndView = new ModelAndView();
		
		tModelAndView.setViewName("/fin/createFinance");
		return tModelAndView;
	}

}
