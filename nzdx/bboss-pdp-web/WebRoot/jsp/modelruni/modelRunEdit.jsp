<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:编辑模型运行界面。
	作者:lw
	版权:bjxbckj
	版本:v1.0 
	日期:2018-05-18 11:05:34
-->
<div class="row">
	<div class="col-md-12">		 
		<div class="alert alert-danger display-hide  alert-adduserexist">
			<button class="close close-adduserexist" data-close="alert"></button>
			<span class="msg"> 提示信息区 </span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">		 
		<div class="alert alert-success display-hide  alert-addusernotexist">
			<button class="close close-addusernotexist" data-close="alert"></button>
			<span class="msg"> 提示信息区 </span>
		</div>
	</div>
</div>
<pg:beaninfo requestKey="modelRun">		

	<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal form_sys_modifyModelRun" id="form_sys_modifyModelRun">
		<div class="form-body">
						  	<input id="runId" name="runId" type="hidden" value="<pg:cell colName="runId"  />" />
		  				  	<input id="jzId" name="jzId" type="hidden" value="<pg:cell colName="jzId"  />" />
		  				  	<input id="creatDate" name="creatDate" type="hidden" value="<pg:cell colName="creatDate"  dateformat="yyyy-MM-dd HH:mm:ss"  />" />
		  			  														<div class="row">
								<div class="col-md-4" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">运行状态															</label>
							<div class="col-md-9">
																																												<dict:select  type="mRunStatus" name="runStatus" colName="runStatus" textValue="执行状态" textNAN="" extend="class=\"form-control input-sm\"" />
																																					<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
															<div class="col-md-4" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">因素冲击															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="runShorck"  autocomplete="off" value="<pg:cell colName="runShorck"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
															<div class="col-md-4" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">运行求解															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="runSolve"  autocomplete="off" value="<pg:cell colName="runSolve"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-4" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">创建人															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="creater"  autocomplete="off" value="<pg:cell colName="creater"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
								</div>	
									</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="button"   class="btn green btn-ModelRunmodifysave">保存</button>
					<button type="reset" class="btn default">重置</button>
					<button type="button" class="btn default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>

<script type="text/javascript">
	jQuery(document).ready(function() {
				var usercontextpath = "<%=request.getContextPath()%>";
		var modifyModelRun = function(){
			$('#form_sys_modifyModelRun',ModelDialog.getCurrentModal())
			.ajaxSubmit(
					{
						type : 'POST',
						url : usercontextpath+'/jsp/modelrun/updateModelRun.page',
						forceSync : false,
						dataType : 'json',
						beforeSubmit : function() {
							 App.startPageLoading({message: '保存中...'});				           
						},
						error : function(xhr, ajaxOptions,
								thrownError) {
							PlatformCommonUtils.warn(thrownError) ;
						},
	
						success : function(responseText,
								statusText, xhr, $form) {
							 
							 window.setTimeout(function() {
					                App.stopPageLoading();
					            }, 2000);
							var msg = responseText;
							var title = '修改模型运行';
							var tiptype = "success";
							if (msg == 'success') {
								msg = "修改模型运行完毕"
								PDP.success(msg,function(){
									ModelDialog.getCurrentModal().modal('hide');
									SysModelRunManager.queryModelRuns(false);
								}) ;
							} else {							 
								PDP.warn(msg) ;
							}
							
							
	
						}
	
					});
		}
		PDP.validateform({
			form:"#form_sys_modifyModelRun",
			messages : {
																																		},
			rules : {	
																																												
			},
			submitHandler:modifyModelRun
		});
		
		$(".btn-ModelRunmodifysave",ModelDialog.getCurrentModal()).bind("click",function(){
			$("#form_sys_modifyModelRun",ModelDialog.getCurrentModal()).submit();
		});		
	});
</script>
</pg:beaninfo> 
