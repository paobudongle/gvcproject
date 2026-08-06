<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:查看栏目管理界面。
作者:lijia
版权:bxckj
版本:v1.0
日期:2018-02-26 21:15:12
-->
<pg:beaninfo requestKey="channel">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal">
        <div class="form-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">ID:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="channelId"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">创建时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="createDate"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">创建人:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="creater"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">删除标识:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="delFlag"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">描述:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="description"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">是否有内容:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="hasContent"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">是否在新页面打开:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="isBlankOpen"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">是否显示:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="isDisplay"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">关键词:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="keywrods"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">修改人:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="lastModifier"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">修改时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="lastModifyDate"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">排序号:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="orderNo"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">父ID:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="pid"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">简要标题:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="sortTitle"/>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">标题:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="title"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label"">内容模板:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="tplContent"/>
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
