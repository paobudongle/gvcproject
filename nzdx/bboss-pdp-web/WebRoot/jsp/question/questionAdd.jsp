<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css" type="text/css" rel="stylesheet">
<style>
	#nr .btn:not(.md-skip):not(.bs-select-all):not(.bs-deselect-all).btn-sm {
		font-size: 11px;
		padding: 6px 8px 6px 8px;
	}
	#nr .btn:not(.md-skip):not(.bs-select-all):not(.bs-deselect-all) {
		font-size: 12px;
		font-weight: 600;
		text-transform: uppercase;
		transition: box-shadow 0.28s cubic-bezier(0.4, 0, 0.2, 1);
		-webkit-border-radius: 2px;
		-moz-border-radius: 2px;
		-ms-border-radius: 2px;
		-o-border-radius: 2px;
		border-radius: 2px;
		overflow: hidden;
		position: relative;
		user-select: none;
		padding: 6px 8px 6px 8px;
	}
	.modal-dialog {
		width: auto;
		height: auto;
	}
	.checkbox {
		margin-left: 20px;
	}

	.note-editor.note-frame.fullscreen {
		position: fixed;
		top: 60px;
		left: 163px;
		z-index: 1050;
		width: 74%;
	}
	.note-editor.note-frame.fullscreen {
		position: fixed;
		top: 8px;
		left: 163px;
		z-index: 1050;
		width: 74%;
	}
	.note-editable{max-width: 1024px;}
	.note-popover{display: none}
</style>
<!-- 
	描述:添加问题主表界面。
	作者:lijia
	版权:xbc
	版本:v1.0 
	日期:2019-06-22 14:10:54
-->
<div class="row">
	<div class="col-md-12">		 
		<div class="alert alert-danger display-hide  alert-addQuestionexist">
			<button class="close close-addQuestionexist" data-close="alert"></button>
			<span class="msg"> 提示信息区 </span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">		 
		<div class="alert alert-success display-hide  alert-addQuestionnotexist">
			<button class="close close-addQuestionnotexist" data-close="alert"></button>
			<span class="msg"> 提示信息区 </span>
		</div>
	</div>
</div>


<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal form_sys_addQuestion" id="form_sys_addQuestion">
		<input type="hidden" id="qContent" name="qContent"/>
		<div class="form-body">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group form-md-line-input">
						<label class="col-md-2 control-label" >标题 <span class="required">*</span></label>
						<div class="col-md-9">
							<input type="text" class="form-control" placeholder="" id="qTitle" name="qTitle" autocomplete="off">
							<div class="form-control-focus"></div>


						</div>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col-md-12">
					<div class="form-group form-md-line-input">
						<label class="col-md-2 control-label" >发表内容 <span class="required">*</span></label>
						<div class="col-md-9" id="nr">
							<div class="summernote" id="mysummernote"> </div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="form-actions">

			<div class="row">
				<div class="col-md-offset-2 col-md-9">
					<button type="button"  class="btn green btn-Questionaddsave" style="margin-right: 15px">创建</button>
					<button type="reset" class="btn default" style="margin-right: 15px">重置</button>
					<button type="button" class="btn default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>
	<!-- END FORM-->
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		var usercontextpath = "<%=request.getContextPath()%>";



		$('#mysummernote').summernote({
			placeholder:'请输入发表内容',
			height:240,
			lang:'zh-CN',
			toolbar: [
				['style', ['bold', 'italic', 'underline', 'clear']],
				['font', ['strikethrough']],
				['fontsize', ['fontsize']],
				['height', ['height']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['insert',['link','picture','video']],
				['misc', ['undo', 'redo','fullscreen']]
			]

		});

		var addQuestion = function(){
			var qTitle = $('#qTitle', ModelDialog.getCurrentModal()).val();

			var htmlstr = $('.summernote').summernote('code');
			debugger;

			if(qTitle == "") {
				PlatformCommonUtils.warn("请输入标题") ;
				return;
			}


			if(htmlstr == "") {
				PlatformCommonUtils.warn("请输入发表内容") ;
				return;
			}

			$('#qContent', ModelDialog.getCurrentModal()).val(htmlstr);


			$('form',ModelDialog.getCurrentModal())
			.ajaxSubmit(
					{
						type : 'POST',
						url : usercontextpath+'/question/addQuestion.page',
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
							if (msg == 'success') {
								msg = "发表成功"
								PDP.success(msg,function(){
									ModelDialog.getCurrentModal().modal('hide');
									SysQuestionManager.queryQuestions(false);
								}) ;
							} else {							 
								PlatformCommonUtils.warn(msg) ;
							}
							
							
	
						}
	
					});
		}
		PDP.validateform({
			form:"#form_sys_addQuestion",
			messages: {


			},
			rules: {

			},
			submitHandler:addQuestion
		});
		
		$(".btn-Questionaddsave",ModelDialog.getCurrentModal()).bind("click",function(){
			
			$("form",ModelDialog.getCurrentModal()).submit();
			
			
		});
		
	});
</script>
