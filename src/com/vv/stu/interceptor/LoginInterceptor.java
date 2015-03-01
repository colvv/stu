package com.vv.stu.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.vv.stu.model.SysUser;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private Log logger = LogFactory.getLog(getClass());

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		logger.debug("拦截url: " + uri);
		// @wangyi 2015-2-28 过滤登录的url
		if(uri.endsWith("login.do")){
			return true;
		}
		SysUser tSysUser = (SysUser) request.getSession(true).getAttribute("sysuser");
		if (tSysUser == null) {
			PrintWriter out = (PrintWriter) response.getWriter();
			out.println("<script language=\"javaScript\">location.href='/'</script>");
			return false;
		}
		return true;
	}
}
