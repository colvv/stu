package com.vv.common.interf;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.vv.common.service.impl.CommonServiceImpl;

public abstract class BaseController {
	@Resource
	protected HttpServletRequest request;
	@Resource
	protected HttpSession session;
	@Autowired
	protected CommonServiceImpl tCommonServiceImpl;
	
	protected final Log logger = LogFactory.getLog(getClass());
}
