package com.vv.stu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.BusinessException;
import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.service.impl.SysConfServiceImpl;

@Controller
@RequestMapping("/sys")
public class SysConfController extends BaseController {
	@Autowired
	private SysConfServiceImpl tSysConfServiceImpl;

	@RequestMapping("/code/confIndex")
	public ModelAndView confIndex() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.addObject("codesHtml", tSysConfServiceImpl.loadCodesHtml());
		tModelAndView.setViewName("/sys/code/confIndex");
		return tModelAndView;
	}

	@RequestMapping("/code/displayArea")
	public ModelAndView displayArea() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.addAllObjects(tSysConfServiceImpl.loadCodeAreaInfo(PubFun.parseReuest_all(request)));
		tModelAndView.setViewName("/sys/code/displayArea");
		return tModelAndView;
	}

	@RequestMapping("/code/saveSysCodeConf")
	@ResponseBody
	public String saveSysCodeConf() {
		return tSysConfServiceImpl.saveSysCodeConf(PubFun.parseReuest_all(request)) ? "0" : "1";
	}

	@RequestMapping("/code/addModel.do")
	public ModelAndView addModel() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.addAllObjects(PubFun.parseReuest_all(request));
		tModelAndView.setViewName("/sys/code/codeModal");
		return tModelAndView;
	}

	@RequestMapping("/code/insertSysCode")
	@ResponseBody
	public String insertSysCode() {
		try {
			return tSysConfServiceImpl.insertSysCode(PubFun.parseReuest_all(request)) ? "0" : "1";
		} catch (BusinessException e) {
			return "1|" + e.getMessage();
		}
	}
	
	@RequestMapping("/menu/menuIndex")
	public ModelAndView menuIndex() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.setViewName("/sys/menu/menuIndex");
		return tModelAndView;
	}

	@RequestMapping("/menu/userMenuIndex")
	public ModelAndView userMenuIndex() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.setViewName("/sys/menu/userMenuIndex");
		return tModelAndView;
	}
	
}
