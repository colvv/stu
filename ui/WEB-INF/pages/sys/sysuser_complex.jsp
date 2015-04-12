<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var table = $('#sys_001').DataTable({
			"ajax" : {
				"url" : "loadTable/sys_001.do",
				"dataSrc" : ""
			},
			"columns" : [ {
				"data" : "user_id"
			}, {
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
		// 按钮组开始~
		fObject('refresh_button', baseDiv).click(function() {
			table.ajax.reload();
		});
		fObject('add_button', baseDiv).click(function() {
			showForm({
				url : "/sys/model/addModel.do",
				title : "新增用户信息"
			});
		});
		fObject('mod_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要修改的用户！", "default");
				return;
			}
			showForm({
				url : "/sys/model/modModel.do",
				param : {
					user_id : table.$('tr.selected').find("td:eq(0)").text()
				},
				title : "修改用户信息",
				refresh : true
			});
		});
		fObject('del_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要删除的用户！", "default");
				return;
			}
			confrimMsg("确定要删除用户（" + table.$('tr.selected').find("td:eq(1)").text() + "）么？", function() {
				commonAjax_pro("/sys/delSysUser.do", {
					user_id : table.$('tr.selected').find("td:eq(0)").text()
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
		fObject("menu_conf",baseDiv).click(function(){
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要配置的用户！", "default");
				return;
			}
			showForm({
				url : "/sys/menu/menu_select.do",
				title : "菜单配置",
				refresh:true,
				param : {
					user_id : table.$('tr.selected').find("td:eq(0)").text()
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
				<button type="button" class="btn btn-default input-sm" name="menu_conf">
					菜单配置<i class="fa fa-reorder mg-l-5"></i>
				</button>
			</div>
			<table id="sys_001" class="table hover row-border "" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>登录名</th>
						<th>用户姓名</th>
						<th>联系方式</th>
						<th>上次登录时间</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>