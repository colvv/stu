package com.vv.common.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vv.common.dao.DaoOperator;
import com.vv.common.dao.DefaultQueryDao;
import com.vv.common.util.PubFun;

@Repository
public class DefaultQueryDaoImpl implements DefaultQueryDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String getOneValue(String tSQL) {
		Map tMap = new HashMap<>();
		tMap.put("sql_body", tSQL);
		return getOneValue("CommonQuery", tMap);
	}

	@Override
	public String getOneValue(String tSQLID, Map tParams) {
		return sqlSession.selectOne(tSQLID, tParams);
	}

	@Override
	public List<Map> commonQuery_SQL(DaoOperator tDaoOperator) {
		String op_SQL_ID = tDaoOperator.getOp_SQL_ID();
		String sql_ID;
		Map tParams;
		if (DaoOperator.SELECT.equals(tDaoOperator.getOp_Type())) {
			if (PubFun.checkNecessaryString(op_SQL_ID)) {
				sql_ID = op_SQL_ID;
				tParams = tDaoOperator.getOp_Params();
			} else {
				// 2015-2-10 @wangyi : 直接查询sql
				sql_ID = "CommonQuery";
				tParams = new HashMap();
				tParams.put("sql_body", tDaoOperator.getOp_SQL());
			}
			return sqlSession.selectList(sql_ID, tParams);
S		} else {
			return null;
		}
	}

	@Override
	public List<Map> commonQuery_SQL(String tSQL) {
		DaoOperator tDaoOperator = new DaoOperator(tSQL);
		return commonQuery_SQL(tDaoOperator);
	}

}
