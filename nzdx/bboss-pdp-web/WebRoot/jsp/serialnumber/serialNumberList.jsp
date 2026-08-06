<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:序列号列表界面。
	作者:lijia
	版权:xx
	版本:v1.0 
	日期:2018-02-23 09:05:22
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-SerialNumberlist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-SerialNumberlist .checkboxall','.table-SerialNumberlist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >序列号</th>
	       		

	       		<th >状态：0:未激活，1:已激活，2:已过期</th>
	       		

	       		<th >创建时间</th>
	       		

	       		<th >订单ID</th>
	       		

	       		<th >用户ID</th>
	       		

	       		<th >有效结束时间</th>
	       		

	       		<th >有效开始时间</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="serialNumbers">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="sn" type="checkbox" class="checkone" onClick="checkOne('.table-SerialNumberlist .checkboxall','.table-SerialNumberlist .checkone')" value="<pg:cell colName="sn"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="sn"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="activateStatus"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="createTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="orderId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="userId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="validEndTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="validStartTime"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewSerialNumber" data='<pg:cell colName="sn"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editSerialNumber" data='<pg:cell colName="sn"  />' >
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
			$(".table-SerialNumberlist .btn-viewSerialNumber").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看序列号信息",
	         					showfooter:false,
	         					url:usercontextpath+"/serialnumber/getSerialNumber.page",
	         					params:{
	         						"sn":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-SerialNumberlist .btn-editSerialNumber").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改序列号信息",
         					showfooter:false,
         					url:usercontextpath+"/serialnumber/toUpdateSerialNumber.page",
         					params:{
         						"sn":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
