<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var table = $('#example').DataTable({
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
		$('#example tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});
		// 按钮组开始~
		fObject('refresh_button', baseDiv).click(function() {
			table.ajax.reload();
		});
		fObject('add_button', baseDiv).click(function() {
			showForm({
				url : "/tea/model/addModel.do",
				title : "新增教师"
			});
		});
		fObject('mod_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要修改的教师！", "default");
				return;
			}
			var rowdata = table.row(table.$('tr.selected')).data();
			showForm({
				url : "/tea/model/modModel.do",
				param : {
					tea_id : rowdata.tea_id
				},
				title : "修改教师信息",
				refresh : true
			});
		});
		fObject('del_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要删除的tea！", "default");
				return;
			}
			var rowdata = table.row(table.$('tr.selected')).data();
			confrimMsg("确定要删除（" + rowdata.tea_name + "）么？", function() {
				commonAjax_pro("/tea/delTea.do", {
					tea_id : rowdata.tea_id
				}, function(msg) {
					processStop();
					if ("0" === msg) {
						alertMsg_B("删除成功");
						fObject('refresh_button', 'main_area').click();
					} else {
						alertMsg_B("删除失败");
					}
				});
			});
		});
	});
</script>
<div class="row">
	<div class="panel panel-primary">
		<div class="panel-heading">教师信息</div>
		<div class="panel-body">
			<div class="btn-group  mg-b-20" aria-label="操作按钮组">
				<button type="button" class="btn btn-default input-sm" name="refresh_button">
					刷新<i class="fa fa-refresh mg-l-5"></i>
				</button>
				<button type="button" class="btn btn-default input-sm" name="add_button">
					新增<i class="fa fa-plus mg-l-5"></i>
				</button>
				<button type="button" class="btn btn-default input-sm" name="mod_button">
					修改<i class="fa fa-pencil mg-l-5"></i>
				</button>
				<button type="button" class="btn btn-default input-sm" name="del_button">
					删除<i class="fa fa-trash mg-l-5"></i>
				</button>
			</div>
			<table id="example" class="table hover row-border" cellspacing="0" width="100%">
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