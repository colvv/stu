package com.vv.stu.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.exception.BusinessException;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.model.SysUser;
import com.vv.stu.service.impl.SysLoginServiceImpl;
import com.vv.stu.service.impl.SysUserServiceImpl;

@Controller
public class SysLoginController extends BaseController {
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
	public String default_index(@CookieValue(value = "user_id", defaultValue = "") String user_id,
			@CookieValue(value = "user_password", defaultValue = "") String user_password) {
		try {
			// 2015-2-28 @wangyi : 暂时用不到了，做到了js端的自动登录
			// logger.debug("cookie中的值： user_id：" + user_id + ", user_password:"
			// + user_password);
			// logger.debug("needlogin:"+request.getAttribute("need_login"));
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
		return tModelAndView;
	}

	@RequestMapping("/indexContent")
	public ModelAndView indexContent() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.setViewName("indexContent");
		return tModelAndView;
	}

	/**
	 * 登录入口 07932f02f3323059544d188be8e847e7 3087554
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String login() {
		Map tParams = PubFun.parseReuest_all(request);
		SysUser tSysUser = tSysLoginServiceImpl.sysLogin(tParams);
		if (tSysUser == null) {
			return "1";
		} else {
			session.setAttribute("sysuser", tSysUser);
			return "0";
		}
	}

	@RequestMapping("/loginOut")
	@ResponseBody
	public String loginOut() {
		session.removeAttribute("sysuser");
		return "0";
	}

	@RequestMapping("/model/changePwd")
	public ModelAndView changePwd() {
		ModelAndView tModelAndView = new ModelAndView();

		tModelAndView.setViewName("changePwd");
		return tModelAndView;
	}

	@RequestMapping("/changePwdConfrim")
	@ResponseBody
	public String changePwdConfrim() {
		Map tParams = PubFun.parseReuest_all(request);
		SysUser tSysUser = (SysUser) session.getAttribute("sysuser");
		tParams.put("user_id", tSysUser.getUser_id());
		try {
			return tSysLoginServiceImpl.changePwdConfrim(tParams) ? "0" : "1";
		} catch (BusinessException e) {
			return "1|" + e.getMessage();
		}
	}

}
