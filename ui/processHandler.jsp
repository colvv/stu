<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/commonHead.jsp"%>
<!-- <link rel="stylesheet" href="resources/jsplumb/css/jsplumb.css">
 -->
<link rel="stylesheet" href="resources/self/css/process.css">
</head>
<body>
	<div id="main">
		<!-- demo -->
		<div class="demo statemachine-demo" id="statemachine-demo"></div>
		<!-- /demo -->
	</div>
	<%@include file="/include/commonFooter.jsp"%>
	<script>
		$(document).ready(
				function() {
					var array = [ {
						id : 1,
						name : "传输环节"
					}, {
						id : 2,
						name : "预处理环节"
					}, {
						id : 3,
						name : "一次分拣环节"
					}, {
						id : 4,
						name : "二次分拣环节"
					}, {
						id : 5,
						name : "排重环节"
					}, {
						id : 6,
						name : "划价环节"
					}, {
						id : 7,
						name : "入库环节"
					} ];
					var width = $("body").width();
					var size = parseInt((width - 150) / 300);
					var html = "";
					var start_t = 100;
					var start_l = 50;
					var direct = 1;
					for ( var i = 0; i < array.length; i++) {
						html += "<div class='w' id='node_"+array[i].id+"' style='left:"+start_l+"px;top:"+start_t+"px'>" + array[i].name
								+ "</div>";
						start_l += direct * 300;
						if ((i + 1) % size == 0) {
							if (direct == -1) {
								start_l = 50;
							} else {
								// u n y?
								start_l = 300 * size - 150 - 150 + 50;
							}
							direct = direct * -1;
							start_t += 150;
						}
					}
					$("#statemachine-demo").html(html);
					jsPlumb.ready(function() {
						// setup some defaults for jsPlumb.
						var instance = jsPlumb.getInstance({
							Endpoint : [ "Dot", {
								radius : 2
							} ],
							HoverPaintStyle : {
								strokeStyle : "#1e8151",
								lineWidth : 2
							},
							ConnectionOverlays : [ [ "Arrow", {
								location : 1,
								id : "arrow",
								length : 14,
								foldback : 0.8
							} ], [ "Label", {
								label : "FOO",
								id : "label",
								cssClass : "aLabel"
							} ] ],
							Container : "statemachine-demo"
						});

						window.jsp = instance;

						var windows = jsPlumb.getSelector(".statemachine-demo .w");

						// initialise draggable elements.
						// 可以拖动
						instance.draggable(windows);

						instance.bind("connection", function(info) {
							// 更改连线名称
							info.connection.getOverlay("label").setLabel("流转");
						});

						// suspend drawing and initialise.
						instance.batch(function() {
							instance.makeSource(windows, {
								filter : ".ep",
								anchor : "Continuous",
								connector : [ "StateMachine", {
									curviness : 20
								} ],
								connectorStyle : {
									strokeStyle : "#5c96bc",
									lineWidth : 2,
									outlineColor : "transparent",
									outlineWidth : 4
								},
								maxConnections : 5,
								onMaxConnections : function(info, e) {
									alert("Maximum connections (" + info.maxConnections + ") reached");
								}
							});

							// initialise all '.w' elements as connection targets.
							// 连线
							instance.makeTarget(windows, {
								dropOptions : {
									hoverClass : "dragHover"
								},
								anchor : "Continuous",
								allowLoopback : true
							});
							for ( var i = 0; i < array.length; i++) {
								if (array[i + 1]) {
									instance.connect({
										source : "node_" + array[i].id,
										target : "node_" + array[i + 1].id,
									});
								}
							}
							jsPlumb.fire("jsPlumbDemoLoaded", instance);
						});
					});
				});
	</script>
</body>
</html>