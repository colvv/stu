package com.vv.common.dao;

import java.util.List;
import java.util.Map;
@SuppressWarnings("rawtypes")
public interface DefaultQueryDao {

	public String getOneValue(String tSQL);

	public String getOneValue(String tSQL, Map tParams);

	public List<Map> commonQuery_SQL(DaoOperator tDaoOperator);
	
	public List<Map> commonQuery_SQL(String tSQL);

}
