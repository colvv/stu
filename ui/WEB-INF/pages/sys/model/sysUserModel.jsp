<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		fObject("dialog_tabs", baseDiv).find("a:eq(0)").tab("show");
		fObject("confrim", baseDiv).click(function() {
			$("#sysuser_info_form").vali_Form();
			if ($("#sysuser_info_form").hasError()) {
				return;
			}
			hideForm();
			var paramObj = parseParamObj($("#sysuser_info_form").find("[name]"));
			// md5 加密 twice
			paramObj.user_password = $.md5($.md5(paramObj.user_password));
			commonAjax_pro("${form_action}", paramObj, function(msg) {
				processStop();
				if ("0" === msg) {
					alertMsg_B("保存成功");
					fObject('refresh_button', 'main_area').click();
				} else {
					alertMsg_B("保存失败");
				}
			});
		});
		$("#sysuser_info_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#sysuser_info_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
	});
</script>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">系统用户信息</h4>
	</div>
	<div class="modal-body">
		<form id="sysuser_info_form" class="" role="form">
			<ul class="nav nav-tabs" name="dialog_tabs">
				<li><a href="#dialog_basic" data-toggle="tab">基本信息</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane   fade in active" id="dialog_basic">
					<div class="form-group mg-t-10">
						<label class="control-label" for="user_name">用户姓名</label> <input class="form-control" name="user_name" type="text"
							placeholder="请输入用户姓名" validation="required|maxlen=10" value="${user_name }">
					</div>
					<div class="form-group ">
						<label class="control-label" for="user_password">密码</label> <input class="form-control" name="user_password" type="text"
							placeholder="请输入用户初始密码" validation="required|password|maxlen=20|minlen=5" value="${user_password }">
					</div>
					<div class="form-group ">
						<label class="control-label" for="user_phone">联系方式</label> <input class="form-control" name="user_phone" type="text"
							placeholder="请输入联系方式" validation="required|len=11" value="${user_phone }">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" name="confrim">确定</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" name="cancel">取消</button>
	</div>
</div>