<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:模型资源列表界面。
	作者:lijia
	版权:bjxbc
	版本:v1.0 
	日期:2018-07-26 12:17:13
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-ModelResourcelist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-ModelResourcelist .checkboxall','.table-ModelResourcelist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >主键</th>
	       		

	       		<th >00:全球模型01：国家模型02：区域模型</th>
	       		

	       		<th >描述</th>
	       		

	       		<th >难度等级 00 入门01初级02中级03高级</th>
	       		

	       		<th >下载次数</th>
	       		

	       		<th >收费情况00免费01付费</th>
	       		

	       		<th >上级ID</th>
	       		

	       		<th >资源存放路径</th>
	       		

	       		<th >资料图标</th>
	       		

	       		<th >资料名称</th>
	       		

	       		<th >资料类型00：文档资料 01：视频资料</th>
	       		

	       		<th >文件后缀</th>
	       		

	       		<th >时长（仅视频资料有）</th>
	       		

	       		<th >更新日期</th>
	       		

	       		<th >上传时间</th>
	       		

	       		<th >上传人</th>
	       		

	       		<th >浏览次数</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="modelResources">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="id" type="checkbox" class="checkone" onClick="checkOne('.table-ModelResourcelist .checkboxall','.table-ModelResourcelist .checkone')" value="<pg:cell colName="id"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="id"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="blongsModel"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="description"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="difficLevel"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="downloadCount"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="isCharge"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="parentId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="soucrePath"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="sourceIcon"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="sourceName"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="sourceType"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="suffix"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="timeLength"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="updateDate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="uploadTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="uploadUser"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="viewCount"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewModelResource" data='<pg:cell colName="id"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editModelResource" data='<pg:cell colName="id"  />' >
							 修改
						</a>	               
	               </td>    
	                 
	        </tr>
		  
		 </pg:list>
		 </tbody>
</table>
</div>
<script type="text/javascript">
		jQuery(document).ready(function() {	
			
			var usercontextpath = "<%=request.getContextPath()%>";
			$(".table-ModelResourcelist .btn-viewModelResource").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看模型资源信息",
	         					showfooter:false,
	         					url:usercontextpath+"/modelresource/getModelResource.page",
	         					params:{
	         						"id":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-ModelResourcelist .btn-editModelResource").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改模型资源信息",
         					showfooter:false,
         					url:usercontextpath+"/modelresource/toUpdateModelResource.page",
         					params:{
         						"id":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
