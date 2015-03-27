<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "choose_modal";
		var table = $('#tea_selected').DataTable({
			"ajax" : {
				"url" : "loadTable/tea_001.do",
				"dataSrc" : ""
			},
			"columns" : [ {
				"data" : "tea_name"
			}, {
				"data" : "tea_state"
			}, {
				"data" : "tea_sex"
			}, {
				"data" : "tea_birthday"
			}, {
				"data" : "tea_phone"
			}, {
				"data" : "tea_address"
			}, {
				"data" : "tea_desc"
			} ]
		});
		$('#tea_selected tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});
		$('#tea_selected tbody').on('dblclick', 'tr', function() {
			var _data = table.row(table.$(this)).data();
			choose_addEle(_data);
		});
	});
</script>
<div class="panel panel-default">
	<div class="panel-body">
		<table id="tea_selected" class="hover row-border compact" cellspacing="0" width="100%">
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