package com.vv.stu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;
import com.vv.stu.service.impl.LessonServiceImpl;

@RequestMapping("/lesson")
@Controller
public class LessonController extends BaseController {
	@Autowired
	private LessonServiceImpl tLessonServiceImpl;
	
	@RequestMapping("/lessonIndex")
	public ModelAndView lessonIndex(){
		ModelAndView tModelAndView = new ModelAndView();
		
		
		
		return tModelAndView;
	}
	
}
