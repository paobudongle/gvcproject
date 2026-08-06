<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
<!-- 
	描述:查看问题主表界面。
	作者:lijia
	版权:xbc
	版本:v1.0 
	日期:2019-06-22 14:10:54
-->
<style>
	.answers-list-title{
		height:50px;
		line-height: 45px;
		background:linear-gradient(180deg,rgba(220,227,226,1) 0%,rgba(255,255,255,1) 100%);
		color: #333;
		font-size: 16px;
		font-weight: bold;
		text-align: left;
		padding-left: 15px;
		margin-top: 20px;
	}
	.answers-list .answers-item{
		position: relative;
		word-break: break-all;
		line-height: 30px;
	}
	.answers-list .answers-item .answers-item-author{
		color: #0b94ea;
	}
	.answers-list .answers-item .answers-item-content{
		color: #666;
		display: inline-block;
	}
</style>
<pg:beaninfo requestKey="question">
	<!-- BEGIN FORM-->
	<div class="rich_media_content " id="js_content">


			<h1 style="margin-top: 0px;word-break: break-all; margin-bottom: 15px; padding: 0px; font-size: 32px; line-height: 1.5; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
				<pg:cell colName="qTitle"/></h1>
			<div class="vel" style="margin: 0px 0px 20px; padding: 0px; font-size: 14px; color: rgb(153, 153, 153); text-align: center; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
				<span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">作者：<pg:cell colName="userName"/></span>
				<span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">发表时间：<pg:cell colName="qTime"/></span>
			</div>

			<div class="content f18 h30" style="margin-top: 30px; padding: 0px; font-size: 18px; line-height: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
				<pg:cell colName="qContent"/>
			</div>



		<div class="row" >
			<div class="col-md-12">
				<div class="answers-list-title">回复列表</div>
				<ul class="answers-list">
					<pg:list requestKey="answersList">
						<li class="answers-item">
							<span class="answers-item-author"><pg:cell colName="userName"/></span> 回复：
							<div class="answers-item-content"><pg:cell colName="answerContent"  /></div>
						</li>
	<%--					<div class="form-group form-md-line-input">--%>
	<%--						<label class="col-md-2 control-label" >--%>
	<%--							<pg:cell colName="userName"/>--%>
	<%--						</label>--%>
	<%--						<div class="col-md-9">--%>
	<%--							<pg:cell colName="answerContent"  />--%>
	<%--						</div>--%>
	<%--					</div>--%>
					</pg:list>
				</ul>
			</div>
		</div>


		<form action="#" class="form-horizontal form_sys_addQuestion" id="form_sys_addQuestion">
			<input type="hidden" id="qId" name="qId" value="<pg:cell colName="qId"  />"/>
			<input type="hidden" id="answerContent" name="answerContent"/>
			<div class="form-body">
				<div class="row" >
					<div class="col-md-12">
						<div class="form-group form-md-line-input" style="position: relative;padding-left: 70px;">
							<label class="control-label" style="position: absolute;left: 15px">回复 <span class="required">*</span></label>
							<div class="" id="nr">
								<div class="summernote" id="mysummernote"> </div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button type="button"   class="btn green btn-Questionaddsave" style="margin-left: 55px;">发表回复</button>
					</div>
				</div>
			</div>
		</form>
	</div>
		</pg:beaninfo>

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

			var htmlstr = $('.summernote').summernote('code');

			if(htmlstr == "") {
				PlatformCommonUtils.warn("请输入回复内容") ;
				return;
			}

			$('#answerContent', ModelDialog.getCurrentModal()).val(htmlstr);


			$('form',ModelDialog.getCurrentModal())
					.ajaxSubmit(
							{
								type : 'POST',
								url : usercontextpath+'/question/addQuestionAnswer.page',
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
										msg = "回复成功"
										PDP.success(msg,function(){
											ModelDialog.getCurrentModal().modal('hide');
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