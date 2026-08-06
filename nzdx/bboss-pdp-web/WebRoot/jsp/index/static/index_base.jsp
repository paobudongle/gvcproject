<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>量化经济分析平台（高校版）</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="量化经济分析平台（高校版）" />
    <meta name="generator" content="量化经济分析平台（高校版）" data-variable=""/>
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/index.css"/>

    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>

</head>
<!--[if lte IE 8]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。</div>
<![endif]-->
<body class="met-navfixed">
<%@ include file="title.jsp" %>

<div class="banner_met_16_1 page-bg" data-height='' style='' m-id='40' m-type='banner'>
    <div class="slick-slide">
        <img class="cover-image" src="${pageContext.request.contextPath}/jsp/index/picture/H3.jpg" srcset='${pageContext.request.contextPath}/jsp/index/picture/H3.jpg 767w,${pageContext.request.contextPath}/jsp/index/picture/H3.jpg' sizes="(max-width: 767px) 767px" alt="" data-height='0|0|0' >
    </div>
</div>
<section class="product_list_met_11_5 text-xs-center"  m-id="5">
    <div class="container">
        <div class="col-lg-12 product-list">
            <div class="main">
                <div class="head">
                    <h2>在线模拟</h2>
                </div>
                <ul class="list">
                    <li>
                        <div class="card">
                            <figure>
                                <a href="javaScript:void(0)" title="全球模型" target=_self  onclick="javaScript:alert('火热建设中...')">
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/index_1.png" alt=""
                                         class="img-fluid">
                                </a>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="javaScript:void(0)" title="全球模型" class="block text-truncate" style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self onclick="javaScript:alert('火热建设中...')">全球模型</a>
                            </h4>
                        </div>
                    </li>
                    <li>
                        <div class="card">
                            <figure>
                               <a href="${pageContext.request.contextPath}/modeljznm/toSimulate.page" title="国家模型" target=_self>
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/index_2.png" alt=""
                                         class="img-fluid">
                                </a>
                                <%--
                                   <a href="avaScript:void(0)" title="国家模型" target=_self onclick="javaScript:alert('火热建设中...')">
                                       <img src="${pageContext.request.contextPath}/jsp/index/picture/index_2.png" alt=""
                                            class="img-fluid">
                                   </a>
                                   --%>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="" title="国家模型" class="block text-truncate " style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self>国家模型</a>
                            </h4>
                        </div>
                    </li>
                    <li>
                        <div class="card">
                            <figure>
                                <a href="javaScript:void(0)" title="区域模型正在建设中....." target=_self  onclick="javaScript:alert('火热建设中...')">
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/index_3.png" alt=""
                                         class="img-fluid">
                                </a>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="javaScript:void(0)" title="区域模型" class="block text-truncate" style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self onclick="javaScript:alert('火热建设中...')">区域模型</a>
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<section class="product_list_met_11_5 text-xs-center"  m-id="5">
    <div class="container">
        <div class="col-lg-12 product-list">
            <div class="main">
                <div class="head">
                    <h2>模型资源</h2>
                </div>
                <ul class="list">
                    <li>
                        <div class="card">
                            <figure>
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=04" title="公共资源" target=_self>
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/jy0.jpg" alt=""
                                         class="img-fluid" style="width:321px;height: 178px">
                                </a>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=04" title="公共资源" class="block text-truncate" style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self>公共资源</a>
                            </h4>
                        </div>
                    </li>
                    <li>
                        <div class="card">
                            <figure>
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=05" title="宏观模型" target=_self>
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/jy1.jpg" alt=""
                                         class="img-fluid" style="width:321px;height: 178px">
                                </a>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=05" title="宏观模型" class="block text-truncate" style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self>宏观模型</a>
                            </h4>
                        </div>
                    </li>
                    <li>
                        <div class="card">
                            <figure>
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=00" title="全球模型" target=_self>
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/jy2.jpg" alt=""
                                         class="img-fluid" style="width:321px;height: 178px">
                                </a>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=00" title="全球模型" class="block text-truncate" style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self>全球模型</a>
                            </h4>
                        </div>
                    </li>
                    <li>
                        <div class="card">
                            <figure>
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=01" title="国家模型" target=_self>
                                    <img src="${pageContext.request.contextPath}/jsp/index/picture/jy3.jpg" alt=""
                                         class="img-fluid" style="width:321px;height: 178px">
                                </a>
                            </figure>
                            <h4 class="card-title m-b-0">
                                <a href="${pageContext.request.contextPath}/modelresource/toResourceIndex.page?blongsModel=01" title="国家模型" class="block text-truncate" style="color: #ff6600;font-size:18px;font-weight: 600;" target=_self>国家模型</a>
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<section class="team_list_met_11_4 " m-id="7">
    <div class="team-bg">
    </div>
    <div class="container ">
        <ul class="list p-0 m-b-0" >
            <li class="item">
                <a href="${pageContext.request.contextPath}/index/toAbout.page?id=1"  target="_blank"  class="head">
                    <img src="${pageContext.request.contextPath}/jsp/index/picture/about.png" alt="关于我们"/>
                </a>
                <div class="content" style="height: 150px;">
                    <p class="title">关于我们</p>
                  <%--  <h3 class="keywords">一个主体，四个作用</h3>--%>
                    <p class="desc" >“促进学术交流，辅助科学决策，创造价值，造福社会。”</p>
                    <a href="${pageContext.request.contextPath}/index/toAbout.page?id=1" target="_blank" class="more">
                        <span>了解详情</span>
                    </a>
                </div>
            </li>

            <li class="item">
                <a href="${pageContext.request.contextPath}/index/toAbout.page?id=2"  target="_blank"  class="head">
                    <img src="${pageContext.request.contextPath}/jsp/index/picture/plant.png" alt="平台介绍"/>
                </a>
                <div class="content" style="height: 150px;">
                    <p class="title">平台介绍</p>
                   <%-- <h3 class="keywords">经济、决策、分析</h3>--%>
                    <p class="desc">量化经济分析平台是一个综合一体化科研决策支持系统</p>
                    <a href="${pageContext.request.contextPath}/index/toAbout.page?id=2" target="_blank" class="more">
                        <span>了解详情</span>
                    </a>
                </div>
            </li>
            <li class="item">
                <a href="${pageContext.request.contextPath}/index/toAbout.page?id=3" target="_blank" class="head">
                    <img src="${pageContext.request.contextPath}/jsp/index/picture/1521616428.jpg" alt="合作共建"/>
                </a>
                <div class="content" style="height: 150px;">
                    <p class="title">合作共建</p>
                 <%--   <h3 class="keywords">一个主体，四个作用</h3>--%>
                    <p class="desc">和勤大数据应用研究院/GTAP/CoPS/英飞咨询/CIMERS...</p>
                    <a href="${pageContext.request.contextPath}/index/toAbout.page?id=3" target="_blank" class="more">
                        <span>了解详情</span>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</section>

<%@ include file="foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/index.js"></script>
</body>
</html>
