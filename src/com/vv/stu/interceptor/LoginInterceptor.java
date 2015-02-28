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
		SysUser tSysUser = (SysUser) request.getSession(true).getAttribute("sysuser");
		if (tSysUser == null) {
			PrintWriter out = (PrintWriter) response.getWriter();
			out.println("<script language=\"javaScript\">location.href='/'</script>");
			return false;
		}
		return true;
	}
}
