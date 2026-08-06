<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>
<%@ taglib uri="/WEB-INF/tld/dictionary.tld" prefix="dict" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>数智实验室</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="数智实验室" />
    <meta name="generator" content="数智实验室" data-variable=""/>
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/news.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/home.css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>

    <script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/index/js/index.js"></script>

    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>


    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/echarts.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
    <style>
        /* 本页内容加宽并水平居中 */
        .exper-page {
            width: 96%;
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 15px;
            box-sizing: border-box;
        }
        .exper-page .exper-nav {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            margin: 10px 0 16px;
        }
        .exper-page .exper-nav .btn {
            min-width: 88px;
        }
        .exper-page .age-chart-wrap {
            width: 100%;
            margin: 0 auto 20px;
        }
        .exper-page #gdp_per {
            width: 100% !important;
            height: 640px;
            margin: 0 auto;
        }
        .exper-page .year-select-bar {
            text-align: right;
            margin: 0 0 10px;
        }
        .exper-page .chart-filter-bar {
            text-align: right;
            margin: 0 0 10px;
        }
    </style>

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
<div class="hed"></div>

<div class="exper-page">
    <div class="exper-nav">
        <a href="#lyf" type="button" class="btn btn-primary">人口</a>
        <a href="#output" type="button" class="btn btn-primary">教育</a>
        <a href="#export" type="button" class="btn btn-info">职业</a>
        <button class="btn btn-danger" onclick="toExper()">实验开始</button>
    </div>
    <hr/>

    <a name="lyf"></a>
    <div class="year-select-bar">
        <label for="year-select">选择年份：</label>
        <select id="year-select">
            <option value="0">2015年</option>
            <option value="1">2016年</option>
            <option value="2">2017年</option>
            <option value="3">2018年</option>
            <option value="4">2019年</option>
            <option value="5">2021年</option>
            <option value="6">2022年</option>
            <option value="7" selected>2023年</option>
        </select>
    </div>
    <div class="age-chart-wrap">
        <div id="gdp_per"></div>
    </div>
    <br/>
    <a name="gdp"></a>
    <br/>
    <a name="output"></a>

    <div class="chart-filter-bar">
        <label class="radio-inline">
            <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" onchange="showChar(1)" checked> 男
        </label>
        <label class="radio-inline">
            <input type="radio" name="optionsRadiosinline" id="optionsRadios4" value="option2" onchange="showChar(2)"> 女
        </label>
    </div>
    <div class="row">

        <div class="col-md-6">
            <a name="lyf"></a>
            <div id="lyf_cy" style="width: 100%;height: 400px;"></div>
        </div>
        <div class="col-md-6">
            <a name="output"></a>
            <div id="pro_creat" style="width: 100%;height: 400px;"></div>
        </div>
    </div>
    <br/>
    <a name="export"></a>

    <div class="row">
        <div class="col-md-6">
            <a name="import"></a>
            <div id="pro_in_cp" style="width: 100%;height: 400px;"></div>
        </div>
        <div class="col-md-6">
            <a name="export"></a>
            <div id="pro_out_cp" style="width: 100%;height: 400px;"></div>
        </div>
    </div>
    <br/>
    <a name="import"></a>

    <div class="row">
        <div class="col-md-6">
            <a name="import"></a>
            <div id="pro_in" style="width: 100%;height: 400px;"></div>
        </div>
        <div class="col-md-6">
            <a name="export"></a>
            <div id="pro_out" style="width: 100%;height: 400px;"></div>
        </div>
    </div>
    <br/>

    <br/>
    <div class="exper-nav">
        <a href="#lyf" type="button" class="btn btn-primary">人口</a>
        <a href="#gdp" type="button" class="btn btn-info">教育</a>
        <a href="#export" type="button" class="btn btn-info">职业</a>
        <a class="btn btn-danger" target="_blank" href="${pageContext.request.contextPath}/modeljz/toSimulate.page" role="button">开始实验</a>
    </div>
</div>
<%@ include file="foot.jsp" %>
<script>
    var usercontextpath = "<%=request.getContextPath()%>";
    var loginAccount = "<%=control.getUserAccount()%>";
    $(document).ready(function(){
        var menuId = '${menu_id}'
        $("#menu_"+menuId).addClass("active");
        gdpPer();
        lyfCY();
        proCreaat();
        proIn();
        proOut();
        proInCP();
        proOutCP();
        showChar("1");
        $(window).on('resize', function () {
            if (myChart) { myChart.resize(); }
        });
    });

    // 全局变量
    const years = ['2015年', '2016年', '2017年', '2018年', '2019年', '2021年', '2022年', '2023年'];
    const ageGroups = [
        '0-4岁', '5-9岁', '10-14岁', '15-19岁', '20-24岁', '25-29岁',
        '30-34岁', '35-39岁', '40-44岁', '45-49岁', '50-54岁', '55-59岁',
        '60-64岁', '65-69岁', '70-74岁', '75-79岁', '80-84岁', '85-89岁',
        '90-94岁', '95岁以上'
    ];

    const male =[
            [-39201829,-36548439,-34411249,-36760358,-50828907,-67148137,-53096356,-50341131,-60853331,-64418949,-54355604,-39980662,-41341677,-28997112,-19546827,-14698922,-9647414,-4560801,-1495160,-337203],
            [-40067998,-36812725,-34896671,-35800423,-47631236,-66189697,-54910475,-49847699,-58551987,-64914852,-60733108,-37076530,-42772941,-31020385,-20362177,-14774317,-9951364,-4800233,-1604285,-352160],
            [-40804727,-37119552,-35619086,-34874620,-44448899,-63107980,-56698646,-52034516,-55076451,-66393372,-61220545,-37901178,-43587829,-33662458,-21525471,-15093072,-10312339,-4931933,-1670886,-415159],
            [-40478256,-37313844,-36581520,-34311315,-41067969,-58159388,-59559797,-51866539,-52697791,-64593563,-61555060,-44499615,-43583567,-35748983,-23003973,-15486729,-10778013,-5181515,-1753724,-420123],
            [-39606194,-37759496,-36844916,-34478877,-38667332,-53357276,-62976559,-51862652,-51003378,-63358309,-62157753,-49756958,-40797307,-37930811,-24785402,-16243922,-10900775,-5571117,-1881770,-449197],
            [-34352607,-44685127,-42541183,-36379698,-35883571,-43116532,-61352429,-52540971,-47351935,-55678159,-63479538,-60161130,-35054711,-40991404,-28680317,-18249761,-12247710,-7181467,-2580654,-602087],
            [-30317026,-43733674,-43731630,-37692349,-35249241,-41128033,-57517300,-54622370,-49022645,-52158818,-64621735,-59904186,-36954306,-41523633,-31103113,-19394596,-12570250,-7481634,-2702752,-631732],
            [-27285480,-42422907,-43875909,-39558587,-34223964,-39457353,-53953633,-57191128,-48967373,-49903289,-62163493,-60001854,-42265101,-40984792,-33280108,-20680472,-12810043,-7722549,-2958607,-614350]

    ];

    const female =[
            [37327408,34800889,32765889,35002676,48398542,63937475,50557575,47934089,57943653,61338782,51756612,38069002,39364940,27610627,18612203,13996099,9186126,4342728,1423670,321080],
            [38167624,35066745,33241567,34102454,45372147,63050404,52306141,47483487,55774941,61836023,57852614,35318037,40744275,29549128,19396425,14073590,9479383,4572564,1528196,335458],
            [38931639,35415627,33984039,33273746,42408530,60211090,54095968,49645939,52548238,63345671,58410296,36161374,41586986,32117227,20537372,14400244,9838965,4705539,1594186,396101],
            [38683140,35659063,34959215,32789689,39246701,55580155,56918460,49566380,50360768,61728989,58825237,42526161,41650738,34163600,21983801,14799929,10300034,4951727,1675950,401491],
            [37918344,36150345,35274740,33009532,37019493,51083413,60292762,49652483,48829828,60658243,59508850,47636525,39058696,36314359,23729153,15551674,10436230,5333700,1801577,430054],
            [32755430,42607553,40563290,34688274,34215214,41111889,58499933,50098151,45150372,53089480,60528145,57364021,33424891,39085566,27346866,17401263,11678269,6847575,2460670,574093],
            [28957911,41773090,41771138,36002598,33669015,39284261,54938795,52173646,46824956,49820535,61724738,57218677,35297641,39662125,29708759,18525135,12006724,7146232,2581587,603412],
            [26112347,40598943,41989474,37857774,32752512,37760893,51633908,54732208,46862031,47757708,59490788,57422088,40447923,39222660,31849237,19791320,12259278,7390520,2831402,587936]

    ];


    function prepareEchartsData(yearIndex) {
        // 反转：使 0-4岁 在底部（Y轴从高龄到低龄）
        return {
            male: male[yearIndex],   // 负值 → 左侧
            female: female[yearIndex]             // 正值 → 右侧
        };
    }

    let myChart;

    // 初始化图表
    function initChart() {
        myChart = echarts.init(document.getElementById('gdp_per'));
    }

    // 更新指定年份的金字塔图
    function updateChart(yearIndex) {
        const { male, female } = prepareEchartsData(yearIndex);
        // 左右对称：按当年男女绝对值最大值对齐 x 轴
        let maxAbs = 0;
        male.forEach(function (v) { maxAbs = Math.max(maxAbs, Math.abs(v)); });
        female.forEach(function (v) { maxAbs = Math.max(maxAbs, Math.abs(v)); });
        maxAbs = Math.ceil(maxAbs / 10000000) * 10000000;

        const option = {
            title: {
                text: `${years[yearIndex]} 人口年龄分布`,
                left: 'center',
                textStyle: { fontSize: 18 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].name + '<br/>';
                    params.forEach(p => {
                        let rawValue = p.value;
                        if (Array.isArray(rawValue)) {
                            rawValue = rawValue[0] !== undefined ? rawValue[0] : rawValue[1];
                        }
                        if (p.seriesName === '男性') {
                            res += ('男性: ' + Math.abs(rawValue).toLocaleString() + '<br/>');
                        } else if (p.seriesName === '女性') {
                            res += ('女性: ' + Math.abs(rawValue).toLocaleString() + '<br/>');
                        }
                    });
                    return res;
                }
            },
            legend: {
                data: ['男性', '女性'],
                top: '5%',
                itemWidth: 20,
                itemHeight: 10
            },
            grid: {
                left: '5%',
                right: '5%',
                top: '12%',
                bottom: '8%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                position: 'top',
                min: -maxAbs,
                max: maxAbs,
                axisLabel: {
                    formatter: (value) => Math.abs(value).toLocaleString()
                },
                splitLine: { show: true }
            },
            yAxis: {
                type: 'category',
                data: ageGroups,
                axisTick: { show: false },
                axisLabel: { fontSize: 12 }
            },
            series: [
                {
                    name: '男性',
                    type: 'bar',
                    stack: 'total',
                    data: male,
                    itemStyle: { color: '#5470C6' },
                    barWidth: '60%'
                },
                {
                    name: '女性',
                    type: 'bar',
                    stack: 'total',
                    data: female,
                    itemStyle: { color: '#EA7CCC' },
                    barWidth: '60%'
                }
            ]
        };

        myChart.setOption(option, true);
    }
    function showChar(value) {
        if(2==value){
            $("#lyf_cy").hide();
            $("#pro_creat").hide();
            $("#pro_in_cp").show();
            $("#pro_out_cp").show();
        }

        if(1==value){
            $("#lyf_cy").show();
            $("#pro_creat").show();
            $("#pro_in_cp").hide();
            $("#pro_out_cp").hide();
        }
    }
    // 主函数
    function gdpPer() {
        initChart();
        // 默认显示 2023年
        updateChart(7);
        if (myChart) { myChart.resize(); }

        // 绑定下拉框 change 事件
        document.getElementById('year-select').addEventListener('change', function(e) {
            const yearIndex = parseInt(e.target.value);
            updateChart(yearIndex);
        });
    }



    function gdpTotal() {

        // ========== 1. 年份数组（补充2015年，与数据列对应） ==========
        const years = ['2016年', '2017年', '2018年', '2019年', '2021年', '2022年', '2023年'];

        // ========== 2. 年龄组类别（20个，与数据行2-21对应） ==========
        const ageGroups = [
            '0-4岁', '5-9岁', '10-14岁', '15-19岁', '20-24岁', '25-29岁',
            '30-34岁', '35-39岁', '40-44岁', '45-49岁', '50-54岁', '55-59岁',
            '60-64岁', '65-69岁', '70-74岁', '75-79岁', '80-84岁', '85-89岁',
            '90-94岁', '95岁以上'
        ];

        // ========== 3. 按行拆分的人口数据数组（核心：与你提供的行数据一一对应） ==========
        // 第一行：各年份总人口数
        const totalPopulation = [21312241, 1158019, 1145246, 1144648, 1091876, 1494054, 1443996, 1482230];
        // 第2-21行：各年龄段人口数（每行对应一个年龄段，列对应年份）
        const ageData = [
            [ 68447, 68313, 67393, 62722, 72978, 62248, 57537],    // 0-4岁
            [ 63831, 63314, 63322, 60701, 96094, 90793, 90498],    // 5-9岁
            [ 60420, 60727, 62248, 59844, 92304, 91846, 94775],    // 10-14岁
            [ 61562, 59251, 58258, 55822, 79414, 79560, 85813],    // 15-19岁
            [ 79102, 73185, 68050, 61519, 77256, 73629, 73696],    // 20-24岁
            [ 106663, 100701, 92977, 81741, 91729, 85040, 84358],  // 25-29岁
            [ 87573, 88959, 93201, 93971, 128056, 116755, 113258], // 30-34岁
            [ 80485, 82553, 81886, 77703, 109171, 109832, 118381], // 35-39岁
            [ 94730, 87713, 83574, 77044, 98023, 98379, 101291],   // 40-44岁
            [ 104623, 105476, 102384, 95621, 114545, 103955, 102401], // 45-49岁
            [ 97608, 96760, 96850, 93125, 129319, 127635, 126579], // 50-54岁
            [ 59638, 59823, 69844, 74068, 121989, 117482, 120926], // 55-59岁
            [ 67696, 68044, 68014, 60712, 70755, 71964, 84465],    // 60-64岁
            [ 48454, 51552, 54799, 55086, 81345, 79964, 81497],     // 65-69岁
            [ 31677, 32590, 34810, 35665, 56208, 58782, 64545],     // 70-74岁
            [ 22449, 22553, 22799, 22610, 34886, 35928, 39405],     // 75-79岁
            [ 14331, 14708, 14845, 14322, 22543, 22434, 23524],     // 80-84岁
            [ 6606, 6902, 7036, 12317, 12542, 13443],         // 85-89岁
            [ 1902, 1964, 2031, 2113, 4249, 4297, 4885],             // 90-94岁
            [ 413, 455, 458, 450, 871, 929, 953]                      // 95岁以上
        ];

        // ========== 4. 颜色配置（20个颜色对应20个年龄段） ==========
        const colors = [
            '#5470C6', '#91CC75', '#FAC858', '#EE6666', '#73C0DE', '#3BA272',
            '#FC8452', '#9A60B4', '#EA7CCC', '#5B8FF9', '#5CDBD3', '#F59E0B',
            '#FF6B3B', '#6B7280', '#10B981', '#EF4444', '#8B5CF6', '#EC4899',
            '#06B6D4', '#84CC16'
        ];

        // ========== 5. 构建ECharts系列数据 ==========
        const series = ageGroups.map((name, index) => {
            return {
                name: name,
                type: 'bar',
                data: ageData[index],
                itemStyle: {
                    color: colors[index]
                }
            };
        });

        // ========== 6. 初始化图表并配置 ==========
        var myChart = echarts.init(document.getElementById('gdp_all'));
        const option = {
            title: {
                text: '人口数(人口抽样调查)(人)',
                left: 'center',
                textStyle: { fontSize: 18 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    // 悬浮提示：显示年份+各年龄段人口数（保留0位小数）
                    let res = params[0].name + '<br/>';
                    params.forEach(item => {
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: ageGroups,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '15%', // 预留底部空间给滚动图例
                top: '5%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: years,
                axisLabel: {
                    fontWeight: 'bold',
                    fontSize: 12,
                    interval: 0 // 强制显示所有年份标签
                }
            },
            yAxis: {
                type: 'value',
                name: '人口数',
                nameTextStyle: { fontWeight: 'bold' },
                axisLabel: { fontWeight: 'bold' }
            },
            series: series
        };


        myChart.setOption(option,true);
    }



    function lyfCY() {
        // 教育阶段类别（列数据）
        const educationTypes = [
            '学前教育', '小学', '初中', '高中', '大学专科', '大学本科', '研究生'
        ];

        // 年龄组类别
        const ageGroups = [
            '0-4岁', '5-9岁', '10-14岁', '15-19岁', '20-24岁', '25-29岁',
            '30-34岁', '35-39岁', '40-44岁', '45-49岁', '50-54岁', '55-59岁',
            '60-64岁', '65-69岁', '70-74岁', '75-79岁', '80-84岁', '85-89岁',
            '90-94岁', '95岁以上'
        ];

        // 图片中的数据（按年龄组-教育阶段排列）
        const educationData = [
            // age0_4：学前教育,小学,初中,高中,大学专科,大学本科,研究生
            [12381615, 0, 0, 0, 0, 0, 0],
            // age5_9
            [7204368, 21920126, 486880, 1254, 0, 0, 0],
            // age10_14
            [348187, 12882181, 12785987, 608567, 4216, 1284, 101],
            // age15_19
            [107310, 510179, 5239544, 15936918, 3516944, 2850842, 4624],
            // age20_24
            [68751, 532217, 5795150, 5858702, 7222548, 7714298, 622678],
            // age25_29
            [72951, 881593, 9241404, 7872037, 7470176, 6621462, 1034404],
            // age30_34
            [103712, 1602733, 14898934, 10657246, 8770374, 7798179, 1106876],
            // age35_39
            [100865, 1603382, 13577642, 8000582, 5881295, 5934282, 915451],
            // age40_44
            [122553, 2409420, 13959773, 7552526, 4298231, 3665745, 577700],
            // age45_49
            [192440, 4246091, 17700214, 8001986, 3875159, 2974180, 388562],
            // age50_54
            [265961, 6140937, 17855339, 6850628, 2854568, 2232399, 259012],
            // age55_59
            [243533, 4943411, 13560338, 6975797, 2315944, 1620079, 206352],
            // age60_64
            [337945, 4666240, 8488873, 5309524, 1403479, 672596, 68375],
            // age65_69
            [500153, 6111856, 7867982, 2996616, 1138537, 489697, 34306],
            // age70_74
            [485511, 4874619, 4210844, 1602147, 706853, 319761, 13270],
            // age75_79
            [411355, 3010410, 2245264, 1002837, 397675, 314025, 8432],
            // age80_84
            [419240, 2089965, 1151573, 598834, 280111, 296267, 5547],
            // age85_89
            [338737, 1199834, 562865, 268596, 112947, 113537, 3974],
            // age90_94
            [89414, 316713, 148576, 70900, 29814, 29970, 1049],
            // age95
            [14706, 52090, 24436, 11661, 4904, 4929, 173]
        ];

        // 颜色配置（7种颜色对应7个教育阶段）
        const colors = [
            '#5470C6', '#91CC75', '#FAC858', '#EE6666',
            '#73C0DE', '#EA7CCC', '#3BA272'
        ];

        // 构建系列数据
        const series = educationTypes.map((name, index) => {
            // 提取每个教育阶段在各年龄组的数据
            const data = educationData.map(ageGroup => ageGroup[index]);
            return {
                name: name,
                type: 'bar',
                data: data,
                itemStyle: {
                    color: colors[index]
                }
            };
        });

        var myChart = echarts.init(document.getElementById('lyf_cy'));
        const option = {
            title: {
                text: '城镇男性教育程度分布',
                left: 'center',
                textStyle: { fontSize: 16 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].name + '<br/>';
                    params.forEach(item => {
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: educationTypes,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '18%', // 预留更多空间给图例
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: ageGroups,
                axisLabel: {
                    fontSize: 10,
                    interval: 0,
                    rotate: 45 // 旋转标签避免重叠
                }
            },
            yAxis: {
                type: 'value',
                name: '人数',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: series
        };
        myChart.setOption(option,true);
    }
    function proCreaat() {
        var myChart = echarts.init(document.getElementById('pro_creat'));
        // 教育阶段类别（列数据）
        const educationTypes = [
            '学前教育', '小学', '初中', '高中', '大学专科', '大学本科', '研究生'
        ];

        // 年龄组类别
        const ageGroups = [
            '0-4岁', '5-9岁', '10-14岁', '15-19岁', '20-24岁', '25-29岁',
            '30-34岁', '35-39岁', '40-44岁', '45-49岁', '50-54岁', '55-59岁',
            '60-64岁', '65-69岁', '70-74岁', '75-79岁', '80-84岁', '85-89岁',
            '90-94岁', '95岁以上'
        ];

        // 图片中的乡村男性教育数据（按年龄组-教育阶段顺序）
        const educationData = [
            // age0_4：学前教育,小学,初中,高中,大学专科,大学本科,研究生
            [6694903, 0, 0, 0, 0, 0, 0],
            // age5_9
            [4484775, 13649870, 269821, 364, 0, 0, 0],
            // age10_14
            [231696, 9972999, 8549266, 221374, 727, 170, 35],
            // age15_19
            [82000, 466738, 4816004, 4218821, 894335, 408314, 770],
            // age20_24
            [75134, 565189, 5177173, 2863558, 2037478, 1080276, 62843],
            // age25_29
            [96684, 914248, 7865481, 3199082, 1794253, 1008946, 89549],
            // age30_34
            [154736, 1647964, 11486000, 3438558, 1466028, 692999, 47469],
            // age35_39
            [173741, 1872060, 9784245, 2071268, 685260, 313246, 18718],
            // age40_44
            [225300, 2887285, 9727024, 1635340, 411108, 152319, 8370],
            // age45_49
            [351934, 5286511, 13012781, 1701022, 338664, 116291, 5851],
            // age50_54
            [469708, 7876623, 14267892, 1687133, 257762, 83263, 4245],
            // age55_59
            [444318, 6914744, 11154283, 2175484, 202606, 55726, 3411],
            // age60_64
            [620794, 6894463, 6565899, 1702869, 116475, 22268, 1325],
            // age65_69
            [1005887, 9500136, 5579966, 999235, 96016, 16775, 761],
            // age70_74
            [1041264, 7472750, 2922227, 438473, 63034, 11563, 417],
            // age75_79
            [894732, 4606219, 1540073, 271033, 41186, 8906, 286],
            // age80_84
            [788873, 2728191, 630154, 133678, 26572, 7769, 229],
            // age85_89
            [519301, 1256863, 228622, 47668, 9394, 3556, 137],
            // age90_94
            [137077, 331767, 60348, 12583, 2480, 939, 36],
            // age95
            [22545, 54566, 9925, 2069, 408, 154, 6]
        ];
        // 颜色配置（7种颜色对应7个教育阶段）
        const colors = [
            '#5470C6', '#91CC75', '#FAC858', '#EE6666',
            '#73C0DE', '#EA7CCC', '#3BA272'
        ];

        // 构建系列数据
        const series = educationTypes.map((name, index) => {
            // 提取每个教育阶段在各年龄组的数据
            const data = educationData.map(ageGroup => ageGroup[index]);
            return {
                name: name,
                type: 'bar',
                data: data,
                itemStyle: {
                    color: colors[index]
                }
            };
        });

        const option = {
            title: {
                text: '乡村男性教育程度分布',
                left: 'center',
                textStyle: { fontSize: 16 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].name + '<br/>';
                    params.forEach(item => {
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: educationTypes,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '18%', // 预留更多空间给图例
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: ageGroups,
                axisLabel: {
                    fontSize: 10,
                    interval: 0,
                    rotate: 45 // 旋转标签避免重叠
                }
            },
            yAxis: {
                type: 'value',
                name: '人数',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: series
        };
        myChart.setOption(option,true);
    }

    function proIn() {
        var myChart = echarts.init(document.getElementById('pro_in'));
        // 职业类别
        const careers = [
            '企业就业人员', '中层及以上管理人员', '专业技术人员',
            '办事人员和有关人员', '社会生产服务和生活服务人员',
            '生产制造及有关人员', '其他职业'
        ];

        // 受教育程度类别
        const educations = [
            '学前教育', '小学', '初中', '高中', '大学专科', '大学本科', '研究生'
        ];

        // 数据（职业[受教育程度]）
        const data = [
            [0.001, 0.034, 0.321, 0.294, 0.245, 0.223, 0.03],
            [0.002, 0.052, 0.401, 0.533, 0.998, 1.627, 0.341],
            [0.007, 0.241, 1.335, 1.296, 1.507, 1.596, 0.142],
            [0.059, 1.69, 9.001, 4.823, 2.591, 1.463, 0.129],
            [0.303, 4.355, 6.063, 0.882, 0.126, 0.032, 0],
            [0.058, 2.242, 9.562, 3.048, 1.137, 0.378, 0.02],
            [0.001, 0.009, 0.027, 0.011, 0.007, 0, 0]
        ];

        // 颜色配置
        const colors = [
            '#4895ef', '#f98210', '#98c1d9',
            '#f9c74f', '#277da1', '#f3722c', '#545454'
        ];

        // 构建系列数据
        const series = careers.map((career, index) => {
            return {
                name: career,
                type: 'bar',
                stack: '职业',
                data: data[index],
                itemStyle: {
                    color: colors[index]
                }
            };
        });

        // 配置项
        const option = {
            title: {
                text: '受教育程度与职业的关系结构（男性）',
                left: 'center',
                textStyle: { fontSize: 16 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].axisValue + '<br/>';
                    let total = 0;
                    params.forEach(item => {
                        total += item.data;
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: careers,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '18%',
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: educations,
                axisLabel: {
                    fontSize: 12,
                    rotate: 30
                }
            },
            yAxis: {
                type: 'value',
                name: '占比',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: series
        };
        myChart.setOption(option,true);
    }

    function proOut() {
        var myChart = echarts.init(document.getElementById('pro_out'));
        const careers = [
            '企业就业人员', '中层及以上管理人员', '专业技术人员',
            '办事人员和有关人员', '社会生产服务和生活服务人员',
            '生产制造及有关人员', '其他职业'
        ];

        const educations = [
            '学前教育', '小学', '初中', '高中', '大学专科', '大学本科', '研究生'
        ];

        const data = [
            [0.001, 0.015, 0.096, 0.09, 0.08, 0.074, 0.009],
            [0.001, 0.038, 0.335, 0.682, 1.603, 2.22, 0.35],
            [0.005, 0.077, 0.574, 0.76, 1.177, 1.254, 0.137],
            [0.125, 1.78, 6.518, 3.164, 1.798, 0.971, 0.077],
            [0.712, 4.419, 4.335, 0.401, 0.06, 0.014, 0.001],
            [0.088, 1.335, 4.064, 0.879, 0.29, 0.111, 0.011],
            [0.001, 0, 0.016, 0.006, 0.005, 0, 0]
        ];

        const colors = [
            '#4895ef', '#f98210', '#98c1d9',
            '#f9c74f', '#277da1', '#f3722c', '#545454'
        ];

        const series = careers.map((career, index) => {
            return {
                name: career,
                type: 'bar',
                stack: '职业',
                data: data[index],
                itemStyle: {
                    color: colors[index]
                }
            };
        });

        const option = {
            title: {
                text: '受教育程度与职业的关系结构（女性）',
                left: 'center',
                textStyle: { fontSize: 16 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].axisValue + '<br/>';
                    let total = 0;
                    params.forEach(item => {
                        total += item.value;
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: careers,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '18%',
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: educations,
                axisLabel: {
                    fontSize: 12,
                    rotate: 30
                }
            },
            yAxis: {
                type: 'value',
                name: '占比',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: series
        };

        myChart.setOption(option,true);
    }

    function proInCP() {
        var myChart = echarts.init(document.getElementById('pro_in_cp'));
        // 教育阶段类别（列数据）
        const educationTypes = [
            '学前教育', '小学', '初中', '高中', '大学专科', '大学本科', '研究生'
        ];

        // 年龄组类别
        const ageGroups = [
            '0-4岁', '5-9岁', '10-14岁', '15-19岁', '20-24岁', '25-29岁',
            '30-34岁', '35-39岁', '40-44岁', '45-49岁', '50-54岁', '55-59岁',
            '60-64岁', '65-69岁', '70-74岁', '75-79岁', '80-84岁', '85-89岁',
            '90-94岁', '95岁以上'
        ];

        // 图片中的数据（按年龄组-教育阶段排列）
        // 图片中的城镇女性教育数据（按年龄组-教育阶段顺序）
        const educationData = [
            // age0_4：学前教育,小学,初中,高中,大学专科,大学本科,研究生
            [11130574, 0, 0, 0, 0, 0, 0],
            // age5_9
            [6320499, 19207020, 397647, 971, 0, 0, 0],
            // age10_14
            [312557, 11053741, 11132403, 623131, 4842, 1267, 75],
            // age15_19
            [89166, 411064, 3709929, 14103230, 3387004, 3302988, 3607],
            // age20_24
            [57186, 402615, 4062510, 4328916, 7127994, 8859662, 790112],
            // age25_29
            [69355, 760880, 7723939, 6420165, 7491376, 7558665, 1277435],
            // age30_34
            [114621, 1641488, 14148486, 9568800, 9010706, 8344124, 1236955],
            // age35_39
            [133888, 1883962, 13287907, 7397212, 5869532, 5770212, 851701],
            // age40_44
            [211945, 3093157, 13733493, 6957809, 4103579, 3310968, 425962],
            // age45_49
            [417607, 5773919, 17320764, 7083758, 3362258, 2285519, 221375],
            // age50_54
            [699146, 8535335, 17092753, 5936255, 2272214, 1467918, 121012],
            // age55_59
            [840238, 7438938, 12994344, 6319184, 1638387, 834785, 66080],
            // age60_64
            [1194487, 6801378, 7538023, 4667749, 874168, 336727, 19956],
            // age65_69
            [1776412, 8631986, 6883265, 2331390, 686473, 267663, 11162],
            // age70_74
            [1537927, 6492600, 3529280, 1191053, 375352, 151460, 3816],
            // age75_79
            [1384625, 4084794, 1902867, 780113, 230418, 155927, 2308],
            // age80_84
            [1429806, 2944658, 951793, 420261, 141747, 123881, 1896],
            // age85_89
            [1232369, 1619640, 379202, 150505, 48094, 45645, 1565],
            // age90_94
            [404006, 530964, 124313, 49340, 15766, 14964, 513],
            // age95
            [91115, 119748, 28036, 11128, 3556, 3375, 116]
        ];


        // 颜色配置（7种颜色对应7个教育阶段）
        const colors = [
            '#5470C6', '#91CC75', '#FAC858', '#EE6666',
            '#73C0DE', '#EA7CCC', '#3BA272'
        ];

        // 构建系列数据
        const series = educationTypes.map((name, index) => {
            // 提取每个教育阶段在各年龄组的数据
            const data = educationData.map(ageGroup => ageGroup[index]);
            return {
                name: name,
                type: 'bar',
                data: data,
                itemStyle: {
                    color: colors[index]
                }
            };
        });
        const option = {
            title: {
                text: '城镇女性教育程度分布',
                left: 'center',
                textStyle: { fontSize: 16 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].name + '<br/>';
                    params.forEach(item => {
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: educationTypes,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '18%', // 预留更多空间给图例
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: ageGroups,
                axisLabel: {
                    fontSize: 10,
                    interval: 0,
                    rotate: 45 // 旋转标签避免重叠
                }
            },
            yAxis: {
                type: 'value',
                name: '人数',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: series
        };
        myChart.setOption(option,true);
    }

    function proOutCP() {
        var myChart = echarts.init(document.getElementById('pro_out_cp'));
// 教育阶段类别（列数据）
        const educationTypes = [
            '学前教育', '小学', '初中', '高中', '大学专科', '大学本科', '研究生'
        ];

        // 年龄组类别
        const ageGroups = [
            '0-4岁', '5-9岁', '10-14岁', '15-19岁', '20-24岁', '25-29岁',
            '30-34岁', '35-39岁', '40-44岁', '45-49岁', '50-54岁', '55-59岁',
            '60-64岁', '65-69岁', '70-74岁', '75-79岁', '80-84岁', '85-89岁',
            '90-94岁', '95岁以上'
        ];


        // 乡村女性教育数据（按年龄组-教育阶段顺序）
        const educationData = [
            // age0_4：学前教育,小学,初中,高中,大学专科,大学本科,研究生
            [6038170, 0, 0, 0, 0, 0, 0],
            // age5_9
            [4006919, 12076721, 216532, 289, 0, 0, 0],
            // age10_14
            [213886, 8650835, 7450462, 205006, 788, 171, 40],
            // age15_19
            [68689, 397633, 3446832, 3394323, 851663, 464144, 525],
            // age20_24
            [71463, 504730, 3692519, 1992517, 2071003, 1232811, 71642],
            // age25_29
            [108066, 876790, 6327560, 2332817, 1651626, 990841, 95547],
            // age30_34
            [198151, 1717906, 9955641, 2549479, 1184365, 560971, 41689],
            // age35_39
            [261156, 2117471, 8393682, 1430556, 468937, 201772, 12907],
            // age40_44
            [405818, 3497349, 8187329, 1044488, 253260, 92720, 4759],
            // age45_49
            [751625, 6862990, 10724956, 987335, 176959, 61275, 2861],
            // age50_54
            [1220821, 10523298, 11175581, 860218, 115573, 36824, 1878],
            // age55_59
            [1420725, 9775586, 8197982, 965545, 72581, 19160, 1225],
            // age60_64
            [1915252, 8659502, 3848795, 613996, 33816, 7455, 509],
            // age65_69
            [3140296, 10877043, 2766659, 266510, 22960, 5473, 345],
            // age70_74
            [3034879, 7699948, 1287082, 108119, 12424, 3144, 219],
            // age75_79
            [2660447, 4570476, 632464, 70689, 8456, 2667, 165],
            // age80_84
            [2291060, 2632717, 249659, 31393, 4693, 2153, 158],
            // age85_89
            [1692240, 1353058, 108090, 13342, 2049, 1234, 85],
            // age90_94
            [554765, 443571, 35435, 4374, 672, 405, 28],
            // age95
            [125116, 100039, 7992, 986, 151, 91, 6]
        ];

        // 颜色配置（7种颜色对应7个教育阶段）
        const colors = [
            '#5470C6', '#91CC75', '#FAC858', '#EE6666',
            '#73C0DE', '#EA7CCC', '#3BA272'
        ];

        // 构建系列数据
        const series = educationTypes.map((name, index) => {
            // 提取每个教育阶段在各年龄组的数据
            const data = educationData.map(ageGroup => ageGroup[index]);
            return {
                name: name,
                type: 'bar',
                data: data,
                itemStyle: {
                    color: colors[index]
                }
            };
        });

        const option = {
            title: {
                text: '乡村女性教育程度分布',
                left: 'center',
                textStyle: { fontSize: 16 }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { type: 'shadow' },
                formatter: function(params) {
                    let res = params[0].name + '<br/>';
                    params.forEach(item => {
                        res += item.seriesName + `:`+ item.data + '<br/>';
                    });
                    return res;
                }
            },
            legend: {
                data: educationTypes,
                type: 'scroll',
                bottom: 0,
                left: 'center',
                pageIconSize: 12,
                pageTextStyle: { fontSize: 12 }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '18%', // 预留更多空间给图例
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: ageGroups,
                axisLabel: {
                    fontSize: 10,
                    interval: 0,
                    rotate: 45 // 旋转标签避免重叠
                }
            },
            yAxis: {
                type: 'value',
                name: '人数',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: series
        };
        myChart.setOption(option,true);
    }

    function proCH() {
        var myChart = echarts.init(document.getElementById('ch_rd'));
        var data = [
            {
                name: '农产品',
                value:1086.38
            },
            {
                name: '羊毛',
                value:6.75
            },
            {
                name: '牛肉',
                value:35.69
            },
            {
                name: '肉制品',
                value:584.5
            },
            {
                name: '矿产品',
                value:366.58
            },
            {
                name: '采掘业',
                value:550.5
            },
            {
                name: '乳制品',
                value:58.78
            },
            {
                name: '烟草饮料',
                value:286.43
            },
            {
                name: '加工食品',
                value:708.01
            },
            {
                name: '纺织业',
                value:1232.41
            },
            {
                name: '轻工业',
                value:2880.45
            },
            {
                name: '重工业',
                value:9840.81
            },
            {
                name: '服务业',
                value:12190.21
            }
        ]
        option = {
            title: {
                left: 'center',
                top: "4%",
                text: ['中国行业规模(2014)'],
                textStyle: {
                    rich: {
                        c: {
                            color: '#0000',
                            fontSize: 25,
                            fontWeight: 'bold',
                            width: 4,
                            height: 15,
                            backgroundColor: '#2196f3',

                        },
                        d: {
                            //   color: '#3e4956',
                            fontWeight: 'bold',
                            fontSize: 17,
                            padding: [0, 0, 0, 10],
                        },
                    }
                },
            },
            toolbox: {
            },
            tooltip: {},
            // roam:false,
            series: [{
                name: '中国行业规模',
                fontWeight: 'bold',
                roam: false,
                type: 'treemap',
                visibleMin: 30,
                data: data,
                leafDepth: 4, //呈现层级，若为1加载时仅展开一层，接下来的每一层通过单击进入，如上面的效果图所示，
                //每一层级呈现的样式
                label: {
                    show: true ,
                    fontSize: 12,
                    //  color: '#000000',
                    formatter: function(params) {
                        var arr = [
                            params.name,
                            params.value + '(十亿美元)'
                        ];
                        return arr.join('\n');
                    }
                },
                upperLabel: {
                    show: true,
                    height: 25
                },
                itemStyle: {
                    borderColor: '#333'
                },
                levels: [{
                    colorSaturation: [0.2, 0.8],
                    itemStyle: {
                        normal: {
                            borderColor: '#333',
                            borderWidth: 1,
                            gapWidth: 2
                        }
                    }
                },
                    {
                        colorSaturation: [0.9, 0.9],
                        colorMappingBy: 'id',
                        itemStyle: {
                            normal: {
                                fontSize: 12,
                                gapWidth: 20,
                                borderWidth: 2
                            }
                        }
                    },
                ]
            }]
        };
        myChart.setOption(option,true);
    }
    function  toExper() {
        if(loginAccount==null||loginAccount==""||loginAccount=="guest___"){
            PlatformCommonUtils.warn('请检查是否已经登录！');
            return;
        }else{
            // window.location=usercontextpath+"/modeljz/toSimulate.page";
            window.open(usercontextpath+"/modeljz/toSimulate.page?type=CHN-GEO");
        }
    }

</script>
</body>
</html>
