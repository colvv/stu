var max_process = 61;
var max_dealing = 91;
var interval_process = 500;
var process_func;
var alertB_func;
var slefAnim_func;
// 在下方的选择区域用到
var choose_randomArray = [ "fa-slideshare", "fa-paw", "fa-music", "fa-codepen", "fa-diamond" ];
var choose_randomColor = [ "success", "info", "default" ];

// 2015-2-28 @wangyi : 防止连点,disabled不能点，不用特殊考虑
$("body").on("click", "button", function() {
	var $obj = $(this);
	// 增加图形转动特效
	$obj.find("i").each(function() {
		if (!$(this).hasClass("fa-spin")) {
			var $i_obj = $(this);
			$i_obj.addClass("fa-spin");
			setTimeout(function() {
				$i_obj.removeClass("fa-spin");
			}, 2000);
		}
	});
	$obj.attr("disabled", true);
	setTimeout(function() {
		$obj.attr("disabled", false);
	}, 1000);
});
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function(fmt) { // author: meizz
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}
function commonAjax(request_url, data, func) {
	ajaxInner({
		request_url : request_url,
		data : data,
		func : func,
		protype : 'loading'
	});
}
function commonAjax_none(request_url, data, func) {
	ajaxInner({
		request_url : request_url,
		data : data,
		func : func
	});
}
function commonAjax_pro(request_url, data, func) {
	ajaxInner({
		request_url : request_url,
		data : data,
		func : func,
		protype : 'process'
	});
}
function ajaxInner(paramobj) {
	if (paramobj.protype == 'process') {
		startProcess("");
	} else if (paramobj.protype == 'loading') {
		startSimpleLoad();
	}
	$.ajax({
		type : "POST",
		url : paramobj.request_url,
		data : paramobj.data,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		cache : false,
		dataType : "text",
		success : function() {
			if (paramobj.protype == 'process') {
				processHandler();
			}
			// 参数继续向下传递
			paramobj.func(arguments[0], arguments[1], arguments[2]);
		},
		error : function() {
			if (paramobj.protype == 'process') {
				processStop();
			}
			alertMsg("系统处理异常", "danger");
		},
		complete : function() {
			if (paramobj.protype == 'process') {
				processComplete();
			} else if (paramobj.protype == 'loading') {
				stopSimpleLoad();
			}
		}
	});
}
function alertMsg(msg, type) {
	if (!type) {
		type = "default";
	}
	$("#alert_msg .modal-body").html("<strong class='text-" + type + " '>" + msg + "</strong>");
	$("#alert_msg").modal('show');
}
function confrimMsg(msg, func) {
	fObject("confrim", "comfrim_modal").unbind("click");
	fObject("confrim", "comfrim_modal").click(func);
	$("#comfrim_modal .modal-body").html("<strong class='text-danger'>" + msg + "</strong>");
	$("#comfrim_modal").modal('show');
}

function startProcess(msg) {
	if (!msg) {
		msg = "正在加载，请稍候";
	}
	_log(msg);
	$("#show_process .process_info").text(msg);
	$("#show_process").show();
	$("#show_process .progress-bar").css("width", "10%");
	$("#show_process .progress-bar").data("width", 10);
	// 2015-2-12 @wangyi : 开始自动增加
	process_func = setTimeout(function() {
		processUp(10, max_process)
	}, interval_process);

}
function processUp(cur, max) {
	_log("cur:" + cur);
	var upspace = max - cur;
	var after = upspace / 2 * Math.random() + cur;
	$("#show_process .progress-bar").css("width", after + "%");
	$("#show_process .progress-bar").data("width", after);
	if (max - after > 1) {
		process_func = setTimeout(function() {
			processUp(after, max)
		}, interval_process);
	}
}
function processHandler(msg) {
	if (!msg) {
		msg = "处理数据中...";
	}
	clearTimeout(process_func);
	$("#show_process .process_info").text(msg);
	_log(msg);
	process_func = setTimeout(function() {
		processUp($("#show_process .progress-bar").data("width"), max_dealing)
	}, interval_process);
}
function processComplete(msg) {
	if (!msg) {
		msg = "加载完成";
	}
	clearTimeout(process_func);
	$("#show_process .process_info").text(msg);
	_log(msg);
	var cur = $("#show_process .progress-bar").data("width");
	setTimeout(function() {
		$("#show_process .progress-bar").css("width", "100%");
		setTimeout(function() {
			$("#show_process").hide();
			$("#show_process .progress-bar").css("width", "0%");
		}, interval_process);
	}, interval_process)

}
function processStop() {
	clearTimeout(process_func);
	$("#show_process").hide();
	$("#show_process .progress-bar").css("width", "0%");
}

function startSimpleLoad() {
	clearTimeout(slefAnim_func);
	$("#loading_simple_content [name='self-animate']").text("");
	$("#loading_simple_back").show();
	$("#loading_simple_content").show();
	selfAnimate($("#loading_simple_content [name='self-animate']"));
}
function selfAnimate($obj) {
	var text = $obj.text();
	if (text.length == 6) {
		text = "";
	} else {
		text += ".";
	}
	$obj.text(text);
	slefAnim_func = setTimeout(function() {
		selfAnimate($obj);
	}, 1000);
}
function stopSimpleLoad() {
	setTimeout(function() {
		clearTimeout(slefAnim_func);
		$("#loading_simple_back").hide();
		$("#loading_simple_content").hide();
	}, interval_process / 2);
}

function _log(message) {
	var now = new Date(), y = now.getFullYear(), m = now.getMonth() + 1, // ！JavaScript中月分是从0开始的
	d = now.getDate(), h = now.getHours(), min = now.getMinutes(), s = now.getSeconds(), time = y + '/' + m + '/' + d + ' ' + h + ':' + min + ':' + s;
	try {
		if (window.console) {
			console.log(time + ' My App: ' + message);
		}
	} catch (e) {
		// do nothing
	}
}

var _last_form = "";
/**
 * url, param, refresh,title user new
 */
function showForm(paramObj) {
	if (_last_form === paramObj.url && !paramObj.refresh) {
		$("#form_modal").modal('show');
	} else {
		if (!paramObj.title) {
			paramObj.title = "表单信息";
		}
		if (paramObj.width) {
			$("#form_modal .modal-dialog").css("width", paramObj.width);
		} else {
			$("#form_modal .modal-dialog").css("width", "");
		}

		$("#form_modal [name='form_title']").text(paramObj.title);
		_last_form = paramObj.url;
		commonAjax(paramObj.url, paramObj.param, function(msg) {
			// 2015-3-4 @wangyi : 需要去除之前的绑定哦
			fObject("confrim", "form_modal").unbind("click");
			$("#form_modal [name='form_body']").html(msg);
			$("#form_modal").modal('show');
		});
	}
}
function hideForm() {
	$("#form_modal").modal('hide');
}
// ---- -----------------  通用选择 功能区域  -----------------start
function showChoose(paramObj) {
	if (!paramObj.title) {
		paramObj.title = "请选择";
	}
	if (paramObj.width) {
		$("#choose_modal .modal-dialog").css("width", paramObj.width);
	} else {
		$("#choose_modal .modal-dialog").css("width", "");
	}

	$("#choose_modal [name='form_title']").text(paramObj.title);
	// 2015-3-26 @wangyi : 清楚选择区域
	removeAllSelected();
	commonAjax(paramObj.url, paramObj.param, function(msg) {
		// 2015-3-4 @wangyi : 需要去除之前的绑定哦
		fObject("confrim", "choose_modal").unbind("click");
		$("#choose_modal [name='form_body']").html(msg);
		$("#choose_modal").modal('show');
		if (paramObj.initEle) {
			$("#choose_modal").data("selectObj", paramObj.initEle);
		}
		$("#choose_modal").data("paramObj", paramObj);
		fObject("confrim", "choose_modal").click(function() {
			//_log(displayObj($("#choose_modal").data("selectObj")));
			paramObj.confrim_func($("#choose_modal").data("selectObj"));
			hideChoose();
		});
	});
	if (paramObj.initEle) {
		for ( var _index in paramObj.initEle) {
			choose_addEle(paramObj.initEle[_index]);
		}
	}
}
$(document).ready(function() {
	//双击移除
	fObject("selected_area", "choose_modal").on('dblclick', ".panel", function() {
		var _objData = $("#choose_modal").data("selectObj");
		delete _objData[$(this).find("[name='selelct_id']").val()];
		$("#choose_modal").data("selectObj", _objData);
		$(this).popover("hide");
		$(this).remove();
	});
});
function choose_addEle(_data) {
	var _objData = $("#choose_modal").data("selectObj");
	var _paramObj = $("#choose_modal").data("paramObj")
	if (!_objData) {
		_objData = new Object();
	} else {
		if (_objData[_data[_paramObj.select_id]]) {
			return;
		}
	}
	if(_paramObj.maxChoose){
		if(getObj_Attr_Count(_objData)>=_paramObj.maxChoose){
			alertMsg_B("操作失败，超过最大选择上限（"+_paramObj.maxChoose+"）");
			return;
		}
	}
	_objData[_data[_paramObj.select_id]] = _data;
	$("#choose_modal").data("selectObj", _objData);
	var html = "<div class='panel panel-" + choose_randomColor[parseInt(Math.random() * 3)] + " pull-left mg-r-5 mg-b-5 cursor-p'  name='" + _data[_paramObj.select_id]
			+ "'  title='' data-content='<span class=base-font><small>";
	for ( var info_param in _paramObj.show_info) {
		html += _paramObj.show_info[info_param] + "：" + (_data[info_param] ? _data[info_param] : '') + "<br>";
	}
	if (_paramObj.show_info.length != 0) {
		html = html.substr(0, html.length - 4);
	}
	html += "</small><span>'> <div class='panel-heading panel-head-lite pull-left'> <i class=' fa " + choose_randomArray[parseInt(Math.random() * 5)]
			+ " fa-lg pull-left mg-t-3'></i> <div class='huge pull-left'> " + _data[_paramObj.select_name] + " </div> </div><input type='hidden' name='selelct_id' value='"
			+ _data[_paramObj.select_id] + "'> </div>";
	fObject("selected_area", "choose_modal").append(html);

	fObject("selected_area", "choose_modal").find("[name='" + _data[_paramObj.select_id] + "']").popover({
		placement : 'top',
		trigger : "click",
		delay : {
			show : 200,
			hide : 100
		},
		html : true
	});

}
function removeAllSelected() {
	fObject("selected_area", "choose_modal").html('');
	$("#choose_modal").data("selectObj", new Object());
}
function hideChoose() {
	$("#choose_modal").modal('hide');
}

//---- -----------------  通用选择 功能区域  -----------------end

function fValue(field, baseD) {
	if (baseD) {
		return $("#" + baseD + "  [name='" + field + "']").val();
	} else {
		return $("[name='" + field + "']").val();
	}
}
/**
 * 根据name来获取元素本身 主要考虑页面相同id过多
 * 
 * @param field
 * @returns
 */
function fObject(field, baseD) {
	if (baseD) {
		return $("#" + baseD + "  [name='" + field + "']");
	} else {
		return $("[name='" + field + "']");
	}
}
function parseParamObj($objs) {
	var param_str = "{";
	$objs.each(function() {
		param_str += $(this).attr("name") + ":'";
		param_str += $(this).val() + "',";
	});
	param_str = param_str.substr(0, param_str.length - 1);
	param_str += "}";
	return eval("(" + param_str + ")");
}
function dPicker($obj) {
	$obj.datetimepicker({
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});
}
/**
 * 校验日期合法性
 * 
 * @param str
 * @returns {Boolean}
 */
function checkDate(str) {
	if (!str) {
		return false;
	}
	var reg = /^(\d{4})(\d{2})(\d{2})$/;
	var r = str.match(reg);
	if (r == null)
		return false;
	r[2] = r[2] - 1;
	var d = new Date(r[1], r[2], r[3]);
	if (d.getFullYear() != r[1])
		return false;
	if (d.getMonth() != r[2])
		return false;
	if (d.getDate() != r[3])
		return false;

	return true;
}
function checkNecessaryStr(str) {
	if (str !== "" && str !== null && str !== "null") {
		return true;
	}
	return false;
}

function alertMsg_B(msg, type) {
	if (!type) {
		// 2015-3-27 @wangyi : 类型转换
		msg = msg.toString();
		if (msg.indexOf("成功") !== -1) {
			type = "success";
		} else if (msg.indexOf("失败") !== -1) {
			type = "danger";
		} else {
			type = "info";
		}
	}
	$("#alert_bottom").hide();
	$("#alert_bottom").finish();
	clearTimeout(alertB_func);
	$("#alert_bottom .alert").removeClass().addClass("alert alert-" + type + " alert-dismissable  col-xs-6 ");
	var html = '<span class="label label-' + type + ' " >' + type + '</span><i class=" fa fa-info-circle mg-l-5"></i><strong class="mg-l-5 ">' + msg + '</strong>';
	fObject("dispay_area", "alert_bottom").html(html);
	$("#alert_bottom").fadeIn("normal");
	alertB_func = setTimeout(function() {
		$("#alert_bottom").fadeOut("slow");
	}, 5000);
}
function addCookie(name, value, days) {
	var cookieString = name + "=" + escape(value);
	// 判断是否设置过期时间
	if (days > 0) {
		var date = new Date();
		date.setTime(date.getTime() + days * 24 * 3600 * 1000);
		cookieString = cookieString + "; path=/;expires=" + date.toGMTString();
	}
	document.cookie = cookieString;
}
function getCookie(name) {
	var strCookie = document.cookie;
	var arrCookie = strCookie.split("; ");
	for ( var i = 0; i < arrCookie.length; i++) {
		var arr = arrCookie[i].split("=");
		if (arr[0] == name)
			return arr[1];
	}
	return "";
}
function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";path=/;expires=" + exp.toGMTString();
}
function getSimpleDate(str) {
	if (str) {
		return (str.toString()).replace("-", "").replace("-", "").replace("/", "").replace("/", "");
	}
}
/**
 * 获取日期对象
 * 
 * @param strDate
 *            日期字符串
 * @param splitOp
 *            分割符
 * @return 返回日期对象
 * 
 */
function getDate(strDate) {
	if (!strDate) {
		return strDate
	}
	strDate = getSimpleDate(strDate);
	if (strDate.length != 8) {
		return null;
	}
	// 2015-3-11 @wangyi : 月份减1？
	// 2015-3-23 @wangyi : 改了又改
	return new Date(Date.parse(strDate.substr(0, 4) + "/" + strDate.substr(4, 2) + "/" + strDate.substr(6, 2)));
}
function calDate(baseDate, interval, unit) {
	var baseD = getDate(baseDate), result = baseD;
	if (unit === "D") {
		result.setDate(baseD.getDate() + interval);
	} else if (unit === "M") {
		result.setMonth(baseD.getMonth() + interval);
	} else if (unit === "Y") {
		result.setFullYear(baseD.getFullYear() + interval);
	}
	return result.Format("yyyy-MM-dd");
}
function monthLastDay(tMonth) {
	var tYM = tMonth.split("-");
	var tY = tYM[0];
	var tM = tYM[1];
	var tD = "31";
	if ("04" === tM || "06" === tM || "09" === tM || "11" === tM) {
		tD = "30";
	} else if ("02" === tM) {
		if (parseInt(tY) % 4 == 0 && (parseInt(tY) % 100 != 0 || parseInt(tY) % 400 == 0)) {
			tD = "29";
		} else {
			tD = "28";
		}
	}
	return tMonth + "-" + tD;
}
/**
 * 格式化数字
 * 
 * @param num
 * @returns
 */
function formatNum(num) {
	if (isNaN(num)) {
		return 0;
	}
	num = "" + num;
	if (num.charAt(0) === '-') {
		return "-" + formatNum(num.substring(1));
	}
	if (num.indexOf(".") == -1) {
		var count = 0;
		var result = "";
		for ( var i = num.length - 1; i >= 0; i--) {
			count++;
			result = num.charAt(i) + result;
			if (count % 3 === 0 && count < num.length)
				result = "," + result;
		}
		return result;
	} else {
		var array = num.split('.');
		return formatNum(array[0]) + "." + array[1];
	}
}
function displayObj(obj) {
	return JSON.stringify(obj);
}
function getObj_Attr_Count(obj) {
	var count = 0;
	for ( var i in obj)
		count++;
	return count;
}