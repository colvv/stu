<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/commonHead.jsp"%>
<link rel="stylesheet" href="resources/self/css/process.css">
</head>
<body>
	<%@include file="/include/commonFooter.jsp"%>
	<div id="content1" style="height: 500px;"></div>
	<div id="content2"></div>
	<script>
		$(document).ready(function() {
			$("#content2").vProcess({
				move_able : true,
				complex_datas :[{"id":"1","name":"传输环节","renderTo":[{"target":2,"lineName":"退回"},{"target":3,"lineName":"通过"}],"left":90,"top":280},{"id":"2","name":"预处理环节","renderTo":[4],"left":346,"top":123},{"id":"3","name":"一次分拣环节","renderTo":[4],"left":356,"top":400},{"id":"4","name":"二次分拣环节","renderTo":[1,5],"left":690,"top":273},{"id":"5","name":"排重环节","renderTo":[6],"left":938,"top":272},{"id":"6","name":"划价环节","renderTo":[7],"left":1228,"top":274},{"id":"7","name":"入库环节","left":1229,"top":464}],
				program : true
			});
		});
	</script>
</body>
</html>