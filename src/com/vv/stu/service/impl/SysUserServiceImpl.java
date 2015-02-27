package com.vv.stu.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.dao.DefaultQueryDao;
import com.vv.common.dao.PubCommitDao;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class SysUserServiceImpl extends BaseService {

	public boolean addSysUser(Map tParams) {
		try {
			String tPassword = (String) tParams.get("user_password");
			// 2015-2-27 @wangyi : 密码加密
			tPassword = PubFun.MD5Encode(tPassword, "col_vv");
			tParams.put("user_password", tPassword);
			tPubCommitDao.doCommit(new DaoOperator("insertUser", tParams));
			return true;
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}
}
