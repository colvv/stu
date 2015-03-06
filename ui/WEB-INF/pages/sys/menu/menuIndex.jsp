<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var setting = {
			data : {
				simpleData : {
					enable : true
				}
			},
			callback : {
				onClick : function(event, treeId, treeNode) {
					// 看来他等于字符串null、、、、
					commonAjax("/sys/menu/displayArea_menu.do", {
						menu_id : treeNode.menu_id
					}, function(html) {
						fObject("display_area", baseDiv).html(html);
					});
				}
			}
		};
		var _nodes = eval("(${menu_ztree})");
		$.fn.zTree.init($("#sys_menu_ztree"), setting, _nodes);
	});
</script>
<div class="row">
	<div class="col-xs-3">
		<div class="panel panel-default min-width-500">
			<!-- /.panel-heading -->
			<div class="panel-heading">系统菜单列表</div>
			<div class="panel-body" style="width: 100%;">
				<ul id="sys_menu_ztree" class="ztree"
					style="border: 0; width: 100%; height: 300px; overflow-y: auto; overflow-x: hidden; background-color: none;"></ul>
			</div>
		</div>
	</div>
	<div class="col-xs-9">
		<div class="panel panel-primary min-width-500">
			<!-- /.panel-heading -->
			<div class="panel-heading">菜单信息</div>
			<div class="panel-body" style="width: 100%;" name="display_area">
				<h3 class="text-center mg-t-150"><i class=" fa fa-arrow-left mg-r-5"></i>Select First</h3>
			</div>
		</div>
	</div>
</div>