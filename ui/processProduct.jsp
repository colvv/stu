<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/commonHead.jsp"%>
<link rel="stylesheet" href="resources/self/css/process.css">
</head>
<body>
	<%@include file="/include/commonFooter.jsp"%>
	<div id="content1" style="height: 500px;"></div>
	<script>
		$(document).ready(function() {
			$("#content1").vProcess({
				top : 550,
				simple_datas : [ {
					name : "1",
					cssClass :"label-success"
				}, "2", {
					name : "3",
					cssClass :'label-danger'
				}, {
					name : "4",
					cssClass :'label-info'
				}, {
					name : "5",
					cssClass :'label-warning'
				}, {
					name : "6",
					cssClass :'label-primary'
				}, {
					name : "7",
					css : {
						'background-color' : 'purple'
					}
				} ]
			});
			$("#content2").vProcess({
				move_able : true,
				complex_datas : [ {
					"id" : "1",
					"name" : "传输环节",
					"renderTo" : [ {
						"target" : 2,
						"lineName" : "退回"
					}, {
						"target" : 3,
						"lineName" : "通过"
					} ],
					"left" : 90,
					"top" : 280,
					title : 'hello~<br><h1>哈哈2！</h1>'
				}, {
					"id" : "2",
					"name" : "预处理环节",
					"renderTo" : [ 4 ],
					"left" : 444,
					"top" : 123,
					cssClass : 'color-g'
				}, {
					"id" : "3",
					"name" : "一次分拣环节",
					"renderTo" : [ 4 ],
					"left" : 426,
					"top" : 424,
					cssClass : 'color-bg-b'
				}, {
					"id" : "4",
					"name" : "二次分拣环节",
					"renderTo" : [ 1, 5 ],
					"left" : 494,
					"top" : 282
				}, {
					"id" : "5",
					"name" : "排重环节",
					"renderTo" : [ 6 ],
					"left" : 765,
					"top" : 285
				}, {
					"id" : "6",
					"name" : "划价环节",
					"renderTo" : [ 7 ],
					"left" : 1015,
					"top" : 286
				}, {
					"id" : "7",
					"name" : "入库环节",
					"left" : 1021,
					"top" : 463,
					cssClass : 'testa'
				} ],
				program : true
			});
		});
	</script>
</body>
</html>