<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var sysdate = "${sysdate}";
		fObject("makechart", baseDiv).click(function() {
			var start_date;
			var end_date;
			switch (fObject("date_choicer", baseDiv).val()) {
			case "hand":
				$("#finance_choice_form").vali_Form();
				if ($("#finance_choice_form").hasError()) {
					return;
				}
				start_date = getSimpleDate(fObject("start_date", baseDiv).val());
				end_date = getSimpleDate(fObject("end_date", baseDiv).val());
				break;
			case "year":
				end_date = getSimpleDate(sysdate);
				start_date = getSimpleDate(calDate(sysdate, -1, "Y"));
				break;
			case "month":
				end_date = getSimpleDate(sysdate);
				start_date = getSimpleDate(calDate(sysdate, -1, "M"));
				break;
			case "week":
				end_date = getSimpleDate(sysdate);
				start_date = getSimpleDate(calDate(sysdate, -7, "D"));
				break;
			default:
				return;
			}

			commonAjax("/fin/loadFinanceChart.do", {
				start_date : start_date,
				end_date : end_date
			}, function(html) {
				fObject("chart_content", baseDiv).html(html);
			});
		});
		fObject("date_choicer", baseDiv).load_Selection({
			codetype : "date_choicer",
			needEmpty : false,
			defaultVal : "week"
		});
		fObject("date_choicer", baseDiv).change(function() {
			if ($(this).val() === 'hand') {
				$("#" + baseDiv + " .hand_date").css("visibility", "visible");
			} else {
				$("#" + baseDiv + " .hand_date").css("visibility", "hidden");
				$("#finance_choice_form").removeError();
			}
		});
		dPicker(fObject("start_date_div", baseDiv));
		dPicker(fObject("end_date_div", baseDiv));
	});
</script>
<div class="panel panel-success">
	<div class="panel-heading ">收支信息</div>
	<div class="panel-body">
		<form id="finance_choice_form">
			<div class="form-group col-xs-4">
				<label for="date_choicer">时间选择</label> <select class=" form-control  " name="date_choicer">
				</select>
			</div>
			<div class="form-group col-xs-4">
				<label for="start_date" class="hand_date" style="visibility: hidden;">开始日期</label>
				<div class="input-group date form_date hand_date" data-date-format="yyyy-mm-dd" name="start_date_div" style="visibility: hidden;">
					<input class="form-control  " type="text" placeholder="请输入开始日期" value="" validation="date" name="start_date"><span
						class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
			<div class="form-group col-xs-4">
				<label for="end_date" class="hand_date" style="visibility: hidden;">结束日期</label>
				<div class="input-group date form_date hand_date" data-date-format="yyyy-mm-dd" name="end_date_div" style="visibility: hidden;">
					<input class="form-control  " type="text" placeholder="请输入结束日期" value="${sysdate}" validation="date" name="end_date"><span
						class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
			<div class="form-group col-xs-4  ">
				<label for="">&nbsp;</label>
				<button class="btn  btn-success btn-block " href="#" name="makechart">
					<i class="fa  fa-line-chart  fa-lg  fa-fw "></i> 生成报表
				</button>
			</div>
		</form>
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body" style="width: 100%; height: 500px;" name="chart_content">
						<h3 class="text-center mg-t-150">
							<i class=" fa fa-arrow-up mg-r-5"></i>Choose First
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
