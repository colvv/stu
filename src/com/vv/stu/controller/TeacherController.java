package com.vv.stu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;

@RequestMapping("/tea")
@Controller
public class TeacherController extends BaseController{
	
	
	@RequestMapping("/index.do")
	public ModelAndView tModelAndView(){
		ModelAndView tModelAndView = new ModelAndView();
		
		tModelAndView.setViewName("/tea/teacher_complex");
		return tModelAndView;
	}
}
