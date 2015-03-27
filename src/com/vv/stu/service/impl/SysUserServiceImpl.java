package com.vv.stu.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.dao.DefaultQueryDao;
import com.vv.common.dao.PubCommitDao;
import com.vv.common.exception.BusinessException;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class SysUserServiceImpl extends BaseService {

	public boolean addSysUser(Map tParams) throws BusinessException {
		try {
			// 加密放到了js端
			// String tPassword = (String) tParams.get("user_password");
			// // 2015-2-27 @wangyi : 密码加密
			// tPassword = PubFun.MD5Encode(tPassword, "col_vv");
			// tParams.put("user_password", tPassword);
			tPubCommitDao.doCommit(new DaoOperator("insertSysUser", tParams));
		} catch (DuplicateKeyException e) {
			throw new BusinessException("用户名重复，请更换");
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean modSysUser(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("updateSysUser", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public boolean delSysUser(Map tParams) {
		try {
			tPubCommitDao.doCommit(new DaoOperator("deleteSysUser", tParams));
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

	public Map getSysUser(Map tParams) {
		try {
			return tDefaultQueryDao.commonQuery_SQL(new DaoOperator("selectSysUser", tParams)).get(0);
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return null;
	}
}
