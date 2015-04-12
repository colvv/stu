package com.vv.templet.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.BusinessException;
import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.ClassServiceImpl;


@RequestMapping("/templet")
@Controller
public class TempletController extends BaseController{
	@Autowired
	private ClassServiceImpl tClassServiceImpl;
	
	@RequestMapping("/templet123")
	public ModelAndView classIndex() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("aa/aa");
		return tModelAndView;
	}
	
	
	@RequestMapping("/templet345")
	@ResponseBody
	public String createClass() {
		try {
			String tCurrentYear = PubFun.getCurrentDate().substring(0, 4);
			Map tParam = PubFun.parseReuest_all(request);
			return tClassServiceImpl.createClass(tParam) ? "0" : "1";
		} catch (BusinessException e) {
			return "1|" + e.getMessage();
		}
	}
	
}
