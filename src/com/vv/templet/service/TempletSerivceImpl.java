package com.vv.templet.service;

import java.util.Map;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.BusinessException;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class TempletSerivceImpl extends BaseService {

	public boolean templetHello() throws BusinessException {
		try {
			if (PubFun.randomBoolean())
				return false;
		} catch (DuplicateKeyException e) {
			// @wangyi 2015-3-30  此异常必须被controller捕获
			throw new BusinessException("错误");
		} catch (Exception e) {
			// @wangyi 2015-3-30  抛出此异常，可使事务回滚
			throw new ServiceException();
		}
		return true;
	}

	public boolean templetSQL(Map tParams) throws BusinessException {
		try {
			// @wangyi 2015-3-30 利用通用数据库操作类进行操作
			if (tPubCommitDao.doCommit(new DaoOperator("3344", tParams)) == 1)
				return true;
		} catch (Exception e) {
			throw new ServiceException();
		}
		return true;
	}

}
