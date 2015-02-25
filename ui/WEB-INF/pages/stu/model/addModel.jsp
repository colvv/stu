<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_content_area";
		fObject("cancel", baseDiv).click(function() {
			$("#form_area").hide();
			$("#form_content_area").hide();
		});
		$("#" + baseDiv + " .close").click(function() {
			fObject("cancel", baseDiv).click();
		});
		fObject("confrim", baseDiv).click(function() {
			fObject("cancel", baseDiv).click();
			commonAjax_pro("/stu/addStu.do", {
				stu_name : fObject("stu_name", baseDiv).val()
			}, function(msg) {
				processError();
				if ("0" === msg) {
					alertMsg("保存成功");
					fObject('refresh_button', 'main_area').click();
				} else {
					alertMsg("保存失败");
				}
			});
		});

	});
</script>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">新增学生</h4>
	</div>
	<div class="modal-body">
		<form class="" role="form">
			<div class="form-group">
				<label for="stu_name">学生姓名</label> <input class="form-control" name="stu_name" type="text" placeholder="请输入学生姓名">
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" data-dismiss="modal" name="confrim">确定</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" name="cancel">取消</button>
	</div>
</div>