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


@Service
public class SysUserServiceImpl extends BaseService{

	public List<Map> updateUsers() {
		try {
			tDefaultQueryDao.commonQuery_SQL("SELECT tea_id FROM vv_teacher");
			DaoOperator tDaoOperator = new DaoOperator();
			tDaoOperator.setOp_Type(DaoOperator.UPDATE);
			tDaoOperator.setOp_SQL("UPDATE vv_teacher SET tea_desc=CONCAT(tea_name,'0',tea_id) ");
			tPubCommitDao.doCommit(tDaoOperator);
			tDaoOperator = new DaoOperator();
			tDaoOperator.setOp_Type(DaoOperator.UPDATE);
			tDaoOperator.setOp_SQL("UPDATE 2132132334 SET tea_3443desc=CONCAT(tea_name,'5',tea_id) ");
			tPubCommitDao.doCommit(tDaoOperator);
			return null;
		} catch (Exception e) {
			logger.error("service层处理出现异常："+e.toString());
			throw new ServiceException("数据处理失败");
		}
	}
	public String example(){
		try {
			//.. content
			return null;
		} catch (Exception e) {
			logger.error("service层处理出现异常："+e.toString());
			throw new ServiceException("数据处理失败");
		}
	}
	public List<Map> selectTeachers(){
		try {
			//.. content
			return tDefaultQueryDao.commonQuery_SQL("select * from vv_teacher");
		} catch (Exception e) {
			logger.error("service层处理出现异常："+e.toString());
			throw new ServiceException("数据处理失败");
		}
	}
}
