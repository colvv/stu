<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
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
		fObject('refresh_button',baseDiv).click(function(){
			 table.ajax.reload();
		});
		fObject('add_button',baseDiv).click(function(){
			$("#form_area").show();
			$("#form_content_area").show();
			commonAjax("/stu/model/addModel.do",null,function(msg){
				$("#form_content_area [name='form_content']").html(msg);
			});
		});
		fObject('del_button',baseDiv).click(function(){
			confrimMsg("确定要删除么？",function(){
				alert(1);
			});
			return;
			commonAjax_pro("/stu/addStu.do", {
				stu_name : fObject("stu_name", baseDiv).val()
			}, function(msg) {
				processError();
				if ("0" === msg) {
					alertMsg("保存成功");
					fObject('refresh_button', 'main_area').click();
				} else {
					alertMsg("保存失败");
				}
			});
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
				<button type="button" class="btn btn-default input-sm" name="del_button">删除</button>
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