<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:内容分类列表界面。
	作者:lijia
	版权:xxx
	版本:v1.0 
	日期:2018-03-04 17:50:51
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-ContentTypelist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-ContentTypelist .checkboxall','.table-ContentTypelist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >ID</th>
	       		

	       		<th >名称</th>
	       		

	       		<th >创建时间</th>
	       		

	       		<th >创建人</th>
	       		

	       		<th >是否删除</th>
	       		

	       		<th >是否有图片</th>
	       		

	       		<th >图片高度</th>
	       		

	       		<th >图片宽度</th>
	       		

	       		<th >是否可用</th>
	       		

	       		<th >修改人</th>
	       		

	       		<th >修改时间</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="contentTypes">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="contentTypeId" type="checkbox" class="checkone" onClick="checkOne('.table-ContentTypelist .checkboxall','.table-ContentTypelist .checkone')" value="<pg:cell colName="contentTypeId"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="contentTypeId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="contentTypeName"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="createDate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="creater"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="delFlag"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="hasImg"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="imgHeight"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="imgWidth"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="isDisabled"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="lastModifier"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="lastModifyDate"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewContentType" data='<pg:cell colName="contentTypeId"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editContentType" data='<pg:cell colName="contentTypeId"  />' >
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
			$(".table-ContentTypelist .btn-viewContentType").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看内容分类信息",
	         					showfooter:false,
	         					url:usercontextpath+"/contenttype/getContentType.page",
	         					params:{
	         						"contentTypeId":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-ContentTypelist .btn-editContentType").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改内容分类信息",
         					showfooter:false,
         					url:usercontextpath+"/contenttype/toUpdateContentType.page",
         					params:{
         						"contentTypeId":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
