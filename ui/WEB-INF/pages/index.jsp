<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/commonHead.jsp"%>
<!-- create by @vv 2015-2-6 -->
<style>
body {
	background-image: url("${ctx}/resources/self/images/19-half.png");
	padding-top: 60px;
}
</style>
</head>
<body>
	<header role="header">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="row">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"><strong>学生管理系统</strong></a>
					</div>
					<div>
						<ul class="nav navbar-nav" id="menu_area">${menustr}
						</ul>
					</div>
					<div class="navbar-text navbar-right ">
						<span>欢迎回来，王毅</span>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div class="container" id="main_area" role="main" style="margin-bottom: 30px;">
		
	</div>
	<%@include file="/include/commonFooter.jsp"%>
	<script>
		$(document).ready(function() {
			// 将首页的连接置换为"#"
			$("#menu_area a[href]").each(function() {
				var url = $(this).attr("href")
				$(this).click(function() {
					if (url !== "") {
						//$("#main_area").load(url);
						commonAjax(url,null,function(html){
							$("#main_area").html(html);
								//alertMsg("load complete","primary")
						})
					}
				});
				$(this).attr("href", "#");
			});
			/** 进度条测试
			startProcess("");
			setTimeout(function(){
				processHandler();
				setTimeout(function(){
					processComplete();
				},"5000");
			},"5000");
			*/
		});
		//alertMsg("wca","success");
	</script>
</body>
</html>