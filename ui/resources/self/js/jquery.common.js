(function($) {
	$.fn.vTable = function(data, title) {
		var html = "<table class='table table-condensed table-bordered table-hover'>";
		html += "<thead><tr class='success'>"
		for ( var param in title) {
			html += "<th>" + title[param] + "</th>";
		}
		html += "</tr></thead><tbody>";
		for (i = 0; i < data.length; i++) {
			html += "<tr>";
			for ( var param in title) {
				var node = data[i][param];
				// 替换可能的undifined
				if (!node) {
					node = "";
				}
				html += "<td>" + node + "</td>";
			}
			html += "</tr>";
		}
		html += "</tbody></table>";
		$(this).html(html);
	};
})(jQuery);
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
				$msg.after("<div class='extendinfo label label-danger pull-right'><i class='fa fa-minus-circle'></i>" + checkResult
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
		return $(this).find(".label-danger").filter(".extendinfo").length > 0 ? true : false;
	};
	$.fn.removeError = function() {
		var $form = $(this);
		$form.find("[validation]").each(function() {
			removeClass($(this).closest(".form-group"));
			removeMsg($form.find("label[for='" + $(this).attr("name") + "']"));
		})
	}
	$.fn.addLabel = function(info, labelType) {
		if ($(this).attr("for")) {
			$(this).append("<span class='label label-" + labelType + " mg-l-5 user_label_info'>" + info + "</span>");
		} else {
			$(this).closest("form").find("[for='" + $(this).attr("name") + "']").append(
					"<span class='label label-" + labelType + " mg-l-5 user_label_info'>" + info + "</span>");
		}
	}
	$.fn.delLabel = function() {
		if ($(this).attr("for")) {
			$(this).find(".label").filter(".user_label_info").remove();
		} else {
			$(this).closest("form").find("[for='" + $(this).attr("name") + "']").find(".label").filter(".user_label_info").remove();
		}
	}
	$.fn.displayNec_Ele = function() {
		var validation = $(this).attr("validation");
		var $form = $(this).closest("form");
		var $msg = $form.find("label[for='" + $(this).attr("name") + "']");
		if (validation.indexOf("required") !== -1) {
			$msg.addLabel("必要", "warning");
		} else {
			$msg.addLabel("可选", "primary");
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
		} else if (rule === "num") {
			if (isNaN(value)) {
				return "请输入正确的数字";
			}
		} else if (rule === "date") {
			value = getSimpleDate(value);
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
		} else if (rule.indexOf("maxdate") !== -1) {
			var maxdate = rule.split("=")[1];
			var maxdateval = getSimpleDate(maxdate);
			value = getSimpleDate(value);
			if (value > maxdateval) {
				return "超过最大日期范围:" + maxdate;
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
(function($) {
	$.fn.load_Selection = function(settings) {
		var defaults = {
			codetype : '',
			// 2015-3-9 @wangyi : 是否可以访问缓存
			cache : true,
			// 2015-3-9 @wangyi : 拼接条件生成方法
			conditionFunc : undefined,
			needEmpty : true,
			defaultVal : ''
		}, opt = $.extend(defaults, settings), condition = '', cacheValue = null, $selectOjb = $(this);

		if (opt.conditionFunc) {
			condition = opt.conditionFunc();
		}
		if (opt.cache) {
			cacheValue = $("body").data(opt.codetype + "|" + condition);
		}
		initELement($selectOjb);
		if (cacheValue) {
			displayResult(cacheValue, $selectOjb, opt.needEmpty, opt.defaultVal);
		} else {
			commonAjax_none("/loadSelection.do", {
				codetype : opt.codetype,
				condition : condition
			}, function(msg) {
				$("body").data(opt.codetype + "|" + condition, msg);
				displayResult(msg, $selectOjb, opt.needEmpty, opt.defaultVal);
			});
		}
	};
	function initELement($selectOjb) {
		$selectOjb.empty();
		$selectOjb.append("<option value=''>正在加载...</option>");
		$selectOjb.prop("disabled", true);
	}
	function displayResult(msg, $selectOjb, needEmpty, defaultVal) {
		$selectOjb.empty();
		var datas = eval("(" + msg + ")");
		var html = "";
		if (needEmpty) {
			html += "<option value=''>请选择</option>"
		}
		for (i = 0; i < datas.length; i++) {
			html += "<option value='" + datas[i].code + "'>" + datas[i].codename + "</option>"
		}
		$selectOjb.append(html);
		$selectOjb.prop("disabled", false);
		$selectOjb.val(defaultVal);
	}
})(jQuery);