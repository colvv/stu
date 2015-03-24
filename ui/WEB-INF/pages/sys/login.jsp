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
						<div class="form-group">
							<input type="checkbox" name="auto_login"> 一周内自动登录
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
			$("body").keyup(function(event) {
				if (event.keyCode == 13) {
					fObject("login_button").click();
				}
			});
			$("[name='auto_login']").bootstrapSwitch({
				size : 'mini'
			});
			//自动登录判断
			if (checkNecessaryStr(getCookie("user_id")) && checkNecessaryStr(getCookie("user_password"))) {
				commonAjax("/login.do", {
					"user_id" : getCookie("user_id"),
					"user_password" : getCookie("user_password")
				}, function(msg) {
					if ("0" === msg) {
						fObject("login_button").prop("disabled",true);
						alertMsg_B("自动登录成功，稍候跳转...");
						setTimeout(function() {
							window.location.href = "/index.do";
						}, 1000);
					} else {
						// 失败删除cookie
						delCookie("user_id");
						delCookie("user_password");
						alertMsg_B("自动登陆失败，请重新输入用户名密码");
					}
				});
			}
			// 正常的登录
			fObject("login_button").click(function() {
				$("form").vali_Form(true);
				if ($("form").hasError()) {
					return;
				}
				var md5_password = $.md5(b64_sha512(fObject("user_password").val()));
				commonAjax("/login.do", {
					"user_id" : fObject("user_id").val(),
					"user_password" : md5_password,
					"auto_login" : fObject("auto_login").prop("checked")
				}, function(msg) {
					if ("0" === msg) {
						// 成功并勾选添加cookie
						if (fObject("auto_login").prop("checked") === true) {
							addCookie("user_id", fObject("user_id").val(), 7);
							addCookie("user_password", md5_password, 7);
						}
						fObject("login_button").prop("disabled",true);
						alertMsg_B("登录成功，稍候跳转...");
						setTimeout(function() {
							window.location.href = "/index.do";
						}, 1000);
					} else {
						// 失败删除cookie
						delCookie("user_id");
						delCookie("user_password");
						alertMsg_B("登陆失败，请检查用户名、密码");
					}
				});
			});
		});
	</script>
</body>
</html>