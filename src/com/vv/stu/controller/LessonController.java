package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.LessonServiceImpl;

@RequestMapping("/les")
@Controller
public class LessonController extends BaseController {
	@Autowired
	private LessonServiceImpl tLessonServiceImpl;

	@RequestMapping("/lessonIndex")
	public ModelAndView lessonIndex() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("les/les_complex");
		return tModelAndView;
	}

	@RequestMapping("/addLes")
	@ResponseBody
	public String addLes() {
		Map tParams = PubFun.parseReuest_all(request);
		tParams.put("les_id", tCommonServiceImpl.createMaxNo("les_id", 6));
		return tLessonServiceImpl.insertLesson(tParams) ? "0" : "1";

	}

	@RequestMapping("/modLes")
	@ResponseBody
	public String modLes() {
		return tLessonServiceImpl.updateLesson(PubFun.parseReuest_all(request)) ? "0" : "1";
	}

	@RequestMapping("/model/addModel")
	public ModelAndView addModel() {
		ModelAndView tModelAndView = new ModelAndView("les/model/lesModel");
		tModelAndView.addObject("form_action", "/les/addLes.do");
		return tModelAndView;
	}

	@RequestMapping("/model/modModel")
	public ModelAndView modModel() {
		ModelAndView tModelAndView = new ModelAndView("les/model/lesModel");
		tModelAndView.addAllObjects(tLessonServiceImpl.selectLesson(PubFun.parseReuest_all(request)));
		tModelAndView.addObject("form_action", "/les/modLes.do");
		return tModelAndView;
	}
}
