<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		$("#create_finance_form [validation]").change(function() {
			$(this).vali_Ele();
		});
		$("#create_finance_form [validation]").blur(function() {
			$(this).vali_Ele();
		});
		fObject('confrim', baseDiv).click(function() {
			$("#create_finance_form").vali_Form();
			if ($("#create_finance_form").hasError()) {
				return;
			}
			fObject('reset', baseDiv).click();
		});
		fObject('reset', baseDiv).click(function() {
			$("#create_finance_form").removeError();
			fObject("fin_date", baseDiv).val("");
			fObject("fin_oi_type", baseDiv).val("");
			fObject("fin_type", baseDiv).val("");
			fObject("fin_rela_user", baseDiv).val("");
			fObject("fin_money", baseDiv).val("");
			fObject("stu_desc", baseDiv).val("");
		});

		dPicker(fObject("fin_date_div", baseDiv));
	});
</script>
<div class="panel panel-primary">
	<div class="panel-heading">新建收支</div>
	<div class="panel-body">
		<form id="create_finance_form" class="" role="form">
			<div class="row">
				<!-- Tab panes -->
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_date">收支时间</label>
					<div class="input-group  date form_date" data-date-format="yyyy-mm-dd" name="fin_date_div">
						<input class="form-control" name="fin_date" type="text" placeholder="请输入收支时间" validation="required|date" value="${fin_date }">
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					</div>
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_oi_type">收支类型</label> <select class="form-control" name="fin_oi_type" validation="required">
						<option value="">请选择</option>
						<option value="0">收入类</option>
						<option value="1">支出类</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group  col-xs-7">
					<label class="control-label" for="fin_type">收入类型</label> <select class="form-control" name="fin_type" validation="required">
						<option value="">请选择</option>
						<option value="0">收入类</option>
						<option value="1">支出类</option>
					</select>
				</div>
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_rela_user">相关人员</label> <input class="form-control" name="fin_rela_user" type="text"
						value="${sysuser.user_name }" validation="required">
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="form-group  col-xs-7">
					<label class="control-label" for="fin_money">收入金额</label> <input class="form-control" name="fin_money" type="text" placeholder="请输入金额"
						value="${fin_money }" validation="required">
				</div>
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_user">录入人员</label> <input class="form-control" name="fin_user" type="text"
						value="${sysuser.user_name }" readonly>
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="col-xs-11">
					<label class="control-label" for="stu_desc">说明</label>
					<textarea class="form-control" name="stu_desc" placeholder="请输入收支情况说明" validation="required|minlength=10">${stu_desc}</textarea>
				</div>
				<div class="form-group col-xs-1"></div>
			</div>
		</form>
	</div>
	<div class="panel-footer text-right pd-r-50">
		<button type="button" class="btn btn-primary mg-l-5" name="confrim">
			确定<i class="fa fa-check mg-l-5"></i>
		</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-default" name="reset">
			重置<i class="fa fa-rotate-left mg-l-5"></i>
		</button>
	</div>
</div>
