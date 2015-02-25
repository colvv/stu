package com.vv.stu.controller;

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
			String stu_name = request.getParameter("stu_name");
			String stu_no = tCommonServiceImpl.createMaxNo("stu_no", 6);
			return tStudentServiceImpl.addStu(PubFun.getCurrentDate().substring(0, 4) + stu_no, stu_name) ? "0" : "1";
	}

	@RequestMapping("/model/{model_name}")
	public String model(@PathVariable String model_name) {
		return "stu/model/" + model_name;
	}

}
