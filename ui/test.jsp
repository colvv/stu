<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/commonHead.jsp"%>
<style>
body {
	background-image: url("${ctx}/resources/self/images/19.jpg");
}
</style>
</head>
<body>
	<header class=" navbar-inverse navbar-fixed-top" role="header">
		<div class="container ">
			<div class="navbar-header">
				<p class="navbar-brand"></p>
			</div>
		</div>
	</header>
	<div class="container" role="main">
		<div class="row mg-t-150">
			<div class="col-xs-3"></div>
			<div class="col-xs-6">
				<h1>学生管理系统</h1>
				<div class="well well-lg">
					<h3 class="text-muted">系统登录</h3>
					<form class="" role="form">
						<div class="form-group">
							<label for="user_id">用户名</label> <input class="form-control" name="user_id" type="text" placeholder="请输入用户名" validation="required">
						</div>
						<div class="form-group">
							<label for="user_password">密码</label> <input class="form-control" name="user_password" type="password" placeholder="请输入密码"
								validation="required">
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" name="auto_login"> 一周内自动登录
							</label>
						</div>
						<button class="btn btn-primary btn-block" type="button" name="login_button">登录</button>
					</form>
				</div>
			</div>
			<div class="col-xs-3"></div>
		</div>
	</div>
	<%@include file="/include/commonFooter.jsp"%>
	<script>
		$(document).ready(function() {
			alert($.md5($.md5("3087554")));
			alert($.md5(b64_sha512("3087554")));
		});
	</script>
</body>
</html>