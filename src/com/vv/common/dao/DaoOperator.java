package com.vv.common.dao;

import java.util.Map;

public class DaoOperator {
	public static final String UPDATE = "UPDATE";
	public static final String INSERT = "INSERT";
	public static final String DELETE = "DELETE";
	public static final String SELECT = "SELECT";
	private String op_Type;
	private String op_SQL;
	private String op_SQL_ID;
	private Map op_Params;

	public DaoOperator() {

	}

	public DaoOperator(String tSQL) {
		this.op_SQL = tSQL;
		String tF_C = (tSQL.substring(0, 1)).toUpperCase();
		if ("I".equals(tF_C)) {
			this.op_Type = INSERT;
		} else if ("U".equals(tF_C)) {
			this.op_Type = UPDATE;
		} else if ("D".equals(tF_C)) {
			this.op_Type = DELETE;
		} else {
			this.op_Type = SELECT;
		}
	}
	public DaoOperator(String tSQL,String tOp_Type) {
		this.op_SQL = tSQL;
		this.op_Type = tOp_Type;
	}

	public DaoOperator(String tSQL_ID, Map tParams) {
		this.op_SQL_ID = tSQL_ID;
		this.op_Params = tParams;
		String tF_C = (tSQL_ID.substring(0, 1)).toUpperCase();
		if ("I".equals(tF_C)) {
			this.op_Type = INSERT;
		} else if ("U".equals(tF_C)) {
			this.op_Type = UPDATE;
		} else if ("D".equals(tF_C)) {
			this.op_Type = DELETE;
		} else {
			this.op_Type = SELECT;
		}
	}

	public String getOp_Type() {
		return op_Type;
	}

	public void setOp_Type(String op_Type) {
		this.op_Type = op_Type;
	}

	public String getOp_SQL() {
		return op_SQL;
	}

	public void setOp_SQL(String op_SQL) {
		this.op_SQL = op_SQL;
	}

	public String getOp_SQL_ID() {
		return op_SQL_ID;
	}

	public void setOp_SQL_ID(String op_SQL_ID) {
		this.op_SQL_ID = op_SQL_ID;
	}

	public Map getOp_Params() {
		return op_Params;
	}

	public void setOp_Params(Map op_Params) {
		this.op_Params = op_Params;
	}

}
