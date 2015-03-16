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
		$(document).ready(function() {
			//将需要展示的环节按照数组顺序即可
			var array = [ "传输环节", "预处理环节", "一次分拣环节", "二次分拣环节", "排重环节", "划价环节", "入库环节" ];
			//var array = eval("${array}");
			var width = $("body").width();
			var size = parseInt((width + 50) / 300);
			if (size === 0) {
				size = 1;
			}
			var html = "";
			var start_t = 100;
			var start_l = 50;
			var direct = 1;
			for ( var i = 0; i < array.length; i++) {
				html += "<div class='w' id='node_"+i+"' style='left:"+start_l+"px;top:"+start_t+"px'>" + array[i] + "</div>";
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
					//箭头上的文字和选中效果
					//label : "FOO",
					id : "label",
				//cssClass : "aLabel"
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
				//info.connection.getOverlay("label").setLabel("流转");
			});

			// suspend drawing and initialise.
			instance.batch(function() {
				instance.makeSource(windows, {
					filter : ".ep",
					anchor : "Continuous",
					//此处定义连线的。。。
					//connector : [ "StateMachine", {
					//	curviness : 20
					//} ],
					//connector :"Straight",
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
						//if ((i + 1) % size === 0) {
						//	instance.connect({
						//		source : "node_" + array[i].id,
						//		target : "node_" + array[i + 1].id,
						//		connector : [ "StateMachine", {
						//			curviness : 10
						//		} ],
						//		anchors:["Right", "Right"]
						//	});

						//} else {
						instance.connect({
							source : "node_" + i,
							target : "node_" + (i + 1),
							connector : "Straight"
						});
						//}
					}
				}
				jsPlumb.fire("jsPlumbDemoLoaded", instance);
			});
			
		});
		/**
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
		*/
	</script>
</body>
</html>