<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:招聘列表界面。
	作者:lijia
	版权:bc
	版本:v1.0 
	日期:2018-05-19 12:05:28
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-Advertiselist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-Advertiselist .checkboxall','.table-Advertiselist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >ID</th>
	       		

	       		<th >招聘单位</th>
	       		

	       		<th >招聘内容</th>
	       		

	       		<th >招聘职位</th>
	       		

	       		<th >状态0，未发布，1已发布</th>
	       		

	       		<th >附件ID</th>
	       		

	       		<th >创建时间</th>
	       		

	       		<th >创建人</th>
	       		

	       		<th >是否删除</th>
	       		

	       		<th >修改人</th>
	       		

	       		<th >修改时间</th>
	       		

	       		<th >发布时间</th>
	       		

	       		<th >工作地点</th>
	       		

	       		<th >薪资</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="advertises">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="advertiseId" type="checkbox" class="checkone" onClick="checkOne('.table-Advertiselist .checkboxall','.table-Advertiselist .checkone')" value="<pg:cell colName="advertiseId"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="advertiseId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="advertiseCompany"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="advertiseContent"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="advertisePosition"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="advertiseStatus"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="attachId"  />
																					
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
						 		                									<pg:cell colName="lastModifier"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="lastModifyDate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="releaseDate"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="workAddress"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="workWage"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewAdvertise" data='<pg:cell colName="advertiseId"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editAdvertise" data='<pg:cell colName="advertiseId"  />' >
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
			$(".table-Advertiselist .btn-viewAdvertise").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看招聘信息",
	         					showfooter:false,
	         					url:usercontextpath+"/advertise/getAdvertise.page",
	         					params:{
	         						"advertiseId":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-Advertiselist .btn-editAdvertise").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改招聘信息",
         					showfooter:false,
         					url:usercontextpath+"/advertise/toUpdateAdvertise.page",
         					params:{
         						"advertiseId":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
