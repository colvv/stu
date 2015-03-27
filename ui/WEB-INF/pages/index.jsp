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
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="header_menu">
			<div class="container">
				<div class="row">
					<div class="navbar-header">
						<a class="navbar-brand " href="#" name="index_content"><span class="color-w"><strong><i class="fa fa-laptop fa-lg mg-r-5"></i>学生管理系统</strong></span></a>
					</div>
					<ul class="nav navbar-nav" id="menu_area">${menustr}
					</ul>
					<ul class="nav navbar-nav pull-right mg-l-20">
						<li class="dropdown"><a href="#" class=" dropdown-toggle " data-toggle="dropdown"><span class="color-b"><i
									class='fa fa-th-large fa-spin'></i>设置</span></a>
							<ul class="dropdown-menu">
								<li class="dropdown"><a href="#" name="quit_sys"><i class="fa fa-sign-out"></i>退出</a></li>
								<li class="dropdown"><a href="#" name="change_password"><i class="fa fa-key"></i>修改密码</a></li>
							</ul></li>
					</ul>
					<div class="navbar-text navbar-right ">
						<span class="">欢迎回来，${sysuser.user_name }</span>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div class="container min-h-500 " id="main_area" role="main"></div>
	<%@include file="/include/commonFooter.jsp"%>
	<script>
		$(document).ready(function() {
			var baseDiv = "header_menu";
			fObject("quit_sys", baseDiv).click(function() {
				confrimMsg("确定要退出么？", function() {
					commonAjax("/loginOut.do", null, function(msg) {
						// 登出之后删除cookie否则可能继续自动登录
						delCookie("user_id");
						delCookie("user_password");
						window.location.href = "/";
					});
				});
			});
			fObject("change_password", baseDiv).click(function() {
				showForm({
					url : "/model/changePwd.do",
					title : "修改密码"
				});
			});
			// 将首页的连接置换为"#"
			$("#menu_area a[href]").each(function() {
				var url = $(this).attr("href")
				$(this).click(function() {
					if (url !== "") {
						commonAjax(url, null, function(html) {
							$("#main_area").html(html);
						})
					}
				});
				$(this).attr("href", "#");
			});
			fObject("index_content", baseDiv).click(function() {
				commonAjax("/indexContent.do", null, function(html) {
					$("#main_area").html(html);
				});
			});
			fObject("index_content", baseDiv).click();
		});
	</script>
</body>
</html>