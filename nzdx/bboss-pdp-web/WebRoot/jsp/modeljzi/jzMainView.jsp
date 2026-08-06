<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:查看模型数据加总界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
-->
<pg:beaninfo requestKey="jzMain">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal">
        <div class="form-body">
            <input id="jzId" name="jzId" type="hidden" value="<pg:cell colName="jzId"    />"/>
            <input id="lastModifyDate" name="lastModifyDate" type="hidden"
                   value="<pg:cell colName="lastModifyDate"    />"/>
            <input id="outputDir" name="outputDir" type="hidden" value="<pg:cell colName="outputDir"    />"/>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-1 control-label"">数据名称:</label>

                        <div class="col-md-11">
                            <p class="form-control-static">
                                <pg:cell colName="jzTitle"/>
                            </p>
                        </div>
                    </div>
                </div>





            </div>

            <pg:case colName="jzType">

                <pg:equal value="1">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group ">
                                <label class="col-md-3 control-label"">数据类型:
                                </label>
                                <div class="col-md-9">
                                    <p class="form-control-static">
                                        <dict:itemname type="jzType" colName="jzType"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group ">
                                <label class="col-md-3 control-label"">文件名称:
                                </label>
                                <div class="col-md-9">
                                    <p class="form-control-static">
                                        <pg:cell colName="jzOglname"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </pg:equal>
            </pg:case>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">数据状态:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <dict:itemname type="jzStatus" colName="jzStatus"/>
                            </p>
                        </div>
                    </div>
                </div>



                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">创建时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="creatDate"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">创建人:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="userName"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-1 control-label"">备注:
                        </label>

                        <div class="col-md-11">
                            <p class="form-control-static">
                                <pg:cell colName="remark"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group ">
                        <label class="col-md-1 control-label">加总日志:
                        </label>

                        <div class="col-md-11">
                            <p class="form-control-static">
                            <pre class="prettyprint linenums">
                                <pg:cell colName="aggLog"/>
                            </pre>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button type="button" class="btn green" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>

    </form>

</pg:beaninfo> 
