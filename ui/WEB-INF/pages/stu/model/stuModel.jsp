<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		fObject("dialog_tabs", baseDiv).find("a:eq(0)").tab("show");
		fObject("confrim", baseDiv).click(function() {
			$("#stu_info_form").vali_Form();
			if ($("#stu_info_form").hasError()) {
				return;
			}
			hideForm();
			var paramObj = parseParamObj($("#stu_info_form").find("[name]"));
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
		$("#stu_info_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#stu_info_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
		$("#stu_info_form").displayNec_Form();

		fObject("stu_sex", baseDiv).val("${stu_sex}");
		dPicker(fObject("stu_birthday_div", baseDiv));
	});
</script>
<form id="stu_info_form" class="" role="form">
	<ul class="nav nav-tabs" name="dialog_tabs">
		<li><a href="#dialog_basic" data-toggle="tab">基本信息<i class="fa fa-star" style="color: red;"></i></a></li>
		<li><a href="#dialog_extend" data-toggle="tab">更多信息</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane   fade in active" id="dialog_basic">
			<div class="form-group mg-t-10">
				<label class="control-label" for="stu_id">学号</label> <input class="form-control" name="stu_id" type="text" placeholder="系统将自动生成"
					value="${stu_id }" readonly>
			</div>
			<div class="form-group">
				<label class="control-label" for="stu_name">学生姓名</label> <input class="form-control" name="stu_name" type="text" placeholder="请输入学生姓名"
					validation="required|maxlen=10" value="${stu_name }">
			</div>
			<div class="form-group ">
				<label class="control-label" for="stu_sex">性别</label> <select class="form-control" name="stu_sex" validation="required">
					<option value="">请选择</option>
					<option value="0">男</option>
					<option value="1">女</option>
				</select>
			</div>
			<div class="form-group ">
				<label class="control-label" for="stu_birthday">出生日期</label>
				<div class="input-group  date form_date" data-date-format="yyyy-mm-dd" name="stu_birthday_div">
					<input class="form-control" name="stu_birthday" type="text" placeholder="请输入学生出生日期" validation="required|date" value="${stu_birthday }">
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
			<div class="form-group ">
				<label class="control-label" for="stu_phone">联系方式</label> <input class="form-control" name="stu_phone" type="text" placeholder="请输入联系方式"
					validation="required|len=11" value="${stu_phone }">
			</div>
		</div>
		<div class="tab-pane fade " id="dialog_extend">
			<div class="form-group mg-t-10">
				<label class="control-label" for="stu_lt_name">小名</label> <input class="form-control" name="stu_lt_name" type="text"
					placeholder="请输入学生小名" validation="maxlen=10" value="${stu_lt_name }">
			</div>
			<div class="form-group ">
				<label class="control-label" for="stu_kindergarten">所在幼儿园</label> <input class="form-control" name="stu_kindergarten" type="text"
					placeholder="请输入学生所在幼儿园" validation="maxlen=40" value="${stu_kindergarten }">
			</div>
			<div class="form-group ">
				<label class="control-label" for="stu_address">联系地址</label> <input class="form-control" name="stu_address" type="text"
					placeholder="请输入学生联系地址" validation="maxlen=80" value="${stu_address }">
			</div>
			<div class="form-group ">
				<label class="control-label" for="stu_backinfo">备注信息</label>
				<textarea class="form-control" name="stu_backinfo" placeholder="请输入学生备注信息" validation="maxlen=200">${stu_backinfo }</textarea>
			</div>
		</div>
	</div>
</form>
