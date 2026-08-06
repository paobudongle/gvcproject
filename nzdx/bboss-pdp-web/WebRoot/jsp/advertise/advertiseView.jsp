<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>





<!--
描述:查看招聘界面。
作者:lijia
版权:bc
版本:v1.0
日期:2018-05-19 12:05:28
-->
<head>
    <title>招聘详情</title>
</head>

<pg:beaninfo requestKey="advertise">
<div class="rich_media_content " id="js_content">
    <h1 style="font-size: 32px; line-height: 1.5; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
        招聘详情</h1>
    <div class="content f18 h30" style="margin-top: 0px;margin-right: 150px;margin-left: 150px;  padding: 0px; font-size: 18px; line-height: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">
        <dd class="job-advantage" style="outline: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 15px 0px 10px; color: rgb(51, 51, 51); word-wrap: break-word; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, SimSun, Arial, &quot;Helvetica Neue&quot;, Helvetica; font-size: 14px;"><div class="item_con pos_info" style="outline: 0px;text-size-adjust: none;-webkit-tap-highlight-color: rgba(0, 0, 0, 0.05);margin: 0px 0px 0px;padding: 10px 30px 10px;width: 782px;background-image: initial;background-position: initial;background-size: initial;background-repeat: initial;background-attachment: initial;background-origin: initial;background-clip: initial;position: relative;font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, 微软雅黑, arial, Tahoma, SimSun, sans-serif;font-size: 12px;"><div class="pos_base_info" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); margin: 35px 0px 0px; padding: 0px; overflow: hidden;"><span class="pos_title" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); font-size: 30px; color: rgb(46, 52, 59); font-weight: 700; float: left; margin-top: 4px;"><pg:cell colName="advertisePosition"/></span><span class="pos_salary" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); float: right; color: rgb(255, 85, 46); font-size: 36px; font-weight: 700;">${advertise.workWage}<span class="font18" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); font-size: 18px; font-weight: 400; position: relative; top: -2px; left: 0px; margin-left: 8px;">元/月</span></span></div><span class="pos_name" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); line-height: 1; display: inline-block; width: 782px; font-size: 20px; margin-top: 18px; color: rgb(46, 52, 59);">招聘单位：<pg:cell colName="advertiseCompany"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工作地点：<pg:cell colName="workAddress"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<pg:cell colName="releaseDate"/></span> </div><div class="item_con" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); margin: 10px 0px 0px; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, 微软雅黑, arial, Tahoma, SimSun, sans-serif; font-size: 12px;"><div class="subitem_con pos_description" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); margin: 0px 0px 10px; padding: 30px 23px 0px 30px; overflow: hidden;"><h2 class="title" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); margin: 0px 0px 32px; padding: 0px; font-size: 20px; color: rgb(51, 51, 51); font-weight: 600;">职位描述</h2><div class="posDes" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); margin: 0px 0px 32px; padding: 0px; font-size: 14px; color: rgb(46, 52, 59); line-height: 30px; overflow: hidden; "><div class="des" style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05); margin: 0px; padding: 0px;"><br style="outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.05);"><pg:cell colName="advertiseContent"/></div></div></div></div></dd>
    </div>
</div>

</pg:beaninfo>
