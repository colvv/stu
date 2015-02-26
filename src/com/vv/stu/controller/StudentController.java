package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.ServiceException;
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
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("stu/stu_complex");
		return tModelAndView;
	}

	@RequestMapping("/addStu")
	@ResponseBody
	public String addStu() {
		String tCurrentYear = PubFun.getCurrentDate().substring(0, 4);
		String stu_id = tCommonServiceImpl.createMaxNo("stu_id" + tCurrentYear, 6);
		Map tParams = PubFun.parseReuest_all(request);
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

	@RequestMapping("/model/{model_name}")
	public String model(@PathVariable String model_name) {
		return "stu/model/" + model_name;
	}

}
