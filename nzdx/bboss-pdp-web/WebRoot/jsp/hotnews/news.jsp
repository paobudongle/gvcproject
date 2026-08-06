<%@ page session="false" language="java"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>	
<!-- 
	描述:查看会议管理界面。
	作者:lijia
	版权:bc
	版本:v1.0 
	日期:2018-05-19 12:04:43
-->
<head>
	<title>资讯详情</title>
</head>
<pg:beaninfo requestKey="content">

	<!-- BEGIN FORM-->
	<div class="rich_media_content " id="js_content">
		<h1 style="margin-top: 0px; margin-bottom: 15px; padding: 0px; font-size: 32px; line-height: 1.5; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
			<pg:cell colName="title"/></h1>
		<div class="vel" style="margin: 0px 0px 20px; padding: 0px; font-size: 14px; color: rgb(153, 153, 153); text-align: center; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
			<span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">来源：<pg:cell colName="channelName"/></span>
			<span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">作者：管理员</span>
			<span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">发布时间：<pg:cell colName="releaseDate"/></span>
		</div>

		<div class="content f18 h30" style="margin-top: 30px;margin-right: 150px;margin-left: 150px; padding: 0px; font-size: 18px; line-height: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
			<pg:cell colName="cmsContent"/>
		</div>
	</div>

</pg:beaninfo> 
