package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.StudentServiceImpl;

@RequestMapping("/stu")
@Controller
public class StudentController extends BaseController {
	@Autowired
	private StudentServiceImpl tStudentServiceImpl;

	@RequestMapping("/stuList")
	public ModelAndView stuList() {
		ModelAndView tModelAndView = new ModelAndView("stu/stu_complex");
		return tModelAndView;
	}

	@RequestMapping("/addStu")
	@ResponseBody
	public String addStu() {
		String tCurrentYear = PubFun.getCurrentDate().substring(0, 4);
		Map tParams = PubFun.parseReuest_all(request);
		// 2015-2-26 @wangyi : 特殊处理时间
		String stu_birthday = (String) tParams.get("stu_birthday");
		String stu_id = tCommonServiceImpl.createMaxNo("stu_id" + tCurrentYear, 6);
		tParams.put("stu_birthday", PubFun.getSimpleDate(stu_birthday));
		tParams.put("stu_id", tCurrentYear + stu_id);
		// 2015-2-25 @wangyi : 学号为年份加上
		return tStudentServiceImpl.addStu(tParams) ? "0" : "1";
	}

	@RequestMapping("/delStu")
	@ResponseBody
	public String delStu() {
		String stu_id = request.getParameter("stu_id");
		return tStudentServiceImpl.delStu(stu_id) ? "0" : "1";
	}

	@RequestMapping("/modStu")
	@ResponseBody
	public String modStu() {
		String stu_id = request.getParameter("stu_id");
		Map tParams = PubFun.parseReuest_all(request);
		// 2015-2-26 @wangyi : 特殊处理时间
		String stu_birthday = (String) tParams.get("stu_birthday");
		if (PubFun.checkNecessaryString(stu_birthday)) {
			stu_birthday = stu_birthday.replace("-", "");
			stu_birthday = stu_birthday.replace("/", "");
		} else {
			stu_birthday = "0";
		}
		tParams.put("stu_birthday", stu_birthday);
		return tStudentServiceImpl.modStu(tParams) ? "0" : "1";
	}

	@RequestMapping("/model/addModel")
	public ModelAndView addModel() {
		ModelAndView tModelAndView = new ModelAndView("stu/model/stuModel");
		tModelAndView.addObject("form_action", "/stu/addStu.do");
		return tModelAndView;
	}

	@RequestMapping("/model/modModel")
	public ModelAndView modModel() {
		ModelAndView tModelAndView = new ModelAndView("stu/model/stuModel");
		String stu_id = request.getParameter("stu_id");
		tModelAndView.addAllObjects(tStudentServiceImpl.getStu(stu_id));
		tModelAndView.addObject("form_action", "/stu/modStu.do");
		return tModelAndView;
	}
	@RequestMapping("/choose/chooseStu")
	public ModelAndView  chooseStu() {
		ModelAndView tModelAndView = new ModelAndView("stu/choose/stu_choose");
		return tModelAndView;
	}

}
