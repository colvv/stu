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

/**
 * 数据中的参数包括
 * top，left，id，name，renderTo，css，cssClass,title等
 */
(function($) {
	$.fn.vProcess = function(settings) {
		var defaults = {
			top : 100,
			left : 50,
			x_step : 300,
			y_step : 150,
			direct : 1,
			move_able : false,
			simple_datas : null,
			complex_datas : null,
			lineFunc : undefined,
			program : false
		}, opt = $.extend(defaults, settings), $processOjb = $(this), width = $processOjb.width(), html = "<div class='statemachine-demo'>", random_id = $processOjb
				.attr("id"), complex_default = {
			top : 0,
			left : 0
		}, complex_opt;
		if (opt.simple_datas) {
			// 2015-3-16 @wangyi : 首先计算宽度
			var size = parseInt((width + 50) / 300);
			if (size === 0) {
				// 2015-3-16 @wangyi : 至少为1
				size = 1;
			}
			for ( var i = 0; i < opt.simple_datas.length; i++) {
				if (typeof opt.simple_datas[i] == "object") {
					html += getNodeHtml(opt.left, opt.top, random_id, i, opt.simple_datas[i].name, opt.simple_datas[i].cssClass,
							opt.simple_datas[i].title);
				} else {
					html += getNodeHtml(opt.left, opt.top, random_id, i, opt.simple_datas[i], null, null);
				}
				opt.left += opt.direct * opt.x_step;
				// 2015-3-17 @wangyi :  此处的逻辑应当调整
				if ((i + 1) % size == 0) {
					if (opt.direct == -1) {
						opt.left = 50;
					} else {
						// u n y?
						opt.left = opt.x_step * size - 150 - 150 + 50;
					}
					opt.direct = opt.direct * -1;
					opt.top += 150;
				}
			}
		} else if (opt.complex_datas) {
			for ( var i = 0; i < opt.complex_datas.length; i++) {
				if (!opt.complex_datas[i].left) {
					opt.complex_datas[i].left = 100;
				}
				if (!opt.complex_datas[i].top) {
					opt.complex_datas[i].top = 100;
				}
				html += getNodeHtml(opt.complex_datas[i].left, opt.complex_datas[i].top, random_id, opt.complex_datas[i].id,
						opt.complex_datas[i].name, opt.complex_datas[i].cssClass, opt.complex_datas[i].title)
			}
			if (opt.program) {
				html += "<input type='button' name='export' value='导出信息'><textarea name='export_info' style='width:500px;height:200px;'></textarea>";
			}
		}
		html += "</div>";

		$processOjb.html(html);
		if (opt.simple_datas) {
			for ( var i = 0; i < opt.simple_datas.length; i++) {
				if (typeof opt.simple_datas[i] == "object") {
					if (opt.simple_datas[i].css) {
						for ( var i = 0; i < opt.simple_datas.length; i++) {
							if (opt.simple_datas[i].css) {
								$("#node_" + random_id + i).css(opt.simple_datas[i].css);
							}
						}
					}
				}
			}
		} else if (opt.complex_datas) {
			for ( var i = 0; i < opt.complex_datas.length; i++) {
				if (opt.complex_datas[i].css) {
					$("#node_" + random_id + opt.complex_datas[i].id).css(opt.complex_datas[i].css);
				}
			}
		}
		// 2015-3-17 @wangyi :  提示框
		$processOjb.find(".w").tooltip({
			html : true
		});

		$processOjb.find("[name='export']").click(function() {
			$processOjb.find("[name='export_info']").val(exportElements(opt.complex_datas, random_id));
		});

		var instance = initJsPlumb($processOjb.attr("id"), opt.complex_datas);
		var windows = jsPlumb.getSelector("#" + $processOjb.attr("id") + " .statemachine-demo .w");
		// 可以拖动
		if (opt.move_able) {
			instance.draggable(windows);
		}
		if (opt.lineFunc) {
			instance.bind("connection", opt.lineFunc);
			// function(info) {
			// 更改连线名称
			// info.connection.getOverlay("label").setLabel("流转");
			// });
		}
		// suspend drawing and initialise.
		instance.batch(function() {
			instance.makeSource(windows, {
				filter : ".ep",
				anchor : "Continuous",
				connector : "Straight",
				connectorStyle : {
					strokeStyle : "#5c96bc",
					lineWidth : 2,
					outlineColor : "transparent",
					outlineWidth : 4
				}
			// maxConnections : 5,
			// onMaxConnections : function(info, e) {
			// alert("Maximum connections (" + info.maxConnections + ")
			// reached");
			// }
			});

			// 连线
			instance.makeTarget(windows, {
				dropOptions : {
					hoverClass : "dragHover"
				},
				anchor : "Continuous",
				allowLoopback : true
			});
			if (opt.simple_datas) {
				for ( var i = 0; i < opt.simple_datas.length; i++) {
					if (opt.simple_datas[i + 1]) {
						instance.connect({
							source : "node_" + random_id + i,
							target : "node_" + random_id + (i + 1)
						});
					}
				}
			} else if (opt.complex_datas) {
				for ( var i = 0; i < opt.complex_datas.length; i++) {
					if (opt.complex_datas[i].renderTo) {
						for ( var j = 0; j < opt.complex_datas[i].renderTo.length; j++) {
							//_log("source:" + opt.complex_datas[i].id + ",target:" + opt.complex_datas[i].renderTo[j]);
							if (typeof opt.complex_datas[i].renderTo[j] == "object") {
								instance.connect({
									source : "node_" + random_id + opt.complex_datas[i].id,
									target : "node_" + random_id + opt.complex_datas[i].renderTo[j].target,
									// 2015-3-16 @wangyi : 增加标签
									overlays : [ [ "Label", {
										label : opt.complex_datas[i].renderTo[j].lineName,
										id : "label",
										cssClass : "aLabel"
									} ] ]
								});
							} else {
								instance.connect({
									source : "node_" + random_id + opt.complex_datas[i].id,
									target : "node_" + random_id + opt.complex_datas[i].renderTo[j]
								});
							}
						}
					}
				}
			}
		});
	};
	function getNodeHtml(left, top, random_id, id, name, cssClass, title) {
		var html = "<div class='w label label-default";
		if (cssClass) {
			html += " " + cssClass;
		}
		html += "' id='node_" + random_id + id + "' style='left:" + left + "px;top:" + top + "px' ";
		if (title) {
			html += " title='" + title + "'";
		}
		html += ">" + name + "</div>";
		return html;
	}
	function initJsPlumb(id, obj) {
		var setting = {};
		// 2015-3-16 @wangyi : 暂时废弃
		if (false) {
			setting = {
				// 箭头上的文字和选中效果
				label : "FOO",
				id : "label",
				cssClass : "aLabel"
			}
		}
		return jsPlumb.getInstance({
			Endpoint : [ "Dot", {
				radius : 2
			} ],
			HoverPaintStyle : {
				strokeStyle : "#1e8151",
				lineWidth : 2
			},
			ConnectionOverlays : [ [ "Arrow", {
				location : 1,
				id : "arrow",
				length : 14,
				foldback : 0.8
			} ], [ "Label", setting ] ],
			Container : id
		});
	}
	function exportElements(complex_datas, random_id) {
		if (!complex_datas)
			return;
		for ( var i = 0; i < complex_datas.length; i++) {
			complex_datas[i].top = parseInt($("#node_" + random_id + complex_datas[i].id).position().top);
			complex_datas[i].left = parseInt($("#node_" + random_id + complex_datas[i].id).position().left);
		}
		return JSON.stringify(complex_datas);
	}

})(jQuery);
