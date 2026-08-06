<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8"%>

<%@ taglib uri="/WEB-INF/tld/admin-taglib.tld" prefix="admin"%>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<!-- BEGIN PAGE LEVEL PLUGINS -->

<link
        href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"
        rel="stylesheet" type="text/css" />



<!-- BEGIN PAGE HEADER-->
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <admin:menuposition />

</div>
<div class="row">
    <div class="col-md-12">
        &nbsp;
        <div class="alert alert-danger  display-hide">
            <button class="close" data-close="alert"></button>
            <span class="msg"> 提示信息区 </span>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3">
        <div class="portlet light bordered">
            <div class="portlet-title tabbable-line">
                <div class="caption">
                    <i class="icon-pin font-yellow-crusta"></i> <span
                        class="caption-subject bold font-yellow-crusta uppercase">
						栏目管理 </span>

                </div>

            </div>
            <div class="portlet-body">
                <div class="scroller" style="height: 450px">
                    <div id="channel_tree"></div>
                    <p></p>
                </div>

            </div>
        </div>

    </div>
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-12">

                <!-- Begin: UserList Datatable  -->
                <%@ include file="/jsp/channel/channelMain.jsp"%>
                <!-- End: UserList Datatable  -->

            </div>
        </div>
    </div>
</div>





<script
        src="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/jstree.min.js"
        type="text/javascript"></script>
<script
        src="${pageContext.request.contextPath}/assets/sysmanager/sysmanager.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->


<script type="text/javascript">
    var usercontextpath = SysChannelManager.usercontextpath();
    jQuery(document).ready(function() {
       // Sysmanager.initorg_tree(true); //  initorg_tree core componets
      //  SysUser.queryUserList('0',false);

        $("#channel_tree").jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                },
                // so that create works
                "check_callback" : true,
                'data' : {
                    'url' : function (node) {
                        return usercontextpath+"/channel/getChildrens.page?pId=0";
                    }/*,
                    'data' : function (node) {
                      return { 'parent' : node.id,'isuser':isuser };
                    }*/
                }
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "lisan":{
                    "icon" : "fa fa-list icon-state-warning icon-lg"
                }
            },
            "plugins" : [   "types" ]
        });

        $('#channel_tree').on('select_node.jstree',function(e,data){
            debugger;
            var domId = data.instance.get_node(data.selected[0]).id;
            var text = data.instance.get_node(data.selected[0]).text;
            $("#pid").val(domId);
            $("#pName").val(text);
            SysChannelManager.queryChannels(true);
        });

        PlatformCommonUtils.initSlimScroll('.scroller', null, true);

    });
</script>

<!-- END CONTENT BODY -->