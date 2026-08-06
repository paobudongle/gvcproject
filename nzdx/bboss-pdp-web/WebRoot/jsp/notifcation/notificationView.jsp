<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:查看通知公告界面。
	作者:lijia
	版权:bxc
	版本:v1.0 
	日期:2018-12-13 12:31:18
-->
<pg:beaninfo requestKey="notification">	

	<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal" >
		<div class="form-body">
			  											<div class="row">
						<div class="col-md-12" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">通知ID:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="notificationId"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-12" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">通知内容:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="notificationContent"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-12" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">0,未发布，1已发布:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="notificationState"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-12" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">通知时间:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="notificationTime"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-12" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">通知标题:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="notificationTitle"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
						</div>	
							</div>
		
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">					
					<button type="button" class="btn green" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
		
	</form>

</pg:beaninfo> 
