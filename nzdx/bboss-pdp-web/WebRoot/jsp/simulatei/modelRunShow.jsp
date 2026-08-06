<%@ page import="org.frameworkset.platform.security.AccessControl" %>
<%@ page session="false" language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<script src="../../assets/pages/scripts/table-datatables-editable.js" type="text/javascript"></script>
<%--<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<script src="${pageContext.request.contextPath}/assets/global/plugins/echarts.min.js" type="text/javascript"></script>
<!--
描述:添加模型数据加总界面。
作者:liuwu
版权:北京信碧诚
版本:v1.0
日期:2018-03-25 00:24:45
-->
<div class="row">

    <div class="col-md-12">
        <label style="color: blue;">宏观</label>
        <table  id="rsTable" class="table table-bordered table-striped"></table>
    </div>
<div class="row">
    <div class="col-md-12">
        <label style="color: blue;">行业</label>
        <table  id="hyTable" class="table table-bordered table-striped"></table>
    </div>
</div>
<div>
    <div class="row">
        <div class="col-md-12">
            <div id="main1" style="width: 950px;height:400px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="main2" style="width: 950px;height:400px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="main3" style="width: 950px;height:400px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="main4" style="width: 950px;height:400px;"></div>
        </div>
    </div>
 </div>

<!-- END FORM-->
<script type="text/javascript">
    var regionList = ${allRegion};
    var showDatas  = ${showRunData};
    var charData={};
    var nameCH={"yev":"社会福利","GDP":"GDP","GDP_cv":"GDP",
        "up":"居民消费","ug":"政府消费","qcgds":"投资","qxwreg":"总出口",
        "qiwreg":"总进口","DTBAL":"贸易平衡","qo(UnSkLab:":"非娴熟劳动力",
        "qo(SkLab:":"娴熟劳动力","pfactreal(UnSkLab:":"实际工资（非娴熟）",
        "pfactreal(SkLab:":"实际工资（娴熟）","tot":"贸易条件","ppriv":"消费者价格指数",
        "INCOMEEV":"社会福利","qgdp":"GDP","EW":"社会福利"
    };
    var units={"yev":"%","GDP":"百万美元","GDP_cv":"百万美元",
        "up":"%","ug":"%","qcgds":"%","qxwreg":"%",
        "qiwreg":"%","DTBAL":"百万美元","qo(UnSkLab:":"%",
        "qo(SkLab:":"%","pfactreal(UnSkLab:":"%",
        "pfactreal(SkLab:":"%","tot":"%","ppriv":"%",
        "INCOMEEV":"百万美元","qgdp":"%","EW":"%"
    };;
    var deptData = ${deptData};
    // console.log(showDatas);
    jQuery(document).ready(function () {
        combCharDat();
        initHgTableHead();
        initHgTableBody();
        initHyTableHead();
        initHyTableBody();
        initchar1();
        initchar2();
        initchar3();
        initchar4();
    });

    /**
     // 社会福利与GDP效应（%） yev,qgdp
     //社会福利与GDP效应（百万美元） EW, GDP_cv
     //各国总进出口变化（%）qxwreg,qiwreg
     // 各国投资变化（%） qcgds
     */
    function  combCharDat() {
        var yev=[], qgdp=[],EW=[],GDP_cv=[],qxwreg=[],qiwreg=[],qcgds=[];
        charData.yev=yev, charData.qgdp=qgdp,charData.EW=EW,charData.GDP_cv=GDP_cv,
        charData.qxwreg=qxwreg,charData.qiwreg=qiwreg,charData.qcgds=qcgds;
        for(var i = 0 ;i<showDatas.length;i++){
            var tr = "<tr>";
            $.each(showDatas[i], function (key, value) {
                // tr = tr+"<td>"+nameCH[key]+"</td><td>"+units[key]+"</td>";
               if(key=="yev"){
                   for(var i = 0 ;i<regionList.length;i++){
                       yev.push(value[regionList[i]]);
                   }
               }else if(key=="qgdp"){
                   for(var i = 0 ;i<regionList.length;i++){
                       qgdp.push(value[regionList[i]]);
                   }
               }else if(key=="EW"){
                   for(var i = 0 ;i<regionList.length;i++){
                       EW.push(value[regionList[i]]);
                   }
               }else if(key=="GDP_cv"){
                   for(var i = 0 ;i<regionList.length;i++){
                       GDP_cv.push(value[regionList[i]]);
                   }
               }else if(key=="qxwreg"){
                   for(var i = 0 ;i<regionList.length;i++){
                       qxwreg.push(value[regionList[i]]);
                   }
               }else if(key=="qiwreg"){
                   for(var i = 0 ;i<regionList.length;i++){
                       qiwreg.push(value[regionList[i]]);
                   }
               }else if(key=="qcgds"){
                   for(var i = 0 ;i<regionList.length;i++){
                       qcgds.push(value[regionList[i]]);
                   }
               }
            });
        }
    }
    function initchar1() {
        var myChart = echarts.init(document.getElementById('main1'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                padding: [10, 5],
                x:'center',
                text: '社会福利与GDP效应（%）'
            },
            tooltip: {},
            legend: {
                y:'bottom',
                data:['社会福利','GDP效应']
            },
            xAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉,
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    },
                    rotate:20
                },
                data: regionList
            },
            yAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    }
                }
            },
            series: [{
                name: '社会福利',
                type: 'bar',
                data: charData.yev
            },{
                name: 'GDP效应',
                type: 'bar',
                data:  charData.qgdp
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }

    function initchar2() {
        var myChart = echarts.init(document.getElementById('main2'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                padding: [25, 5],
                x:'center',
                text: '社会福利与GDP效应（百万美元）'
            },
            tooltip: {},
            legend: {
                y:'bottom',
                data:['社会福利','GDP效应']
            },
            xAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉,
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    },
                    rotate:20
                },
                data: regionList
            },
            yAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    }
                }
            },
            series: [{
                name: '社会福利',
                type: 'bar',
                data: charData.EW
            },{
                name: 'GDP效应',
                type: 'bar',
                data: charData.GDP_cv
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    function initchar3() {
        var myChart = echarts.init(document.getElementById('main3'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                padding: [25, 5],
                x:'center',
                text: '各国总进出口变化（%）'
            },
            tooltip: {},
            legend: {
                y:'bottom',
                data:['总出口','总进口']
            },
            xAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉,
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    },
                    rotate:20
                },
                data: regionList
            },
            yAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    }
                }
            },
            series: [{
                name: '总出口',
                type: 'bar',
                data: charData.qxwreg
            },{
                name: '总进口',
                type: 'bar',
                data: charData.qiwreg
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    function initchar4() {
        var myChart = echarts.init(document.getElementById('main4'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                padding: [25, 5],
                x:'center',
                text: '各国投资变化（%）'
            },
            tooltip: {},
            xAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉,
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    },
                    rotate:20
                },
                data: regionList
            },
            yAxis: {
                axisLine:{
                    lineStyle:{
                        width:2,//这里是为了突出显示加上的，可以去掉
                        color:'#104E8B'
                    }
                },
                axisLabel:{
                    textStyle:{
                        fontWeight:'bold',
                        fontSize:16
                    }
                }
            },
            series: [{
                name: '',
                type: 'bar',
                data: charData.qcgds
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }

    function  initHgTableHead() {
        var th="<tr><td>模型变量</td><td>单位</td>";
        for(var i = 0 ;i<regionList.length;i++){
            th  = th +("<td>"+regionList[i]+"</td>");
        }
        th+="</tr>";
        $("#rsTable").append(th);
    }
    
    function  initHgTableBody() {
        for(var i = 0 ;i<showDatas.length;i++){
            var tr = "<tr>";
            var parmDats = showDatas[i];
            $.each(parmDats, function (key, value) {
                tr = tr+"<td>"+nameCH[key]+"</td><td>"+units[key]+"</td>";
                for(var i = 0 ;i<regionList.length;i++){
                    tr = tr+"<td>"+value[regionList[i]]+"</td>";
                }
            });
            tr=tr+"</tr>";
            $("#rsTable").append(tr);
        }
    }




    function  initHyTableHead() {
        var th="<tr><td>行业产出</td>";
        for(var i = 0 ;i<regionList.length;i++){
            th  = th +("<td>"+regionList[i]+"</td>");
        }
        th+="</tr>";
        $("#hyTable").append(th);
    }

    function  initHyTableBody() {
        $.each(deptData, function (key, value){
            var tr = "<tr><td>"+key+"</td>";
            for(var i = 0 ;i<regionList.length;i++){
                tr = tr+"<td>"+value[regionList[i]]+"</td>";
            }
            tr=tr+"</tr>";
            $("#hyTable").append(tr);
        });
    }
</script>
