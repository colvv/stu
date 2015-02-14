package com.vv.common.service.impl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vv.common.interf.BaseController;

@Controller
@RequestMapping("/tea")
public class TEA_Controller extends BaseController{

	@RequestMapping("/index")
	public String loadTEA_Index(){
		return "tea/teacher_complex";
	}
	
}
