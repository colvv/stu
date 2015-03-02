<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";

		dPicker(fObject("choose_date_div", baseDiv));
	});
</script>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="input-group col-xs-4  date form_date" data-date-format="yyyy-mm-dd" name="choose_date_div">
			<input class="form-control" name="choose_date" type="text" placeholder="请选择日期" validation="date" value="${choose_date }"> <span
				class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
	</div>
	<div class="panel-body">
		<div class="row color-bg-w">
			<div class="col-xs-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class=" icon-group icon-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">昨日新增3名学生</div>
								<div>共286名学生</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left text-primary">查看详情</span> <span class="pull-right"><i class="icon-fighter-jet text-primary"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="  icon-tasks icon-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">有3条代办任务</div>
								<div></div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left text-muted">查看详情</span> <span class="pull-right"><i class="icon-fighter-jet text-muted"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="panel panel-success">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="icon-book icon-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">最近新开设3门课程</div>
								<div>共210门课程</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left text-success">查看详情</span> <span class="pull-right"><i class="icon-fighter-jet text-success"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="icon-money icon-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">昨日收入1500￥</div>
								<div>昨日支出1200￥</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left text-warning">查看详情</span> <span class="pull-right"><i class="icon-fighter-jet text-warning"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-10">
				<div class="panel panel-default">
					<div class="panel-heading">今日课程</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Column heading</th>
									<th>Column heading</th>
									<th>Column heading</th>
								</tr>
							</thead>
							<tbody>
								<tr class="active">
									<td>1</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr class="success">
									<td>3</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<td>4</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr class="warning">
									<td>5</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<td>6</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr class="danger">
									<td>7</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<div class="col-xs-2">
				<div class="panel panel-default">
					<div class="panel-heading">快速链接</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<button class="btn btn-primary btn-block" type="button" name="login_button">财务登记</button>
						<button class="btn btn-primary btn-block" type="button" name="login_button">学生报名</button>
						<button class="btn btn-primary btn-block" type="button" name="login_button">学生选课</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row"></div>