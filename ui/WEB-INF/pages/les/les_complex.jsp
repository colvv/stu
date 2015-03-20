<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var baseDiv = "main_area";
		var table = $('#example').DataTable({
			"ajax" : {
				"url" : "loadTable/les_001.do",
				"dataSrc" : ""
			},
			"columns" : [  {
                "class":          'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": '<i class="fa fa-chevron-circle-up fa-lg mg-l-20"/>'
            },{
				"data" : "les_name"
			},{
				"data" : "les_type"
			}, {
				"data" : "create_time"
			} ] , 
			"order": [[1, 'asc']]
		});
		// Add event listener for opening and closing details
	    $('#example tbody').on('click', 'td.details-control', function () {
	        var tr = $(this).closest('tr');
	        var $icon = $(this).find("i");
	        var row = table.row( tr );
	        if ( row.child.isShown() ) {
	            row.child.hide();
	            $icon.removeClass("fa-chevron-circle-down color-g"); 
	            $icon.addClass("fa-chevron-circle-up"); 
	            tr.removeClass('shown');
	        }
	        else {
	            row.child( detailHtml(row.data()) ).show();
	            $icon.removeClass("fa-chevron-circle-up"); 
	            $icon.addClass("fa-chevron-circle-down  color-g"); 
	            tr.addClass('shown');
	        }
	    } );
		function detailHtml ( data ) {
		    // `d` is the original data object for the row
		    return '<div class="word-b"><label class="control-label mg-l-5 mg-r-20" for="stu_backinfo">备注信息:</label><small class="">'+data.les_desc+'</small></div>';
		}
		$('#example tbody').on('click', 'tr[role="row"]', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});
		// --- table -end
		// 按钮组开始~
		fObject('refresh_button', baseDiv).click(function() {
			table.ajax.reload();
		});
		fObject('add_button', baseDiv).click(function() {
			showForm({
				url : "/les/model/addModel.do",
				title : "新增课程",
				refresh : true
			});
		});
		fObject('mod_button', baseDiv).click(function() {
			if (table.$('tr.selected').length !== 1) {
				alertMsg("请先选中要修改的课程！", "default");
				return;
			}
			showForm({
				url : "/les/model/modModel.do",
				param : {
					les_id : table.row(table.$('tr.selected')).data().les_id
				},
				title : "修改课程信息",
				refresh : true
			});
		});
	});
</script>
<div class="row">
	<div class="panel panel-primary">
		<div class="panel-heading">课程信息</div>
		<div class="panel-body">
			<div class="btn-group  mg-b-20" aria-label="操作按钮组">
				<button type="button" class="btn btn-default input-sm" name="refresh_button">
					刷新<i class="fa fa-refresh mg-l-5"></i>
				</button>
				<button type="button" class="btn btn-default input-sm" name="add_button">
					新增<i class="fa fa-plus mg-l-5"></i>
				</button>
				<button type="button" class="btn btn-default input-sm" name="mod_button">
					修改<i class="fa fa-pencil mg-l-5"></i>
				</button>
			</div>
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th width="50px;">展开</th>
						<th>课程名称</th>
						<th width="100px;">课程类型</th>
						<th width="150px;">创建时间</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>