package com.vv.stu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;
import com.vv.stu.service.impl.ClassServiceImpl;

@RequestMapping("/class")
@Controller
public class ClassController extends BaseController {
	@Autowired
	private ClassServiceImpl tClassServiceImpl;

	@RequestMapping("/classIndex")
	public ModelAndView classIndex() {
		ModelAndView tModelAndView = new ModelAndView();
		
		
		
		return tModelAndView;
	}

}
