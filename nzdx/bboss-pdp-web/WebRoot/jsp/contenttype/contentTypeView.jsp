<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:查看内容分类界面。
	作者:lijia
	版权:xxx
	版本:v1.0 
	日期:2018-03-04 17:50:51
-->
<pg:beaninfo requestKey="contentType">	

	<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal" >
		<div class="form-body">
			  											<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">ID:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="contentTypeId"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">名称:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="contentTypeName"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">创建时间:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="createDate"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">创建人:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="creater"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">是否删除:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="delFlag"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">是否有图片:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="hasImg"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">图片高度:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="imgHeight"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">图片宽度:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="imgWidth"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">是否可用:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="isDisabled"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">修改人:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="lastModifier"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">修改时间:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="lastModifyDate"    /> 
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
