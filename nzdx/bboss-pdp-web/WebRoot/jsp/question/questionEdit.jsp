<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:编辑问题主表界面。
	作者:lijia
	版权:xbc
	版本:v1.0 
	日期:2019-06-22 14:10:54
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
<pg:beaninfo requestKey="question">		

	<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal form_sys_modifyQuestion" id="form_sys_modifyQuestion">
		<div class="form-body">
					  														<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.qId"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="qId"  autocomplete="off" value="<pg:cell colName="qId"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.answerCount"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="answerCount"  autocomplete="off" value="<pg:cell colName="answerCount"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.qContent"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="qContent"  autocomplete="off" value="<pg:cell colName="qContent"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.qTime"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="qTime"  autocomplete="off" value="<pg:cell colName="qTime"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.qTitle"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="qTitle"  autocomplete="off" value="<pg:cell colName="qTitle"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.userId"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="userId"  autocomplete="off" value="<pg:cell colName="userId"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.userName"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="userName"  autocomplete="off" value="<pg:cell colName="userName"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
																</div>				<div class="row">
								<div class="col-md-12" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1"><pg:message code="question.viewCount"/>															</label>
							<div class="col-md-9">
																																	<input type="text" class="form-control" placeholder="" name="viewCount"  autocomplete="off" value="<pg:cell colName="viewCount"  />">
																											<div class="form-control-focus"></div>
																		 
																						</div>
						</div>
					</div>
								</div>	
									</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="button"   class="btn green btn-Questionmodifysave">保存</button>
					<button type="reset" class="btn default">重置</button>
					<button type="button" class="btn default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>

<script type="text/javascript">
	jQuery(document).ready(function() {
				var usercontextpath = "<%=request.getContextPath()%>";
		var modifyQuestion = function(){
			$('#form_sys_modifyQuestion',ModelDialog.getCurrentModal())
			.ajaxSubmit(
					{
						type : 'POST',
						url : usercontextpath+'/jsp/question/updateQuestion.page',
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
							var title = '修改问题主表';
							var tiptype = "success";
							if (msg == 'success') {
								msg = "修改问题主表完毕"
								PDP.success(msg,function(){
									ModelDialog.getCurrentModal().modal('hide');
									SysQuestionManager.queryQuestions(false);
								}) ;
							} else {							 
								PDP.warn(msg) ;
							}
							
							
	
						}
	
					});
		}
		PDP.validateform({
			form:"#form_sys_modifyQuestion",
			messages : {
																																																														},
			rules : {	
																																																																																
			},
			submitHandler:modifyQuestion
		});
		
		$(".btn-Questionmodifysave",ModelDialog.getCurrentModal()).bind("click",function(){
			$("#form_sys_modifyQuestion",ModelDialog.getCurrentModal()).submit();
		});		
	});
</script>
</pg:beaninfo> 
