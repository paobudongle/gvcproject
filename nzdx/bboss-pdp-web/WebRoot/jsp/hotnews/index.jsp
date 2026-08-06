<%--
  Created by IntelliJ IDEA.
  User: Any
  Date: 2018/3/25
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>热点资讯</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="/jsp/hotnews/css/index.css">
    <script src="/jsp/hotnews/js/hm.js?3093c14f1afee2b787e9a4a405bdcfd5"></script>
    <script src="/jsp/hotnews/js/jquery.min.js"></script>
    <script src="/jsp/hotnews/js/common.js"></script>
</head>
<body>
<div class="header">
    <div class="w1200 clearfix">
        <a href="javascript:void(0)" class="logo"><i class="icon-logo"></i></a>
        <ul class="fl nav">
            <li><a href="javascript:void(0)" onclick="toHostNews('1')">最新热点</a></li>
            <c:forEach var="bean" items="${channels}">
                <li><a href="javascript:void(0)" onclick="toHostNews('${bean.channelId}')">${bean.title}</a></li>
            </c:forEach>
        </ul>
        <%--<div class="fr mr10 search">
            <input type="text" placeholder="">
            <button type="submit"><i class="icon icon-top-search"></i></button>

        </div>--%>
    </div>
</div>

<input type="hidden" id="channelId" name="channelId" value="${conditions.channelId}"/>

<div class="w1200 pb30">
    <ul class="pt15 list-img-4 clearfix" id="ul_content">

        <c:forEach var="bean" items="${hostNewsList.datas}">
                <li>
                    <div>
                        <a href="<%=request.getContextPath()%>/index/toNews.page?contentId=${bean.contentId}&channelName=${bean.channelName}"  target="_blank">
                            <span><img src="${bean.indexImg}" alt="" width="288px"></span>
                            <b>${bean.title}</b>
                        </a>
                        <p>
                            <span><a href="javascript:void(0)" onclick="toHostNews('${bean.channelId}')">${bean.channelName}</a></span>
                            <i>${bean.releaseDate}</i>
                        </p>
                    </div>
                </li>
        </c:forEach>

    </ul>
    <!--翻页-->
    <div class="page" id="pages">
        <c:if test="${totalPage > 0}">
        <ul >
              <li id="bt_index" style="display: none" ><a href="javascript:void(0)" onclick="toPage(1)">首页</a></li>
              <li id="bt_pre" style="display: none"  ><a href="javascript:void(0)" onclick="toPage('pre')">上一页</a></li>
            <c:forEach var="nums" begin="1" end="${totalPage > 12 ? 12 : totalPage}" step="1">
             <li id="li_${nums}"
                     <c:if test="${nums == 1}">
                        class="thisclass"
                     </c:if>
                >
                 <a href="javascript:void(0)" onclick="toPage('${nums}')">${nums}</a></li>

            </c:forEach>
            <c:if test="${totalPage > 1}">
              <li id="bt_next"><a href="javascript:void(0)" onclick="toPage('next')">下一页</a></li>
              <li id="bt_end"><a href="javascript:void(0)" onclick="toPage('${totalPage}')">末页</a></li>
            </c:if>
        </ul>
        </c:if>
    </div>
    <!--#翻页-->
</div>



<div class="pt30 footer">
    <div class="footer-txt">
        Copyright ©  版权所有 All Rights Reserved
    </div>
</div>
<script>
    var usercontextpath = "<%=request.getContextPath()%>";
    var currentPage = 1;
    var offset = 0;
    var pagesize = 12;
    var totalPage = '${totalPage}';


    function toPage(type) {
        if(type =="next") {
            $("#li_"+currentPage).removeClass("thisclass");
            offset = pagesize * currentPage;
            currentPage = Number(currentPage) + 1;
            $.post(usercontextpath + "/content/queryListInfoHostNews.page", {"channelId": $("#channelId").val(),"offset":offset,"pagesize":pagesize},
                function(data){
                    showContent(data);
                    showButton();
                    if((Number(currentPage)) % pagesize == 1) {
                        for(var i = 1;i<currentPage+1;i++) {
                            $("#li_"+i).remove();
                        }
                        for(var i = currentPage;i < currentPage + pagesize;i++) {
                            if(i == currentPage) {
                                $("#bt_next").before('<li id="li_'+i+'"  class="thisclass" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                            }else {
                                $("#bt_next").before('<li id="li_'+i+'" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                            }
                        }
                    }else {
                        $("#li_"+currentPage).addClass("thisclass");

                    }
                }, "json");
        }else if(type =="pre") {
            $("#li_"+currentPage).removeClass("thisclass");
            offset = pagesize * Number(currentPage) -2;
            currentPage = Number(currentPage) - 1;
            $.post(usercontextpath + "/content/queryListInfoHostNews.page", {"channelId": $("#channelId").val(),"offset":offset,"pagesize":pagesize},
                function(data){
                    showContent(data);
                    showButton();
                    if((Number(currentPage)) % pagesize == 0) {
                        for(var i = currentPage + pagesize;i>currentPage;i--) {
                            $("#li_"+i).remove();
                        }
                        for(var i = currentPage - pagesize + 1 ;i<=currentPage;i++) {
                            if(i == currentPage) {
                                $("#bt_next").before('<li id="li_'+i+'"  class="thisclass" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                            }else {
                                $("#bt_next").before('<li id="li_'+i+'" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                            }
                        }
                    }else {
                        $("#li_"+currentPage).addClass("thisclass");

                    }
                }, "json");
        }else {
            if(currentPage != type) {
                $("#li_"+currentPage).removeClass("thisclass");
                currentPage = type;
                offset = pagesize * (Number(type) - 1);
                $.post(usercontextpath + "/content/queryListInfoHostNews.page", {"channelId": $("#channelId").val(),"offset":offset,"pagesize":pagesize},
                    function(data){
                        showContent(data);
                        showButton();

                        if(totalPage == currentPage) {
                            for(var i = 1;i<=currentPage;i++) {
                                $("#li_"+i).remove();
                            }
                            for(var i = currentPage - pagesize +1 ;i<= currentPage;i++) {
                               if(i > 0 ) {
                                   if(i == currentPage) {
                                       $("#bt_next").before('<li id="li_'+i+'"  class="thisclass" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                                   }else {
                                       $("#bt_next").before('<li id="li_'+i+'" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                                   }
                               }

                            }
                            $("#li_"+currentPage).addClass("thisclass");
                        }else if(currentPage == 1){
                            for(var i = 1;i<=totalPage;i++) {
                                $("#li_"+i).remove();
                            }

                            var n = (currentPage + Number(totalPage)) > pagesize ? pagesize : (currentPage + Number(totalPage));

                            for(var i = 1 ;i<n ;i++) {
                                if(i > 0 ) {
                                    if(i == currentPage) {
                                        $("#bt_next").before('<li id="li_'+i+'"  class="thisclass" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                                    }else {
                                        $("#bt_next").before('<li id="li_'+i+'" ><a href="javascript:void(0)" onclick="toPage('+i+')">'+i+'</a></li>');
                                    }
                                }

                            }
                            $("#li_"+currentPage).addClass("thisclass");
                        }else {
                            $("#li_"+currentPage).addClass("thisclass");
                        }

                    }, "json");
            }
        }

    }


    function showContent(data) {
        $("#ul_content").html("");
        $.each(data.datas, function (index, tx) {
            var url = usercontextpath + "/content/toNews.page?contentId="+tx.contentId+"&channelName="+tx.channelName;
            $("#ul_content").append('<li><div><a href="'+url+'" target="_blank"><span><img src="'+tx.indexImg+'" alt="" width="288px"></span><b>'+tx.title+'</b></a><p><span><a href="javascript:void(0)" onclick="toHostNews(\''+tx.channelId+'\')">'+tx.channelName+'</a></span><i>'+tx.releaseDate+'</i></p></div></li>');
        });



    }


    function toHostNews(channelId){
        window.location.href = usercontextpath + "/index/toHostNews.page?channelId="+channelId
    }

   function showButton() {
       if(currentPage == 1) {
           $("#bt_index").hide();
           $("#bt_pre").hide();
       }else{
           $("#bt_index").show();
           $("#bt_pre").show();
       }

       if(currentPage == totalPage) {
           $("#bt_next").hide();
           $("#bt_end").hide();
       }else {
           $("#bt_next").show();
           $("#bt_end").show();
       }
   }
   
   function toNews(contentId,channelName) {
        debugger

      // $(this).attr("target", "_blank");
      // $(this).attr("href", url);
       window.location.href = usercontextpath + "/index/toNews.page?contentId="+contentId
   }
</script>
</body>
</html>
