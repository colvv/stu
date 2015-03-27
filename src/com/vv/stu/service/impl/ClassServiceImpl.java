package com.vv.stu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.vv.common.exception.BusinessException;
import com.vv.common.interf.BaseService;

@Service
public class ClassServiceImpl extends BaseService {

	public boolean createClass(Map tParams) throws BusinessException {
		String choose_stu = (String) tParams.get("choose_stu");
		String choose_tea = (String) tParams.get("choose_tea");
		String choose_mas = (String) tParams.get("choose_mas");
		

		return true;
	}

}
