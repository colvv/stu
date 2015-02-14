package com.vv.common.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@SuppressWarnings("rawtypes")
public interface PubCommitDao {
	public int doCommit(DaoOperator tDaoOperator);
	// 2015-2-10 @wangyi : 考虑有序
	public int doCommit(ArrayList<DaoOperator> tDaoOperators);

}
