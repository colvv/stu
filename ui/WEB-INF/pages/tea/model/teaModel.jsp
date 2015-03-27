<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		fObject("confrim", baseDiv).click(function() {
			$("#teacher_info_form").vali_Form();
			if ($("#teacher_info_form").hasError()) {
				return;
			}
			hideForm();
			var paramObj = parseParamObj($("#teacher_info_form").find("[name]"));
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
		$("#teacher_info_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#teacher_info_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
		// 修改时特殊需要处理
		if ('${mod_flag}' === '1') {

		}
		$("#teacher_info_form").displayNec_Form();
		fObject("tea_sex", baseDiv).val("${tea_sex}");
		dPicker(fObject("tea_birthday_div", baseDiv));
	});
</script>
<form id="teacher_info_form" class="" role="form">
	<input type="hidden"  name="tea_id" value="${tea_id}">
	<div class="tab-pane   fade in active">
		<div class="form-group">
			<label class="control-label" for="tea_name">教师姓名</label> <input class="form-control" name="tea_name" type="text" placeholder="请输入教师姓名"
				validation="required|maxlen=20" value="${tea_name }">
		</div>
		<div class="form-group">
			<label class="control-label" for="tea_sex">性别</label> <select class="form-control" name="tea_sex" validation="required">
				<option value="">请选择</option>
				<option value="0">男</option>
				<option value="1">女</option>
			</select>
		</div>
		<div class="form-group ">
			<label class="control-label" for="tea_birthday">出生日期</label>
			<div class="input-group  date form_date" data-date-format="yyyy-mm-dd" name="tea_birthday_div">
				<input class="form-control" name="tea_birthday" type="text" placeholder="请输入生出生日期" validation="required|date" value="${tea_birthday }">
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			</div>
		</div>
		<div class="form-group ">
			<label class="control-label" for="tea_phone">联系方式</label> <input class="form-control" name="tea_phone" type="text" placeholder="请输入联系方式"
				validation="required|maxlen=11" value="${tea_phone }">
		</div>
		<div class="form-group ">
			<label class="control-label" for="tea_address">联系地址</label> <input class="form-control" name="tea_address" type="text"
				placeholder="请输入联系地址" validation="maxlen=80" value="${tea_address }">
		</div>
		<div class="form-group ">
			<label class="control-label" for="tea_desc">备注信息</label>
			<textarea class="form-control" name="tea_desc" placeholder="请输入" validation="maxlen=200">${tea_desc }</textarea>
		</div>
	</div>
</form>
