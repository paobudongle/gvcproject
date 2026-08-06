<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:查看优惠活动界面。
作者:lijia
版权:xxx
版本:v1.0
日期:2018-02-22 16:34:26
-->
<pg:beaninfo requestKey="discounts">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal">
        <div class="form-body">

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">优惠活动名称:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="discountsName"/>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">活动状态:
                        </label>
                        <div class="col-md-9">
                            <p class="form-control-static">
                                <dict:itemname type="activityStatus" colName="discountsStatus" />
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">开始时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="discountsStartTime"/>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">结束时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="discountsEndTime"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">优惠活动描述:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="discountsDesc"/>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">优惠活动规则(SQL):
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="discountsRule"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">&nbsp;
                </div>
            </div>
            <div class="row">
                <div class="col-md-offset-5 col-md-6">
                    <button type="button" class="btn green" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>

    </form>

</pg:beaninfo> 
