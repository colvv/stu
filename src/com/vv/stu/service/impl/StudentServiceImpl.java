package com.vv.stu.service.impl;

import org.springframework.stereotype.Service;

import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;

@Service
public class StudentServiceImpl extends BaseService {

	public boolean addStu(String tName) {
		try {
			tPubCommitDao.doCommit(new DaoOperator(
					"Insert into vv_student values ('2008000004','" + tName
							+ "',now())"));
			tPubCommitDao.doCommit(new DaoOperator(
					"insert into vv_student_info (stu_id) values ('2008000004')"));
			return true;
		} catch (Exception e) {
			logger.error("service层处理出现异常："+e.toString());
			throw new ServiceException("数据处理失败");
		}
		
	}
}
