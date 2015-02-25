package com.vv.stu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseController;
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

	@RequestMapping("/model/{model_name}")
	public String model(@PathVariable String model_name) {
		return "stu/model/" + model_name;
	}

	@RequestMapping("oper/add")
	@ResponseBody
	public String addStu() {
		try {
			String tName = request.getParameter("name");
			return tStudentServiceImpl.addStu(tName) ? "0" : "1";
			// tSysUserService.updateUsers();
		} catch (ServiceException e) {
			logger.debug("service层处理失败");
		} catch (Exception e) {
			logger.error("controller出现异常：" + e.toString());
		}
		return "1";
	}

}
