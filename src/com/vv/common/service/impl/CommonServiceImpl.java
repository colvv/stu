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
import com.vv.common.util.PubFun;

/**
 * 用户数据加载，不需要事务控制 not any more
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
	/**
	 * 获取系统流水号
	 * @param id
	 * @param length
	 * @return
	 * @author wangyi  2015-2-25
	 */
	public String createMaxNo(String id, int length) {
		double maxno = PubFun.f_Double(tDefaultQueryDao
				.commonQuery_SQL("SELECT IFNULL(max(vv_sys_maxno.no),-1)+1 maxno FROM vv_sys_maxno WHERE id='" + id + "' for update").get(0)
				.get("maxno"));
		if (maxno == 0) {
			logger.debug("auto do insert like >>INSERT INTO vv_sys_maxno VALUES ('hello',0)<<  ");
			tPubCommitDao.doCommit(new DaoOperator("INSERT INTO vv_sys_maxno VALUES ('"+id+"',1)",DaoOperator.INSERT));
			maxno = 1;
		}else{
			tPubCommitDao.doCommit(new DaoOperator("update vv_sys_maxno set no=no+1 where id ='"+id+"'",DaoOperator.UPDATE));
		}
		return PubFun.LCh(PubFun.s_Double(maxno, 0), "0", length);
	}
}
