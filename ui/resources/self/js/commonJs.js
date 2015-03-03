var max_process = 61;
var max_dealing = 91;
var interval_process = 500;
var process_func;
var alertB_func;

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

function commonAjax(request_url, data, func) {
	$.ajax({
		type : "POST",
		url : request_url,
		data : data,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		cache : false,
		dataType : "text",
		success : function() {
			// 参数继续向下传递
			func(arguments[0], arguments[1], arguments[2]);
		},
		error : function() {
			alertMsg("系统处理异常", "danger");
		},
		complete : function() {
		}
	});
}
function commonAjax_pro(request_url, data, func) {
	startProcess("");
	$.ajax({
		type : "POST",
		url : request_url,
		data : data,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		cache : false,
		dataType : "text",
		success : function() {
			processHandler();
			// 参数继续向下传递
			func(arguments[0], arguments[1], arguments[2]);
		},
		error : function() {
			processStop();
			alertMsg("系统处理异常", "danger");
		},
		complete : function() {
			processComplete();
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
function _log(message) {
	var now = new Date(), y = now.getFullYear(), m = now.getMonth() + 1, // ！JavaScript中月分是从0开始的
	d = now.getDate(), h = now.getHours(), min = now.getMinutes(), s = now.getSeconds(), time = y + '/' + m + '/' + d + ' ' + h + ':' + min
			+ ':' + s;
	try {
		if (window.console) {
			console.log(time + ' My App: ' + message);
		}
	} catch (e) {
		// do nothing
	}
}
var _last_form = "";
function showForm(url, param, refresh) {
	if (_last_form === url && !refresh) {
		$("#form_modal").modal('show');
	} else {
		_last_form = url;
		commonAjax(url, param, function(msg) {
			$("#form_modal [name='form_content']").html(msg);
			$("#form_modal").modal('show');
		});
	}

}
function hideForm() {
	$("#form_modal").modal('hide');
}

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
/**
 * 表单校验部分 1.加入参数，校验成功不显示正确
 * 
 */
(function($) {
	$.fn.vali_Ele = function(succ_none) {
		var validation = $(this).attr("validation");
		var value = $.trim($(this).val());
		var $display = $(this).closest(".form-group");
		var $form = $(this).closest("form");
		var $msg = $form.find("label[for='" + $(this).attr("name") + "']");
		removeClass($display);
		removeMsg($msg);
		// 准备结束
		var valis = validation.split("|");
		for ( var i = 0; i < valis.length; i++) {
			var checkResult = validateFunc(value, valis[i]);
			if (checkResult !== 0) {
				// 出现错误
				$display.addClass("has-error");
				$msg
						.after("<div class='extendinfo label label-danger pull-right'><i class='fa fa-minus-circle'></i>" + checkResult
								+ "</div>");
				// 2015-2-26 @wangyi : 增加一个提示动画效果
				$msg.nextAll(".extendinfo").animate({
					marginRight : 70
				}, 200, null, function() {
					$msg.nextAll(".extendinfo").animate({
						marginRight : 0
					}, 200);
				});
				return false;
			}
		}
		if (!succ_none) {
			$display.addClass("has-success");
			$msg.after("<div class='extendinfo label label-success pull-right'><i class='fa fa-check-circle'></i></div>");
		}
		return true;
	};
	$.fn.vali_Form = function(succ_none) {
		$(this).find("[validation]").each(function() {
			$(this).vali_Ele(succ_none);
		})
	};
	$.fn.hasError = function() {
		return $(this).find(".label-danger").length > 0 ? true : false;
	};
	$.fn.displayNec_Ele = function() {
		var validation = $(this).attr("validation");
		var $form = $(this).closest("form");
		var $msg = $form.find("label[for='" + $(this).attr("name") + "']");
		if (validation.indexOf("required") !== -1) {
			$msg.append("<span class='label label-warning mg-l-20'>必要</span>");
		} else {
			$msg.append("<span class='label label-primary mg-l-20'>可选</span>");
		}
	};
	$.fn.displayNec_Form = function() {
		$(this).find("[validation]").each(function() {
			$(this).displayNec_Ele();
		});
	};
	function removeClass($obj) {
		$obj.removeClass("has-success");
		$obj.removeClass("has-error");
	}
	function removeMsg($obj) {
		$obj.nextAll(".extendinfo").remove();
	}
	function validateFunc(value, rule) {
		if (rule === "required") {
			if (!checkNecessaryStr(value)) {
				return "此项必须填写";
			}
		} else if (rule === "date") {
			value = value.replace("-", "").replace("-", "");
			value = value.replace("/", "").replace("/", "");
			if (!checkDate(value)) {
				return "日期不合法请重新填写";
			}
		} else if (rule === "password") {
			var regx = /^[a-zA-Z0-9_]*$/;
			if (!regx.test(value)) {
				return "只可输入字母数字下划线";
			}

		} else if (rule.substr(0, 3) === "len") {
			if (checkNecessaryStr(value)) {
				var length = rule.split("=")[1];
				if (value.length != length) {
					return "此项的长度应为" + length;
				}
			}
		} else if (rule.indexOf("maxlen") !== -1) {
			var maxlength = rule.split("=")[1];
			if (value.length > maxlength) {
				return "此项最大长度为" + maxlength;
			}
		} else if (rule.indexOf("minlen") !== -1) {
			if (checkNecessaryStr(value)) {
				var minlength = rule.split("=")[1];
				if (value.length < minlength) {
					return "此项最小长度为" + minlength;
				}
			}
		}
		return 0;
	}
})(jQuery);

function alertMsg_B(msg, type) {
	if (!type) {
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
	var html = '<span class="label label-' + type + ' " >' + type + '</span><i class=" fa fa-info-circle mg-l-5"></i><strong class="mg-l-5 ">'
			+ msg + '</strong>';
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
