package com.vv.common.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vv.common.dao.DaoOperator;
import com.vv.common.dao.PubCommitDao;
import com.vv.common.util.PubFun;

@Repository
public class PubCommitDaoImpl implements PubCommitDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int doCommit(DaoOperator tDaoOperator) {
		String op_SQL_ID = tDaoOperator.getOp_SQL_ID();
		String sql_ID;
		Map tParams;
		String tOperator = tDaoOperator.getOp_Type();
		if (PubFun.checkNecessaryString(op_SQL_ID)) {
			sql_ID = op_SQL_ID;
			tParams = tDaoOperator.getOp_Params();
		} else {
			// 2015-2-10 @wangyi : 直接查询sql
			sql_ID = "CommonOP" + tOperator;
			tParams = new HashMap();
			tParams.put("sql_body", tDaoOperator.getOp_SQL());
		}
		if (DaoOperator.UPDATE.equals(tOperator)) {
			return sqlSession.update(sql_ID, tParams);
		} else if (DaoOperator.DELETE.equals(tOperator)) {
			return sqlSession.delete(sql_ID, tParams);
		} else if (DaoOperator.INSERT.equals(tOperator)) {
			return sqlSession.insert(sql_ID, tParams);
		} else {
			return -1;
		}
	}

	@Override
	public int doCommit(List<DaoOperator> tDaoOperators) {
		int count = 0;
		for (DaoOperator tDaoOperator : tDaoOperators) {
			count += doCommit(tDaoOperator);
		}
		return count;
	}

}
