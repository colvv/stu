package com.vv.stu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseController;
import com.vv.stu.service.impl.SysLoginServiceImpl;
import com.vv.stu.service.impl.SysUserServiceImpl;

@Controller
public class SysLoginController extends BaseController{
	@Autowired
	private SysUserServiceImpl tSysUserService;
	@Autowired
	private SysLoginServiceImpl tSysLoginServiceImpl;

	/**
	 * 特殊，通过web。xml配置
	 * 
	 * @return
	 * @author wangyi 2015-2-3
	 * @throws Exception
	 */
	@RequestMapping("/default_index")
	public String default_index() {
		try {
			String path = request.getContextPath();
			session.setAttribute("ctx", path);// 路径
			// tSysUserService.updateUsers();
		} catch (ServiceException e) {
			logger.debug("service层处理失败");
		} catch (Exception e) {
			logger.error("controller出现异常：" + e.toString());
		}
		return "sys/login";
	}

	@RequestMapping("/bootstrap")
	public String bootstrap() {
		return "sys/bootstrap";
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.addObject("menustr", tSysLoginServiceImpl.loadMenuHtml());
		tModelAndView.setViewName("index");
		return tModelAndView ;
	}

	

}
