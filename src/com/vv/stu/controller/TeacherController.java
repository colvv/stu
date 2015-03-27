package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.TeacherServiceImpl;

@RequestMapping("/tea")
@Controller
public class TeacherController extends BaseController {

	@Autowired
	private TeacherServiceImpl tTeacherServiceImpl;

	@RequestMapping("/index.do")
	public ModelAndView tModelAndView() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("/tea/teacher_complex");
		return tModelAndView;
	}

	@RequestMapping("/addTea")
	@ResponseBody
	public String addTea() {
		Map tParams = PubFun.parseReuest_all(request);
		// 2015-2-26 @wangyi : 特殊处理时间
		String tea_birthday = (String) tParams.get("tea_birthday");
		String tea_id = tCommonServiceImpl.createMaxNo("tea_id", 6);
		tParams.put("tea_birthday", PubFun.getSimpleDate(tea_birthday));
		tParams.put("tea_id", "TE" + tea_id);
		return tTeacherServiceImpl.insertTeacher(tParams) ? "0" : "1";
	}

	@RequestMapping("/delTea")
	@ResponseBody
	public String delTea() {
		return tTeacherServiceImpl.deleteTeacher(PubFun.parseReuest_all(request)) ? "0" : "1";
	}

	@RequestMapping("/modTea")
	@ResponseBody
	public String modTea() {
		Map tParams = PubFun.parseReuest_all(request);
		// 2015-2-26 @wangyi : 特殊处理时间
		String tea_birthday = (String) tParams.get("tea_birthday");
		tParams.put("tea_birthday", PubFun.getSimpleDate(tea_birthday));
		return tTeacherServiceImpl.updateTeacher(tParams) ? "0" : "1";
	}

	@RequestMapping("/model/addModel")
	public ModelAndView addModel() {
		ModelAndView tModelAndView = new ModelAndView("tea/model/teaModel");
		tModelAndView.addObject("form_action", "/tea/addTea.do");
		return tModelAndView;
	}

	@RequestMapping("/model/modModel")
	public ModelAndView modModel() {
		ModelAndView tModelAndView = new ModelAndView("tea/model/teaModel");
		tModelAndView.addAllObjects(tTeacherServiceImpl.selectTeacher(PubFun.parseReuest_all(request)));
		tModelAndView.addObject("form_action", "/tea/modTea.do");
		return tModelAndView;
	}
	@RequestMapping("/choose/chooseTea")
	public ModelAndView  chooseStu() {
		ModelAndView tModelAndView = new ModelAndView("tea/choose/tea_choose");
		return tModelAndView;
	}
}
