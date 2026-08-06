<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:通知公告列表界面。
	作者:lijia
	版权:bxc
	版本:v1.0 
	日期:2018-12-13 12:31:18
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-Notificationlist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-Notificationlist .checkboxall','.table-Notificationlist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >通知ID</th>
	       		

	       		<th >通知内容</th>
	       		

	       		<th >0,未发布，1已发布</th>
	       		

	       		<th >通知时间</th>
	       		

	       		<th >通知标题</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="notifications">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="notificationId" type="checkbox" class="checkone" onClick="checkOne('.table-Notificationlist .checkboxall','.table-Notificationlist .checkone')" value="<pg:cell colName="notificationId"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="notificationId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="notificationContent"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="notificationState"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="notificationTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="notificationTitle"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewNotification" data='<pg:cell colName="notificationId"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editNotification" data='<pg:cell colName="notificationId"  />' >
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
			$(".table-Notificationlist .btn-viewNotification").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看通知公告信息",
	         					showfooter:false,
	         					url:usercontextpath+"/notifcation/getNotification.page",
	         					params:{
	         						"notificationId":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-Notificationlist .btn-editNotification").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改通知公告信息",
         					showfooter:false,
         					url:usercontextpath+"/notifcation/toUpdateNotification.page",
         					params:{
         						"notificationId":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
