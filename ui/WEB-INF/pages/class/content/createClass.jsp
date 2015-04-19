<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#create_class_area:after {
	content: "班级创建";
	position: absolute;
	top: 15px;
	left: 15px;
	font-size: 14px;
	font-weight: bold;
	color: #A38C97;
	text-transform: uppercase;
	letter-spacing: 1px;
}
</style>
<script>
	$(document).ready(
			function() {
				var baseDiv = "create_class_area";
				var chooseEle_stu = new Object();
				var chooseEle_mas = new Object();
				var chooseEle_tea = new Object();
				var chooseEle_les = new Object();
				$("#" + baseDiv).on("dblclick", ".create-class-box", function() {
					$classBox = $(this);
					confrimMsg("确定要删除（" + $(this).text() + "）么？", function() {
						switch ($classBox.parent().attr("name")) {
						case "stu_list_area":
							delete chooseEle_stu[$classBox.attr("name")];
							break;
						case "tea_list_area":
							delete chooseEle_tea[$classBox.attr("name")];
							break;
						case "mas_list_area":
							delete chooseEle_mas[$classBox.attr("name")];
							break;
						default:
							break;
						}
						$classBox.remove();
						mas_display();
					});
				});
				// 选择班主任
				fObject("master_add", baseDiv).dblclick(function() {
					showChoose({
						url : "/tea/choose/chooseTea.do",
						maxChoose : 1,
						select_id : 'tea_id',
						select_name : 'tea_name',
						show_info : {
							"tea_name" : "姓名",
							"tea_address" : "地址"
						},
						title : "班主任选择",
						width : '90%',
						initEle : chooseEle_mas,
						confrim_func : function(obj) {
							chooseEle_mas = obj;
							fObject("mas_list_area", baseDiv).html("");
							var _html = "";
							for ( var ele in chooseEle_mas) {
								_html += display_mas(chooseEle_mas[ele]);
							}
							fObject("mas_list_area", baseDiv).prepend(_html);
							mas_display();
						}
					});
				});
				// 选择教师
				fObject("teacher_add", baseDiv).dblclick(function() {
					showChoose({
						url : "/tea/choose/chooseTea.do",
						maxChoose : 99,
						select_id : 'tea_id',
						select_name : 'tea_name',
						show_info : {
							"tea_name" : "姓名",
							"tea_address" : "地址"
						},
						title : "任教老师选择",
						width : '90%',
						initEle : chooseEle_tea,
						confrim_func : function(obj) {
							chooseEle_tea = obj;
							fObject("tea_list_area", baseDiv).html("");
							var _html = "";
							for ( var ele in chooseEle_tea) {
								_html += display_tea(chooseEle_tea[ele]);
							}
							fObject("tea_list_area", baseDiv).prepend(_html);
						}
					});
				});
				// 选择课程
				fObject("lesson_add", baseDiv).dblclick(function() {
					showChoose({
						url : "/les/choose/chooseLes.do",
						maxChoose : 99,
						select_id : 'les_id',
						select_name : 'les_name',
						show_info : {
							"les_name" : "课程名称",
							"les_type" : "课程类型",
							"create_time" : "创建时间",
							"les_desc" : "课程描述"
						},
						title : "班级课程选择",
						width : '90%',
						initEle : chooseEle_les,
						confrim_func : function(obj) {
							chooseEle_les = obj;
							fObject("les_list_area", baseDiv).html("");
							var _html = "";
							for ( var ele in chooseEle_les) {
								_html += display_les(chooseEle_les[ele]);
							}
							fObject("les_list_area", baseDiv).prepend(_html);
						}
					});
				});
				// 选择学生
				fObject("student_add", baseDiv).dblclick(function() {
					showChoose({
						url : "/stu/choose/chooseStu.do",
						maxChoose : 99,
						select_id : 'stu_id',
						select_name : 'stu_name',
						show_info : {
							"stu_name" : "姓名",
							"stu_kindergarten" : "幼儿园"
						},
						title : "学生选择",
						width : '90%',
						initEle : chooseEle_stu,
						confrim_func : function(obj) {
							chooseEle_stu = obj;
							fObject("stu_list_area", baseDiv).html("");
							var _html = "";
							for ( var ele in chooseEle_stu) {
								_html += display_stu(chooseEle_stu[ele]);
							}
							fObject("stu_list_area", baseDiv).prepend(_html);
						}
					});
				});
				function display_stu(ele) {
					var sex = ele.stu_sex;
					var _html = "<div class='panel panel-";
					if ("0" === sex) {
						_html += "info";
					} else {
						_html += "danger";
					}
					_html += " pull-left mg-r-5 mg-b-5 create-class-box cursor-p' name='" + ele.stu_id
							+ "'><div class='panel-heading panel-head-lite pull-left'>";
					if ("0" === sex) {
						_html += "<i class='  fa fa-reddit fa-3x pull-left'></i>";
					} else {
						_html += "<i class='  fa  fa-github-alt  fa-3x pull-left'></i>";
					}
					_html += "<div class='huge pull-left'>哈哈<br>" + ele.stu_name + "</div></div></div>";
					return _html;
				}
				function display_mas(ele) {
					var _html = '<div class="panel panel-default pull-left mg-r-5 mg-b-0 create-class-box cursor-p" name="'+ele.tea_id+'">'
							+ '<div class="panel-heading  pull-left"><i class="  fa fa-twitter fa-3x pull-left"></i>';
					_html += '<div class="huge pull-left ">' + ele.tea_name + '</div></div></div>';
					return _html;
				}
				function display_tea(ele) {
					var _html = '<div class="panel panel-success pull-left mg-r-5 mg-b-0 create-class-box cursor-p" name="'+ele.tea_id+'">'
							+ '<div class="panel-heading  pull-left"><i class="  fa fa-leaf fa-3x pull-left"></i>';
					_html += '<div class="huge pull-left ">' + ele.tea_name + '</div></div></div>';
					return _html;
				}
				function display_les(ele) {
					var _html = '<div class="panel panel-default pull-left mg-r-5 mg-b-0 create-class-box cursor-p" name="'+ele.les_id+'">'
							+ '<div class="panel-heading  pull-left"><i class="  fa fa-book fa-3x pull-left"></i>';
					_html += '<div class="huge pull-left ">' + ele.les_name + '</div></div></div>';
					return _html;
				}
				function mas_display() {
					if (fObject("mas_list_area", baseDiv).find(".panel").length == 1) {
						fObject("master_add").hide();
					} else {
						fObject("master_add").show();
					}
				}
				//确认、取消按钮
				fObject("return", "main_area").click(
						function() {
							fObject("class_content", "main_area").html(
									'<div class="panel-body min-h-500 "><h3 class="text-center mg-t-150"> '
											+ '<i class=" fa fa-arrow-up mg-r-5"></i>Select First </h3></div>');
						});
				fObject("confrim", "main_area").click(function() {
					// 可以没有
					//if (getObj_Attr_Count(chooseEle_mas) == 0) {
					//	alert("请选择一位班主任");
					//}
					if (!$("#" + baseDiv).vali_Form({
						fail_show_type : 'alertMsg_B',
						succ_show_type : 'none'
					})) {
						return;
					}
					if (getObj_Attr_Count(chooseEle_tea) == 0) {
						alertMsg_B("请至少选择一位任课老师");
						return;
					}
					if (getObj_Attr_Count(chooseEle_les) == 0) {
						alertMsg_B("请至少选择一门课程");
						return;
					}
					if (getObj_Attr_Count(chooseEle_stu) == 0) {
						alertMsg_B("请至少选择一名学生");
						return;
					}
					//var chooseEle_stu = new Object();
					//var chooseEle_mas = new Object();
					//var chooseEle_tea = new Object();
					commonAjax_pro("/class/createClass.do", {
						"choose_mas" : displayObj(chooseEle_mas),
						"choose_tea" : displayObj(chooseEle_tea),
						"choose_stu" : displayObj(chooseEle_stu),
						"choose_les" : displayObj(chooseEle_les),
						"class_name" : fObject("class_name", baseDiv).val(),
						"class_desc" : fObject("class_desc", baseDiv).val()
					}, function(msg) {
						processStop();
						var array = msg.split("|");
						if (array[0] === '0') {
							alertMsg_B("保存成功");
						} else {
							if (array[1]) {
								alertMsg_B("保存失败," + array[1]);
							} else {
								alertMsg_B("保存失败");
							}
						}
					});
				});
			});
</script>
<!--
			<div class="panel panel-success  mg-b-0 mg-r-5 pull-left center-block create-class-box">
					<div class="panel-heading  pull-left">
						<i class="  fa fa-user-secret fa-3x pull-left"></i>
						<div class="huge pull-left text-center">
							刘艳<br>算心珠
						</div>
					</div>
				</div>
			
			<div class="panel panel-default pull-left mg-r-5 mg-b-0 create-class-box">
				<div class="panel-heading  pull-left">
					<i class="  fa fa-twitter fa-3x pull-left"></i>
					<div class="huge pull-left ">
						张晋平<br>珠心算
					</div>
				</div>
			</div>

	<div class="panel panel-info pull-left mg-r-5 mg-b-5 create-class-box">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-reddit fa-3x pull-left"></i>
					<div class="huge pull-left">
						庆庆<br>王子诚
					</div>
				</div>
			</div>
			<div class="panel panel-danger pull-left mg-r-5 mg-b-5 create-class-box">
				<div class="panel-heading panel-head-lite pull-left">
					<i class="  fa fa-github-alt fa-3x pull-left"></i>
					<div class="huge pull-left">
						悠悠<br>王子瑜
					</div>
				</div>
			</div>
 -->
<div class="panel-body min-h-500  pd-t-50" id="create_class_area" onselectstart="return false">
	<form role="form" id="create_class_form">
		<div class="row">
			<label class="col-xs-1" for="class_name">班级名称</label>
			<div class="col-xs-11">
				<input class="form-control wd-50" name="class_name" type="text" placeholder="请输入班级名称" validation="required|maxlen=20"
					value="${class_name }">
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-5">
				<label>班主任</label>
			</div>
			<div class="col-xs-6 ">
				<div name="mas_list_area"></div>
				<div class="panel panel-primary pull-left mg-r-5 mg-b-5 cursor-p" name="master_add">
					<div class="panel-heading  pull-left">
						<i class="  fa fa-plus fa-3x "></i>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<label class="col-xs-1">任课老师</label>
			<div class="col-xs-11">
				<div name="tea_list_area"></div>
				<div class="panel panel-primary pull-left mg-r-5 mg-b-0 cursor-p" name="teacher_add">
					<div class="panel-heading  pull-left">
						<i class="  fa fa-plus fa-3x "></i>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<label class="col-xs-1">班级课程</label>
			<div class="col-xs-11">
				<div name="les_list_area"></div>
				<div class="panel panel-primary pull-left mg-r-5 mg-b-0 cursor-p" name="lesson_add">
					<div class="panel-heading  pull-left">
						<i class="  fa fa-plus fa-3x "></i>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<label class="col-xs-1">学生</label>
			<div class="col-xs-11">
				<div name="stu_list_area"></div>
				<div class="panel panel-info pull-left mg-r-5 mg-b-5 cursor-p" name="student_add">
					<div class="panel-heading panel-head-lite pull-left">
						<i class="  fa fa-plus fa-3x "></i>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<label class="col-xs-1" for="class_desc">班级描述</label>
			<div class="col-xs-11">
				<textarea class="form-control wd-80 min-h-100" name="class_desc" placeholder="请输入班级描述" validation="required|maxlen=200">${class_desc }</textarea>
			</div>
		</div>
		<hr>
		<div class="row ">
			<div class="label label-info pull-left mg-r-5 mg-l-20 mg-b-5 font-15 cursor-p">
				<i class=" fa fa-reddit  pull-left"></i>
				<div class=" pull-left">男孩/boy</div>
			</div>
			<div class="label label-danger pull-left  mg-r-5 font-15 cursor-p">
				<i class=" fa fa-github-alt   pull-left"></i>
				<div class=" pull-left">女孩/girl</div>
			</div>
			<div class="label label-success pull-left  font-15 cursor-p">双击"+"按钮可以添加，双击已有学生/老师可以进行移除</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" name="confrim">确定</button>
	<button type="button" class="btn btn-default" name="return">返回</button>
</div>