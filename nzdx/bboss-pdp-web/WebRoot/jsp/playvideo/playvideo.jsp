<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>贸易政策经济影响虚拟仿真实验教学项目</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <%@ include file="../index/front_head.jsp" %>
    <meta name="description" content="平台服务主要包括提供贸易政策经济影响虚拟仿真实验教学项目、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持" />
    <meta name="keywords" content="贸易政策经济影响虚拟仿真实验教学项目" />
    <meta name="generator" content="贸易政策经济影响虚拟仿真实验教学项目" data-variable=""/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/news.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/playvideo/css/Dvideo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/playvideo/font-icon/style.css">
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

<body class="met-navfixed">
<div class="site-page-wrap">
<%@ include file="../index/title.jsp" %>
<div class="site-page-main">


<div class="container">
 <div id="testVideo"></div>
</div>
</div><!-- site-page-main -->
<%@ include file="../index/foot.jsp" %>
</script>
</script>
<script src="${pageContext.request.contextPath}/jsp/playvideo/js/Dvideo.js"></script>
<script>

    var videoWrap = document.getElementById('testVideo')
    var fullScreen = document.getElementById('getFullScreen')
    var video = new Dvideo ({
        ele: '#testVideo',
        title: '${modelResource.sourceName}',
        nextVideoExtend: function () {
           // alert('您点击了下一页')
        },
        showNext: true,
        width: '100%',
        height: '545px',
        src: '${modelResource.soucrePath}',
        autoplay: true,
        setVideoDefinition: function (type, e, current) {
            if (type === '0') {
               // alert('你点击了标清')
                // video.setVideoInfo('這是標清','这里填写视频的标清地址',current)
            }
            if (type === '1') {
               // alert('你点击了标清')
                // video.setVideoInfo('這是標清','这里填写视频的高清地址',current)
            }
            if (type === '2') {
               // alert('你点击了标清')
                // video.setVideoInfo('這是標清','这里填写视频的超清地址',current)
            }
            video.showLoading(false)

            // setTimeout(function () {
            // 	video.videoEle.currentTime = current
            // 	video.videoPlay()
            // 	video.showLoading(false)
            // }, 3000)
        },
    })

    // 全屏
    function setFullScreen () {
        video.launchFullScreen(videoWrap)
    }

    // 播放
    function play () {
        video.videoPlay()
    }

    // 暂停
    function pause () {
        video.videoPause()
    }

    // 播放暂停
    function playpause () {
        video.videoPlayPause()
    }

    function setVolume (v) {
        video.updateVolume(v)
    }

    function setBackRate (index) {
        video.setPlayBackRate(index)
    }

    function setVideoForward () {
        video.videoForward(10)
    }

    function setVideoRewind () {
        video.videoRewind(10)
    }

    function showLoading () {
        video.showLoading(true, '视频清晰度切换中，请稍等')
    }

    function showTopBottomCtrlNotClose () {
        video.showTopBottomCtrl()
    }

    function hideTopBottomCtrlLi () {
        video.hideTopBottomCtrl(true)
    }

    function showTopBottomCtrl () {
        video.showTopBottomCtrl(true)
    }

    function hideTopBottomCtrl () {
        video.hideTopBottomCtrl()
    }

    function setVideoSize () {
        video.updateVideoSize(720,480)
    }
</script>
</div><!-- site-page-wrap -->

</body>
</html>