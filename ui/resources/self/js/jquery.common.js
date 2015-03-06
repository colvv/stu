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
		return $(this).find(".label-danger").length > 0 ? true : false;
	};
	$.fn.removeError = function(){
		var $form = $(this);
		$form.find("[validation]").each(function() {
			removeClass($(this).closest(".form-group"));
			removeMsg($form.find("label[for='" + $(this).attr("name") + "']"));
		})
	}
	$.fn.addLabel = function(info, labelType) {
		$(this).append("<span class='label label-" + labelType + " mg-l-5'>" + info + "</span>");
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
(function($) {
	$.fn.load_Selection = function(codetype) {
		$selectOjb = $(this);

	};
})(jQuery);