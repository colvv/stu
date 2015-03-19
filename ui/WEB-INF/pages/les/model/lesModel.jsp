<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		fObject("confrim", baseDiv).click(function() {
			$("#les_info_form").vali_Form();
			if ($("#les_info_form").hasError()) {
				return;
			}
			hideForm();
			var paramObj = parseParamObj($("#les_info_form").find("[name]"));
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
		$("#les_info_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#les_info_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
		$("#les_info_form").displayNec_Form();

		// 修改时带入lesson_type
		$("les_type", baseDiv).val("${les_type}");
		fObject("les_type", baseDiv).load_Selection({
			codetype : "lesson_type",
			cache : false
		});
	});
</script>
<form id="les_info_form" class="" role="form">
	<div class="form-group">
		<label class="control-label" for="les_name">课程名称</label> <input class="form-control" name="les_name" type="text" placeholder="请输入课程名称"
			validation="required|maxlen=20" value="${les_name }">
	</div>
	<div class="form-group ">
		<label class="control-label" for="les_type">课程类型</label> <select class="form-control" name="les_type" validation="required"></select>
	</div>
	<div class="form-group ">
		<label class="control-label" for="les_desc">备注信息</label>
		<textarea class="form-control" name="les_desc" placeholder="请输入课程备注信息" validation="maxlen=200">${les_desc }</textarea>
	</div>
</form>
