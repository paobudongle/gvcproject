<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!--
描述:查看序列号界面。
作者:lijia
版权:xx
版本:v1.0
日期:2018-02-23 09:05:22
-->
<pg:beaninfo requestKey="serialNumber">

    <!-- BEGIN FORM-->
    <form action="#" class="form-horizontal">
        <div class="form-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">序列号:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="sn"/>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">状态:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <dict:itemname type="activateStatus" colName="activateStatus" />
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">订单号:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="orderId"/>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">用户:
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
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">有效结束时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="validEndTime"/>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label class="col-md-3 control-label">有效开始时间:
                        </label>

                        <div class="col-md-9">
                            <p class="form-control-static">
                                <pg:cell colName="validStartTime"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-5 col-md-6">
                    <button type="button" class="btn green" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>

    </form>

</pg:beaninfo> 
