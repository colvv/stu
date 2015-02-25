<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_area_m";
		$("#form_area_m [name='confrim']").click(function() {
			$("#form_area_m .close").click();
			commonAjax("/stu/oper/add.do", {
				name : fValue("stu_name", baseDiv)
			}, function(msg) {
				if (msg === '0') {
					alertMsg("操作成功");
				} else {
					alertMsg("操作失败");
				}
			});
		});
		$("#form_area_m .close").click(function() {
			$("#form_area_b").hide();
			$("#form_area_m").hide();
		});
		$("#form_area_m [name='cancel']").click(function() {
			$("#form_area_m .close").click();
		});

	});
</script>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">学生信息录入</h4>
	</div>
	<div class="modal-body">
		<form class="" action="" role="form">
			<div class="form-group">
				<label for="vv_name">学生姓名</label> <input class="form-control" name="stu_name" type="text" placeholder="请输入学生姓名">
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" data-dismiss="modal" name="confrim">确定</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" name="cancel">取消</button>
	</div>
</div>