<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin"%>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:通知公告主界面。
	作者:lijia
	版权:bxc
	版本:v1.0 
	日期:2018-12-13 12:31:18
-->
<!-- BEGIN PAGE HEADER-->
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
	<admin:menuposition />
</div>
<!-- END PAGE BAR -->
<!-- BEGIN PAGE TITLE-->
<div class="row">
	<div class=" col-md-12">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet light bordered">

					<div class="portlet-title">
						<div class="caption">
							<i class="icon-pin font-yellow-crusta"></i> <span
								class="caption-subject bold font-yellow-crusta uppercase">
							查询条件 </span>

						</div>

					</div>
					<div class="portlet-body form">
						<form role="form" class="form-horizontal form-queryNotification">
							<div class="form-body">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group form-md-line-input">
											<label class="col-md-3 control-label">通知标题 </label>
											<div class="col-md-9">
												<div class="input-icon right">
													<input type="text" class="form-control  input-xs"
														   placeholder="通知标题" name="notificationTitle">
													<div class="form-control-focus"></div>
													<span class="help-block">请输入通知标题</span>
												</div>

											</div>
										</div>
									</div>


									<div class="col-md-4">&nbsp;</div>
									<div class="col-md-4">
										<div class="form-group form-md-line-input">

											<div class="col-md-12">
												<div class="input-group">
		
															<span class="input-group-btn btn-left">
		
																<button type="button"
																		class="btn btn-xs green-haze btn-queryNotification "
																		aria-expanded="false">查询</button>
																<button type="reset" class="btn btn-xs default reset"
																		aria-expanded="false">重置</button>
		
															</span>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="portlet light bordered">
					<div class="portlet-title tabbable-line">
						<div class="caption">
							<i class="icon-pin font-yellow-crusta"></i> <span
								class="caption-subject bold font-yellow-crusta uppercase">
							通知公告列表 </span>

						</div>
						<div class="actions">

							<a class="btn btn-xs blue btn-addNotification"> 新增 <i class="fa fa-edit"></i></a>
							<a class="btn btn-xs red btn-batchdelNotification">
								<i class="fa fa-times"></i> 批量删除
							</a>


						</div>
					</div>
					<div class="portlet-body portlet-Notificationlist"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var SysNotificationManager = function(){
	var usercontextpath = "<%=request.getContextPath()%>";
	var queryNotifications = function(doquery){
					var notificationTitle=$("#notificationTitle").val();
						if(  PDP.containSpecial(notificationTitle)){
			PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
			return;
		}
				$(".portlet-Notificationlist").load(usercontextpath+"/notifcation/queryListInfoNotifications.page",
									doquery?$('.form-queryNotification').serialize():{},
									function(){
									});	
	}
	return {
		queryNotifications:function(doquery){
			queryNotifications(doquery);
		},
		usercontextpath:function(){
			return usercontextpath;
		}
	}
}();
$(document).ready(function() {
		var usercontextpath = SysNotificationManager.usercontextpath();
	SysNotificationManager.queryNotifications(true);
	$(".form-queryNotification .btn-queryNotification").bind('click',function(){
			SysNotificationManager.queryNotifications(true);
	});
	$(".btn-addNotification").bind('click',function(){
		 ModelDialog.dialog({
				title:"新增通知公告",
				showfooter:false,
				url:usercontextpath+"/notifcation/toAddNotification.page",				
				width:"800px",
				height:"320px"

         });
	});
	$(".btn-batchdelNotification").bind("click",function(){
	  
        var chk_value =[]; 
        $('.portlet-Notificationlist input[name="notificationId"]:checked').each(function(){ 
        	chk_value.push($(this).val());
        }); 
        if(chk_value.length == 0)
        {
           	 PDP.warn("请选择要删除的通知公告!");
           	 return;
        }
         PDP.confirm("确定要删除选中的通知公告吗?",function(isConfirm){
           	 	if(isConfirm)
           	 	{        	 		
           	 		
	           	 	$.post(usercontextpath+"/notifcation/deleteBatchNotification.page",
	          				$.param( {
									"notificationIds" : chk_value
								 },true),
	          				function(responseText){
		          				if(responseText=="success"){
		          					
		          					PDP.success("通知公告删除成功!");
		          					SysNotificationManager.queryNotifications(false);
		          				}else{
		          					PDP.warn("通知公告删除失败:"+responseText);
		          				}
	          				});
           	 	}		        	
			});	
	});

            
});

</script>
