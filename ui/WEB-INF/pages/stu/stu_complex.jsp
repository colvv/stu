<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		// 按钮组开始~
		fObject('refresh_button', baseDiv).click(function() {
			table.ajax.reload();
		});
		fObject('add_button', baseDiv).click(function() {
			showForm("/stu/model/addModel.do", null);
		});
		fObject('mod_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要修改的学生！", "default");
				return;
			}
			showForm("/stu/model/modModel.do", {
				stu_id : table.$('tr.selected').find("td:eq(0)").text()
			}, true);
		});
		fObject('del_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要删除的学生！", "default");
				return;
			}
			confrimMsg("确定要删除学生（" + table.$('tr.selected').find("td:eq(1)").text() + "）么？", function() {
				commonAjax_pro("/stu/delStu.do", {
					stu_id : table.$('tr.selected').find("td:eq(0)").text()
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
		<div class="panel-heading">学生信息</div>
		<div class="panel-body">
			<div class="btn-group  mg-b-20" aria-label="操作按钮组">
				<button type="button" class="btn btn-default input-sm" name="refresh_button">刷新</button>
				<button type="button" class="btn btn-default input-sm" name="add_button">新增</button>
				<button type="button" class="btn btn-default input-sm" name="mod_button">修改</button>
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