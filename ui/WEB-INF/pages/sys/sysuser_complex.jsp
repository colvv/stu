<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var table = $('#example').DataTable({
			"ajax" : {
				"url" : "loadTable/sys_001.do",
				"dataSrc" : ""
			},
			"columns" : [ {
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
	<div class="panel panel-primary">
		<div class="panel-heading">用户信息</div>
		<div class="panel-body">
			<div class="btn-group  mg-b-20" aria-label="操作按钮组">
				<button type="button" class="btn btn-default input-sm">刷新</button>
				<button type="button" class="btn btn-default input-sm">新增</button>
				<button type="button" class="btn btn-default input-sm">修改</button>
				<button type="button" class="btn btn-default input-sm">删除</button>
			</div>
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