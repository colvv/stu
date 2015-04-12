package com.vv.stu.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.vv.common.dao.DaoOperator;
import com.vv.common.exception.BusinessException;
import com.vv.common.exception.ServiceException;
import com.vv.common.interf.BaseService;
import com.vv.common.util.PubFun;

@Service
public class ClassServiceImpl extends BaseService {

	public boolean createClass(Map tParams) throws BusinessException {
		try {
			String choose_stu = (String) tParams.get("choose_stu");
			String choose_tea = (String) tParams.get("choose_tea");
			String choose_mas = (String) tParams.get("choose_mas");
			Object mas = JSONObject.parseObject(choose_mas);
			Object tea = JSONObject.parseObject(choose_tea);
			Object stu = JSONObject.parseObject(choose_stu);
			if (!(mas instanceof Map) || !(tea instanceof Map) || !(stu instanceof Map)) {
				throw new BusinessException("系统处理异常");
			}
			Set mas_key = ((Map) mas).keySet();
			Set tea_key = ((Map) tea).keySet();
			Set stu_key = ((Map) stu).keySet();
			if (mas_key.size() != 1) {
				throw new BusinessException("一个班级只能选择一个班主任");
			}
			tPubCommitDao.doCommit(new DaoOperator("insertClass", tParams));
			Map _Params = new HashMap();
			_Params.put("class_id", tParams.get("class_id"));
			// @wangyi 2015-3-30 学生
			for (Object object : stu_key) {
				_Params.put("rela_type", "01");
				_Params.put("rela_id", ((Map) ((Map) stu).get(object)).get("stu_id"));
				tPubCommitDao.doCommit(new DaoOperator("insertClassRela", _Params));
			}
			// @wangyi 2015-3-30 老师
			for (Object object : tea_key) {
				_Params.put("rela_type", "02");
				_Params.put("rela_id", ((Map) ((Map) tea).get(object)).get("tea_id"));
				tPubCommitDao.doCommit(new DaoOperator("insertClassRela", _Params));
			}
			// @wangyi 2015-3-30 班主任
			for (Object object : mas_key) {
				_Params.put("rela_type", "03");
				_Params.put("rela_id", ((Map) ((Map) mas).get(object)).get("tea_id"));
				tPubCommitDao.doCommit(new DaoOperator("insertClassRela", _Params));
			}

		} catch (BusinessException e) {
			throw e;
		} catch (Exception e) {
			PubFun.throwServiceException(e);
		}
		return true;
	}

}
