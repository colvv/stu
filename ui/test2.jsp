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
		<div class="demo statemachine-demo" id="statemachine-demo">
			<div class="w" id="opened">
				BEGIN
				<!--  连线出发点
				<div class="ep"></div>
				 -->
			</div>
			<div class="w" id="phone1">
				PHONE INTERVIEW 1
			</div>
			<div class="w" id="phone2">
				PHONE INTERVIEW 2
			</div>
			<div class="w" id="inperson">
				IN PERSON
			</div>
			<div class="w" id="rejected">
				REJECTED
			</div>
		</div>
		<!-- /demo -->
	</div>
	<%@include file="/include/commonFooter.jsp"%>
	<script>
		$(document).ready(function() {
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
				//instance.draggable(windows);

				// bind a click listener to each connection; the connection is deleted. you could of course
				// just do this: jsPlumb.bind("click", jsPlumb.detach), but I wanted to make it clear what was
				// happening.
				instance.bind("click", function(c) {
					// 删除线条
					//instance.detach(c);
				});

				// bind a connection listener. note that the parameter passed to this function contains more than
				// just the new connection - see the documentation for a full list of what is included in 'info'.
				// this listener sets the connection's internal
				// id as the label overlay's text.
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

					// and finally, make a couple of connections
					instance.connect({
						source : "opened",
						target : "phone1",
						anchor : [ 0.2, 0 ],
					});
					instance.connect({
						source : "phone1",
						target : "phone1"
					});
					instance.connect({
						source : "phone1",
						target : "inperson",
						anchor : [ 0, 0.8 ],
					});
					instance.connect({
						source : "inperson",
						target : "phone2",
						endpoint:["Dot", { radius:3 }],
						  endpointStyle:{ fillStyle: "green" },
					});
				 var connection  = 	instance.connect({
						source : "phone2",
						target : "rejected",
						 endpoint:"Blank",
						    anchors:[
						        [ "Perimeter", { shape:"Ellipse" } ]
						    ]
					});
				 connection.bind("click",function(conn){
					 alert("you clicked on "+conn);
				 });
					// anchor，前两个为起点的位置   后面的不清楚
					// anchors:["Bottom", "Continuous"] ,Bottom为底，Continuous最近位置
					//deleteEndpointsOnDetach:false ,删除时保留结束点
				});

				jsPlumb.fire("jsPlumbDemoLoaded", instance);
			});
		});
	</script>
</body>
</html>