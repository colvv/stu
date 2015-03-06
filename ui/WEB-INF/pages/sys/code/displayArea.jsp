<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		fObject("table_area", baseDiv).vTable(eval('${sys_codes}'), {
			code : "编码",
			codename : "编码描述",
			codealias : "备注"
		});

		fObject("save_button", baseDiv).click(function() {
			commonAjax("/sys/code/saveSysCodeConf.do", {
				codetype : fObject("codetypes", baseDiv).data("current"),
				desc : fObject("desc", baseDiv).val()
			}, function(msg) {
				if ("0" === msg) {
					alertMsg_B("保存成功");
				} else {
					alertMsg_B("保存失败");
				}
			});
		});
		fObject("add_button", baseDiv).click(function() {
			showForm({
				url : "/sys/code/addModel.do",
				param : {
					codetype : '${sys_code_conf.codetype}',
					name : '${sys_code_conf.name}'
				},
				title : "新增编码",
				refresh:true
			});
		});
	});
</script>
<div class="row">
	<form class="" role="form">
		<div class="form-group col-xs-9">
			<label for="name">枚举名称</label> <input class="form-control" name="name" type="text" value="${sys_code_conf.name}" placeholder="请输入编码名称"
				readonly>
		</div>
		<div class="form-group col-xs-9">
			<label for="desc">枚举描述</label>
			<textarea class="form-control" name="desc" placeholder="请输入编码描述" validation="required">${sys_code_conf.desc}</textarea>
		</div>
	</form>
</div>
<div class="btn-group  mg-b-20" aria-label="操作按钮组">
	<button type="button" class="btn btn-default input-sm" name="save_button">
		更新描述信息<i class="fa fa-save  mg-l-5"></i>
	</button>
	<button type="button" class="btn btn-default input-sm" name="add_button">
		新增编码<i class="fa fa-plus mg-l-5"></i>
	</button>
	<button type="button" class="btn btn-info input-sm" disabled>
		其他操作@管理员<i class="fa fa-whatsapp fa-lg   mg-l-5"></i>
	</button>
</div>
<div class="" name="table_area"></div>
