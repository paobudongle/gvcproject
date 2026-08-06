<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
.sdac a:link{color: white;
	text-decoration: none;
}
.sdac a:hover{color: white;
	text-decoration: none;
}
.sdac a:visited{color: white;
	text-decoration: none;
}
.sdac a:active{color: white;
	text-decoration: none;
}
.mdd{
	font-size: 20px;
	font-weight: 600;
	letter-spacing: 1px;
	margin-bottom: 14px;
	color: #fff4d6;
}
.cwu-footer-section{
	padding: 6px 20px 0;
}
.cwu-footer-section .list-unstyled{
	margin-bottom: 0;
}
.cwu-footer-section li{
	font-size: 15px;
	line-height: 1.9;
	color: rgba(255,255,255,0.94);
}
.cwu-footer-section li + li{
	margin-top: 2px;
}
.cwu-footer-label{
	display: inline-block;
	min-width: 42px;
	color: rgba(255,255,255,0.82);
}
.cwu-support-link{
	display: inline-flex;
	align-items: center;
	color: rgba(255,255,255,0.96);
}
.cwu-support-link img{
	height: 30px;
	width: 80px;
	margin-right: 12px;
	border: 1px solid rgba(255,255,255,0.28);
	background: #ffffff;
}
.cwu-copyright{
	margin: 0;
	font-size: 15px;
	letter-spacing: 0.5px;
	color: rgba(255,255,255,0.92);
}
.cwu-footer-brand{
	padding: 0;
}
.cwu-footer-brand p{
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0;
}
.cwu-footer-brand img{
	display: block;
	max-width: 100%;
	height: auto;
}
.cwu-footer-brand .cwu-footer-logo{
	height: 158px;
	width: auto;
	margin-bottom: 10px;
}
.cwu-footer-brand .cwu-footer-slogan{
	height: 36px;
	width: auto;
}
</style>
<footer class='foot_info_met_16_1 met-foot p-y-20 border-top1' m-id='38' m-type='foot' style="background: #9f0303;color: white;line-height: 2em;">
    <div class="container text-xs-center sdac">
        <div class="col-lg-4 cwu-footer-brand">
        	<p>
        		<img class="cwu-footer-logo" src="${pageContext.request.contextPath}/jsp/index/images/logoft.png" alt="中华女子学院" />
        		<img class="cwu-footer-slogan" src="${pageContext.request.contextPath}/jsp/index/images/slogft.png" alt="崇德 至爱 博学 尚美" />
        	</p>
        </div>
        <div class="col-lg-4 cwu-footer-section" align="left">
        	<ul class="list-unstyled">
        		<li class="mdd">联系方式</li>
        		<li><span class="cwu-footer-label">邮箱</span><a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=lebw5_P89vDV8Lj2_uDn5vDmu-b7"  target="_blank">support@infsum.com</a></li>
        		<li><span class="cwu-footer-label">电话</span>010-84659004</li>
        		<li><span class="cwu-footer-label">地址</span>北京市朝阳区育慧东路1号</li>
        	</ul>

        </div>
        <div class="col-lg-4 cwu-footer-section" align="left">
        	<ul class="list-unstyled">
        		<li class="mdd">技术支持</li>
				<li>
					<a class="cwu-support-link" href="http://www.infsum.com/"  target="_blank">
						<img src="${pageContext.request.contextPath}/jsp/index/picture/ISM.png" style="height: 30px;width:80px" class="img-thumbnail" title="深圳英飞咨询有限公司">
						<span>深圳英飞咨询有限公司</span>
					</a>
				</li>
        	</ul>
        </div>
    </div>
    <div class="container sdac" style="border-top: 1px white solid;margin-top: 20px;padding: 10px 0px 0px 0px;">
    	<div align="center"><p class="cwu-copyright">&copy; <a href="https://www.cwu.edu.cn/" target="_blank">中华女子学院</a> 版权所有</p></div>
    </div>
</footer>
<%@ include file="front_scripts.jsp" %>
