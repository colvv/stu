<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="bs-footer navbar-bottom mg-t-50" role="footer">
	<div class="container">
		<div class="row ">
			<div class="col-xs-4">
				<span class="muted "> &copy; 2015 学生管理</span> <span class="text-primary">当前版本： v1.0</span>
			</div>
			<div class="col-xs-6">
				<span class="text-danger ">请用IE9+、chrome、safari、firefox或opear等现代浏览器</span>
			</div>
			<div class="col-xs-2 text-right">
				<strong> @我:</strong> <a href="mailto:5vwy89@163.com"><i class="fa fa-envelope-o fa-lg"></i> </a>
			</div>
		</div>
	</div>
</footer>


<!-- 模态框（Modal） alert -->
<div class="modal fade" id="alert_msg" tabindex="-1" role="dialog" aria-labelledby="错误信息" aria-hidden="true" style="z-index: 1043">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">信息提示</h4>
			</div>
			<div class="modal-body">
				<strong class="text-danger ">这是一个错误信息</strong>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<!-- 模态框（Modal）confrim -->
<div class="modal fade" id="comfrim_modal" tabindex="-1" role="dialog" aria-labelledby="提示信息" aria-hidden="true" style="z-index: 1042">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">提示信息</h4>
			</div>
			<div class="modal-body">
				<strong class="text-danger ">确定要删除么？</strong>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" name="confrim">确定</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<div class="loading_back" id="show_process">
	<div class="container">
		<div class="row mg-t-150">
			<div class="col-xs-12 ">
				<div style="width: 120px; margin: 0 auto;">
					<span class="label label-info process_info center-block ">正在加载，请稍候</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<div class="progress">
					<div class="progress-bar progress-bar-striped " role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
						style="width: 0%">
						<span class="sr-only">0% Complete</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  简单的loading效果 -->
<div class="loading_back" id="loading_simple_back"></div>
<div class="loading_content" id="loading_simple_content">
	<div class="">
		<h2 class="text-center color-w">
			<i class="fa fa-spinner fa-spin mg-r-5"></i>Loading<span name="self-animate"></span>
		</h2>
	</div>
</div>

<!-- 模态框（Modal）FORM -->
<div class="modal fade " id="form_modal" tabindex="-1" role="dialog" aria-labelledby="信息录入" aria-hidden="true">
	<div class=" modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" name="form_title">系统用户信息</h4>
			</div>
			<div class="modal-body" name="form_body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" name="confrim">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" name="cancel">取消</button>
			</div>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<!-- 模态框（Modal）选择框，有可能会和modal一同出现 -->
<div class="modal fade " id="choose_modal" tabindex="-1" role="dialog" aria-labelledby="信息录入" aria-hidden="true" style="z-index: 1041">
	<div class=" modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" name="form_title">系统用户信息</h4>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="panel panel-default min-h-100">
							<div class="panel-body">
								<h5 class="mg-t-0 mg-b-5">
									<small>已选择<span class="text-danger mg-l-10">（单击可查看详情，双击可以去除已选择目标）</span></small>
								</h5>
								<div name="selected_area" class="row pd-l-10 pd-r-5"></div>
							</div>
						</div>
					</div>
					<div class="row" name="form_body" onselectstart="return false"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" name="confrim">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" name="cancel">取消</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<div class="container navbar-fixed-bottom" id="alert_bottom" style="display: none;z-index: 1044" >
	<div class="row">
		<div class="col-xs-3"></div>
		<div class="alert alert-success alert-dismissable  col-xs-6 ">
			<span name="dispay_area"> <span class="label label-success ">success</span><strong class="mg-l-5 center-block">保存成功！</strong>
			</span>
		</div>
	</div>
</div>
<!-- /.modal -->
<style>
.loading_back {
	background: #000;
	opacity: .5;
	filter: alpha(opacity =                                 50);
	position: fixed;
	z-index: 1040;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	display: none;
}

.loading_content {
	position: fixed;
	z-index: 1041;
	top: 50%;
	left: 50%;
	margin-left: -100px;
	margin-top: -100px;
	display: none;
}
</style>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="./resources/jquery/js/jquery-1.11.2.min.js"></script>
<script src="./resources/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script src="./resources/jsplumb/js/jquery.jsPlumb-1.7.4.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
<script src="./resources/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script src="./resources/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="./resources/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="./resources/jquery.dataTables/js/jquery.dataTables.cn.js"></script>
<script src="./resources/jquery.dataTables/js/dataTables.bootstrap.js"></script>
<script src="./resources/jquery.ztree/js/jquery.ztree.all-3.5.js"></script>
<script src="./resources/highcharts/js/highcharts.js"></script>
<script src="./resources/highcharts/js/highcharts-3d.js"></script>
<script src="./resources/highcharts/js/modules/exporting.js"></script>
<script src="./resources/self/js/commonJs.js"></script>
<script src="./resources/self/js/jquery.common.js"></script>
<script src="./resources/self/js/sha512.js"></script>
<script src="./resources/jquery/js/jquery.md5.js"></script>