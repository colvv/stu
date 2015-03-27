<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		fObject("codetypes", baseDiv).find(".list-group-item").click(function() {
			fObject("codetypes", baseDiv).find(".cur").removeClass("cur");
			$(this).addClass("cur");
			if ($(this).find("[name='current']").length == 0) {
				// 是不是有些累赘 臃肿？
				fObject("codetypes", baseDiv).find(".list-group-item [name='current']").remove();
				fObject("codetypes", baseDiv).find(".list-group-item [name='org_badge']").show();
				$(this).find("[name='org_badge']").hide();
				$(this).prepend("<span class=\"label label-primary pull-right\" name=\"current\">当前</span>");
			}
			commonAjax("/sys/code/displayArea.do", {
				codetype : $(this).find("[name='codetype']").val()
			}, function(html) {
				fObject("display_area", baseDiv).html(html);
			});
		});
	});
</script>
<div class="row">
	<div class="col-xs-3">
		<div class="panel panel-default min-h-500 ">
			<!-- /.panel-heading -->
			<div class="panel-heading">现有枚举项</div>
			<div class="panel-body" style="width: 100%;">
				<ul class="list-group" name="codetypes">
					${codesHtml}
					<!-- 
					<li class="list-group-item cursor-p"><span class="badge" name="org_badge" style="display: block;">0</span>课程类型<input type="hidden" name="codetype" value="lesson_type"></li>
					<li class="list-group-item cursor-p"><span class="badge" name="org_badge" style="display: block;">0</span>学生状态<input type="hidden" name="codetype" value="student_state"></li>
					<li class="list-group-item cursor-p"><span class="label label-primary pull-right" name="current">当前</span><span class="badge" name="org_badge" style="display: none;">1</span>学生类型<input type="hidden" name="codetype" value="student_type"></li>
					 -->
				</ul>
			</div>
		</div>
	</div>
	<div class="col-xs-9">
		<div class="panel panel-primary min-h-500 ">
			<!-- /.panel-heading -->
			<div class="panel-heading">具体信息</div>
			<div class="panel-body" style="width: 100%;" name="display_area">
				<h3 class="text-center mg-t-150">
					<i class=" fa fa-arrow-left mg-r-5"></i>Select First
				</h3>
			</div>
		</div>
	</div>
</div>