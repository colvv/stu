package com.vv.common.interf;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public abstract class BaseController {
	@Resource
	protected HttpServletRequest request;
	@Resource
	protected HttpSession session;
	
	protected final Log logger = LogFactory.getLog(getClass());
}
