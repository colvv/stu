<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		fObject("confrim", baseDiv).click(function() {
			$("#sys_code_conf").vali_Form();
			if ($("#sys_code_conf").hasError()) {
				return;
			}
			hideForm();
			var paramObj = parseParamObj($("#sys_code_conf").find("[name]"));
			commonAjax("/sys/code/insertSysCode.do", paramObj, function(msg) {
				var array = msg.split("|");
				if (array[0] === '0') {
					alertMsg_B("保存成功");
					// 调用外层点击 来刷新
					var $cur = fObject("codetypes", "main_area").find(".list-group-item").filter(".cur");
					$cur.find("[name='org_badge']").text(parseInt($cur.find("[name='org_badge']").text()) + 1);
					$cur.click();
				} else {
					if (array[1]) {
						alertMsg_B("保存失败," + array[1]);
					} else {
						alertMsg_B("保存失败");
					}
				}
			});
		});

		$("#sys_code_conf [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#sys_code_conf [validation]").blur(function() {
			$(this).vali_Ele();
		});
	});
</script>
<form id="sys_code_conf" class="" role="form">
	<div class="tab-pane   fade in active">
		<input type="hidden" name="codetype" value="${codetype}">
		<div class="form-group">
			<label class="control-label" for="name">枚举名称</label> <input class="form-control" name="name" type="text" value="${name }" readonly>
		</div>
		<div class="form-group">
			<label class="control-label" for="code">编码</label> <input class="form-control" name="code" type="text" placeholder="请输入编码"
				validation="required|maxlen=10|password">
		</div>
		<div class="form-group ">
			<label class="control-label" for="codename">编码描述</label> <input class="form-control" name="codename" type="text" placeholder="请输入编码描述"
				validation="required|maxlen=40">
		</div>
		<div class="form-group ">
			<label class="control-label" for="codealias">备注</label>
			<textarea class="form-control" name="codealias" placeholder="请输入备注" validation="maxlen=100"></textarea>
		</div>
	</div>
</form>

