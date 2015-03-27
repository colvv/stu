package com.vv.stu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.BusinessException;
import com.vv.common.interf.BaseController;
import com.vv.common.service.impl.CommonServiceImpl;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.ClassServiceImpl;

@RequestMapping("/class")
@Controller
public class ClassController extends BaseController {
	@Autowired
	private ClassServiceImpl tClassServiceImpl;

	@RequestMapping("/classIndex")
	public ModelAndView classIndex() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("class/class_complex");
		return tModelAndView;
	}

	@RequestMapping("/createClassPage")
	public ModelAndView createClassPage() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("class/content/createClass");
		return tModelAndView;
	}

	@RequestMapping("/createClass")
	@ResponseBody
	public String createClass() {
		try {
			String tCurrentYear = PubFun.getCurrentDate().substring(0, 4);
			Map tParam = PubFun.parseReuest_all(request);
			tParam.put("class_id", tCurrentYear + tCommonServiceImpl.createMaxNo("LES" + tCurrentYear, 6));
			return tClassServiceImpl.createClass(tParam) ? "0" : "1";
		} catch (BusinessException e) {
			return "1|" + e.getMessage();
		}
	}

}
