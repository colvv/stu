<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "choose_modal";
		var table = $('#les_selected').DataTable({
			"ajax" : {
				"url" : "loadTable/les_001.do",
				"dataSrc" : ""
			},
			"columns" : [ {
				"data" : "les_name"
			}, {
				"data" : "les_type"
			}, {
				"data" : "create_time"
			}, {
				"data" : "les_desc"
			} ]
		});
		$('#les_selected tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});
		$('#les_selected tbody').on('dblclick', 'tr', function() {
			var _data = table.row(table.$(this)).data();
			choose_addEle(_data);
		});

	});
</script>
<div class="panel panel-default">
	<div class="panel-body">
		<table id="les_selected" class=" table hover row-border compact" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th width="150px;">课程名称</th>
					<th width="150px;">课程类型</th>
					<th width="100px;">创建时间</th>
					<th width="250px;">备注信息</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
