package com.vv.stu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vv.common.interf.BaseController;
import com.vv.common.util.PubFun;
import com.vv.stu.model.SysUser;
import com.vv.stu.service.impl.FinanceServiceImpl;

@RequestMapping("/fin")
@Controller
public class FinanceController extends BaseController {
	@Autowired
	private FinanceServiceImpl tFinanceServiceImpl;

	@RequestMapping("/createFinance")
	public ModelAndView createFinance() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.addObject("sysdate", PubFun.getCurrentDate());
		tModelAndView.setViewName("/fin/createFinance");
		return tModelAndView;
	}

	@RequestMapping("/recentFinance")
	public ModelAndView recentFinance() {
		ModelAndView tModelAndView = new ModelAndView();
		tModelAndView.addObject("sysdate", PubFun.getCurrentDate());
		tModelAndView.setViewName("/fin/recentFinance");
		return tModelAndView;
	}

	@RequestMapping("/addFinance")
	@ResponseBody
	public String addFinance() {
		Map tParams = PubFun.parseReuest_all(request);
		// 2015-3-11 @wangyi : 校验金额
		String tMoney = request.getParameter("fin_money");
		if (PubFun.f_Double(tMoney) == 0) {
			return "1|金额非法,请检查";
		}
		SysUser tSysUser = (SysUser) session.getAttribute("sysuser");
		tParams.put("user_id", tSysUser.getUser_id());
		tParams.put("fin_id", tCommonServiceImpl.createMaxNo("fin_id", 10));
		tParams.put("fin_create_type", "0");
		tParams.put("fin_date", PubFun.getSimpleDate((String) tParams.get("fin_date")));
		return tFinanceServiceImpl.addFinance(tParams) ? "0" : "1";
	}

	@RequestMapping("/loadFinanceChart")
	public ModelAndView loadFinanceChart() {
		ModelAndView tModelAndView = new ModelAndView();
		Map tParams = PubFun.parseReuest_all(request);
		tModelAndView.addObject("charhtml", tFinanceServiceImpl.makeChart(tParams));
		tModelAndView.addAllObjects(tParams);
		tModelAndView.setViewName("/fin/content/financeChart");
		return tModelAndView;
	}

}
