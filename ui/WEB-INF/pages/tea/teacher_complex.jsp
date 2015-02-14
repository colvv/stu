<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	var table = $('#example').DataTable({
		"ajax" : {
			"url" : "loadTable/tea_001.do", "dataSrc" : ""
		}, "columns" : [ {
			"data" : "TEA_NAME"
		}, {
			"data" : "TEA_STATE"
		}, {
			"data" : "TEA_SEX"
		}, {
			"data" : "TEA_BIRTHDAY"
		}, {
			"data" : "TEA_PHONE"
		}, {
			"data" : "TEA_ADDRESS"
		}, {
			"data" : "TEA_DESC"
		} ]
	});
	$('#example tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});
</script>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">查询条件</div>
		<div class="panel-body">
			<form class="navbar-form" role="search">
				<div class="form-group pull-left">
					<label for="sys_user_id">登录名</label> <input type="text" class="form-control input-sm" placeholder="输入登录用户名" name="sys_user_id">
				</div>
				<div class="form-group ">
					<label for="sys_user_name">用户姓名</label> <input type="text" class="form-control input-sm" placeholder="输入检索用户姓名" name="sys_user_name">
				</div>
				<div class="btn-group pull-right" aria-label="操作按钮组">
					<button type="button" class="btn btn-default input-sm" onclick="alertMsg('哈哈')">查询</button>
					<button type="button" class="btn btn-default input-sm">新增</button>
					<button type="button" class="btn btn-default input-sm">修改</button>
					<button type="button" class="btn btn-default input-sm">删除</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 
		<div class="row">
			<ul class="nav nav-pills ">
				<li role="presentation" class="active"><a href="#home" data-toggle="tab">Home</a></li>
				<li role="presentation"><a href="#ios" data-toggle="tab">Profile</a></li>
				<li role="presentation"><a href="#jmeter" data-toggle="tab">Messages</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active well" id="home">
					<table class="table table-striped ">
						<caption>系统用户信息</caption>
						<thead>
							<tr>
								<th>名称</th>
								<th>城市</th>
								<th>密码</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tanmay</td>
								<td>Bangalore</td>
								<td>560001</td>
							</tr>
							<tr>
								<td>Sachin</td>
								<td>Mumbai</td>
								<td>400003</td>
							</tr>
							<tr>
								<td>Uma</td>
								<td>Pune</td>
								<td>411027</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="ios">
					<p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X
						操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
				</div>
				<div class="tab-pane fade" id="jmeter">
					<p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
				</div>
			</div>
		</div>
		 -->
<div class="row">
	<div class="panel panel-success">
		<div class="panel-heading">查询结果</div>
		<div class="panel-body">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>教师姓名</th>
						<th>教师状态</th>
						<th>性别</th>
						<th>生日</th>
						<th>联系电话</th>
						<th>联系地址</th>
						<th>备注</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>