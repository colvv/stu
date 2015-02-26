<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		fObject("dialog_tabs", baseDiv).find("a:eq(0)").tab("show");
		dPicker(fObject("stu_birthday_div", baseDiv));
		fObject("confrim", baseDiv).click(function() {
			var paramObj = parseParamObj(fObject("form_content", baseDiv).find("[name]"));
			commonAjax_pro("/stu/addStu.do", paramObj, function(msg) {
				processError();
				if ("0" === msg) {
					alertMsg("保存成功");
					fObject('refresh_button', 'main_area').click();
				} else {
					alertMsg("保存失败");
				}
			});
		});
		$("#stu_info_form [validation]").change(function(){
			$(this).vali_Ele();
		});

	});
</script>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">新增学生</h4>
	</div>
	<div class="modal-body">
		<form id="stu_info_form" class="" role="form">
			<ul class="nav nav-tabs" name="dialog_tabs">
				<li><a href="#dialog_basic" data-toggle="tab">基本信息<i class="icon-star" style="color:red;"></i></a></li>
				<li><a href="#dialog_extend" data-toggle="tab">更多信息</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane   fade in active" id="dialog_basic">
					<div class="form-group mg-t-10">
						<label  class="control-label" for="stu_name">学生姓名</label> <input class="form-control" name="stu_name"   type="text" placeholder="请输入学生姓名"  validation="required">
					</div>
					<div class="form-group ">
						<label  class="control-label" for="stu_sex">性别</label> <select class="form-control" name="stu_sex"  validation="required">
							<option value="">请选择</option>
							<option value="0">男</option>
							<option value="1">女</option>
						</select>
					</div>
					<div class="form-group ">
						<label  class="control-label" for="stu_birthday">出生日期</label>
						<div class="input-group  date form_date" data-date-format="yyyy-mm-dd" name="stu_birthday_div">
							<input class="form-control" name="stu_birthday" type="text" placeholder="请输入学生出生日期" validation="required"> <span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
					<div class="form-group ">
						<label  class="control-label" for="stu_phone">联系方式</label> <input class="form-control" name="stu_phone" type="text" placeholder="请输入联系方式" validation="required">
					</div>
				</div>
				<div class="tab-pane fade " id="dialog_extend">
					<div class="form-group mg-t-10">
						<label  class="control-label" for="stu_lt_name">小名</label> <input class="form-control" name="stu_lt_name" type="text" placeholder="请输入学生小名">
					</div>
					<div class="form-group ">
						<label  class="control-label" for="stu_kindergarten">所在幼儿园</label> <input class="form-control" name="stu_kindergarten" type="text" placeholder="请输入学生所在幼儿园">
					</div>
					<div class="form-group ">
						<label  class="control-label" for="stu_address">联系地址</label> <input class="form-control" name="stu_address" type="text" placeholder="请输入学生联系地址">
					</div>
					<div class="form-group ">
						<label  class="control-label" for="stu_backinfo">备注信息</label>
						<textarea class="form-control" name="stu_backinfo" placeholder="请输入学生备注信息"></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" data-dismiss="modal" name="confrim">确定</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" name="cancel">取消</button>
	</div>
</div>