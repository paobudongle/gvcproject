<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8"%>

<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin"%>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<!-- BEGIN PAGE LEVEL PLUGINS -->

<link
        href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"
        rel="stylesheet" type="text/css" />
<div class="row">
    <div class="col-md-6">

        <div class="row">
            <div class="col-md-12">
            <form role="form" class="form-horizontal form-queryContent1">
                <input type="hidden" name="crawlId" value="0">
                <div class="col-md-5">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-4 control-label" >标题</label>
                        <div class="col-md-8">
                            <div class="input-icon right">
                                <input type="text" class="form-control  input-xs"
                                       placeholder="内容" name="cmsContent">
                                <div class="form-control-focus"></div>
                                <span class="help-block">请输入标题</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group form-md-line-input">
                        <label class="col-md-4 control-label" >时间</label>
                        <div class="col-md-8">
                            <input type="text" name="releaseDate" id="releaseDate" class="form-control  input-xs date-picker" />
                            <div class="form-control-focus"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group form-md-line-input">
                        <div class="col-md-12">
                            <div class="input-group">
                                <span class="input-group-btn btn-left">
									<button type="button" class="btn btn-xs green-haze btn-queryContent " aria-expanded="false">查询</button>
								</span>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet-body portlet-Contentlist1"></div>
            </div>
        </div>
    </div>
    <div class="col-md-1" style="text-align: center;padding-top: 150px;">
        <div class="row" style="width: 80px">
                    <a class="btn btn-xs blue btn-sentContent" data-target="#stack1" data-toggle="modal" >发布</a>
        </div>
        <div class="row" style="width: 80px;padding-top: 20px;padding-bottom: 20px">
                    <a class="btn btn-xs green btn-backContent">撤回</a>
        </div>
        <div class="row" style="width: 80px">
                    <a class="btn btn-xs red btn-delContent">删除</a>
        </div>

    </div>
    <div class="col-md-5">
        <div class="row" style="padding-top: 45px;">
            <form role="form" class="form-horizontal form-queryContent2">
                <input type="hidden" name="crawlId" value="1">
            </form>
            <div class="col-md-12">
                <div class="portlet-body portlet-Contentlist2"></div>
            </div>
        </div>
    </div>
</div>

<div id="stack1" class="modal fade" tabindex="-1" data-focus-on="input:first">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="stackclose"></button>
        <h4 class="modal-title">请选择栏目</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-md-line-input">
                    <label class="col-md-4 control-label" >栏目<span class="required">*</span></label>
                    <div class="col-md-6">
                        <select class="form-control" name="channelId" id="channelId">
                            <pg:list actual="${channels}">
                                <option value="<pg:cell colName="channelId"/>"><pg:cell colName="title"/></option>
                            </pg:list>
                        </select>
                        <div class="form-control-focus"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn green" onclick="sendReprint()">确定</button>
        </div>
    </div>
</div>

<script type="text/javascript">
    var usercontextpath = "<%=request.getContextPath()%>";

    $(function () {
        queryContents1(true);
        queryContents2(true);

        $('.date-picker').datepicker({
            autoclose : true,
            language : 'zh-CN',
            format : 'yyyy-mm-dd'
        });


        $(".btn-backContent").bind("click", function () {

            var chk_value = [];
            $('.portlet-Contentlist2 input[name="contentId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择要撤回的内容!");
                return;
            }
            PDP.confirm("确定要撤回选中的内容吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/content/deleteBatchContent.page",
                        $.param({
                            "contentIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("内容撤回成功!");
                                queryContents1(true);
                                queryContents2(true);
                                SysContentManager.queryContents(true);
                            } else {
                                PDP.warn("内容撤回失败:" + responseText);
                            }
                        });
                }
            });
        });



        $(".btn-delContent").bind("click", function () {

            var chk_value = [];
            $('.portlet-Contentlist1 input[name="crawlId"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            if (chk_value.length == 0) {
                PDP.warn("请选择左侧要删除的内容!");
                return;
            }
            PDP.confirm("确定要删除选中的内容吗?", function (isConfirm) {
                if (isConfirm) {

                    $.post(usercontextpath + "/content/deleteBatchReprintContent.page",
                        $.param({
                            "crawlIds": chk_value
                        }, true),
                        function (responseText) {
                            if (responseText == "success") {

                                PDP.success("内容删除成功!");
                                queryContents1(true);
                                SysContentManager.queryContents(true);
                            } else {
                                PDP.warn("内容删除失败:" + responseText);
                            }
                        });
                }
            });
        });

    });

    function queryContents1(doquery) {
        $(".portlet-Contentlist1").load(usercontextpath + "/content/queryListInfoReprintContents.page",
            doquery ? $('.form-queryContent1').serialize() : {},
            function () {
            });
    }

    function queryContents2(doquery) {
        $(".portlet-Contentlist2").load(usercontextpath + "/content/queryListInfoReprintContents.page",
            doquery ? $('.form-queryContent2').serialize() : {},
            function () {
            });
    }


    function sendReprint() {
        var chk_value = [];
        $('.portlet-Contentlist1 input[name="crawlId"]:checked').each(function () {
            chk_value.push($(this).val());
        });
        if (chk_value.length == 0) {
            PDP.warn("请选择要发布的内容!");
            return;
        }
          PDP.confirm("确定要发布选中的内容吗?", function (isConfirm) {
              if (isConfirm) {

                  $.post(usercontextpath + "/content/rePrintBatchContent.page",
                      $.param({
                          "crawlIds": chk_value,"channelId":$("#channelId").val()
                      }, true),
                      function (responseText) {
                          if (responseText == "success") {

                              PDP.success("内容发布成功!");
                              queryContents1(true);
                              queryContents2(true);
                              SysContentManager.queryContents(true);
                              $("#stackclose").click();
                          } else {
                              PDP.warn("内容发布失败:" + responseText);
                          }
                      });
              }
          });


    }


</script>

<!-- END CONTENT BODY -->