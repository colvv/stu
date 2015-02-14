package com.vv.stu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;

@RequestMapping("/stu")
@Controller
public class StudentController extends BaseController {

	@RequestMapping("/stuList")
	public ModelAndView stuList() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("stu/stu_complex");
		return tModelAndView;
	}

	@RequestMapping("/model/{model_name}")
	public String model(@PathVariable String model_name) {
		return "stu/model/"+model_name;
	}

}
