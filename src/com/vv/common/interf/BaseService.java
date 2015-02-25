package com.vv.common.interf;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.vv.common.dao.DefaultQueryDao;
import com.vv.common.dao.PubCommitDao;
import com.vv.common.service.impl.CommonServiceImpl;

public abstract class BaseService {
	@Autowired
	protected DefaultQueryDao tDefaultQueryDao;
	@Autowired
	protected PubCommitDao tPubCommitDao;

	protected final Log logger = LogFactory.getLog(getClass());
}
