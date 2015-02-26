<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var table = $('#sys_001').DataTable({
			"ajax" : {
				"url" : "loadTable/sys_001.do",
				"dataSrc" : ""
			},
			"columns" : [ {
				"data" : "user_name"
			}, {
				"data" : "user_phone"
			}, {
				"data" : "last_login_time"
			} ]
		});
		$('#sys_001 tbody').on('click', 'tr', function() {
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
	<div class="panel panel-primary">
		<div class="panel-heading">用户信息</div>
		<div class="panel-body">
			<div class="btn-group  mg-b-20" aria-label="操作按钮组">
				<button type="button" class="btn btn-default input-sm">刷新</button>
				<button type="button" class="btn btn-default input-sm">新增</button>
				<button type="button" class="btn btn-default input-sm">修改</button>
				<button type="button" class="btn btn-default input-sm">删除</button>
			</div>
			<table id="sys_001" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>用户姓名</th>
						<th>联系方式</th>
						<th>上次登录时间</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>