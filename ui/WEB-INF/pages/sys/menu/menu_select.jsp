<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "form_modal";
		var setting = {
			data : {
				simpleData : {
					enable : true
				}
			},
			check : {
				enable : true
			}
		};
		var _nodes = eval("(${ztreehtml})");
		$.fn.zTree.init($("#sys_user_menu_ztree"), setting, _nodes);
		fObject("close_button", baseDiv).click(function() {
			fObject("alert_info", baseDiv).alert('close');
		});
		fObject("confrim", baseDiv).click(function() {
			hideForm();
			var menus = "";
			var treeObj = $.fn.zTree.getZTreeObj("sys_user_menu_ztree"), nodes = treeObj.getCheckedNodes(true);
			for ( var i = 0; i < nodes.length; i++) {
				menus += nodes[i].menu_id + ",";
			}
			if (menus != "") {
				menus = menus.substring(0, menus.length - 1)
			}
			commonAjax_pro("/sys/menu/updateUserMenu.do", {
				menus : menus,
				user_id:'${user_id}'
			}, function(msg) {
				processStop();
				if ("0" === msg) {
					alertMsg_B("保存成功,重新登录后生效");
				} else {
					alertMsg_B("保存失败");
				}
			});
		});
	});
</script>
<div class="alert alert-info fade in" name="alert_info">
	<button type="button" class="close" name="close_button">×</button>
	可以选择的菜单需要在<strong>菜单管理 </strong>中配置
</div>
<h4>请勾选可以访问的菜单</h4>
<ul id="sys_user_menu_ztree" class="ztree" style="border: 0; width: 100%; overflow-y: auto; overflow-x: hidden; background-color: none;"></ul>
