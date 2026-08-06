<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:内容表列表界面。
	作者:lijia
	版权:xxx
	版本:v1.0 
	日期:2018-03-18 10:26:11
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-Contentlist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-Contentlist .checkboxall','.table-Contentlist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >内容ID</th>
	       		

	       		<th >作者</th>
	       		

	       		<th >栏目ID</th>
	       		

	       		<th >内容</th>
	       		

	       		<th >内容图</th>
	       		

	       		<th >状态</th>
	       		

	       		<th >转载ID</th>
	       		

	       		<th >创建时间</th>
	       		

	       		<th >创建者</th>
	       		

	       		<th >是否删除</th>
	       		

	       		<th >摘要</th>
	       		

	       		<th >修改人</th>
	       		

	       		<th >修改时间</th>
	       		

	       		<th >流媒体</th>
	       		

	       		<th >新闻时间</th>
	       		

	       		<th >来源</th>
	       		

	       		<th >来源URL</th>
	       		

	       		<th >发布时间</th>
	       		

	       		<th >简短标题</th>
	       		

	       		<th >标题</th>
	       		

	       		<th >标题图</th>
	       		

	       		<th >附件ID</th>
	       		

	       		<th >首页图</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="contents">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="contentId" type="checkbox" class="checkone" onClick="checkOne('.table-Contentlist .checkboxall','.table-Contentlist .checkone')" value="<pg:cell colName="contentId"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="contentId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="author"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="channelId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="cmsContent"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="contentImg"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="contentStatus"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="crawlId"  />
																					
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
						 		                									<pg:cell colName="description"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="lastModifier"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="lastModifyDate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="mediaId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="newsdate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="orgin"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="orginUrl"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="releaseDate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="shortTitle"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="title"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="titleImg"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="attachId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="indexImg"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewContent" data='<pg:cell colName="contentId"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editContent" data='<pg:cell colName="contentId"  />' >
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
			$(".table-Contentlist .btn-viewContent").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看内容表信息",
	         					showfooter:false,
	         					url:usercontextpath+"/content/getContent.page",
	         					params:{
	         						"contentId":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-Contentlist .btn-editContent").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改内容表信息",
         					showfooter:false,
         					url:usercontextpath+"/content/toUpdateContent.page",
         					params:{
         						"contentId":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
