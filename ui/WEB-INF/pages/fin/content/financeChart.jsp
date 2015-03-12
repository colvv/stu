<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var charhtml = eval("(${charhtml})");
		//alert(getTimeLocal(getDate(${start_date}))+"::"+Highcharts.dateFormat('%Y年%m月%d日',getTimeLocal(getDate(${start_date}))));
		var chart = new Highcharts.Chart({
			chart : {
				zoomType : 'x',
				renderTo : 'chart_finance_001',
				type : 'column',
				margin : 75,
				options3d : {
					enabled : true,
					alpha : 0,
					beta : 0
				},
			},
			title : {
				// 用html
				useHTML : true,
				text : '<h3 class="no-wrap">收支情况</h3>'
			},
			subtitle:{
				useHTML : true,
				text : '<h3 class="no-wrap"><small>'+Highcharts.dateFormat('%Y年%m月%d日',getDate(${start_date}).getTime())+'至'+Highcharts.dateFormat('%Y年%m月%d日',getDate(${end_date}).getTime())+'</small></h3>'

			},		
			xAxis : {
				type : 'datetime',
				labels : {
					step : 2,
					formatter : function() {
						return Highcharts.dateFormat('%Y-%m-%d', this.value);
					}
				}
			},
			tooltip : {
				shared : true,
				useHTML : true,
				formatter : function() {
					var html = "<i class='fa fa-location-arrow fa-2x color-b'></i>" + Highcharts.dateFormat('%Y年%m月%d日', new Date(this.points[0].x).getTime()) + "<br/>";
					html += "<span class='color-g'>收入：" + Highcharts.numberFormat(this.points[0].y) + "</span><br/>";
					html += "<span class='color-r'>支出：" + Highcharts.numberFormat(this.points[1].y) + "</span>";
					return html;
					//return Highcharts.dateFormat('%Y年%m月%d日', this[0].x) + '，<b>' + this[0].series.name + '：</b><br/>' + formatNum(this[0].y) + '元';
				}
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
				data : charhtml[0],
				color : '#5cb85c',
				stack : '0'
			}, {
				name : '支出',
				data : charhtml[1],
				color : '#EC6148',
				stack : '1'
			} ]
		});
	});
</script>
<div id="chart_finance_001" ></div>
