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
				<p class="navbar-brand">请先登录</p>
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
					<form class="" action="${ctx}/index.do" role="form">
						<div class="form-group">
							<label for="vv_name">用户名</label> <input class="form-control" name="vv_name" type="text" placeholder="请输入用户名">
						</div>
						<div class="form-group">
							<label for="vv_password">密码</label> <input class="form-control" name="vv_password" type="password" placeholder="请输入密码">
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> 一周内自动登录
							</label>
						</div>
						<button class="btn btn-primary btn-block" type="submit">登录</button>
					</form>
				</div>
			</div>
			<div class="col-xs-3"></div>
		</div>
	</div>
	<%@include file="/include/commonFooter.jsp"%>
</body>
</html>