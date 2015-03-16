<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(
			function() {
				var baseDiv = "main_area";
				$("#create_finance_form [validation]").change(function() {
					$(this).vali_Ele();
					if ($(this).attr("name") == "fin_oi_type" || $(this).attr("name") == "fin_date") {
						if (fObject("fin_oi_type", baseDiv).vali_Ele() && fObject("fin_date", baseDiv).vali_Ele()) {
							activc_display_area();
						} else {
							hide_display_area();
						}
					}
				});
				$("#create_finance_form [validation]").blur(function() {
					$(this).vali_Ele();
				});
				fObject('confrim', baseDiv).click(
						function() {
							$("#create_finance_form").vali_Form();
							if ($("#create_finance_form").hasError()) {
								return;
							}
							var paramObj = parseParamObj($("#create_finance_form").find("[name]"));
							var money = parseFloat(paramObj.fin_money);
							if ((fObject("fin_oi_type", baseDiv).val() === "0" && money <= 0)
									|| (fObject("fin_oi_type", baseDiv).val() === "1" && money >= 0)) {
								alertMsg_B("请按照提示录入金额", "danger");
								return;
							}
							hideForm();
							commonAjax_pro("/fin/addFinance.do", paramObj, function(msg) {
								processStop();
								var array = msg.split("|");
								if (array[0] === '0') {
									alertMsg_B("保存成功");
									fObject('reset', baseDiv).click();
								} else {
									if (array[1]) {
										alertMsg_B("保存失败," + array[1]);
									} else {
										alertMsg_B("保存失败");
									}
								}
							});
						});
				fObject('reset', baseDiv).click(function() {
					hide_display_area();
					$("#create_finance_form").removeError();
					fObject("fin_date", baseDiv).val("");
					fObject("fin_oi_type", baseDiv).val("");
					fObject("fin_type", baseDiv).val("");
					fObject("fin_rela_user", baseDiv).val("");
					fObject("fin_money", baseDiv).val("");
					fObject("fin_desc", baseDiv).val("");

				});
				function hide_display_area() {
					fObject("detail_area", baseDiv).fadeOut(1000, function() {
						fObject("confrim", baseDiv).prop("disabled", true);
					});
				}
				function activc_display_area() {
					fObject("fin_type", baseDiv).load_Selection({
						codetype : "fin_type",
						conditionFunc : function() {
							return fObject("fin_oi_type", baseDiv).val() + "%";
						}
					});
					fObject("fin_money", baseDiv).delLabel();
					if (fObject("fin_oi_type", baseDiv).val() === "0") {
						fObject("fin_money", baseDiv).addLabel("金额大于0", "danger");
					} else {
						fObject("fin_money", baseDiv).addLabel("金额小于0", "danger");
					}
					fObject("fin_money", baseDiv).addLabel("格式为0.00", "info");
					fObject("fin_money", baseDiv).addLabel("小数可省略", "info");

					fObject("detail_area", baseDiv).fadeIn(1000);
					fObject("confrim", baseDiv).prop("disabled", false);
				}

				fObject("fin_oi_type", baseDiv).load_Selection({
					codetype : "fin_oi_type"
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
						<input class="form-control" name="fin_date" type="text" placeholder="请输入收支时间" validation="required|date" value="${sysdate}"> <span
							class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					</div>
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_oi_type">收支类型</label> <select class="form-control" name="fin_oi_type" validation="required">
					</select>
				</div>
			</div>
			<div class="row" name="detail_area" style="display: none;">
				<div class="form-group  col-xs-7">
					<label class="control-label" for="fin_type">收支明细类型</label> <select class="form-control" name="fin_type" validation="required">
					</select>
				</div>
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_rela_user">相关人员</label>
					<div class="input-group">
						<input class="form-control" name="fin_rela_user" type="text" value="${sysuser.user_name }" readonly> <span
							class="input-group-addon color-bg-w cursor-p"><i class="fa fa-search fa-fw"></i></span>
					</div>
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="form-group  col-xs-7">
					<label class="control-label" for="fin_money">收支金额</label>
					<div class="input-group">
						<span class="input-group-addon">￥</span> <input class="form-control" name="fin_money" type="text" placeholder="请输入金额"
							value="${fin_money }" validation="required|num"><span class="input-group-addon">元</span>
					</div>
				</div>
				<div class="form-group col-xs-4">
					<label class="control-label" for="fin_user">录入人员</label> <input class="form-control" name="fin_user" type="text"
						value="${sysuser.user_name }" readonly>
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="col-xs-11">
					<label class="control-label" for="fin_desc">说明</label>
					<textarea class="form-control" name="fin_desc" placeholder="请输入收支情况说明" validation="required|minlength=10">${fin_desc}</textarea>
				</div>
				<div class="form-group col-xs-1"></div>
				<div class="col-xs-12" name="process_area"></div>
			</div>
		</form>
	</div>
	<div class="panel-footer text-right pd-r-50">
		<button type="button" class="btn btn-primary mg-l-5" name="confrim" disabled>
			确定<i class="fa fa-check mg-l-5"></i>
		</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-default" name="reset">
			重置<i class="fa fa-rotate-left mg-l-5"></i>
		</button>
	</div>
</div>
