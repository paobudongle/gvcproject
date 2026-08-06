<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin"%>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:模型资源主界面。
	作者:lijia
	版权:bjxbc
	版本:v1.0 
	日期:2018-07-26 12:17:13
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
					<form role="form" class="form-horizontal form-queryModelResource">					 
						<div class="form-body">					
																												<div class="row">
															<div class="col-md-4">
									<div class="form-group form-md-line-input">
										<label class="col-md-3 control-label" for="form_control_1">资料名称										</label>
										<div class="col-md-9">
																							<div class="input-icon right">
																										<input type="text" class="form-control  input-xs"
														placeholder="资料名称" name="sourceName">
																										<div class="form-control-focus"></div>
													<span class="help-block">请输入资料名称</span>
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
																	class="btn btn-xs green-haze btn-queryModelResource "
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
							模型资源列表 </span>

					</div>
					<div class="actions">
						 
						<a class="btn btn-xs blue btn-addModelResource"  > 新增 <i class="fa fa-edit"></i></a>
						 <a class="btn btn-xs red btn-batchdelModelResource" >
							<i class="fa fa-times"></i> 批量删除
						</a> 
						 
						 
					</div>
				</div>
				<div class="portlet-body portlet-ModelResourcelist"></div>
			</div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
var SysModelResourceManager = function(){
	var usercontextpath = "<%=request.getContextPath()%>";
	var queryModelResources = function(doquery){
					var sourceName=$("#sourceName").val();
						if(  PDP.containSpecial(sourceName)){
			PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
			return;
		}
				$(".portlet-ModelResourcelist").load(usercontextpath+"/modelresource/queryListInfoModelResources.page",
									doquery?$('.form-queryModelResource').serialize():{},
									function(){
									});	
	}
	return {
		queryModelResources:function(doquery){
			queryModelResources(doquery);
		},
		usercontextpath:function(){
			return usercontextpath;
		}
	}
}();
$(document).ready(function() {
		var usercontextpath = SysModelResourceManager.usercontextpath();
	SysModelResourceManager.queryModelResources(false);	
	$(".form-queryModelResource .btn-queryModelResource").bind('click',function(){
			SysModelResourceManager.queryModelResources(true);
	});
	$(".btn-addModelResource").bind('click',function(){
		 ModelDialog.dialog({
				title:"新增模型资源",
				showfooter:false,
				url:usercontextpath+"/modelresource/toAddModelResource.page",				
				width:"1024px",
				height:"568px"

         });
	});
	$(".btn-batchdelModelResource").bind("click",function(){
	  
        var chk_value =[]; 
        $('.portlet-ModelResourcelist input[name="id"]:checked').each(function(){ 
        	chk_value.push($(this).val());
        }); 
        if(chk_value.length == 0)
        {
           	 PDP.warn("请选择要删除的模型资源!");
           	 return;
        }
         PDP.confirm("确定要删除选中的模型资源吗?",function(isConfirm){
           	 	if(isConfirm)
           	 	{        	 		
           	 		
	           	 	$.post(usercontextpath+"/modelresource/deleteBatchModelResource.page",
	          				$.param( {
									"ids" : chk_value
								 },true),
	          				function(responseText){
		          				if(responseText=="success"){
		          					
		          					PDP.success("模型资源删除成功!");
		          					SysModelResourceManager.queryModelResources(false);
		          				}else{
		          					PDP.warn("模型资源删除失败:"+responseText);
		          				}
	          				});
           	 	}		        	
			});	
	});

            
});

</script>
