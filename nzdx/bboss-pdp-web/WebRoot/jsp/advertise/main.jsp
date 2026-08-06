<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin"%>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:招聘主界面。
	作者:lijia
	版权:bc
	版本:v1.0 
	日期:2018-05-19 12:05:28
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
					<form role="form" class="form-horizontal form-queryAdvertise">					 
						<div class="form-body">					
																												<div class="row">
															<div class="col-md-4">
									<div class="form-group form-md-line-input">
										<label class="col-md-3 control-label" for="form_control_1">招聘职位										</label>
										<div class="col-md-9">
																							<div class="input-icon right">
																										<input type="text" class="form-control  input-xs"
														placeholder="招聘职位" name="advertisePosition">
																										<div class="form-control-focus"></div>
													<span class="help-block">请输入招聘职位</span>
												</div>
																						
										</div>
									</div>
								</div>
								
								
																														<div class="col-md-4">
									<div class="form-group form-md-line-input">
										<label class="col-md-3 control-label" for="form_control_1">工作地点										</label>
										<div class="col-md-9">
																							<div class="input-icon right">
																										<input type="text" class="form-control  input-xs"
														placeholder="工作地点" name="workAddress">
																										<div class="form-control-focus"></div>
													<span class="help-block">请输入工作地点</span>
												</div>
																						
										</div>
									</div>
								</div>
								
								
																   								   								   		<div class="col-md-4">
												<div class="form-group form-md-line-input">
		
													<div class="col-md-12">
														<div class="input-group">
		
															<span class="input-group-btn btn-left">
		
																<button type="button"
																	class="btn btn-xs green-haze btn-queryAdvertise "
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
							招聘列表 </span>

					</div>
					<div class="actions">
						 
						<a class="btn btn-xs blue btn-addAdvertise"  > 新增 <i class="fa fa-edit"></i></a>
						 <a class="btn btn-xs red btn-batchdelAdvertise" >
							<i class="fa fa-times"></i> 批量删除
						</a> 
						 
						 
					</div>
				</div>
				<div class="portlet-body portlet-Advertiselist"></div>
			</div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
var SysAdvertiseManager = function(){
	var usercontextpath = "<%=request.getContextPath()%>";
	var queryAdvertises = function(doquery){
					var advertisePosition=$("#advertisePosition").val();
					var workAddress=$("#workAddress").val();
						if(  PDP.containSpecial(advertisePosition)  || PDP.containSpecial(workAddress)){
			PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
			return;
		}
				$(".portlet-Advertiselist").load(usercontextpath+"/advertise/queryListInfoAdvertises.page",
									doquery?$('.form-queryAdvertise').serialize():{},
									function(){
									});	
	}
	return {
		queryAdvertises:function(doquery){
			queryAdvertises(doquery);
		},
		usercontextpath:function(){
			return usercontextpath;
		}
	}
}();
$(document).ready(function() {
		var usercontextpath = SysAdvertiseManager.usercontextpath();
	SysAdvertiseManager.queryAdvertises(false);	
	$(".form-queryAdvertise .btn-queryAdvertise").bind('click',function(){
			SysAdvertiseManager.queryAdvertises(true);
	});
	$(".btn-addAdvertise").bind('click',function(){
		 ModelDialog.dialog({
				title:"新增招聘",
				showfooter:false,
				url:usercontextpath+"/advertise/toAddAdvertise.page",
				 width: "1024px",
				 height: "590px"

         });
	});
	$(".btn-batchdelAdvertise").bind("click",function(){
	  
        var chk_value =[]; 
        $('.portlet-Advertiselist input[name="advertiseId"]:checked').each(function(){ 
        	chk_value.push($(this).val());
        }); 
        if(chk_value.length == 0)
        {
           	 PDP.warn("请选择要删除的招聘!");
           	 return;
        }
         PDP.confirm("确定要删除选中的招聘吗?",function(isConfirm){
           	 	if(isConfirm)
           	 	{        	 		
           	 		
	           	 	$.post(usercontextpath+"/advertise/deleteBatchAdvertise.page",
	          				$.param( {
									"advertiseIds" : chk_value
								 },true),
	          				function(responseText){
		          				if(responseText=="success"){
		          					
		          					PDP.success("招聘删除成功!");
		          					SysAdvertiseManager.queryAdvertises(false);
		          				}else{
		          					PDP.warn("招聘删除失败:"+responseText);
		          				}
	          				});
           	 	}		        	
			});	
	});

            
});

</script>
