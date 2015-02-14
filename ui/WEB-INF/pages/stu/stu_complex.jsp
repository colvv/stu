<script>
	$(document).ready(function() {
		var table = $('#example').DataTable({
			"ajax" : {
				"url" : "loadTable/stu_001.do", "dataSrc" : ""
			}, "columns" : [ {
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
		$("[name='refresh_button']").click(function(){
			 table.ajax.reload();
		});
		$("[name='add_button']").click(function(){
			$("#form_area").show();
			$("#form_area [name='form_content']").load("/stu/model/addModel.do");
		});
	});
</script>
<div class="row">
	<div class="panel panel-primary">
		<div class="panel-heading">用户信息</div>
		<div class="panel-body">
			<div class="btn-group  mg-b-20" aria-label="操作按钮组">
				<button type="button" class="btn btn-default input-sm" name="refresh_button">刷新</button>
				<button type="button" class="btn btn-default input-sm" name="add_button">新增</button>
				<button type="button" class="btn btn-default input-sm">修改</button>
				<button type="button" class="btn btn-default input-sm">删除</button>
			</div>
			<table id="example" class="display" cellspacing="0" width="100%">
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