<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "create_class_area";
		// renew
		$("#" + baseDiv).off();
		$("#" + baseDiv).on("dblclick", ".create-class-box", function() {
			$classBox = $(this);
			confrimMsg("确定要删除（" + $(this).text() + "）么？", function() {
				$classBox.remove();
			});
		});
		fObject("master_add",baseDiv).dblclick(function(){
			alert($(this).attr("name"));
		});
		fObject("teacher_add",baseDiv).dblclick(function(){
			alert($(this).attr("name"));
		});
		fObject("student_add",baseDiv).dblclick(function(){
			alert($(this).attr("name"));
		});
	});
</script>
<div class="panel-body min-height-500" id="create_class_area">
	<div class="row">
		<div class="col-xs-5">
			<label>班主任</label>
		</div>
		<div class="col-xs-6 ">
			<div class="panel panel-success  mg-b-0 mg-r-5 pull-left center-block create-class-box">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-user-secret fa-3x pull-left"></i>
					<div class="huge pull-left text-center">刘艳</div>
				</div>
			</div>
			<div class="panel panel-primary pull-left mg-r-5 mg-b-5" name="master_add"> 
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-plus fa-3x "></i>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			<label class="pull-left wd-a-100">任课老师</label>
			<div class="panel panel-default pull-left mg-r-5 mg-b-0 create-class-box">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-twitter fa-3x pull-left"></i>
					<div class="huge pull-left ">
						张晋平<br>珠心算
					</div>
				</div>
			</div>
			<div class="panel panel-primary pull-left mg-r-5 mg-b-0 " name="teacher_add">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-plus fa-3x "></i>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			<label class="pull-left wd-a-100">学生</label>
			<div class="panel panel-info pull-left mg-r-5 mg-b-5 create-class-box">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-reddit fa-3x pull-left"></i>
					<div class="huge pull-left">
						欢欢<br>王子诚
					</div>
				</div>
			</div>
			<div class="panel panel-danger pull-left mg-r-5 mg-b-5 create-class-box">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-github-alt fa-3x pull-left"></i>
					<div class="huge pull-left">
						欢欢<br>王佳欢
					</div>
				</div>
			</div>
			<div class="panel panel-primary pull-left mg-r-5 mg-b-5 "  name="student_add">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-plus fa-3x "></i>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="row ">
		<div class="label label-info pull-left mg-r-5 mg-b-5 font-15">
			<i class=" fa fa-reddit  pull-left"></i>
			<div class=" pull-left">男孩/boy</div>
		</div>
		<div class="label label-danger pull-left  mg-r-5 font-15">
			<i class=" fa fa-github-alt   pull-left"></i>
			<div class=" pull-left">女孩/girl</div>
		</div>
		<div class="label label-success pull-left  font-15"  >双击"+"按钮可以添加，双击已有学生/老师可以进行移除</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" data-dismiss="modal" name="confrim">确定</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
</div>