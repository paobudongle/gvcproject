<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!-- 
	描述:考核报告列表界面。
	作者:lijia
	版权:bxt
	版本:v1.0 
	日期:2019-10-26 16:43:47
-->
<div class="table-scrollable">
<table	class="table table-bordered table-striped table-condensed table-ExaminationReportlist" >
<thead >
	       <tr>
	            <th width="2%"><input type="checkbox" class="checkboxall" onClick="checkAll('.table-ExaminationReportlist .checkboxall','.table-ExaminationReportlist .checkone')"/>
								</th>
				<th width="2%">序号</th>				

	       		<th >实验ID</th>
	       		

	       		<th >耗时（分钟）</th>
	       		

	       		<th >对抗国A</th>
	       		

	       		<th ></th>
	       		

	       		<th >两个对抗国：中国-美国</th>
	       		

	       		<th ></th>
	       		

	       		<th >实验名称</th>
	       		

	       		<th >00:进行中；05：实验完成</th>
	       		

	       		<th >所属组ID</th>
	       		

	       		<th ></th>
	       		

	       		<th ></th>
	       		

	       		<th ></th>
	       		

	       		<th >所属队ID</th>
	       		

	       		<th >得分</th>
	       		
				<th width="10%">操作</th>
	       	</tr>	
	       	</thead >
	       	<tbody>
	      <pg:list requestKey="examinationReports">
	
	   		 
	
	   		<tr >
	   				<td><input
						name="experId" type="checkbox" class="checkone" onClick="checkOne('.table-ExaminationReportlist .checkboxall','.table-ExaminationReportlist .checkone')" value="<pg:cell colName="experId"    />" 
						/>
					</td>
	   		        
	                <td><pg:rowid increament="1" offset="false"/></td>    
	                <td>
						 		                									<pg:cell colName="experId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="costTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="countryA"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="countryAb"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="countryB"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="endTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="experName"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="experState"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="groupId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="operatSocre"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="remark"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="startTime"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="teamId"  />
																					
					</td>
	                <td>
						 		                									<pg:cell colName="totalSocre"  />
																					
					</td>
	        		
	                <td nowrap>
	                <a class="btn btn-xs blue btn-viewExaminationReport" data='<pg:cell colName="experId"  />' > 查看 </a>
					<a class="btn btn-xs red btn-editExaminationReport" data='<pg:cell colName="experId"  />' >
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
			$(".table-ExaminationReportlist .btn-viewExaminationReport").bind('click',function(){
					var data = $(this).attr("data");
                   	 
                   	 ModelDialog.dialog({
	         					title:"查看考核报告信息",
	         					showfooter:false,
	         					url:usercontextpath+"/jsp/examinationreport/getExaminationReport.page",
	         					params:{
	         						"experId":data
	         				      },
	         					width:"1024px",
	         					height:"768px"

	         	         });
			});
			$(".table-ExaminationReportlist .btn-editExaminationReport").bind('click',function(){
					var data = $(this).attr("data");             	 
                   	 
                	 ModelDialog.dialog({
         					title:"修改考核报告信息",
         					showfooter:false,
         					url:usercontextpath+"/jsp/examinationreport/toUpdateExaminationReport.page",
         					params:{
         						"experId":data
         				      },
         					width:"1024px",
         					height:"768px"

         	         });
			});			
		});		
</script>	
