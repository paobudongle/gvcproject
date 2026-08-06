<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:问题主表列表界面。
	作者:lijia
	版权:xbc
	版本:v1.0 
	日期:2019-06-22 14:10:54
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-Questionlist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-Questionlist .checkboxall','.table-Questionlist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th ><pg:message code="question.qId"/></th>
	       		

	       		<th ><pg:message code="question.answerCount"/></th>
	       		

	       		<th ><pg:message code="question.qContent"/></th>
	       		

	       		<th ><pg:message code="question.qTime"/></th>
	       		

	       		<th ><pg:message code="question.qTitle"/></th>
	       		

	       		<th ><pg:message code="question.userId"/></th>
	       		

	       		<th ><pg:message code="question.userName"/></th>
	       		

	       		<th ><pg:message code="question.viewCount"/></th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="questions">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="qId" type="checkbox" class="checkone" onClick="checkOne('.table-Questionlist .checkboxall','.table-Questionlist .checkone')" value="<pg:cell colName="qId"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="qId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="answerCount"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="qContent"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="qTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="qTitle"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="userId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="userName"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="viewCount"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewQuestion" data='<pg:cell colName="qId"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editQuestion" data='<pg:cell colName="qId"  />' >
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
			$(".table-Questionlist .btn-viewQuestion").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看问题主表信息",
	         					showfooter:false,
	         					url:usercontextpath+"/jsp/question/getQuestion.page",
	         					params:{
	         						"qId":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-Questionlist .btn-editQuestion").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改问题主表信息",
         					showfooter:false,
         					url:usercontextpath+"/jsp/question/toUpdateQuestion.page",
         					params:{
         						"qId":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
