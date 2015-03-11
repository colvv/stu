<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var chart = new Highcharts.Chart({
			chart : {
				renderTo : 'chart_student_lesson',
				type : 'column',
				margin : 75,
				options3d : {
					enabled : true,
					alpha : 10,
					beta : 5
				},
			},
			title : {
				// 用html
				useHTML : true,
				text : '<h3 class="no-wrap">一周内收入情况</h3>'
			},
			xAxis : {
				categories : [ '周一', "周二", "周三", "周四", "周五", "周六", "周日" ]
			},
			yAxis : {
				title : {
					useHTML : true,
					text : '<h5 class="no-wrap"><strong>金额 (单位：元)</strong></h5>'
				}
			},
			plotOptions : {
				column : {
					// 默认就是25
					depth : 40,
					stacking : 'normal'
				}
			},
			series : [ {
				name : '收入',
				data : [ 15, 17, 19, 25, 125, 423, 44, 546, 768, 1, 2, 0 ],
				color : '#87C287',
				stack : '0'

			}, {
				name : '支出',
				data : [ 456, 213, 45, 0, 0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 ],
				color : '#EC6148',
				stack : '1'
			} ]
		});

		fObject("date_choicer", baseDiv).load_Selection({
			codetype : "date_choicer",
			needEmpty : false,
			defaultVal : "week"
		});
		fObject("frequency_choicer", baseDiv).load_Selection({
			codetype : "frequency_choicer",
			needEmpty : false,
			defaultVal : "day"
		});
		fObject("date_choicer", baseDiv).change(function() {
			if ($(this).val() === 'hand') {
				$("#" + baseDiv + " .hand_date").show();
			} else {
				$("#" + baseDiv + " .hand_date").hide();
			}
		});
		dPicker(fObject("startdate_div", baseDiv));
		dPicker(fObject("enddate_div", baseDiv));
	});
</script>
<div class="panel panel-success">
	<div class="panel-heading ">收支信息</div>
	<div class="panel-body">
		<form>
			<div class="form-group col-xs-4">
				<label for="date_choicer">时间选择</label> <select class=" form-control  " name="date_choicer">
				</select>
			</div>
			<div class="form-group col-xs-4">
				<label for="frequency_choicer">周期选择</label> <select class=" form-control  " name="frequency_choicer">
				</select>
			</div>
			<div class="form-group col-xs-4">
				<label for="">业务选择</label> <select class=" form-control  " name="">
				</select>
			</div>
			<div class="form-group col-xs-4">
				<label for="">开始日期</label>
				<div class="input-group">
					<input class="form-control  " data-date-format="yyyy-mm-dd" type="text" placeholder="请输入金额" value="${fin_money }" validation="required"><span
						class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
			<div class="form-group col-xs-4">
				<label for="">结束日期</label>
				<div class="input-group">
					<input class="form-control  " data-date-format="yyyy-mm-dd" type="text" placeholder="请输入金额" value="${fin_money }" validation="required"><span
						class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
			<div class="form-group col-xs-4  ">
				<label for="">&nbsp;</label>
				<button class="btn  btn-success btn-block " href="#">
					<i class="fa  fa-line-chart  fa-lg  fa-fw "></i> 生成报表
				</button>
			</div>
		</form>
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body" style="width: 100%;">
						<div id="chart_student_lesson" style="width: 100%; height: 500px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
