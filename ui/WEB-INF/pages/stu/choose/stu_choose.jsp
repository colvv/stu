<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var table = $('#example').DataTable({
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
<div class="container">
<div class="row">
	<div class="panel panel-primary">
		<div class="panel-body">
			<table id="example" class="hover row-border compact" cellspacing="0" width="100%">
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
</div>
</div>