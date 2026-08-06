<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>


<!DOCTYPE html>
<html>
<head>
    <title>量化经济分析平台</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <%@ include file="../index/front_head.jsp" %>
    <meta name="description" content="" />
    <meta name="keywords" content="量化经济分析平台" />
    <meta name="generator" content="量化经济分析平台" data-variable=""/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/modelresource/${pageContext.request.contextPath}/jsp/modelresource/static/css/content_toolbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/modelresource/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/modelresource/static/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/modelresource/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/modelresource/static/css/download_new.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/news.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/static/css/common_sync.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/static/css/cleft.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/static/css/course.css" />

    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/></head>

<body class="met-navfixed">
<div class="site-page-wrap">
<%@ include file="../index/title.jsp" %>
<div class="site-page-main">
<div class="meeting_main">
    <div class="container clearfix csdn_dl_bread">
        <div class="row">
            <div class="col-md-12">
                <%--<a href="/">资源中心</a>&nbsp;>&nbsp;
                <a href="/c-16">开发技术</a>&nbsp;>&nbsp;
                <a href="/c-16014">其它</a>&nbsp;>&nbsp;I/O口控制实验--%>
            </div>
        </div>
    </div>
    <div class="download_new clearfix">
        <div class="download_l fl" id="detail_down_l">
            <div class="download_top" id="download_top" data-id="10773284">
                <div class="download_top_wrap clearfix">
                    <div class="download_top_t">
                        <dl class="download_dl">
                            <dt><img src="${pageContext.request.contextPath}/jsp/modelresource/static/picture/${modelResource.suffix}.svg">
                                <%--<div class="star_box">
                                    <i class="fa fa-star yellow"></i>
                                    <em>0分</em>
                                </div>--%>
                                <i class="user_grade"></i>
                            </dt>
                            <dd>
                                <h3 title='${modelResource.sourceName}'>
                                    <span>${modelResource.sourceName}</span>
                                </h3>

                                <div class="download_b">
                                    <span class="pre_description">${modelResource.description}</span>
                                </div>

                                <div class="dl_b">
                                    <strong class="size_box">
                                        <span>${modelResource.updateDate}上传</span><span>大小：<em>${modelResource.fileSize}</em></span>
                                    </strong>
                                </div>

                            </dd>
                        </dl>
                    </div>

                </div>


                <div class="dl_download dl_pdf clearfix">
                    <div class="dl_download_box dl_download_l">
                        <c:if test="${modelResource.suffix != 'mp4'}">
                            <a onclick="downCount()" href="${modelResource.soucrePath}" class="direct_download" download="${modelResource.sourceName}.${modelResource.suffix}"  target="_self" data-bind-login="true">立即下载</a>
                        </c:if>
                        <c:if test="${modelResource.suffix == 'mp4'}">
                            <a href="${pageContext.request.contextPath}/index/playVideo.page?id=${modelResource.id}" target="_blank"  class="open_vip"><span>在线观看</span></a>
                        </c:if>


                    </div>
                </div>
            </div>

            <!--评论 无评论不显示评论模块-->
            <!--  无评论，当前用户无下载 则不显示 -->
            <div class="comment_model">
                <div id="comment" class="dl_comm clearfix" >
                    <h3 class="comment_t">
                        <strong>评论</strong>
                        <span>共${size}条</span>
                    </h3>
                    <div class="comm_t">
                        <!--页码-->
                    </div>
                    <div class="comm_b comm_b_cur">
                        <div class="comm_b_r clearfix">
                            <div class="comm_b_t clearfix">
                                <ul id="csdn_dl_commentbox" class="comment_stars">
                                    <li class="tit">评分：</li>
                                    <input class="star" id="star" name="star" value="0" type="hidden">
                                    <input  id="resourceId" name="resourceId" value="${modelResource.id}" type="hidden">
                                    <input  id="commentUser" name="commentUser" value="${userName}" type="hidden">
                                    <input  id="isComment" name="isComment" value="${isComment}" type="hidden">
                                    <li class="stats">
                                        <i aria-hidden="true" id="starpf1" onclick="setStar('1')" class="fa fa-star ffs"></i>
                                        <i aria-hidden="true" id="starpf2" onclick="setStar('2')" class="fa fa-star ffs"></i>
                                        <i aria-hidden="true" id="starpf3" onclick="setStar('3')" class="fa fa-star ffs"></i>
                                        <i aria-hidden="true" id="starpf4" onclick="setStar('4')" class="fa fa-star ffs"></i>
                                        <i aria-hidden="true" id="starpf5" onclick="setStar('5')" class="fa fa-star ffs"></i>
                                    </li>
                                </ul>
                                <div class="dl_comm_tip">一个资源可评论一次，评论内容不能少于5个字</div>
                            </div>
                            <div class="comm_b_b clearfix">
                                <textarea class="comm_text open" id="cc_body" placeholder="不少于5个字"></textarea>
                                <button class="comm_btn" onclick="postComment();">发表</button>
                            </div>
                        </div>
                    </div>
                </div>                </div>
            <!--相关推荐-->
            <div class="mod_similar clearfix" id="mod_recom">

                <div class="dl_wrap dl_reco" style="margin-top: 0">
                    <div class="album_detail_wrap" id="album_detail_wrap">
                       <c:forEach var="bean" items="${commentList}" >
                            <dl class="album_detail_list clearfix">
                            <dt>

                                <img src="${pageContext.request.contextPath}/jsp/modelresource/static/picture/default.jpg"/>

                            </dt>
                            <dd>
                                    ${bean.comment}
                                <a class="dl_block_a" href="javascript:;" target="_blank">
                                    <div class="album_detail_bot clearfix">
                                        <label class="score_box">
                                            <i aria-hidden="true" id="${bean.id}_0" class="fa fa-star"></i>
                                            <i aria-hidden="true" id="${bean.id}_1" class="fa fa-star"></i>
                                            <i aria-hidden="true" id="${bean.id}_2" class="fa fa-star"></i>
                                            <i aria-hidden="true" id="${bean.id}_3" class="fa fa-star"></i>
                                            <i aria-hidden="true" id="${bean.id}_4" class="fa fa-star"></i>
                                        </label>
                                        <strong><em>${bean.commentUser}</em></strong>
                                        <label>
                                            <span>时间：</span>
                                            <em class="upl_time">${bean.commentDate}</em>
                                        </label>
                                    </div>
                                    <script>
                                        var star = '${bean.star}';
                                        for (var i=0;i<star;i++)
                                        {
                                            $("#${bean.id}_"+i).addClass("yellow");
                                        }
                                    </script>
                                </a>
                            </dd>
                        </dl>
                       </c:forEach>

                        <div class="dl_more" style="font-size:14px; color:red; text-align:center;padding-top:10px; display:none;">上滑加载更多</div>
                    </div>
                </div>



            </div>
        </div>
        <div class="download_r fr">
            <div class="dl_right_fixed">
                <div class="mod_personal" data-mod="popu_53">
                    <dl class="personal_wrap" id="personal_wrap">
                        <dt><a target="_blank" href="http://my.csdn.net/qq422055403">
                            <img src="${pageContext.request.contextPath}/jsp/modelresource/static/picture/default.jpg" alt="img"
                                 class="head"></a>
                            <span class="vip vip_l vip_l_single"></span>
                        </dt>
                        <dd>

                            <a href="javascript:;" target="_blank" class="name">
                                ${modelResource.uploadUser}
                            </a>
                            <p>
                                <img style="margin: 0;" src="${pageContext.request.contextPath}/jsp/modelresource/static/picture/down1.png" alt=""></span>
                            </p>

                            <%--<div class="mod_person_r">
                                <p>
                                    <span class="attention_btn attention">关注</span>
                                </p>
                                <div class="check_all" style="text-align: center;">
                                    <a href="/user/qq422055403/uploads" target="_blank" class="check_all_btn" >
                                        查看TA的资源
                                    </a>
                                </div>
                            </div>--%>
                        </dd>
                    </dl>
                </div>


                <div class="dl_mar dl_mar_b" id="74">

                    <div id="kp_box_392" data-pid="74" data-track-view='{"mod":"kp_popu_392","con":",,"}'>
                        <div style="width:300px;height:250px;margin:0 auto;position:relative;overflow:hidden;">
                            <pg:beaninfo requestKey="modelResource">
                                <pg:equal colName="parentId" value="0">
                                    <img src="${pageContext.request.contextPath}/modelResource/<pg:cell colName="id"/>/icon.jpg" width="300" height="250">
                                </pg:equal>

                                <pg:notequal colName="parentId" value="0">
                                    <img src="${pageContext.request.contextPath}/modelResource/<pg:cell colName="parentId"/>/icon.jpg" width="300" height="250">
                                </pg:notequal>
                            </pg:beaninfo>
                        </div>
                    </div>
                    <script>$(function(){csdn.track.viewCheck($("#kp_box_392"));});</script>
                </div>

                <!--热点文章开始  2018.09.14-->
                <div class="dl_left_box ">
                    <h3 class="dl_new_tit">
                        <span class="line"></span><span class="txt">热点资源</span>
                    </h3>
                    <div class="dl_company">
                        <ul class="hot_arti_list">
                            <c:forEach var="bean" items="${hotList}" >
                                <li>
                                <h4><a class="article_t" href="${pageContext.request.contextPath}/modelresource/toResourceShow.page?id=${bean.id}" target="_self">${bean.sourceName}</a></h4>
                                <div class="hot_arti_b">
                              <%--      <label>
                                        <svg id="choose_svg" class="common_icon" aria-hidden="true">
                                            <use xlink:href="#csdnc-m-passwords-visible"></use>
                                        </svg>
                                        <i>下载:${bean.downloadCount}</i>
                                    </label>--%>
                                    <span>${bean.description}</span>
                                    <em>${bean.uploadUser}</em>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <!--热点文章结束  2018.09.14-->

            </div>


        </div>

    </div>

</div>
</div><!-- site-page-main -->
<%@ include file="../index/foot.jsp" %>
</script>
</script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script>
    function setStar(star) {
        $("#star").val(star);
        $(".ffs").removeClass("yellow");
        for (var i=1;i<=star;i++)
        {
            $("#starpf"+i).addClass("yellow");
        }
    }


    function downCount() {
        var resourceId = $("#resourceId").val();
        $.post("${pageContext.request.contextPath}/modelresource/downCount.page",{"resourceId":resourceId});
    }
    function postComment() {

       debugger;
        var comment = $("#cc_body").val();
        var star = $("#star").val();
        var resourceId = $("#resourceId").val();
        var isComment = $("#isComment").val();

        if(comment.length < 5) {
            PlatformCommonUtils.warn("不少于5个字!");
            return;
        }

        if(star == 0) {
            PlatformCommonUtils.warn("请评分!");
            return;
        }

        if(isComment == 1) {
            PlatformCommonUtils.warn("资源只能评论一次!");
            return;
        }

       $.post("${pageContext.request.contextPath}/modelresource/addResourceComment.page", {"comment": comment, "star": star,"resourceId":resourceId},
            function(data){
                if(data == "success") {
                    PlatformCommonUtils.warn("发表成功!");
                    window.setTimeout(function () {
                        window.location.reload();
                    }, 1500);

                }else {
                    PlatformCommonUtils.warn("发表失败!");
                }
            });
    }
</script>

</div><!-- site-page-wrap -->


</body>
</html>

