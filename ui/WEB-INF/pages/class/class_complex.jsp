<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		fObject("create_class", baseDiv).click(function() {
			commonAjax("/class/createClass.do", {}, function(html) {
				fObject("class_content", baseDiv).html(html);
			});
		});
	});
</script>
<div class="row">
	<div class="panel panel-primary">
		<div class="panel-heading">班级信息</div>
		<div class="panel-body">
			<div class="col-xs-2">
				<button class="btn btn-primary btn-block" name="create_class">
					<i class="fa fa-graduation-cap fa-lg  mg-t-5 mg-r-5"></i>组建班级
				</button>
			</div>
			<div class="col-xs-2">
				<button class="btn btn-defualt btn-block" name="his_class">
					<i class="fa fa-twitter fa-lg  mg-t-5 mg-r-5"></i>历史班级查看
				</button>
			</div>
			<div class="panel panel-default col-xs-12 mg-t-20">
				<div class="panel-body min-height-500" name="class_content">
					<h3 class="text-center mg-t-150">
						<i class=" fa fa-arrow-up mg-r-5"></i>Select First
					</h3>
				</div>
			</div>
		</div>
	</div>
</div>