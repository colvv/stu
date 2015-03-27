<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(
			function() {
				var baseDiv = "choose_modal";
				var table = $('#stu_selected').DataTable({
					"ajax" : {
						"url" : "loadTable/stu_001.do",
						"dataSrc" : ""
					},
					"columns" : [ {
						"data" : "stu_id"
					}, {
						"data" : "stu_name"
					}, {
						"data" : "stu_kindergarten"
					}, {
						"data" : "stu_address"
					} ]
				});
				$('#stu_selected tbody').on('click', 'tr', function() {
					if ($(this).hasClass('selected')) {
						$(this).removeClass('selected');
					} else {
						table.$('tr.selected').removeClass('selected');
						$(this).addClass('selected');
					}
				});
				$('#stu_selected tbody').on('dblclick', 'tr', function() {
					var _data = table.row(table.$(this)).data();
					choose_addEle(_data);
				});
				
			});
</script>
<div class="panel panel-default">
	<div class="panel-body">
		<table id="stu_selected" class="hover row-border compact" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th width="150px;">学号</th>
					<th width="150px;">姓名</th>
					<th width="200px;">所在幼儿园</th>
					<th width="250px;">联系地址</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
