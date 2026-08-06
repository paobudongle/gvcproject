<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:查看模型资源界面。
	作者:lijia
	版权:bjxbc
	版本:v1.0 
	日期:2018-07-26 12:17:13
-->
<pg:beaninfo requestKey="modelResource">	

	<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal" >
		<div class="form-body">
			  											<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">主键:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="id"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">00:全球模型01：国家模型02：区域模型:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="blongsModel"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">描述:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="description"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">难度等级 00 入门01初级02中级03高级:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="difficLevel"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">下载次数:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="downloadCount"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">收费情况00免费01付费:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="isCharge"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">上级ID:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="parentId"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">资源存放路径:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="soucrePath"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">资料图标:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="sourceIcon"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">资料名称:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="sourceName"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">资料类型00：文档资料 01：视频资料:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="sourceType"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">文件后缀:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="suffix"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">时长（仅视频资料有）:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="timeLength"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">更新日期:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="updateDate"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">上传时间:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="uploadTime"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
											<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">上传人:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="uploadUser"    /> 
												 </p>
					</div>
				</div>
			</div>
			 
												</div>			<div class="row">
						<div class="col-md-6" >
				<div class="form-group ">
					<label class="col-md-3 control-label"">浏览次数:				 
					</label>
					 
					<div class="col-md-9">
						<p class="form-control-static"> 
												<pg:cell colName="viewCount"    /> 
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
