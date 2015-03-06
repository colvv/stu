<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		fObject("save_button", baseDiv).click(function() {
			$("#menu_info_form").vali_Form();
			if ($("#menu_info_form").hasError()) {
				return;
			}
			commonAjax("/sys/menu/saveMenuInfo.do", {
				menu_id : '${sys_menu.menu_id}',
				menu_name : fObject("menu_name", baseDiv).val(),
				open_power : fObject("open_power", baseDiv).val()
			}, function(msg) {
				if ("0" === msg) {
					alertMsg_B("保存成功");
				} else {
					alertMsg_B("保存失败");
				}
			});
		});
		$("#menu_info_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#menu_info_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
		fObject("open_power", baseDiv).val("${sys_menu.open_power}");
	});
</script>
<div class="row">
	<form id="menu_info_form"  class="" role="form">
		<div class="form-group col-xs-9">
			<label for="menu_name">菜单名称</label> <input class="form-control" name="menu_name" type="text" value="${sys_menu.menu_name}"
				placeholder="请输入菜单名称" validation="required|maxlength=20">
		</div>
		<div class="form-group col-xs-9">
			<label for="menu_url_read">菜单Url</label> <input class="form-control" name="menu_url_read" type="text" value="${sys_menu.menu_url}"
				placeholder="无" readonly>
		</div>
		<div class="form-group col-xs-9">
			<label for="open_power">菜单默认访问权限</label><select class="form-control" name="open_power" validation="required">
				<option value="0">无权限控制（全部可见）</option>
				<option value="1">有权限控制</option>
			</select>
		</div>
	</form>
</div>
<div class="btn-group  mg-b-20" aria-label="操作按钮组">
	<button type="button" class="btn btn-success input-sm" name="save_button">
		更新<i class="fa fa-save  mg-l-5"></i>
	</button>
	<button type="button" class="btn btn-info input-sm" disabled>
		其他操作@管理员<i class="fa fa-whatsapp fa-lg   mg-l-5"></i>
	</button>
</div>
