package com.vv.common.service.impl;

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

/**
 * 用户数据加载，不需要事务控制
 * 
 * @author Administrator
 * 
 */
@Service
public class CommonServiceImpl extends BaseService {

	public List<Map> loadTableData(String table_id, Map tMap) {
		try {
			return tDefaultQueryDao.commonQuery_SQL(new DaoOperator(table_id, tMap));
		} catch (Exception e) {
			logger.error("service层处理出现异常：" + e.toString());
			throw new ServiceException("数据处理失败");
		}
	}

	public String createMaxNo(String id, int length) {
			
			String tSQL = "UPDATE vv_sys_maxno SET vv_sys_maxno.no = vv_sys_maxno.no+1 WHERE id = 333 AND @value := vv_sys_maxno.no+1; SELECT @value; ";
			String tResult = tDefaultQueryDao.getOneValue(tSQL);
			logger.debug(tResult);
			return tResult;
		}
		
		

}
