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
			// md5 加密 twice,修改时不需要输入
			if (checkNecessaryStr(paramObj.user_password)) {
				paramObj.user_password = $.md5($.md5(paramObj.user_password));
			}
			commonAjax_pro("${form_action}", paramObj, function(msg) {
				processStop();
				var array = msg.split("|");
				if (array[0] === '0') {
					alertMsg_B("保存成功");
					fObject('refresh_button', 'main_area').click();
				} else {
					if (array[1]) {
						alertMsg_B("保存失败," + array[1]);
					} else {
						alertMsg_B("保存失败");
					}
				}
			});
		});
		// 修改时特殊需要处理
		if ('${mod_flag}' === '1') {
			fObject("user_id", baseDiv).removeAttr("validation");
			fObject("user_id", baseDiv).attr("readonly", true);
			$("#" + baseDiv + " [for='user_password']").append("<span class='label label-info mg-l-5'>不录入视为不更改</span>");
		}
		$("#sysuser_info_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#sysuser_info_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
		//密码特殊样式绑定,用attr("class")有问题
		fObject("password_icon", baseDiv).click(function() {
			if ($(this).hasClass("icon-eye-open")) {
				fObject("user_password", baseDiv).attr("type", "password");
				$(this).attr("class", " icon-eye-close");
			} else {
				fObject("user_password", baseDiv).attr("type", "text");
				$(this).attr("class", " icon-eye-open");
			}
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
						<label class="control-label" for="user_id">登录名</label> <input class="form-control" name="user_id" type="text" placeholder="请输入登录名"
							validation="required|maxlen=20|password" value="${user_id }">
					</div>
					<div class="form-group">
						<label class="control-label" for="user_name">用户姓名</label> <input class="form-control" name="user_name" type="text"
							placeholder="请输入用户姓名" validation="required|maxlen=15" value="${user_name }">
					</div>
					<div class="form-group ">
						<label class="control-label" for="user_password">密码</label>
						<div class="input-group" name="password_div">
							<input class="form-control input-group" name="user_password" type="text" placeholder="请输入密码" validation="${password_check }" value=""><span
								class="input-group-addon"><i class=" icon-eye-open" name="password_icon"></i></span>
						</div>
					</div>
					<div class="form-group ">
						<label class="control-label" for="user_phone">联系方式</label> <input class="form-control" name="user_phone" type="text"
							placeholder="请输入联系方式" validation="len=11" value="${user_phone }">
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