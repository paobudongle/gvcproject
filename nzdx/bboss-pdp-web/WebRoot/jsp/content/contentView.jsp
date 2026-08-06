<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:查看内容表界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-03-18 10:26:11
-->
<pg:beaninfo requestKey="content">

   <%-- <pg:cell colName="cmsContent"/>--%>

    <div class="rich_media_content " id="js_content">
        <h1 style="margin-top: 0px; margin-bottom: 15px; padding: 0px; font-size: 32px; line-height: 1.5;
            text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
            <pg:cell colName="title"/></h1>
        <div class="vel"
             style="margin: 0px 0px 20px; padding: 0px; font-size: 14px; color: rgb(153, 153, 153); text-align: center; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
            <span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">发布时间：<pg:cell colName="releaseDate"/></span>
            <span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">来源：<pg:cell colName="channelName"/></span>
            <span class="pr10 pl10" style="margin: 0px; padding: 0px 10px;">编辑：admin</span>
        </div>
        <div class="description"
             style="margin: 0px 0px 10px; padding: 25px 15px 15px; line-height: 28px;
             font-size: 16px; color: rgb(102, 102, 102); border: 1px solid rgb(233, 233, 233);
             position: relative; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
            <span style="margin: 0px; padding: 1px 15px; background-color: rgb(204, 0, 1); color: rgb(255, 255, 255); font-size: 14px; position: absolute; left: 15px; top: -15px;">导读提示</span>
            <pg:cell colName="description"  />
        </div>
        <div class="content f18 h30"
             style="margin: 0px; padding: 0px; font-size: 18px; line-height: 30px; color: rgb(85, 85, 85);
             font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
            <pg:cell colName="cmsContent"/>
        </div>
    </div>

</pg:beaninfo> 
