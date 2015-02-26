var max_process = 61;
var max_dealing = 91;
var interval_process = 500;
var process_func;

function commonAjax(request_url, data, func) {
	$.ajax({
		type : "POST", url : request_url, data : data,
		contentType : "application/x-www-form-urlencoded; charset=utf-8", cache : false, dataType : "text",
		success : function() {
			// 参数继续向下传递
			func(arguments[0], arguments[1], arguments[2]);
		}, error : function() {
			alertMsg("系统处理异常", "danger");
		}, complete : function() {
		}
	});
}
function commonAjax_pro(request_url, data, func) {
	startProcess("");
	$.ajax({
		type : "POST", url : request_url, data : data,
		contentType : "application/x-www-form-urlencoded; charset=utf-8", cache : false, dataType : "text",
		success : function() {
			processHandler();
			// 参数继续向下传递
			func(arguments[0], arguments[1], arguments[2]);
		}, error : function() {
			processError();
			alertMsg("系统处理异常", "danger");
		}, complete : function() {
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
function processError() {
	clearTimeout(process_func);
	$("#show_process").hide();
	$("#show_process .progress-bar").css("width", "0%");
}
function _log(message) {
	var now = new Date(), y = now.getFullYear(), m = now.getMonth() + 1, // ！JavaScript中月分是从0开始的
	d = now.getDate(), h = now.getHours(), min = now.getMinutes(), s = now.getSeconds(), time = y + '/' + m + '/' + d
			+ ' ' + h + ':' + min + ':' + s;
	try {
		if (window.console) {
			console.log(time + ' My App: ' + message);
		}
	} catch (e) {
		// do nothing
	}
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
		weekStart : 1, todayBtn : 1, autoclose : 1, todayHighlight : 1, startView : 2, minView : 2, forceParse : 0
	});
}

/**
 * 表单校验部分
 *
 */
(function($) {
	$.fn.vali_Ele = function() {
		var validation = $(this).attr("validation");
		var value = $.trim($(this).val());
		var $display = $(this).closest(".form-group");
		var $msg = $(this).closest(".control-label");
		removeClass($display);
		removeMsg($msg);
		if (validation.indexOf("required") !== -1) {
			if (value != "" && value != null && value != "null") {
				$display.addClass("has-success");
				$msg.appendTo("<span class='extendinfo'><i class='icon-ok-sign' style='color:green;'></i></span>");
			} else {
				$display.addClass("has-error");
				$msg.appendTo("<span class='extendinfo'><i class='icon-minus-sign' style='color:green;'></i>此项必须填写</span>");
			}
		}
	};
	$.fn.vali_Form = function() {
		$(this).find("[validation]").each(function() {
			$(this).vali_Ele();

		})
	};
	function removeClass($obj) {
		$obj.removeClass("has-success");
		$obj.removeClass("has-error");
	}
	function removeMsg($obj) {
		$obj.find(".extendinfo").remove();
	}
})(jQuery);