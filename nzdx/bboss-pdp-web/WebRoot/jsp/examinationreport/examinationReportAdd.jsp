<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:添加考核报告界面。
	作者:lijia
	版权:bxt
	版本:v1.0 
	日期:2019-10-26 16:43:47
-->
<div class="row">
	<div class="col-md-12">		 
		<div class="alert alert-danger display-hide  alert-addExaminationReportexist">
			<button class="close close-addExaminationReportexist" data-close="alert"></button>
			<span class="msg"> 提示信息区 </span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">		 
		<div class="alert alert-success display-hide  alert-addExaminationReportnotexist">
			<button class="close close-addExaminationReportnotexist" data-close="alert"></button>
			<span class="msg"> 提示信息区 </span>
		</div>
	</div>
</div>


<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal form_sys_addExaminationReport" id="form_sys_addExaminationReport">
		<div class="form-body">
																			<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">实验ID															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="experId"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">耗时（分钟）															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="costTime"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																</div>				<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">对抗国A															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="countryA"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="countryAb"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																</div>				<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">两个对抗国：中国-美国															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="countryB"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="endTime"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																</div>				<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">实验名称															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="experName"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">00:进行中；05：实验完成															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="experState"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																</div>				<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">所属组ID															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="groupId"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="operatSocre"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																</div>				<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="remark"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="startTime"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																</div>				<div class="row">
									<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">所属队ID															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="teamId"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
																<div class="col-md-6" >
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">得分															</label>
							<div class="col-md-9">
																										<input type="text" class="form-control" placeholder="" name="totalSocre"  autocomplete="off" >
																												<div class="form-control-focus"></div>
																																				 
																
							</div>
						</div>
					</div>
								</div>	
									</div>			
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">&nbsp;
				</div>
			</div>			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="button"   class="btn green btn-ExaminationReportaddsave">创建</button>
					<button type="reset" class="btn default">重置</button>
					<button type="button" class="btn default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>
	<!-- END FORM-->
<script type="text/javascript">
	jQuery(document).ready(function() {
				var usercontextpath = "<%=request.getContextPath()%>";
		var addExaminationReport = function(){
			$('form',ModelDialog.getCurrentModal())
			.ajaxSubmit(
					{
						type : 'POST',
						url : usercontextpath+'/jsp/examinationreport/addExaminationReport.page',
						forceSync : false,
						dataType : 'json',
						beforeSubmit : function() {
							 App.startPageLoading({message: '保存中...'});				           
						},
						error : function(xhr, ajaxOptions,
								thrownError) {
							PDP.warn(thrownError) ;
						},
	
						success : function(responseText,
								statusText, xhr, $form) {
							 
							 window.setTimeout(function() {
					                App.stopPageLoading();
					            }, 2000);
							var msg = responseText;
							var title = '增加考核报告';
							var tiptype = "success";
							if (msg == 'success') {
								msg = "增加考核报告完毕"
								PDP.success(msg,function(){
									ModelDialog.getCurrentModal().modal('hide');
									SysExaminationReportManager.queryExaminationReports(false);
								}) ;
							} else {							 
								PlatformCommonUtils.warn(msg) ;
							}
							
							
	
						}
	
					});
		}
		PDP.validateform({
			form:"#form_sys_addExaminationReport",
			messages : {
																																																																																																								},
			rules : {	
																																																																																																																																						
			},
			submitHandler:addExaminationReport
		});
		
		$(".btn-ExaminationReportaddsave",ModelDialog.getCurrentModal()).bind("click",function(){
			
			$("form",ModelDialog.getCurrentModal()).submit();
			
			
		});
		
	});
</script>
