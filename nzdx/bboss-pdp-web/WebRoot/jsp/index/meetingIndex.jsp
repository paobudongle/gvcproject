<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>行业信息</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <%@ include file="front_head.jsp" %>
    <meta name="description" content="平台服务主要包括提供量化经济分析平台、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持" />
    <meta name="keywords" content="量化经济分析平台" />
    <meta name="generator" content="量化经济分析平台" data-variable=""/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/news.css"/>
    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
</script>
</head>
<!--[if lte IE 8]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。</div>
<![endif]-->

<body>
<div class="site-page-wrap">
<%@ include file="title.jsp" %>
<div class="site-page-main">

<main class="news_list_page_met_16_3 met-news">
    <div class="container">
        <div class="row">
            <div class="col-md-9 met-news-body     ">
                <ol class="breadcrumb m-b-0 subcolumn-crumbs">
                    <li class='breadcrumb-item'>
                        <a href="/" title="网站首页" class='icon wb-home'>网站首页</a>
                    </li>
                    <li class='breadcrumb-item'>
                        <a href="${pageContext.request.contextPath}/index/toMeetingIndex.page" title="行业信息" class=''>行业信息</a>
                    </li>
                    <li class='breadcrumb-item'>
                        <a href="${pageContext.request.contextPath}/index/toMeetingIndex.page" title="会议信息" class=''>会议信息</a>
                    </li>
                </ol>
                <div class="met-news-list">
                    <ul class="ulstyle met-pager-ajax imagesize" data-scale='400x400' m-id='10'>

                        <c:forEach items="${meetingList.datas}" var="meeting">
                            <!-- 极简模式 -->
                            <li class='border-bottom1'>
                                <h4>
                                    <a href="<%=request.getContextPath()%>/index/toMeeting.page?meetingId=${meeting.meetingId}" title="${meeting.title}" target="_blank">${meeting.title}</a>
                                    <span style="float:right;">会议时间:${meeting.meetingStartData}至${meeting.meetingEndData}</span>
                                </h4>
                                    <%--<p class="des font-weight-300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4月24日，我集团与浙江众安建设集团有限公司签署了战略合作协议，我集团董事长兼总裁单玉川、党总支书记兼副总裁陈呈频、副总裁兼工程建设管理有限公司总经理应义淼，众安建设集团董事长周世安、副董事长倪允扬、总工华国斌等领导出席了签约仪式。 根据协议内容，双方将携手推进“新体系、新技术、新材料、新工艺”的应用与</p>--%>
                                <p class="info font-weight-300">
                                    <span>主办单位:${meeting.organizer}</span>
                                    <span></span>
                                    <span >地点:${meeting.meetingAddress}</span>
                                    <span></span>
                                    <span style="float:right;">发布时间:${meeting.releaseDate}</span>
                                </p>
                            </li>

                        </c:forEach>
                    </ul>
                    <div class='m-t-20 text-xs-center hidden-sm-down' m-type="nosysdata">


                        <div class='met_pager'>

                            <c:if test="${totalPage > 0}">
                                <c:if test="${currentPage == 1}">
                                    <span class='PreSpan'>上一页</span>
                                </c:if>
                                <c:if test="${currentPage != 1}">
                                    <a href="${pageContext.request.contextPath}/index/toMeetingIndex.page?offset=${prePage}&currentPage=${currentPage - 1}" class="PreA">上一页</a>
                                </c:if>

                                <c:forEach var="nums" begin="1" end="${totalPage > pagesize ? pagesize : totalPage}" step="1">
                                    <a <c:if test="${nums == currentPage}">
                                        class='Ahover'
                                    </c:if>
                                            href='${pageContext.request.contextPath}/index/toMeetingIndex.page?offset=${(nums-1) * pagesize}&currentPage=${nums}' >${nums}</a>

                                </c:forEach>

                                <c:if test="${currentPage != totalPage}">
                                    <a href='${pageContext.request.contextPath}/index/toMeetingIndex.page?offset=${nextPage}&currentPage=${currentPage + 1}' class='NextA'>下一页</a>
                                </c:if>

                                <c:if test="${currentPage == totalPage}">
                                    <span class="NextSpan">下一页</span>
                                </c:if>

                                <span class='PageText'>转至第</span>
                                <input type='text' id='metPageT' data-pageurl='' value='1' />
                                <input type='button' id='metPageB' value='页' />

                            </c:if>

                        </div>
                    </div>
                    <div class="met_pager met-pager-ajax-link hidden-md-up" data-plugin="appear" data-animate="slide-bottom" data-repeat="false" m-type="nosysdata">
                        <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn" data-plugin="ladda" data-style="slide-left" data-url="" data-page="1">
                            <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>加载更多</button>
                    </div>
                </div>
            </div>



            <div class="col-md-3">
                <div class="row">
                    <aside class="sidebar_met_16_1 met-sidebar panel panel-body m-b-0" boxmh-h m-id='35' m-type='nocontent'>
                        <form class='sidebar-search' method='get' action="${pageContext.request.contextPath}/index/toMeetingIndex.page">
                            <input type='hidden' name='lang' value='cn' />
                            <input type='hidden' name='class1' value='1' />
                            <div class="form-group">
                                <div class="input-search">
                                    <button type="submit" class="input-search-btn">
                                        <i class="icon wb-search" aria-hidden="true"></i>
                                    </button>
                                    <input type="text" class="form-control" name="searchword" value="${searchword}" placeholder="关键字">
                                </div>
                            </div>
                        </form>
                        <ul class="sidebar-column list-icons">
                            <li>
                                <a href="${pageContext.request.contextPath}/index/toMeetingIndex.page" title="会议信息" class='active'>会议信息</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/index/toAdvertiseIndex.page" title="招聘信息" class=''>招聘信息</a>
                            </li>
                        </ul>
                     <%--   <div class="sidebar-news-list recommend">
                            <h3 class='font-size-16 m-0'>为你推荐</h3>
                            <ul class="list-group list-group-bordered m-t-10 m-b-0">
                                <li class="list-group-item">
                                    <a href="https://show.metinfo.cn/m/mui082/357/news/shownews.php?id=39" title="我集团与浙江众安建设集团有限公司签署战略合作协议" target=_self>我集团与浙江众安建设集团有限公司签署战略合作协议</a>
                                </li>
                            </ul>
                        </div>--%>
                    </aside>
                </div>
            </div>
        </div>
    </div>
</main>
</div><!-- site-page-main -->
<%@ include file="foot.jsp" %>
</script>
</script>
</div><!-- site-page-wrap -->

</body>
</html>