<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:查看模型运行界面。
作者:lw
版权:bjxbckj
版本:v1.0
日期:2018-05-18 11:05:34
-->
<pg:beaninfo requestKey="modelRun">
    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal">
        <div class="form-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-2 control-label">模拟名称:</label>

                        <div class="col-md-5">
                            <p class="form-control-static">
                                <pg:cell colName="runName"/>
                            </p>
                        </div>
                        <label class="col-md-2 control-label">运行状态:</label>
                        <div class="col-md-3">
                            <p class="form-control-static">
                                <dict:itemname type="mRunStatus" colName="runStatus"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-2 control-label">数据名称:</label>
                        <div class="col-md-5">
                            <p class="form-control-static">
                                <pg:cell colName="jzTitle"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-2 control-label">模型闭合:</label>
                        <div class="col-md-5">
                            <p class="form-control-static">
                                <pg:equal expression="{colsureType}" value="BookClosure">
                                            标准闭合
                                </pg:equal>
                                <pg:equal expression="{colsureType}" value="ShortClosure">
                                            短期闭合
                                </pg:equal>
                                <pg:equal expression="{colsureType}" value="SelfClosure">
                                            自定义闭合
                                </pg:equal>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-2 control-label">闭合详情:
                        </label>

                        <div class="col-md-10">
                            <p class="form-control-static">
                                    <%--<pg:cell colName="runShorck"/>--%>
                            <pre class="prettyprint linenums">
                                    <pg:cell colName="runColsure"/>
                                </pre>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-2 control-label">因素冲击:
                        </label>

                        <div class="col-md-10">
                            <p class="form-control-static">
                                <pre class="prettyprint linenums">
                                    <pg:cell colName="runShorck"/>
                                </pre>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-2 control-label">创建人:
                        </label>

                        <div class="col-md-5">
                            <p class="form-control-static">
                                <pg:cell colName="userName"/>
                            </p>
                        </div>

                        <label class="col-md-2 control-label">创建时间:
                        </label>

                        <div class="col-md-3">
                            <p class="form-control-static">
                                <pg:cell colName="creatDate" dateformat="yyyy-MM-dd HH:mm:ss"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div style="text-align: center">
                    <button type="button" class="btn green" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </form>
</pg:beaninfo>
