<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin"%>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:问题主表主界面。
	作者:lijia
	版权:xbc
	版本:v1.0 
	日期:2019-06-22 14:10:54
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
					<form role="form" class="form-horizontal form-queryQuestion">					 
						<div class="form-body">					
																												<div class="row">
															<div class="col-md-4">
									<div class="form-group form-md-line-input">
										<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.qTitle"/>										</label>
										<div class="col-md-9">
																							<div class="input-icon right">
																										<input type="text" class="form-control  input-xs"
														placeholder="<pg:message code="question.qTitle"/>" name="qTitle">
																										<div class="form-control-focus"></div>
													<span class="help-block">请输入<pg:message code="question.qTitle"/></span>
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
																	class="btn btn-xs green-haze btn-queryQuestion "
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
							问题主表列表 </span>

					</div>
					<div class="actions">
						 
						<a class="btn btn-xs blue btn-addQuestion"  > 新增 <i class="fa fa-edit"></i></a>
						 <a class="btn btn-xs red btn-batchdelQuestion" >
							<i class="fa fa-times"></i> 批量删除
						</a> 
						 
						 
					</div>
				</div>
				<div class="portlet-body portlet-Questionlist"></div>
			</div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
var SysQuestionManager = function(){
	var usercontextpath = "<%=request.getContextPath()%>";
	var queryQuestions = function(doquery){
					var qTitle=$("#qTitle").val();
						if(  PDP.containSpecial(qTitle)){
			PDP.warn('查询字符串含有非法字符集,请检查输入条件！');
			return;
		}
				$(".portlet-Questionlist").load(usercontextpath+"/jsp/question/queryListInfoQuestions.page",
									doquery?$('.form-queryQuestion').serialize():{},
									function(){
									});	
	}
	return {
		queryQuestions:function(doquery){
			queryQuestions(doquery);
		},
		usercontextpath:function(){
			return usercontextpath;
		}
	}
}();
$(document).ready(function() {
		var usercontextpath = SysQuestionManager.usercontextpath();
	SysQuestionManager.queryQuestions(false);	
	$(".form-queryQuestion .btn-queryQuestion").bind('click',function(){
			SysQuestionManager.queryQuestions(true);
	});
	$(".btn-addQuestion").bind('click',function(){
		 ModelDialog.dialog({
				title:"新增问题主表",
				showfooter:false,
				url:usercontextpath+"/jsp/question/toAddQuestion.page",				
				width:"1024px",
				height:"568px"

         });
	});
	$(".btn-batchdelQuestion").bind("click",function(){
	  
        var chk_value =[]; 
        $('.portlet-Questionlist input[name="qId"]:checked').each(function(){ 
        	chk_value.push($(this).val());
        }); 
        if(chk_value.length == 0)
        {
           	 PDP.warn("请选择要删除的问题主表!");
           	 return;
        }
         PDP.confirm("确定要删除选中的问题主表吗?",function(isConfirm){
           	 	if(isConfirm)
           	 	{        	 		
           	 		
	           	 	$.post(usercontextpath+"/jsp/question/deleteBatchQuestion.page",
	          				$.param( {
									"qIds" : chk_value
								 },true),
	          				function(responseText){
		          				if(responseText=="success"){
		          					
		          					PDP.success("问题主表删除成功!");
		          					SysQuestionManager.queryQuestions(false);
		          				}else{
		          					PDP.warn("问题主表删除失败:"+responseText);
		          				}
	          				});
           	 	}		        	
			});	
	});

            
});

</script>
