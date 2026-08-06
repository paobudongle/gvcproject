<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>数智实验室</title>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="format-detection" content="telephone=no" />
    <link href="${pageContext.request.contextPath}/jsp/index/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/jsp/index/css/basic.css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/show.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/xajd/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/index/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/index/css/bootstrap.min.css"/>
    <!--[if lte IE 9]>
	<script src="${pageContext.request.contextPath}/jsp/index/js/lteie9.js"></script>
	<![endif]-->
    <script src="${pageContext.request.contextPath}/jsp/index/js/met_temdemo.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/index/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/echarts.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/global/scripts/util.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <%
        //获得id
        String id=request.getParameter("id");
    %>
    <style>

        /*.experiment-body{*/
        /*    display: none;*/
        /*}*/
        /*.experiment-body.active{*/
        /*    display: block;*/
        /*}*/
        .subcolumn_nav_met_16_1 .subcolumn_nav_met_16_1-ul > li a.active
        {
            background: #bd0a10;
        }
        a.active {
            padding: 10px 15px;
            background: #dc1111;
            border-radius: 3px;
        }
        .scdw table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
            border-radius: 3px;
            border: 1px solid #ddd; /* 表格外边框 */
            font-size: small;
            font-family: 'Microsoft YaHei', sans-serif;
        }

        .scdw thead {
            background-color: #f5698f;
            color: white;
        }

        .scdw th {
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 3px;

        }

        .scdw th:first-child {
            border-top-left-radius: 10px;
        }

        .scdw th:last-child {
            border-top-right-radius: 10px;
        }

        .scdw tbody tr {
            border-bottom: 1px solid #eaeaea;
            transition: background-color 0.2s;
        }

        .scdw td {
            padding: 16px 15px;
            vertical-align: top;
            border: 1px solid #eaeaea; /* 数据单元格边框 */
        }
    </style>
    <script type="text/javascript">
        $(function(){
            // var v=1000;
            // var w = $(".ac .thp").height();
            // if (w<v) {
            //     $(".ac .thp").css("height",v);
            // }else {
            //     $(".ac .thp").css("height",w);
            // }

            //经济生产（劳动参与率）
            ldcyl();
            //经济生产（农业）
            nyxbfb();
            //经济生产（工业）
            gyxbfb();

            //经济生产（服务业）
            fwxbfb();

            //社会再生产
            shzsc();

            //中等教育
            zdjy();


        })
        function zdjy() {//社会再生产
            var myChart = echarts.init(document.getElementById('zdjy'));
            // 数据预处理：将原始数据转换为 ECharts 所需格式
            var rawData = [
                { country: "Australia", countryCode: "AUS", gender: "女", data: [69.02, 70.77, 69.96, 67.77, 67.67, 66.08, 67.20, 69.00, 68.32, 68.30] },
                { country: "Australia", countryCode: "AUS", gender: "男", data: [81.04, 80.16, 79.81, 75.97, 76.05, 73.67, 74.87, 75.63, 75.51, 74.57] },
                { country: "Austria", countryCode: "AUT", gender: "女", data: [59.87, 59.63, 59.21, 59.66, 59.13, 58.01, 57.56, 60.31, 59.53, 57.43] },
                { country: "Austria", countryCode: "AUT", gender: "男", data: [67.28, 67.61, 67.49, 67.86, 67.51, 65.89, 66.19, 67.25, 67.12, 65.97] },
                { country: "Belgium", countryCode: "BEL", gender: "女", data: [53.75, 51.56, 51.29, 53.67, 53.07, 50.80, 49.92, 50.74, 49.82, 49.78] },
                { country: "Belgium", countryCode: "BEL", gender: "男", data: [66.57, 66.46, 65.20, 66.27, 65.69, 63.35, 62.79, 63.39, 62.79, 63.61] },
                { country: "Bulgaria", countryCode: "BGR", gender: "女", data: [53.40, 51.48, 54.07, 53.00, 53.28, 51.81, 49.93, 51.32, 50.51, 48.23] },
                { country: "Bulgaria", countryCode: "BGR", gender: "男", data: [67.71, 66.56, 68.93, 68.53, 68.65, 68.04, 66.17, 66.88, 66.37, 64.77] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "女", data: [null, null, 60.35, 61.32, 57.83, 57.31, 57.99, 58.56, 57.84] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "男", data: [null, null, 71.33, 73.39, 74.27, 75.50, 75.29, 77.43, 77.16] },
                { country: "Canada", countryCode: "CAN", gender: "女", data: [57.28, 56.82, 56.39, 55.51, 55.27, 52.59, 52.82, 53.75, 53.59, 52.04] },
                { country: "Canada", countryCode: "CAN", gender: "男", data: [71.32, 70.98, 71.02, 69.37, 69.65, 67.66, 67.78, 68.01, 67.88, 67.00] },
                { country: "Cyprus", countryCode: "CYP", gender: "女", data: [61.75, 58.40, 60.75, 61.95, 60.27, 56.29, 58.31, 60.64, 60.78, 58.29] },
                { country: "Cyprus", countryCode: "CYP", gender: "男", data: [73.95, 71.92, 73.06, 73.19, 73.38, 73.61, 74.83, 75.10, 74.39, 74.14] },
                { country: "Czechia", countryCode: "CZE", gender: "女", data: [55.36, 55.71, 55.69, 56.15, 55.77, 54.87, 54.14, 53.77, 53.78, 55.46] },
                { country: "Czechia", countryCode: "CZE", gender: "男", data: [70.84, 71.06, 71.07, 71.23, 71.05, 70.31, 70.14, 70.19, 71.03, 70.82] },
                { country: "Germany", countryCode: "DEU", gender: "女", data: [60.45, 61.38, 61.08, 60.82, 61.28, 59.20, 59.21, 59.41, 59.47, 59.00] },
                { country: "Germany", countryCode: "DEU", gender: "男", data: [67.87, 68.89, 68.66, 68.58, 68.97, 67.14, 67.27, 67.20, 67.64, 67.81] },
                { country: "Denmark", countryCode: "DNK", gender: "女", data: [62.36, 62.33, 62.38, 62.47, 62.20, 61.08, 60.57, 61.59, 61.47, 61.28] },
                { country: "Denmark", countryCode: "DNK", gender: "男", data: [70.22, 69.07, 68.58, 69.47, 70.12, 69.50, 69.26, 70.12, 69.76, 71.63] },
                { country: "Spain", countryCode: "ESP", gender: "女", data: [63.54, 64.73, 61.87, 61.60, 61.58, 57.82, 58.97, 59.66, 59.37, 58.09] },
                { country: "Spain", countryCode: "ESP", gender: "男", data: [73.63, 72.64, 71.41, 70.13, 70.81, 67.63, 67.79, 68.36, 68.20, 66.55] },
                { country: "Estonia", countryCode: "EST", gender: "女", data: [65.51, 66.49, 67.79, 67.85, 67.50, 68.04, 58.79, 60.54, 62.55, 62.59] },
                { country: "Estonia", countryCode: "EST", gender: "男", data: [80.17, 81.04, 80.74, 81.48, 80.99, 80.71, 74.64, 77.24, 77.35, 77.45] },
                { country: "Finland", countryCode: "FIN", gender: "女", data: [62.19, 60.91, 60.73, 59.49, 59.91, 58.42, 57.50, 61.56, 59.48, 59.42] },
                { country: "Finland", countryCode: "FIN", gender: "男", data: [71.84, 71.50, 71.32, 71.28, 71.51, 69.72, 72.20, 71.42, 69.86, 69.49] },
                { country: "France", countryCode: "FRA", gender: "女", data: [58.35, 58.11, 57.20, 56.73, 55.44, 53.35, 55.84, 55.61, 55.34, 55.03] },
                { country: "France", countryCode: "FRA", gender: "男", data: [66.06, 65.36, 64.64, 64.00, 62.68, 60.65, 62.38, 62.79, 62.20, 62.26] },
                { country: "United Kingdom", countryCode: "GBR", gender: "女", data: [72.56, 72.38, 72.79, 72.66, 73.08, 73.35, 72.32, 67.92, 67.45, 66.31] },
                { country: "United Kingdom", countryCode: "GBR", gender: "男", data: [79.81, 79.58, 80.33, 80.33, 79.92, 79.64, 78.11, 75.97, 75.93, 74.83] },
                { country: "Greece", countryCode: "GRC", gender: "女", data: [52.47, 52.40, 51.99, 50.82, 50.72, 49.63, 48.77, 49.50, 49.66, 50.26] },
                { country: "Greece", countryCode: "GRC", gender: "男", data: [68.41, 68.46, 68.89, 69.07, 68.38, 66.84, 67.46, 69.69, 69.56, 70.30] },
                { country: "Croatia", countryCode: "HRV", gender: "女", data: [57.10, 55.98, 56.04, 54.29, 53.22, 52.58, 53.20, 54.08, 52.87, 54.03] },
                { country: "Croatia", countryCode: "HRV", gender: "男", data: [65.95, 64.30, 64.86, 64.30, 64.03, 64.03, 64.65, 64.50, 63.74, 64.36] },
                { country: "Hungary", countryCode: "HUN", gender: "女", data: [55.59, 55.42, 55.54, 55.18, 54.70, 53.92, 56.99, 56.80, 56.72, 56.89] },
                { country: "Hungary", countryCode: "HUN", gender: "男", data: [71.03, 71.82, 72.21, 72.50, 73.19, 72.78, 72.40, 72.93, 72.23, 71.55] },
                { country: "Indonesia", countryCode: "IDN", gender: "女", data: [51.60, 51.80, 52.51, 54.21, 55.07, 53.48, 51.59, 50.60, 53.45] },
                { country: "Indonesia", countryCode: "IDN", gender: "男", data: [86.12, 85.96, 85.52, 86.68, 85.94, 84.95, 82.19, 84.24, 85.77] },
                { country: "Ireland", countryCode: "IRL", gender: "女", data: [56.99, 58.80, 57.87, 58.89, 58.60, 55.54, 57.47, 58.43, 57.56, 59.25] },
                { country: "Ireland", countryCode: "IRL", gender: "男", data: [76.30, 76.32, 75.30, 75.93, 76.08, 72.63, 74.00, 74.14, 77.13, 76.25] },
                { country: "Italy", countryCode: "ITA", gender: "女", data: [56.03, 56.45, 55.94, 55.39, 55.10, 53.21, 53.70, 54.22, 53.98, 53.35] },
                { country: "Italy", countryCode: "ITA", gender: "男", data: [72.26, 72.19, 71.72, 71.33, 70.98, 69.31, 69.52, 70.19, 70.43, 69.78] },
                { country: "Japan", countryCode: "JPN", gender: "女", data: [42.33, 42.47, 43.26, 44.75, 44.81, 44.59] },
                { country: "Japan", countryCode: "JPN", gender: "男", data: [67.17, 67.07, 67.18, 68.24, 68.27, 68.11] },
                { country: "Cambodia", countryCode: "KHM", gender: "女", data: [77.26, 80.39, 83.20, null, 63.33, 78.96, 81.28, null, 79.36] },
                { country: "Cambodia", countryCode: "KHM", gender: "男", data: [93.06, 90.06, 93.51, null, 76.49, 85.04, 89.22, null, 89.21] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "女", data: [53.04, 53.03, 53.91, 53.61, 53.54, 52.33, 52.62, 54.00, 54.47, 53.79] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "男", data: [72.14, 71.81, 72.03, 71.80, 71.69, 70.59, 69.89, 71.32, 70.81, 69.83] },
                { country: "Lao PDR", countryCode: "LAO", gender: "女", data: [62.75, null, 54.63, null, null, null, null, 59.71] },
                { country: "Lao PDR", countryCode: "LAO", gender: "男", data: [72.59, null, 61.35, null, null, null, null, 69.06] },
                { country: "Lithuania", countryCode: "LTU", gender: "女", data: [55.84, 55.24, 54.29, 54.06, 53.43, 52.69, 52.57, 52.58, 50.89, 50.22] },
                { country: "Lithuania", countryCode: "LTU", gender: "男", data: [70.16, 70.57, 70.31, 70.42, 69.17, 70.31, 68.08, 67.61, 68.40, 69.27] },
                { country: "Luxembourg", countryCode: "LUX", gender: "女", data: [55.88, 58.75, 58.65, 58.23, 55.63, 55.69, 53.01, 52.71, 53.13, 52.33] },
                { country: "Luxembourg", countryCode: "LUX", gender: "男", data: [64.42, 66.80, 62.69, 62.47, 62.27, 61.11, 61.47, 59.47, 60.45, 59.94] },
                { country: "Latvia", countryCode: "LVA", gender: "女", data: [60.88, 61.42, 61.89, 62.69, 61.21, 63.32, 49.80, 52.31, 51.23, 51.64] },
                { country: "Latvia", countryCode: "LVA", gender: "男", data: [76.05, 75.39, 77.20, 77.53, 74.59, 77.29, 71.34, 71.20, 71.07, 70.77] },
                { country: "Mexico", countryCode: "MEX", gender: "女", data: [50.02, 49.58, 48.78, 49.34, 50.07, 45.64, 49.14, 49.85, 51.29, 51.58] },
                { country: "Mexico", countryCode: "MEX", gender: "男", data: [79.11, 79.53, 79.07, 79.22, 79.72, 74.76, 78.37, 79.47, 79.51, 79.81] },
                { country: "Malta", countryCode: "MLT", gender: "女", data: [63.93, 63.73, 67.33, 65.60, 64.10, 66.28, 69.13, 69.60, 71.06, 70.45] },
                { country: "Malta", countryCode: "MLT", gender: "男", data: [74.56, 76.52, 77.15, 76.01, 77.95, 77.50, 78.51, 80.66, 81.51, 80.72] },
                { country: "Myanmar", countryCode: "MMR", gender: "女", data: [65.68, null, 35.99, 35.31, 43.08, 49.17] },
                { country: "Myanmar", countryCode: "MMR", gender: "男", data: [77.86, null, 58.58, 57.59, 75.52, 87.59] },
                { country: "Malaysia", countryCode: "MYS", gender: "女", data: [53.86, 53.10, 53.88, 54.38, null, 51.73, 53.30, 53.44] },
                { country: "Malaysia", countryCode: "MYS", gender: "男", data: [79.52, 79.41, 79.99, 80.90, null, 80.28, 83.17, 80.83] },
                { country: "Netherlands", countryCode: "NLD", gender: "女", data: [66.39, 65.69, 65.26, 65.64, 66.35, 65.51, 68.12, 68.74, 68.61, 67.78] },
                { country: "Netherlands", countryCode: "NLD", gender: "男", data: [72.88, 72.35, 72.73, 72.81, 72.48, 71.80, 73.34, 73.96, 75.46, 75.05] },
                { country: "Philippines", countryCode: "PHL", gender: "女", data: [62.11, 63.01, 38.42, null, null, null, 33.56, 38.84, 38.15] },
                { country: "Philippines", countryCode: "PHL", gender: "男", data: [87.62, 87.78, 64.64, null, null, null, 52.01, 56.75, 55.92] },
                { country: "Poland", countryCode: "POL", gender: "女", data: [50.24, 50.48, 49.91, 48.85, 47.51, 46.72, 48.90, 49.24, 48.36, 48.12] },
                { country: "Poland", countryCode: "POL", gender: "男", data: [70.13, 71.27, 71.07, 70.43, 70.93, 70.70, 72.66, 72.62, 72.04, 71.40] },
                { country: "Portugal", countryCode: "PRT", gender: "女", data: [73.54, 73.13, 73.48, 72.61, 73.60, 70.02, 70.04, 71.60, 73.07, 72.54] },
                { country: "Portugal", countryCode: "PRT", gender: "男", data: [75.89, 76.36, 76.81, 77.30, 76.97, 74.42, 75.01, 76.27, 77.10, 77.57] },
                { country: "Romania", countryCode: "ROU", gender: "女", data: [54.40, 53.65, 55.16, 54.56, 53.02, 51.94, 47.36, 47.89, 47.81, 48.16] },
                { country: "Romania", countryCode: "ROU", gender: "男", data: [71.90, 70.62, 71.60, 72.17, 71.22, 70.48, 65.79, 65.16, 64.71, 64.80] },
                { country: "Russian Federation", countryCode: "RUS", gender: "女", data: [69.41, 69.15, 61.75, 61.49, 60.13, 59.44, 59.47, 53.44, 53.45, 53.63] },
                { country: "Russian Federation", countryCode: "RUS", gender: "男", data: [83.99, 83.72, 79.40, 78.94, 77.82, 77.24, 78.15, 71.74, 71.69, 71.78] },
                { country: "Singapore", countryCode: "SGP", gender: "女", data: [null, null, null, null, null, 62.41, 61.31, 60.55, 56.12] },
                { country: "Singapore", countryCode: "SGP", gender: "男", data: [null, null, null, null, null, 75.94, 74.06, 73.24, 70.11] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "女", data: [58.13, 58.24, 58.31, 57.45, 56.86, 55.57, 57.10, 57.74, 58.70, 57.54] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "男", data: [73.58, 74.03, 73.26, 72.55, 71.77, 70.98, 71.46, 71.06, 70.70, 70.61] },
                { country: "Slovenia", countryCode: "SVN", gender: "女", data: [53.78, 52.96, 54.36, 55.26, 53.44, 51.98, 50.22, 50.61, 54.34, 54.46] },
                { country: "Slovenia", countryCode: "SVN", gender: "男", data: [65.47, 63.95, 65.22, 66.14, 65.39, 64.07, 63.69, 64.71, 65.54, 66.36] },
                { country: "Sweden", countryCode: "SWE", gender: "女", data: [73.44, 73.28, 73.82, 73.18, 73.33, 73.08, 63.67, 61.75, 63.41, 62.82] },
                { country: "Sweden", countryCode: "SWE", gender: "男", data: [79.74, 78.75, 79.47, 79.12, 79.17, 79.85, 73.19, 72.48, 72.75, 71.36] },
                { country: "Thailand", countryCode: "THA", gender: "女", data: [63.69, 63.48, 63.47, 63.78, 63.74, 64.06, 63.78, 64.34, 66.45, 66.20] },
                { country: "Thailand", countryCode: "THA", gender: "男", data: [80.38, 79.30, 78.58, 80.08, 79.74, 79.50, 79.44, 80.08, 81.58, 81.60] },
                { country: "United States", countryCode: "USA", gender: "女", data: [50.24, 50.25, 50.23, 49.89, 50.11, 48.23, 48.15, 48.93, 49.46, 49.46] },
                { country: "United States", countryCode: "USA", gender: "男", data: [64.71, 64.89, 64.85, 64.63, 64.61, 62.64, 62.76, 63.08, 63.15, 63.04] },
                { country: "Viet Nam", countryCode: "VNM", gender: "女", data: [69.92, 70.40, 70.58, 70.65, 72.50, 68.75, 68.35, 69.97, 67.53] },
                { country: "Viet Nam", countryCode: "VNM", gender: "男", data: [79.68, 80.04, 80.21, 80.25, 83.49, 80.20, 77.95, 80.07, 77.76] }
            ];

            // 年份列表
            const years = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

            // 构建国家映射对象，用于地图显示
            const countryMap = {};
            rawData.forEach(item => {
                if (!countryMap[item.country]) {
                    countryMap[item.country] = {
                        name: item.country,
                        femaleData: [],
                        maleData: []
                    };
                }
                if (item.gender === "女") {
                    countryMap[item.country].femaleData = item.data;
                } else {
                    countryMap[item.country].maleData = item.data;
                }
            });

            // 准备时间轴选项
            const timelineOptions = [];
            for (let i = 0; i < years.length; i++) {
                const seriesDataFemale = [];
                const seriesDataMale = [];

                Object.keys(countryMap).forEach(code => {
                    const countryInfo = countryMap[code];
                    if (countryInfo.femaleData[i] !== undefined) {
                        seriesDataFemale.push({ name: code, value: countryInfo.femaleData[i] });
                    }
                    if (countryInfo.maleData[i] !== undefined) {
                        seriesDataMale.push({ name: code, value: countryInfo.maleData[i] });
                    }
                });

                timelineOptions.push({
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataFemale
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataMale
                        }
                    ]
                });
            }

            // 配置项
            const option = {
                baseOption: {
                    timeline: {
                        axisType: 'category',
                        autoPlay: true,
                        playInterval: 2000,
                        data: years.map((year, idx) => ({
                            value: year
                        }))
                    },
                    title: {
                        text: '中等教育人口占比(2015-2024)',
                        subtext: '按性别划分'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name+`<br/>`+params.seriesName+":"+ params.value+`%`;
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 100,
                        inRange: {
                            color: ['#fff5f0', '#fc4e2a']
                        },
                        text: ['高', '低'],
                        calculable: true
                    },
                    legend: {
                        orient: 'vertical',
                        right: 10,
                        top: 'middle',
                        selectedMode: 'single',
                        selected: {
                            '女性': true,
                            '男性': false
                        },
                        data: ['女性', '男性']
                    },
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        }
                    ]
                },
                options: timelineOptions
            };
            myChart.resize();
            myChart.setOption(option,true);
        }
        function shzsc() {//社会再生产
            var myChart = echarts.init(document.getElementById('shzsc'));
            // 数据预处理：将原始数据转换为 ECharts 所需格式
            var rawData = [
                { country: "China", countryCode: "CHN", gender: "女", data: [null, null, null, 15.35] },
                { country: "China", countryCode: "CHN", gender: "男", data: [null, null, null, 5.90] },
                { country: "Australia", countryCode: "AUS", gender: "男", data: [null, null, null, null, null, 11.18] },
                { country: "Australia", countryCode: "AUS", gender: "女", data: [null, null, null, null, null, 17.12] },
                { country: "Austria", countryCode: "AUT", gender: "男", data: [null, null, null, null, null, null, 8.63] },
                { country: "Austria", countryCode: "AUT", gender: "女", data: [null, null, null, null, null, null, 15.79] },
                { country: "Canada", countryCode: "CAN", gender: "女", data: [14.17, null, null, null, null, null, null, null, 16.46] },
                { country: "Canada", countryCode: "CAN", gender: "男", data: [10.00, null, null, null, null, null, null, null, 11.63] },
                { country: "Germany", countryCode: "DEU", gender: "女", data: [null, null, null, null, null, null, 15.71] },
                { country: "Germany", countryCode: "DEU", gender: "男", data: [null, null, null, null, null, null, 10.54] },
                { country: "Estonia", countryCode: "EST", gender: "男", data: [null, null, null, null, 10.33] },
                { country: "Estonia", countryCode: "EST", gender: "女", data: [null, null, null, null, 15.54] },
                { country: "Finland", countryCode: "FIN", gender: "女", data: [null, null, null, null, 14.06] },
                { country: "Finland", countryCode: "FIN", gender: "男", data: [null, null, null, null, 10.75] },
                { country: "United Kingdom", countryCode: "GBR", gender: "男", data: [6.97, null, null, null, null, null, null, null, 12.25] },
                { country: "United Kingdom", countryCode: "GBR", gender: "女", data: [12.65, null, null, null, null, null, null, null, 16.01] },
                { country: "Japan", countryCode: "JPN", gender: "男", data: [3.13, null, null, null, null, null, 3.75] },
                { country: "Japan", countryCode: "JPN", gender: "女", data: [15.14, null, null, null, null, null, 14.71] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "女", data: [null, null, 12.85] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "男", data: [null, null, 3.82] },
                { country: "Lao PDR", countryCode: "LAO", gender: "女", data: [null, 13.60] },
                { country: "Lao PDR", countryCode: "LAO", gender: "男", data: [null, 10.06] },
                { country: "Mexico", countryCode: "MEX", gender: "男", data: [null, null, 8.82] },
                { country: "Mexico", countryCode: "MEX", gender: "女", data: [null, null, 24.21] },
                { country: "Portugal", countryCode: "PRT", gender: "女", data: [17.81] },
                { country: "Portugal", countryCode: "PRT", gender: "男", data: [10.24] },
                { country: "Russian Federation", countryCode: "RUS", gender: "女", data: [null, null, 18.00] },
                { country: "Russian Federation", countryCode: "RUS", gender: "男", data: [null, null, 7.80] },
                { country: "Thailand", countryCode: "THA", gender: "男", data: [3.25] },
                { country: "Thailand", countryCode: "THA", gender: "女", data: [11.04] },
                { country: "United States", countryCode: "USA", gender: "女", data: [15.88, 15.92, 15.42, 15.38, 15.33, null, 15.54, 15.08] },
                { country: "United States", countryCode: "USA", gender: "男", data: [9.75, 9.79, 9.88, 9.54, 9.67, null, 10.13, 10.08] }
            ];

            // 年份列表
            const years = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

            // 构建国家映射对象，用于地图显示
            const countryMap = {};
            rawData.forEach(item => {
                if (!countryMap[item.country]) {
                    countryMap[item.country] = {
                        name: item.country,
                        femaleData: [],
                        maleData: []
                    };
                }
                if (item.gender === "女") {
                    countryMap[item.country].femaleData = item.data;
                } else {
                    countryMap[item.country].maleData = item.data;
                }
            });

            // 准备时间轴选项
            const timelineOptions = [];
            for (let i = 0; i < years.length; i++) {
                const seriesDataFemale = [];
                const seriesDataMale = [];

                Object.keys(countryMap).forEach(code => {
                    const countryInfo = countryMap[code];
                    if (countryInfo.femaleData[i] !== undefined) {
                        seriesDataFemale.push({ name: code, value: countryInfo.femaleData[i] });
                    }
                    if (countryInfo.maleData[i] !== undefined) {
                        seriesDataMale.push({ name: code, value: countryInfo.maleData[i] });
                    }
                });

                timelineOptions.push({
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataFemale
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataMale
                        }
                    ]
                });
            }

            // 配置项
            const option = {
                baseOption: {
                    timeline: {
                        axisType: 'category',
                        autoPlay: true,
                        playInterval: 2000,
                        data: years.map((year, idx) => ({
                            value: year
                        }))
                    },
                    title: {
                        text: '无偿家务和照料时间占比(2015-2023)',
                        subtext: '按性别划分'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name+`<br/>`+params.seriesName+":"+ params.value+`%`;
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 100,
                        inRange: {
                            color: ['#fff5f0', '#fc4e2a']
                        },
                        text: ['高', '低'],
                        calculable: true
                    },
                    legend: {
                        orient: 'vertical',
                        right: 10,
                        top: 'middle',
                        selectedMode: 'single',
                        selected: {
                            '女性': true,
                            '男性': false
                        },
                        data: ['女性', '男性']
                    },
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        }
                    ]
                },
                options: timelineOptions
            };
            myChart.resize();
            myChart.setOption(option,true);
        }
        function fwxbfb() {//经济生产（工业）
            var myChart = echarts.init(document.getElementById('fwxbfb'));
            // 数据预处理：将原始数据转换为 ECharts 所需格式
            var rawData = [
                { country: "China", countryCode: "CHN", gender: "女", data: [48.31, 49.05, 49.59, 50.31, 51.17, 51.87, 51.92, 52.78, 53.13] },
                { country: "China", countryCode: "CHN", gender: "男", data: [37.58, 37.93, 38.15, 38.49, 38.91, 39.29, 39.16, 39.58, 39.76] },
                { country: "Australia", countryCode: "AUS", gender: "女", data: [90.32, 90.52, 90.69, 90.14, 90.78, 89.93, 90.18, 90.94, 90.53] },
                { country: "Australia", countryCode: "AUS", gender: "男", data: [66.16, 66.58, 66.89, 66.39, 67.42, 67.49, 68.24, 68.67, 68.08] },
                { country: "Austria", countryCode: "AUT", gender: "女", data: [83.64, 84.09, 84.90, 84.84, 85.01, 85.15, 84.33, 84.01, 84.61] },
                { country: "Austria", countryCode: "AUT", gender: "男", data: [57.35, 57.69, 58.97, 58.64, 58.69, 59.01, 58.62, 57.81, 59.22] },
                { country: "Belgium", countryCode: "BEL", gender: "女", data: [90.90, 91.06, 90.71, 90.79, 90.92, 91.04, 91.23, 90.88, 91.46] },
                { country: "Belgium", countryCode: "BEL", gender: "男", data: [65.66, 65.85, 67.31, 66.72, 67.11, 67.87, 69.53, 70.40, 68.88] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "女", data: [90.50, 90.54, 90.56, 90.70, 90.28, 89.82, 90.58, 89.73, 89.76] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "男", data: [76.17, 76.66, 76.98, 72.15, 68.99, 65.47, 65.01, 69.00, 69.12] },
                { country: "Bulgaria", countryCode: "BGR", gender: "女", data: [72.93, 73.41, 72.92, 73.36, 73.47, 73.14, 73.29, 74.18, 75.17] },
                { country: "Bulgaria", countryCode: "BGR", gender: "男", data: [54.68, 54.81, 54.51, 54.59, 54.62, 54.45, 53.90, 54.26, 55.54] },
                { country: "Cambodia", countryCode: "KHM", gender: "女", data: [30.93, 35.05, 35.11, 35.60, 36.07, 37.17, 36.76, 37.40, 37.75] },
                { country: "Cambodia", countryCode: "KHM", gender: "男", data: [34.17, 38.24, 37.44, 36.38, 35.26, 38.70, 36.16, 36.39, 36.46] },
                { country: "Canada", countryCode: "CAN", gender: "女", data: [90.34, 90.23, 90.46, 90.43, 90.64, 90.22, 90.29, 90.53, 90.50] },
                { country: "Canada", countryCode: "CAN", gender: "男", data: [67.55, 68.02, 68.22, 68.34, 68.85, 68.99, 69.50, 69.22, 69.60] },
                { country: "Croatia", countryCode: "HRV", gender: "女", data: [77.54, 79.91, 81.36, 79.73, 79.46, 79.76, 78.97, 80.21, 81.46] },
                { country: "Croatia", countryCode: "HRV", gender: "男", data: [52.54, 53.14, 54.16, 54.96, 54.85, 53.16, 52.10, 53.33, 55.82] },
                { country: "Cyprus", countryCode: "CYP", gender: "女", data: [91.68, 92.04, 92.09, 92.67, 91.74, 91.65, 91.83, 91.75, 92.22] },
                { country: "Cyprus", countryCode: "CYP", gender: "男", data: [69.70, 68.79, 70.72, 71.70, 68.95, 66.53, 69.18, 71.38, 72.19] },
                { country: "Czechia", countryCode: "CZE", gender: "女", data: [74.63, 74.16, 74.03, 74.35, 74.69, 74.86, 75.70, 76.22, 76.67] },
                { country: "Czechia", countryCode: "CZE", gender: "男", data: [46.97, 47.17, 47.41, 48.08, 48.48, 48.57, 48.79, 47.89, 49.33] },
                { country: "Denmark", countryCode: "DNK", gender: "女", data: [89.41, 89.80, 90.20, 90.36, 90.15, 90.04, 90.25, 89.68, 89.40] },
                { country: "Denmark", countryCode: "DNK", gender: "男", data: [68.15, 68.68, 68.94, 68.75, 69.60, 69.24, 68.36, 69.02, 69.08] },
                { country: "Estonia", countryCode: "EST", gender: "女", data: [79.75, 80.69, 80.51, 80.65, 80.90, 81.73, 81.63, 82.00, 84.34] },
                { country: "Estonia", countryCode: "EST", gender: "男", data: [50.38, 51.74, 52.55, 53.00, 54.52, 53.52, 55.42, 55.84, 56.05] },
                { country: "Finland", countryCode: "FIN", gender: "女", data: [89.08, 89.11, 89.31, 89.05, 89.15, 88.56, 88.66, 88.43, 88.71] },
                { country: "Finland", countryCode: "FIN", gender: "男", data: [59.93, 59.94, 60.01, 60.06, 61.02, 61.38, 61.43, 62.12, 61.49] },
                { country: "France", countryCode: "FRA", gender: "女", data: [88.93, 89.07, 88.54, 89.05, 89.01, 89.34, 88.86, 88.69, 88.61] },
                { country: "France", countryCode: "FRA", gender: "男", data: [65.70, 65.52, 66.37, 66.42, 66.04, 66.85, 67.72, 68.22, 68.44] },
                { country: "Germany", countryCode: "DEU", gender: "女", data: [85.20, 85.34, 85.28, 85.23, 85.28, 85.26, 85.02, 85.45, 86.02] },
                { country: "Germany", countryCode: "DEU", gender: "男", data: [58.55, 59.15, 59.16, 59.43, 59.74, 59.32, 59.22, 60.04, 60.29] },
                { country: "Greece", countryCode: "GRC", gender: "女", data: [80.15, 80.63, 80.82, 81.06, 81.99, 82.96, 81.33, 82.38, 82.08] },
                { country: "Greece", countryCode: "GRC", gender: "男", data: [66.76, 66.88, 66.95, 66.75, 67.32, 68.55, 67.46, 66.53, 65.34] },
                { country: "Hungary", countryCode: "HUN", gender: "女", data: [78.15, 77.71, 76.99, 76.98, 76.96, 77.36, 77.52, 77.60, 78.03] },
                { country: "Hungary", countryCode: "HUN", gender: "男", data: [52.96, 52.85, 51.67, 50.32, 51.32, 51.33, 52.62, 52.61, 52.43] },
                { country: "Indonesia", countryCode: "IDN", gender: "女", data: [51.61, 53.91, 54.49, 55.41, 56.76, 57.02, 58.06, 57.12, 57.42] },
                { country: "Indonesia", countryCode: "IDN", gender: "男", data: [40.77, 41.75, 42.49, 43.19, 43.85, 43.52, 43.40, 43.46, 43.76] },
                { country: "Ireland", countryCode: "IRL", gender: "女", data: [89.88, 89.50, 89.70, 90.04, 89.95, 89.30, 89.37, 89.12, 89.20] },
                { country: "Ireland", countryCode: "IRL", gender: "男", data: [65.35, 64.85, 64.58, 64.87, 65.59, 66.02, 65.79, 66.05, 67.37] },
                { country: "Italy", countryCode: "ITA", gender: "女", data: [84.29, 84.54, 84.86, 84.53, 84.61, 84.23, 84.16, 83.66, 84.06] },
                { country: "Italy", countryCode: "ITA", gender: "男", data: [59.18, 59.57, 59.67, 59.77, 59.83, 59.18, 58.59, 58.98, 59.33] },
                { country: "Japan", countryCode: "JPN", gender: "女", data: [82.64, 83.02, 83.09, 83.12, 83.39, 83.72, 83.95, 83.89, 83.86] },
                { country: "Japan", countryCode: "JPN", gender: "男", data: [62.99, 63.33, 63.30, 63.56, 63.82, 64.13, 64.37, 64.81, 64.61] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "女", data: [80.81, 81.62, 81.47, 81.68, 82.23, 82.15, 82.23, 82.19, 82.50] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "男", data: [61.11, 61.30, 61.22, 60.98, 61.29, 60.86, 60.83, 60.89, 61.48] },
                { country: "Lao PDR", countryCode: "LAO", gender: "女", data: [26.20, 27.51, 28.98, 28.25, 27.47, 26.41, 25.45, 24.80, 24.55] },
                { country: "Lao PDR", countryCode: "LAO", gender: "男", data: [26.80, 28.06, 29.43, 28.03, 26.54, 24.71, 23.54, 21.91, 21.69] },
                { country: "Latvia", countryCode: "LVA", gender: "女", data: [82.23, 81.61, 82.94, 82.99, 83.75, 82.71, 83.55, 83.18, 83.58] },
                { country: "Latvia", countryCode: "LVA", gender: "男", data: [54.46, 54.36, 56.47, 55.51, 54.03, 55.42, 55.91, 55.79, 56.95] },
                { country: "Lithuania", countryCode: "LTU", gender: "女", data: [76.90, 78.87, 79.01, 78.69, 79.30, 80.05, 80.12, 80.10, 80.10] },
                { country: "Lithuania", countryCode: "LTU", gender: "男", data: [54.38, 54.30, 54.57, 55.16, 56.20, 57.92, 56.86, 57.58, 58.29] },
                { country: "Luxembourg", countryCode: "LUX", gender: "女", data: [94.83, 94.49, 95.89, 95.30, 95.17, 95.64, 95.76, 95.50, 95.65] },
                { country: "Luxembourg", countryCode: "LUX", gender: "男", data: [79.50, 80.64, 80.97, 80.27, 82.89, 83.02, 84.15, 84.71, 84.26] },
                { country: "Malaysia", countryCode: "MYS", gender: "女", data: [73.04, 73.38, 73.59, 74.13, 74.53, 74.42, 74.52, 75.06, 75.27] },
                { country: "Malaysia", countryCode: "MYS", gender: "男", data: [52.37, 53.97, 54.14, 54.75, 55.13, 54.53, 54.38, 54.65, 54.81] },
                { country: "Malta", countryCode: "MLT", gender: "女", data: [91.18, 91.38, 90.37, 90.93, 90.95, 91.60, 91.93, 92.25, 91.04] },
                { country: "Malta", countryCode: "MLT", gender: "男", data: [70.54, 70.95, 71.80, 73.25, 72.57, 73.12, 73.66, 74.98, 74.33] },
                { country: "Mexico", countryCode: "MEX", gender: "女", data: [79.22, 78.87, 78.27, 78.30, 78.77, 78.52, 77.91, 77.54, 77.59] },
                { country: "Mexico", countryCode: "MEX", gender: "男", data: [51.65, 51.63, 51.46, 51.57, 52.03, 52.72, 52.25, 52.51, 53.26] },
                { country: "Myanmar", countryCode: "MMR", gender: "女", data: [35.48, 36.97, 38.52, 39.88, 39.78, 42.51, 42.71, 43.52, 43.76] },
                { country: "Myanmar", countryCode: "MMR", gender: "男", data: [28.96, 29.19, 29.45, 30.28, 29.70, 30.44, 30.79, 31.26, 31.46] },
                { country: "Netherlands", countryCode: "NLD", gender: "女", data: [92.39, 92.37, 92.29, 92.34, 92.29, 92.14, 93.00, 92.97, 92.87] },
                { country: "Netherlands", countryCode: "NLD", gender: "男", data: [71.64, 71.63, 71.55, 72.43, 72.55, 72.96, 75.64, 76.16, 76.15] },
                { country: "Philippines", countryCode: "PHL", gender: "女", data: [70.90, 72.59, 74.66, 75.68, 76.47, 75.69, 75.76, 76.06, 76.48] },
                { country: "Philippines", countryCode: "PHL", gender: "男", data: [43.75, 44.44, 44.83, 44.54, 46.01, 44.78, 44.50, 46.50, 46.95] },
                { country: "Poland", countryCode: "POL", gender: "女", data: [73.19, 73.76, 73.92, 74.18, 74.43, 74.57, 76.12, 76.54, 77.32] },
                { country: "Poland", countryCode: "POL", gender: "男", data: [45.51, 45.15, 45.32, 45.87, 46.10, 46.05, 47.97, 47.89, 50.43] },
                { country: "Portugal", countryCode: "PRT", gender: "女", data: [79.40, 80.10, 80.58, 80.75, 81.39, 81.12, 82.70, 82.67, 82.54] },
                { country: "Portugal", countryCode: "PRT", gender: "男", data: [57.50, 57.73, 57.86, 58.05, 58.86, 59.13, 63.12, 62.99, 61.97] },
                { country: "Romania", countryCode: "ROU", gender: "女", data: [54.35, 56.32, 56.01, 56.33, 58.07, 59.78, 59.50, 60.56, 60.41] },
                { country: "Romania", countryCode: "ROU", gender: "男", data: [39.41, 39.82, 40.13, 40.98, 41.52, 42.22, 40.88, 40.90, 40.44] },
                { country: "Russian Federation", countryCode: "RUS", gender: "女", data: [78.75, 78.91, 80.19, 80.29, 80.56, 80.68, 80.95, 81.39, 81.39] },
                { country: "Russian Federation", countryCode: "RUS", gender: "男", data: [54.18, 54.49, 54.86, 55.08, 54.94, 55.03, 54.86, 55.11, 55.09] },
                { country: "Singapore", countryCode: "SGP", gender: "女", data: [87.68, 88.40, 88.62, 88.48, 89.32, 89.17, 89.21, 89.24, 89.41] },
                { country: "Singapore", countryCode: "SGP", gender: "男", data: [78.81, 80.25, 80.58, 80.40, 81.64, 81.91, 82.52, 82.35, 82.59] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "女", data: [77.93, 77.48, 77.38, 78.26, 78.44, 77.74, 76.70, 78.50, 79.74] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "男", data: [46.98, 47.05, 45.88, 47.27, 46.87, 46.94, 45.93, 46.71, 47.64] },
                { country: "Slovenia", countryCode: "SVN", gender: "女", data: [74.68, 76.74, 76.24, 74.80, 76.11, 77.16, 79.65, 79.14, 78.27] },
                { country: "Slovenia", countryCode: "SVN", gender: "男", data: [49.58, 49.08, 48.55, 49.87, 49.47, 49.11, 54.53, 54.22, 51.70] },
                { country: "Spain", countryCode: "ESP", gender: "女", data: [89.25, 89.47, 88.89, 88.73, 88.55, 88.52, 88.86, 88.73, 88.93] },
                { country: "Spain", countryCode: "ESP", gender: "男", data: [65.09, 65.26, 64.64, 64.53, 64.77, 64.72, 64.73, 65.54, 65.88] },
                { country: "Sweden", countryCode: "SWE", gender: "女", data: [92.07, 92.06, 91.90, 92.02, 92.19, 91.92, 91.10, 91.81, 91.85] },
                { country: "Sweden", countryCode: "SWE", gender: "男", data: [68.37, 68.82, 69.20, 69.26, 68.82, 69.29, 69.91, 71.26, 71.17] },
                { country: "Thailand", countryCode: "THA", gender: "女", data: [49.34, 51.00, 51.58, 50.80, 51.90, 52.60, 52.57, 53.95, 54.40] },
                { country: "Thailand", countryCode: "THA", gender: "男", data: [39.49, 40.13, 40.62, 40.12, 40.41, 40.51, 40.17, 41.76, 42.15] },
                { country: "United Kingdom", countryCode: "GBR", gender: "女", data: [91.63, 91.71, 91.63, 91.89, 91.63, 91.57, 91.56, 91.56, 91.69] },
                { country: "United Kingdom", countryCode: "GBR", gender: "男", data: [70.09, 70.35, 70.70, 70.90, 71.01, 71.01, 70.94, 71.41, 71.72] },
                { country: "United States", countryCode: "USA", gender: "女", data: [90.49, 90.61, 90.62, 90.57, 90.45, 90.38, 90.56, 90.45, 90.37] },
                { country: "United States", countryCode: "USA", gender: "男", data: [68.94, 69.01, 69.07, 68.97, 68.99, 69.37, 69.73, 69.70, 69.62] },
                { country: "Viet Nam", countryCode: "VNM", gender: "女", data: [35.18, 35.69, 36.68, 38.32, 39.25, 39.36, 41.90, 38.63, 38.58] },
                { country: "Viet Nam", countryCode: "VNM", gender: "男", data: [31.36, 31.13, 31.57, 32.96, 33.62, 33.52, 33.97, 33.24, 33.14] }
            ];

            // 年份列表
            const years = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

            // 构建国家映射对象，用于地图显示
            const countryMap = {};
            rawData.forEach(item => {
                if (!countryMap[item.country]) {
                    countryMap[item.country] = {
                        name: item.country,
                        femaleData: [],
                        maleData: []
                    };
                }
                if (item.gender === "女") {
                    countryMap[item.country].femaleData = item.data;
                } else {
                    countryMap[item.country].maleData = item.data;
                }
            });

            // 准备时间轴选项
            const timelineOptions = [];
            for (let i = 0; i < years.length; i++) {
                const seriesDataFemale = [];
                const seriesDataMale = [];

                Object.keys(countryMap).forEach(code => {
                    const countryInfo = countryMap[code];
                    if (countryInfo.femaleData[i] !== undefined) {
                        seriesDataFemale.push({ name: code, value: countryInfo.femaleData[i] });
                    }
                    if (countryInfo.maleData[i] !== undefined) {
                        seriesDataMale.push({ name: code, value: countryInfo.maleData[i] });
                    }
                });

                timelineOptions.push({
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataFemale
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataMale
                        }
                    ]
                });
            }

            // 配置项
            const option = {
                baseOption: {
                    timeline: {
                        axisType: 'category',
                        autoPlay: true,
                        playInterval: 2000,
                        data: years.map((year, idx) => ({
                            value: year
                        }))
                    },
                    title: {
                        text: '服务业领域女/男性就业人数（占女/男性就业人数的百分比）变化趋势(2015-2023)',
                        subtext: '按性别划分'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name+`<br/>`+params.seriesName+":"+ params.value+`%`;
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 100,
                        inRange: {
                            color: ['#fff5f0', '#fc4e2a']
                        },
                        text: ['高', '低'],
                        calculable: true
                    },
                    legend: {
                        orient: 'vertical',
                        right: 10,
                        top: 'middle',
                        selectedMode: 'single',
                        selected: {
                            '女性': true,
                            '男性': false
                        },
                        data: ['女性', '男性']
                    },
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        }
                    ]
                },
                options: timelineOptions
            };
            myChart.resize();
            myChart.setOption(option,true);
        }
        function gyxbfb() {//经济生产（工业）
            var myChart = echarts.init(document.getElementById('gyxbfb'));
            // 数据预处理：将原始数据转换为 ECharts 所需格式
            var rawData = [
                { country: "China", countryCode: "CHN", gender: "女", data: [27.56, 27.67, 27.77, 27.94, 28.13, 28.55, 28.42, 28.24, 28.27] },
                { country: "China", countryCode: "CHN", gender: "男", data: [30.72, 31.27, 31.84, 32.46, 33.04, 33.79, 34.34, 34.53, 34.80] },
                { country: "Australia", countryCode: "AUS", gender: "女", data: [7.83, 7.72, 7.66, 8.18, 7.50, 8.16, 8.03, 7.71, 7.98] },
                { country: "Australia", countryCode: "AUS", gender: "男", data: [30.53, 30.05, 29.69, 30.17, 29.28, 28.99, 28.64, 28.41, 29.17] },
                { country: "Austria", countryCode: "AUT", gender: "女", data: [12.15, 11.98, 11.42, 11.88, 11.80, 11.47, 12.27, 12.81, 12.81] },
                { country: "Austria", countryCode: "AUT", gender: "男", data: [37.83, 37.59, 36.88, 37.30, 37.25, 36.70, 37.35, 38.34, 37.19] },
                { country: "Belgium", countryCode: "BEL", gender: "女", data: [8.37, 8.18, 8.59, 8.58, 8.44, 8.32, 8.22, 8.55, 7.89] },
                { country: "Belgium", countryCode: "BEL", gender: "男", data: [32.77, 32.47, 31.13, 31.98, 31.71, 30.98, 29.20, 28.39, 29.65] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "女", data: [9.09, 9.03, 9.01, 8.77, 9.03, 9.55, 9.13, 9.32, 9.38] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "男", data: [21.83, 21.33, 21.02, 26.44, 28.25, 32.74, 32.87, 29.13, 28.96] },
                { country: "Bulgaria", countryCode: "BGR", gender: "女", data: [22.74, 22.35, 22.54, 22.40, 22.23, 22.60, 22.61, 21.58, 21.25] },
                { country: "Bulgaria", countryCode: "BGR", gender: "男", data: [36.23, 36.25, 36.31, 36.80, 36.75, 36.95, 37.92, 37.38, 36.93] },
                { country: "Cambodia", countryCode: "KHM", gender: "女", data: [24.35, 24.46, 24.55, 23.79, 23.06, 23.32, 23.55, 23.60, 23.94] },
                { country: "Cambodia", countryCode: "KHM", gender: "男", data: [25.45, 26.99, 26.40, 26.08, 25.83, 26.89, 29.08, 29.13, 29.66] },
                { country: "Canada", countryCode: "CAN", gender: "女", data: [8.62, 8.64, 8.58, 8.61, 8.35, 8.75, 8.80, 8.64, 8.65] },
                { country: "Canada", countryCode: "CAN", gender: "男", data: [30.26, 29.30, 29.77, 29.64, 29.14, 28.99, 28.74, 29.04, 28.74] },
                { country: "Croatia", countryCode: "HRV", gender: "女", data: [15.03, 14.55, 13.51, 15.19, 16.12, 15.75, 16.07, 15.84, 15.27] },
                { country: "Croatia", countryCode: "HRV", gender: "男", data: [36.69, 37.51, 37.30, 37.81, 37.45, 38.72, 39.53, 39.11, 38.26] },
                { country: "Cyprus", countryCode: "CYP", gender: "女", data: [6.26, 6.34, 6.84, 6.31, 6.99, 6.81, 6.99, 7.39, 7.01] },
                { country: "Cyprus", countryCode: "CYP", gender: "男", data: [24.66, 25.90, 25.54, 25.19, 27.71, 29.77, 26.63, 25.03, 24.07] },
                { country: "Czechia", countryCode: "CZE", gender: "女", data: [23.73, 24.12, 24.18, 23.89, 23.57, 23.54, 22.79, 22.03, 21.54] },
                { country: "Czechia", countryCode: "CZE", gender: "男", data: [49.10, 49.00, 48.98, 48.30, 48.12, 48.03, 47.85, 48.70, 47.15] },
                { country: "Denmark", countryCode: "DNK", gender: "女", data: [9.59, 9.29, 8.87, 8.68, 8.75, 8.98, 8.83, 9.26, 9.61] },
                { country: "Denmark", countryCode: "DNK", gender: "男", data: [28.05, 27.72, 27.91, 27.96, 27.19, 27.65, 28.60, 27.92, 27.97] },
                { country: "Estonia", countryCode: "EST", gender: "女", data: [17.69, 17.36, 17.63, 17.70, 17.55, 16.71, 16.94, 16.36, 14.50] },
                { country: "Estonia", countryCode: "EST", gender: "男", data: [44.19, 42.50, 42.13, 41.89, 40.46, 41.96, 40.68, 40.61, 39.95] },
                { country: "Finland", countryCode: "FIN", gender: "女", data: [8.72, 8.80, 8.54, 8.89, 8.79, 9.40, 9.20, 9.61, 9.55] },
                { country: "Finland", countryCode: "FIN", gender: "男", data: [33.94, 34.54, 34.73, 34.71, 33.61, 33.49, 32.65, 32.43, 33.11] },
                { country: "France", countryCode: "FRA", gender: "女", data: [9.42, 9.29, 9.89, 9.57, 9.54, 9.23, 9.69, 9.74, 9.78] },
                { country: "France", countryCode: "FRA", gender: "男", data: [30.55, 30.47, 30.07, 30.06, 30.47, 29.94, 28.76, 28.23, 28.20] },
                { country: "Germany", countryCode: "DEU", gender: "女", data: [13.84, 13.77, 13.84, 13.92, 13.89, 13.92, 14.05, 13.66, 13.16] },
                { country: "Germany", countryCode: "DEU", gender: "男", data: [39.68, 39.18, 39.22, 38.97, 38.73, 39.12, 39.26, 38.41, 38.18] },
                { country: "Greece", countryCode: "GRC", gender: "女", data: [8.12, 8.31, 8.33, 7.90, 7.86, 7.83, 8.41, 7.85, 8.09] },
                { country: "Greece", countryCode: "GRC", gender: "男", data: [20.17, 20.55, 20.78, 20.81, 20.79, 20.35, 20.36, 21.28, 21.94] },
                { country: "Hungary", countryCode: "HUN", gender: "女", data: [19.16, 19.40, 20.12, 20.25, 20.16, 19.77, 19.85, 19.84, 19.40] },
                { country: "Hungary", countryCode: "HUN", gender: "男", data: [40.19, 40.21, 41.43, 43.02, 42.37, 42.30, 41.45, 41.44, 41.49] },
                { country: "Indonesia", countryCode: "IDN", gender: "女", data: [15.77, 16.00, 16.66, 16.98, 16.65, 15.81, 15.91, 16.32, 16.46] },
                { country: "Indonesia", countryCode: "IDN", gender: "男", data: [25.93, 25.34, 25.47, 25.72, 26.02, 25.32, 25.65, 25.48, 25.74] },
                { country: "Ireland", countryCode: "IRL", gender: "女", data: [8.52, 8.96, 8.74, 8.50, 8.84, 9.24, 9.32, 9.63, 9.53] },
                { country: "Ireland", countryCode: "IRL", gender: "男", data: [26.20, 26.69, 27.42, 27.57, 27.24, 26.94, 26.97, 27.58, 26.17] },
                { country: "Italy", countryCode: "ITA", gender: "女", data: [13.28, 12.94, 12.79, 13.08, 13.01, 13.36, 13.37, 14.01, 13.76] },
                { country: "Italy", countryCode: "ITA", gender: "男", data: [36.13, 35.57, 35.52, 35.49, 35.18, 35.71, 36.22, 36.18, 36.04] },
                { country: "Japan", countryCode: "JPN", gender: "女", data: [14.30, 14.09, 14.06, 13.94, 13.78, 13.58, 13.49, 13.55, 13.70] },
                { country: "Japan", countryCode: "JPN", gender: "男", data: [33.18, 32.91, 33.01, 32.68, 32.57, 32.36, 32.17, 31.66, 31.92] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "女", data: [13.81, 13.38, 13.75, 13.56, 12.92, 12.91, 12.98, 12.92, 12.75] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "男", data: [33.76, 33.80, 33.75, 33.85, 33.35, 33.45, 33.41, 33.27, 32.75] },
                { country: "Lao PDR", countryCode: "LAO", gender: "女", data: [7.41, 7.56, 7.70, 7.28, 6.88, 6.57, 6.17, 5.64, 5.61] },
                { country: "Lao PDR", countryCode: "LAO", gender: "男", data: [11.08, 11.29, 11.55, 10.78, 10.09, 9.53, 9.21, 8.52, 8.85] },
                { country: "Latvia", countryCode: "LVA", gender: "女", data: [12.73, 13.33, 12.86, 13.01, 11.90, 13.22, 12.62, 12.61, 12.47] },
                { country: "Latvia", countryCode: "LVA", gender: "男", data: [34.67, 35.23, 33.95, 34.50, 35.69, 34.18, 34.36, 34.82, 33.47] },
                { country: "Lithuania", countryCode: "LTU", gender: "女", data: [16.47, 15.59, 15.59, 16.62, 16.55, 16.26, 16.36, 16.21, 16.47] },
                { country: "Lithuania", countryCode: "LTU", gender: "男", data: [34.02, 35.17, 35.15, 35.11, 35.03, 34.41, 36.05, 35.20, 35.03] },
                { country: "Luxembourg", countryCode: "LUX", gender: "女", data: [4.42, 4.90, 3.41, 4.23, 4.41, 3.86, 3.69, 3.79, 3.81] },
                { country: "Luxembourg", countryCode: "LUX", gender: "男", data: [19.21, 17.98, 17.05, 18.18, 16.21, 15.97, 14.20, 13.89, 14.57] },
                { country: "Malaysia", countryCode: "MYS", gender: "女", data: [19.15, 19.88, 19.70, 19.61, 19.50, 19.52, 19.42, 19.10, 19.00] },
                { country: "Malaysia", countryCode: "MYS", gender: "男", data: [32.43, 31.95, 31.90, 32.06, 32.16, 32.43, 32.87, 32.88, 32.92] },
                { country: "Malta", countryCode: "MLT", gender: "女", data: [8.44, 8.39, 9.42, 8.75, 8.61, 8.10, 7.70, 7.48, 8.59] },
                { country: "Malta", countryCode: "MLT", gender: "男", data: [27.31, 27.28, 26.68, 25.29, 26.04, 25.25, 25.13, 23.84, 24.03] },
                { country: "Mexico", countryCode: "MEX", gender: "女", data: [16.46, 16.84, 17.30, 17.45, 16.91, 16.98, 17.12, 17.45, 17.64] },
                { country: "Mexico", countryCode: "MEX", gender: "男", data: [28.58, 29.08, 29.31, 29.49, 29.38, 28.64, 29.13, 29.87, 29.97] },
                { country: "Myanmar", countryCode: "MMR", gender: "女", data: [14.51, 14.85, 15.16, 16.73, 16.70, 18.08, 18.07, 18.24, 18.37] },
                { country: "Myanmar", countryCode: "MMR", gender: "男", data: [18.24, 17.10, 16.04, 17.20, 16.60, 18.87, 19.04, 18.98, 18.95] },
                { country: "Netherlands", countryCode: "NLD", gender: "女", data: [6.10, 6.24, 6.24, 6.36, 6.33, 6.58, 5.55, 5.75, 5.79] },
                { country: "Netherlands", countryCode: "NLD", gender: "男", data: [25.35, 25.35, 25.49, 24.77, 24.75, 24.28, 21.39, 21.35, 21.45] },
                { country: "Philippines", countryCode: "PHL", gender: "女", data: [10.03, 10.00, 9.92, 9.87, 9.75, 9.19, 8.74, 8.81, 8.79] },
                { country: "Philippines", countryCode: "PHL", gender: "男", data: [20.30, 22.33, 23.48, 24.91, 25.22, 24.20, 25.44, 25.23, 25.30] },
                { country: "Poland", countryCode: "POL", gender: "女", data: [16.45, 16.85, 17.21, 17.40, 17.49, 17.15, 16.88, 16.54, 16.59] },
                { country: "Poland", countryCode: "POL", gender: "男", data: [42.00, 43.30, 43.37, 43.54, 43.89, 43.31, 42.49, 42.75, 40.69] },
                { country: "Portugal", countryCode: "PRT", gender: "女", data: [15.22, 15.13, 15.26, 15.34, 15.00, 15.41, 15.70, 15.68, 15.75] },
                { country: "Portugal", countryCode: "PRT", gender: "男", data: [32.97, 33.36, 33.67, 33.90, 33.88, 33.71, 33.09, 33.11, 33.89] },
                { country: "Romania", countryCode: "ROU", gender: "女", data: [20.03, 21.05, 21.70, 21.46, 20.92, 20.28, 22.27, 22.06, 22.61] },
                { country: "Romania", countryCode: "ROU", gender: "男", data: [35.02, 36.72, 36.71, 36.64, 37.06, 36.85, 39.77, 40.21, 40.99] },
                { country: "Russian Federation", countryCode: "RUS", gender: "女", data: [16.14, 16.07, 15.78, 15.72, 15.44, 15.17, 15.13, 14.76, 14.80] },
                { country: "Russian Federation", countryCode: "RUS", gender: "男", data: [37.60, 37.19, 37.48, 37.25, 37.50, 37.22, 37.46, 37.24, 37.41] },
                { country: "Singapore", countryCode: "SGP", gender: "女", data: [12.12, 11.42, 11.21, 11.37, 10.54, 10.71, 10.68, 10.68, 10.51] },
                { country: "Singapore", countryCode: "SGP", gender: "男", data: [20.91, 19.51, 19.22, 19.43, 18.22, 17.97, 17.38, 17.55, 17.31] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "女", data: [20.82, 21.11, 21.26, 20.55, 20.22, 21.10, 21.51, 20.27, 18.98] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "男", data: [48.45, 48.87, 50.30, 49.52, 49.15, 49.30, 49.60, 49.59, 49.02] },
                { country: "Slovenia", countryCode: "SVN", gender: "女", data: [18.27, 19.16, 19.01, 20.39, 20.44, 19.15, 16.71, 17.03, 18.35] },
                { country: "Slovenia", countryCode: "SVN", gender: "男", data: [43.56, 45.26, 45.39, 44.37, 45.62, 46.60, 41.17, 41.14, 43.72] },
                { country: "Spain", countryCode: "ESP", gender: "女", data: [8.65, 8.40, 8.84, 9.11, 9.41, 9.54, 9.05, 9.39, 9.14] },
                { country: "Spain", countryCode: "ESP", gender: "男", data: [29.13, 28.80, 29.29, 29.59, 29.55, 29.61, 29.56, 29.05, 29.05] },
                { country: "Sweden", countryCode: "SWE", gender: "女", data: [6.90, 6.94, 7.09, 7.14, 7.11, 7.32, 7.89, 7.37, 7.32] },
                { country: "Sweden", countryCode: "SWE", gender: "男", data: [28.67, 28.48, 28.23, 28.19, 28.60, 28.12, 27.26, 25.95, 26.22] },
                { country: "Thailand", countryCode: "THA", gender: "女", data: [20.82, 20.55, 19.90, 19.99, 19.79, 19.44, 19.02, 19.05, 18.98] },
                { country: "Thailand", countryCode: "THA", gender: "男", data: [26.12, 26.35, 25.37, 25.21, 25.46, 25.25, 25.00, 24.93, 24.80] },
                { country: "United Kingdom", countryCode: "GBR", gender: "女", data: [7.72, 7.66, 7.71, 7.49, 7.78, 7.85, 7.86, 7.86, 7.75] },
                { country: "United Kingdom", countryCode: "GBR", gender: "男", data: [28.35, 28.09, 27.68, 27.63, 27.54, 27.53, 27.62, 27.19, 26.91] },
                { country: "United States", countryCode: "USA", gender: "女", data: [8.55, 8.42, 8.43, 8.47, 8.59, 8.59, 8.45, 8.56, 8.64] },
                { country: "United States", countryCode: "USA", gender: "男", data: [28.60, 28.54, 28.48, 28.71, 28.72, 28.30, 28.06, 28.16, 28.32] },
                { country: "Viet Nam", countryCode: "VNM", gender: "女", data: [19.33, 20.79, 21.82, 22.88, 24.89, 26.81, 29.34, 26.71, 27.30] },
                { country: "Viet Nam", countryCode: "VNM", gender: "男", data: [26.05, 28.61, 29.57, 30.35, 32.75, 34.99, 36.72, 34.45, 34.96] }
            ];

            // 年份列表
            const years = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

            // 构建国家映射对象，用于地图显示
            const countryMap = {};
            rawData.forEach(item => {
                if (!countryMap[item.country]) {
                    countryMap[item.country] = {
                        name: item.country,
                        femaleData: [],
                        maleData: []
                    };
                }
                if (item.gender === "女") {
                    countryMap[item.country].femaleData = item.data;
                } else {
                    countryMap[item.country].maleData = item.data;
                }
            });

            // 准备时间轴选项
            const timelineOptions = [];
            for (let i = 0; i < years.length; i++) {
                const seriesDataFemale = [];
                const seriesDataMale = [];

                Object.keys(countryMap).forEach(code => {
                    const countryInfo = countryMap[code];
                    if (countryInfo.femaleData[i] !== undefined) {
                        seriesDataFemale.push({ name: code, value: countryInfo.femaleData[i] });
                    }
                    if (countryInfo.maleData[i] !== undefined) {
                        seriesDataMale.push({ name: code, value: countryInfo.maleData[i] });
                    }
                });

                timelineOptions.push({
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataFemale
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataMale
                        }
                    ]
                });
            }

            // 配置项
            const option = {
                baseOption: {
                    timeline: {
                        axisType: 'category',
                        autoPlay: true,
                        playInterval: 2000,
                        data: years.map((year, idx) => ({
                            value: year
                        }))
                    },
                    title: {
                        text: '工业领域女/男性就业人数（占女/男性就业人数的百分比）变化趋势(2015-2023)',
                        subtext: '按性别划分'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name+`<br/>`+params.seriesName+":"+ params.value+`%`;
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 100,
                        inRange: {
                            color: ['#fff5f0', '#fc4e2a']
                        },
                        text: ['高', '低'],
                        calculable: true
                    },
                    legend: {
                        orient: 'vertical',
                        right: 10,
                        top: 'middle',
                        selectedMode: 'single',
                        selected: {
                            '女性': true,
                            '男性': false
                        },
                        data: ['女性', '男性']
                    },
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        }
                    ]
                },
                options: timelineOptions
            };
            myChart.resize();
            myChart.setOption(option,true);
        }
        function nyxbfb() {//经济生产（农业）
            var myChart = echarts.init(document.getElementById('nyxbfb'));
            // 数据预处理：将原始数据转换为 ECharts 所需格式
            var rawData = [
                { country: "China", countryCode: "CHN", gender: "女", data: [24.13, 23.28, 22.63, 21.75, 20.69, 19.58, 19.66, 18.98, 18.60] },
                { country: "China", countryCode: "CHN", gender: "男", data: [31.71, 30.81, 30.01, 29.04, 28.05, 26.92, 26.49, 25.89, 25.44] },
                { country: "Australia", countryCode: "AUS", gender: "女", data: [1.85, 1.75, 1.66, 1.68, 1.72, 1.91, 1.79, 1.36, 1.49] },
                { country: "Australia", countryCode: "AUS", gender: "男", data: [3.31, 3.37, 3.42, 3.44, 3.30, 3.53, 3.12, 2.92, 2.74] },
                { country: "Austria", countryCode: "AUT", gender: "女", data: [4.21, 3.93, 3.68, 3.28, 3.19, 3.38, 3.39, 3.18, 2.58] },
                { country: "Austria", countryCode: "AUT", gender: "男", data: [4.82, 4.72, 4.15, 4.05, 4.07, 4.29, 4.03, 3.85, 3.59] },
                { country: "Belgium", countryCode: "BEL", gender: "女", data: [0.73, 0.75, 0.71, 0.64, 0.63, 0.64, 0.55, 0.56, 0.65] },
                { country: "Belgium", countryCode: "BEL", gender: "男", data: [1.56, 1.68, 1.55, 1.31, 1.17, 1.16, 1.27, 1.21, 1.48] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "女", data: [0.42, 0.42, 0.43, 0.53, 0.69, 0.63, 0.29, 0.95, 0.86] },
                { country: "Brunei Darussalam", countryCode: "BRN", gender: "男", data: [2.00, 2.00, 2.00, 1.41, 2.76, 1.79, 2.12, 1.87, 1.92] },
                { country: "Bulgaria", countryCode: "BGR", gender: "女", data: [4.33, 4.24, 4.54, 4.24, 4.30, 4.25, 4.09, 4.25, 3.58] },
                { country: "Bulgaria", countryCode: "BGR", gender: "男", data: [9.09, 8.94, 9.18, 8.61, 8.63, 8.59, 8.19, 8.37, 7.53] },
                { country: "Cambodia", countryCode: "KHM", gender: "女", data: [44.71, 40.49, 40.34, 40.60, 40.87, 39.51, 39.69, 39.00, 38.31] },
                { country: "Cambodia", countryCode: "KHM", gender: "男", data: [40.39, 34.77, 36.16, 37.54, 38.91, 34.41, 34.75, 34.49, 33.88] },
                { country: "Canada", countryCode: "CAN", gender: "女", data: [1.03, 1.13, 0.96, 0.96, 1.01, 1.02, 0.92, 0.83, 0.85] },
                { country: "Canada", countryCode: "CAN", gender: "男", data: [2.19, 2.68, 2.01, 2.02, 2.01, 2.02, 1.76, 1.74, 1.65] },
                { country: "Croatia", countryCode: "HRV", gender: "女", data: [7.43, 5.55, 5.13, 5.07, 4.42, 4.49, 4.96, 3.95, 3.27] },
                { country: "Croatia", countryCode: "HRV", gender: "男", data: [10.77, 9.35, 8.54, 7.23, 7.70, 8.12, 8.37, 7.56, 5.92] },
                { country: "Cyprus", countryCode: "CYP", gender: "女", data: [2.05, 1.62, 1.07, 1.01, 1.27, 1.54, 1.18, 0.86, 0.77] },
                { country: "Cyprus", countryCode: "CYP", gender: "男", data: [5.64, 5.31, 3.74, 3.12, 3.34, 3.70, 4.19, 3.59, 3.74] },
                { country: "Czechia", countryCode: "CZE", gender: "女", data: [1.64, 1.72, 1.79, 1.76, 1.74, 1.60, 1.51, 1.75, 1.79] },
                { country: "Czechia", countryCode: "CZE", gender: "男", data: [3.93, 3.83, 3.60, 3.63, 3.40, 3.40, 3.37, 3.41, 3.52] },
                { country: "Denmark", countryCode: "DNK", gender: "女", data: [1.00, 0.91, 0.93, 0.95, 1.10, 0.98, 0.92, 1.07, 0.99] },
                { country: "Denmark", countryCode: "DNK", gender: "男", data: [3.80, 3.60, 3.16, 3.29, 3.21, 3.11, 3.04, 3.06, 2.95] },
                { country: "Estonia", countryCode: "EST", gender: "女", data: [2.56, 1.95, 1.86, 1.65, 1.54, 1.56, 1.42, 1.64, 1.17] },
                { country: "Estonia", countryCode: "EST", gender: "男", data: [5.43, 5.76, 5.31, 5.11, 5.02, 4.52, 3.90, 3.55, 4.00] },
                { country: "Finland", countryCode: "FIN", gender: "女", data: [2.20, 2.09, 2.15, 2.07, 2.06, 2.05, 2.14, 1.96, 1.73] },
                { country: "Finland", countryCode: "FIN", gender: "男", data: [6.13, 5.51, 5.25, 5.22, 5.37, 5.13, 5.92, 5.45, 5.40] },
                { country: "France", countryCode: "FRA", gender: "女", data: [1.65, 1.64, 1.57, 1.38, 1.46, 1.43, 1.45, 1.56, 1.60] },
                { country: "France", countryCode: "FRA", gender: "男", data: [3.76, 4.01, 3.56, 3.53, 3.50, 3.21, 3.52, 3.55, 3.36] },
                { country: "Germany", countryCode: "DEU", gender: "女", data: [0.95, 0.89, 0.88, 0.85, 0.83, 0.82, 0.93, 0.89, 0.82] },
                { country: "Germany", countryCode: "DEU", gender: "男", data: [1.77, 1.67, 1.62, 1.60, 1.53, 1.57, 1.52, 1.55, 1.53] },
                { country: "Greece", countryCode: "GRC", gender: "女", data: [11.73, 11.07, 10.85, 11.04, 10.15, 9.20, 10.26, 9.77, 9.83] },
                { country: "Greece", countryCode: "GRC", gender: "男", data: [13.07, 12.56, 12.27, 12.44, 11.89, 11.09, 12.17, 12.18, 12.73] },
                { country: "Hungary", countryCode: "HUN", gender: "女", data: [2.69, 2.89, 2.89, 2.77, 2.88, 2.88, 2.63, 2.56, 2.56] },
                { country: "Hungary", countryCode: "HUN", gender: "男", data: [6.85, 6.94, 6.91, 6.66, 6.31, 6.37, 5.92, 5.94, 6.08] },
                { country: "Indonesia", countryCode: "IDN", gender: "女", data: [32.63, 30.09, 28.85, 27.60, 26.59, 27.17, 26.02, 26.56, 26.12] },
                { country: "Indonesia", countryCode: "IDN", gender: "男", data: [33.30, 32.92, 32.04, 31.09, 30.13, 31.16, 30.95, 31.06, 30.49] },
                { country: "Ireland", countryCode: "IRL", gender: "女", data: [1.60, 1.54, 1.56, 1.46, 1.21, 1.46, 1.31, 1.25, 1.27] },
                { country: "Ireland", countryCode: "IRL", gender: "男", data: [8.45, 8.46, 8.01, 7.56, 7.18, 7.04, 7.24, 6.37, 6.46] },
                { country: "Italy", countryCode: "ITA", gender: "女", data: [2.44, 2.52, 2.35, 2.39, 2.38, 2.41, 2.47, 2.33, 2.18] },
                { country: "Italy", countryCode: "ITA", gender: "男", data: [4.69, 4.86, 4.81, 4.74, 4.99, 5.11, 5.19, 4.84, 4.63] },
                { country: "Japan", countryCode: "JPN", gender: "女", data: [3.06, 2.90, 2.84, 2.93, 2.83, 2.69, 2.55, 2.57, 2.44] },
                { country: "Japan", countryCode: "JPN", gender: "男", data: [3.83, 3.75, 3.70, 3.76, 3.61, 3.51, 3.47, 3.53, 3.47] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "女", data: [5.38, 4.99, 4.78, 4.75, 4.85, 4.95, 4.80, 4.89, 4.75] },
                { country: "Korea, Rep.", countryCode: "KOR", gender: "男", data: [5.13, 4.90, 5.03, 5.18, 5.37, 5.69, 5.76, 5.85, 5.77] },
                { country: "Lao PDR", countryCode: "LAO", gender: "女", data: [66.38, 64.94, 63.33, 64.47, 65.65, 67.02, 68.38, 69.56, 69.84] },
                { country: "Lao PDR", countryCode: "LAO", gender: "男", data: [62.12, 60.66, 59.02, 61.19, 63.37, 65.75, 67.25, 69.57, 69.46] },
                { country: "Latvia", countryCode: "LVA", gender: "女", data: [5.04, 5.06, 4.20, 4.01, 4.35, 4.07, 3.84, 4.22, 3.95] },
                { country: "Latvia", countryCode: "LVA", gender: "男", data: [10.86, 10.41, 9.58, 9.99, 10.28, 10.40, 9.73, 9.39, 9.58] },
                { country: "Lithuania", countryCode: "LTU", gender: "女", data: [6.63, 5.55, 5.41, 4.69, 4.15, 3.70, 3.52, 3.69, 3.42] },
                { country: "Lithuania", countryCode: "LTU", gender: "男", data: [11.61, 10.53, 10.28, 9.72, 8.77, 7.67, 7.09, 7.22, 6.67] },
                { country: "Luxembourg", countryCode: "LUX", gender: "女", data: [0.75, 0.61, 0.70, 0.47, 0.43, 0.50, 0.56, 0.71, 0.53] },
                { country: "Luxembourg", countryCode: "LUX", gender: "男", data: [1.29, 1.37, 1.98, 1.55, 0.90, 1.01, 1.64, 1.40, 1.16] },
                { country: "Malaysia", countryCode: "MYS", gender: "女", data: [7.81, 6.74, 6.72, 6.26, 5.97, 6.06, 6.06, 5.83, 5.72] },
                { country: "Malaysia", countryCode: "MYS", gender: "男", data: [15.20, 14.08, 13.97, 13.18, 12.71, 13.04, 12.76, 12.47, 12.27] },
                { country: "Malta", countryCode: "MLT", gender: "女", data: [0.37, 0.23, 0.21, 0.32, 0.45, 0.30, 0.38, 0.27, 0.38] },
                { country: "Malta", countryCode: "MLT", gender: "男", data: [2.16, 1.77, 1.52, 1.46, 1.39, 1.63, 1.21, 1.18, 1.63] },
                { country: "Mexico", countryCode: "MEX", gender: "女", data: [4.32, 4.29, 4.43, 4.25, 4.32, 4.50, 4.97, 5.01, 4.77] },
                { country: "Mexico", countryCode: "MEX", gender: "男", data: [19.78, 19.28, 19.22, 18.94, 18.59, 18.64, 18.62, 17.63, 16.77] },
                { country: "Myanmar", countryCode: "MMR", gender: "女", data: [50.00, 48.18, 46.31, 43.39, 43.52, 39.41, 39.22, 38.23, 37.87] },
                { country: "Myanmar", countryCode: "MMR", gender: "男", data: [52.80, 53.71, 54.51, 52.52, 53.70, 50.68, 50.17, 49.75, 49.58] },
                { country: "Netherlands", countryCode: "NLD", gender: "女", data: [1.52, 1.39, 1.47, 1.30, 1.38, 1.28, 1.45, 1.27, 1.35] },
                { country: "Netherlands", countryCode: "NLD", gender: "男", data: [3.01, 3.01, 2.96, 2.80, 2.69, 2.77, 2.97, 2.48, 2.41] },
                { country: "Philippines", countryCode: "PHL", gender: "女", data: [19.07, 17.41, 15.42, 14.45, 13.78, 15.12, 15.50, 15.12, 14.73] },
                { country: "Philippines", countryCode: "PHL", gender: "男", data: [35.94, 33.23, 31.69, 30.55, 28.78, 31.02, 30.06, 28.27, 27.75] },
                { country: "Poland", countryCode: "POL", gender: "女", data: [10.36, 9.40, 8.87, 8.42, 8.08, 8.28, 7.00, 6.92, 6.09] },
                { country: "Poland", countryCode: "POL", gender: "男", data: [12.49, 11.55, 11.32, 10.59, 10.01, 10.64, 9.55, 9.37, 8.88] },
                { country: "Portugal", countryCode: "PRT", gender: "女", data: [5.38, 4.77, 4.17, 3.91, 3.61, 3.47, 1.60, 1.65, 1.71] },
                { country: "Portugal", countryCode: "PRT", gender: "男", data: [9.53, 8.91, 8.46, 8.05, 7.26, 7.17, 3.79, 3.90, 4.14] },
                { country: "Romania", countryCode: "ROU", gender: "女", data: [25.61, 22.64, 22.29, 22.22, 21.01, 19.94, 18.22, 17.37, 16.98] },
                { country: "Romania", countryCode: "ROU", gender: "男", data: [25.56, 23.46, 23.16, 22.38, 21.42, 20.93, 19.35, 18.89, 18.57] },
                { country: "Russian Federation", countryCode: "RUS", gender: "女", data: [5.11, 5.02, 4.03, 3.99, 4.00, 4.16, 3.92, 3.85, 3.80] },
                { country: "Russian Federation", countryCode: "RUS", gender: "男", data: [8.22, 8.32, 7.66, 7.67, 7.56, 7.75, 7.68, 7.65, 7.50] },
                { country: "Singapore", countryCode: "SGP", gender: "女", data: [0.20, 0.18, 0.17, 0.15, 0.14, 0.12, 0.11, 0.08, 0.08] },
                { country: "Singapore", countryCode: "SGP", gender: "男", data: [0.28, 0.23, 0.20, 0.17, 0.14, 0.12, 0.11, 0.10, 0.10] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "女", data: [1.25, 1.41, 1.36, 1.19, 1.34, 1.17, 1.79, 1.23, 1.28] },
                { country: "Slovak Republic", countryCode: "SVK", gender: "男", data: [4.57, 4.08, 3.82, 3.20, 3.98, 3.75, 4.47, 3.70, 3.35] },
                { country: "Slovenia", countryCode: "SVN", gender: "女", data: [7.06, 4.11, 4.76, 4.81, 3.45, 3.69, 3.64, 3.83, 3.38] },
                { country: "Slovenia", countryCode: "SVN", gender: "男", data: [6.86, 5.66, 6.06, 5.76, 4.91, 4.28, 4.29, 4.64, 4.58] },
                { country: "Spain", countryCode: "ESP", gender: "女", data: [2.10, 2.13, 2.27, 2.16, 2.04, 1.94, 2.09, 1.89, 1.92] },
                { country: "Spain", countryCode: "ESP", gender: "男", data: [5.78, 5.94, 6.07, 5.89, 5.68, 5.67, 5.72, 5.41, 5.07] },
                { country: "Sweden", countryCode: "SWE", gender: "女", data: [1.02, 1.00, 1.02, 0.84, 0.70, 0.76, 1.01, 0.81, 0.83] },
                { country: "Sweden", countryCode: "SWE", gender: "男", data: [2.96, 2.69, 2.57, 2.54, 2.58, 2.59, 2.83, 2.78, 2.61] },
                { country: "Thailand", countryCode: "THA", gender: "女", data: [29.84, 28.45, 28.52, 29.21, 28.31, 27.97, 28.41, 27.00, 26.62] },
                { country: "Thailand", countryCode: "THA", gender: "男", data: [34.40, 33.53, 34.01, 34.67, 34.13, 34.25, 34.83, 33.31, 33.06] },
                { country: "United Kingdom", countryCode: "GBR", gender: "女", data: [0.65, 0.63, 0.65, 0.62, 0.59, 0.58, 0.58, 0.57, 0.56] },
                { country: "United Kingdom", countryCode: "GBR", gender: "男", data: [1.57, 1.56, 1.62, 1.47, 1.46, 1.46, 1.44, 1.40, 1.38] },
                { country: "United States", countryCode: "USA", gender: "女", data: [0.96, 0.97, 0.95, 0.96, 0.95, 1.03, 0.99, 0.99, 0.99] },
                { country: "United States", countryCode: "USA", gender: "男", data: [2.46, 2.45, 2.44, 2.32, 2.28, 2.33, 2.22, 2.14, 2.06] },
                { country: "Viet Nam", countryCode: "VNM", gender: "女", data: [45.49, 43.53, 41.50, 38.81, 35.86, 33.83, 28.76, 34.66, 34.13] },
                { country: "Viet Nam", countryCode: "VNM", gender: "男", data: [42.59, 40.26, 38.86, 36.69, 33.63, 31.49, 29.31, 32.32, 31.90] }
            ];

            // 年份列表
            const years = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'];

            // 构建国家映射对象，用于地图显示
            const countryMap = {};
            rawData.forEach(item => {
                if (!countryMap[item.country]) {
                    countryMap[item.country] = {
                        name: item.country,
                        femaleData: [],
                        maleData: []
                    };
                }
                if (item.gender === "女") {
                    countryMap[item.country].femaleData = item.data;
                } else {
                    countryMap[item.country].maleData = item.data;
                }
            });

            // 准备时间轴选项
            const timelineOptions = [];
            for (let i = 0; i < years.length; i++) {
                const seriesDataFemale = [];
                const seriesDataMale = [];

                Object.keys(countryMap).forEach(code => {
                    const countryInfo = countryMap[code];
                    if (countryInfo.femaleData[i] !== undefined) {
                        seriesDataFemale.push({ name: code, value: countryInfo.femaleData[i] });
                    }
                    if (countryInfo.maleData[i] !== undefined) {
                        seriesDataMale.push({ name: code, value: countryInfo.maleData[i] });
                    }
                });

                timelineOptions.push({
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataFemale
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataMale
                        }
                    ]
                });
            }

            // 配置项
            const option = {
                baseOption: {
                    timeline: {
                        axisType: 'category',
                        autoPlay: true,
                        playInterval: 2000,
                        data: years.map((year, idx) => ({
                            value: year
                        }))
                    },
                    title: {
                        text: '农业领域女/男性就业人数（占女/男性就业人数的百分比）变化趋势(2015-2023)',
                        subtext: '按性别划分'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name+`<br/>`+params.seriesName+":"+ params.value+`%`;
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 100,
                        inRange: {
                            color: ['#fff5f0', '#fc4e2a']
                        },
                        text: ['高', '低'],
                        calculable: true
                    },
                    legend: {
                        orient: 'vertical',
                        right: 10,
                        top: 'middle',
                        selectedMode: 'single',
                        selected: {
                            '女性': true,
                            '男性': false
                        },
                        data: ['女性', '男性']
                    },
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        }
                    ]
                },
                options: timelineOptions
            };
            myChart.resize();
            myChart.setOption(option,true);
        }
        function ldcyl() {//经济生产（劳动参与率）
            var myChart = echarts.init(document.getElementById('ldcyl'));
            // 数据预处理：将原始数据转换为 ECharts 所需格式
            var rawData = [
                { country: "Australia", countryCode: "AU", gender: "女", data: [59.15, 59.38, 59.88, 60.52, 60.96, 60.21, 61.27, 62.31, 62.37, 62.36] },
                { country: "Australia", countryCode: "AU", gender: "男", data: [71.18, 70.70, 70.79, 71.07, 71.23, 70.16, 70.81, 71.23, 71.33, 71.21] },
                { country: "Austria", countryCode: "AT", gender: "女", data: [54.83, 55.35, 55.35, 55.43, 55.51, 55.22, 55.35, 55.69, 55.81, 55.55] },
                { country: "Austria", countryCode: "AT", gender: "男", data: [65.93, 66.32, 66.24, 66.68, 66.54, 65.75, 66.17, 66.33, 66.13, 65.82] },
                { country: "Belgium", countryCode: "BE", gender: "女", data: [48.05, 47.81, 47.97, 48.77, 49.10, 48.66, 49.37, 50.03, 49.83, 49.80] },
                { country: "Belgium", countryCode: "BE", gender: "男", data: [58.95, 58.77, 58.95, 58.79, 58.91, 58.31, 58.93, 59.32, 59.16, 58.95] },
                { country: "Bulgaria", countryCode: "BG", gender: "男", data: [60.11, 59.64, 61.67, 61.96, 63.40, 62.69, 62.10, 63.21, 63.15, 62.96] },
                { country: "Bulgaria", countryCode: "BG", gender: "女", data: [48.73, 47.44, 49.60, 49.18, 50.22, 49.31, 49.03, 50.65, 51.04, 50.90] },
                { country: "Brunei Darussalam", countryCode: "BN", gender: "女", data: [57.38, 57.41, 57.46, 57.72, 55.06, 54.56, 54.79, 53.70, 53.53, 53.19] },
                { country: "Brunei Darussalam", countryCode: "BN", gender: "男", data: [72.97, 72.43, 71.94, 74.02, 73.26, 72.26, 71.79, 73.11, 73.09, 72.95] },
                { country: "Canada", countryCode: "CA", gender: "男", data: [70.94, 70.53, 70.64, 70.25, 70.48, 68.93, 69.86, 69.55, 69.69, 69.56] },
                { country: "Canada", countryCode: "CA", gender: "女", data: [60.97, 60.88, 61.07, 60.97, 61.25, 59.38, 60.64, 61.05, 61.13, 61.03] },
                { country: "China", countryCode: "CN", gender: "女", data: [62.57, 62.29, 61.91, 61.53, 61.25, 59.91, 61.18, 59.89, 59.95, 59.56] },
                { country: "China", countryCode: "CN", gender: "男", data: [75.88, 75.33, 74.65, 73.95, 73.38, 71.92, 72.92, 71.59, 71.60, 71.11] },
                { country: "Cyprus", countryCode: "CY", gender: "男", data: [69.16, 69.18, 69.77, 71.08, 72.07, 72.36, 73.37, 73.99, 73.29, 73.06] },
                { country: "Cyprus", countryCode: "CY", gender: "女", data: [59.10, 58.28, 58.92, 59.63, 60.10, 59.05, 59.53, 61.22, 62.48, 62.41] },
                { country: "Czechia", countryCode: "CZ", gender: "女", data: [51.19, 51.74, 52.11, 52.56, 52.30, 51.46, 51.56, 52.19, 53.24, 53.06] },
                { country: "Czechia", countryCode: "CZ", gender: "男", data: [67.96, 68.29, 68.41, 68.54, 68.28, 67.81, 67.69, 67.87, 67.93, 67.61] },
                { country: "Germany", countryCode: "DE", gender: "女", data: [54.44, 54.81, 55.14, 55.21, 55.71, 55.11, 55.02, 55.60, 55.85, 55.64] },
                { country: "Germany", countryCode: "DE", gender: "男", data: [66.26, 66.24, 66.40, 66.72, 67.12, 66.05, 65.98, 66.47, 66.59, 66.33] },
                { country: "Denmark", countryCode: "DK", gender: "女", data: [56.84, 57.68, 57.74, 57.65, 58.06, 57.85, 58.22, 59.55, 59.81, 59.77] },
                { country: "Denmark", countryCode: "DK", gender: "男", data: [66.11, 65.91, 66.01, 66.26, 66.93, 66.50, 67.32, 67.55, 67.79, 67.75] },
                { country: "Spain", countryCode: "ES", gender: "女", data: [52.62, 52.49, 52.28, 51.87, 52.04, 50.92, 52.39, 52.57, 52.84, 52.60] },
                { country: "Spain", countryCode: "ES", gender: "男", data: [64.92, 64.46, 64.11, 63.70, 63.51, 62.17, 62.74, 63.19, 62.82, 62.41] },
                { country: "Estonia", countryCode: "EE", gender: "女", data: [55.75, 56.30, 57.01, 57.28, 57.34, 57.13, 57.78, 60.14, 61.05, 60.83] },
                { country: "Estonia", countryCode: "EE", gender: "男", data: [68.95, 70.07, 70.52, 70.70, 69.86, 69.81, 69.37, 70.79, 70.79, 70.44] },
                { country: "Finland", countryCode: "FI", gender: "女", data: [55.41, 54.98, 55.03, 55.69, 55.68, 55.18, 55.93, 57.27, 57.49, 57.44] },
                { country: "Finland", countryCode: "FI", gender: "男", data: [62.28, 62.27, 62.46, 63.08, 62.83, 62.66, 63.75, 63.69, 63.16, 63.12] },
                { country: "France", countryCode: "FR", gender: "女", data: [50.96, 50.83, 50.63, 50.81, 50.62, 50.05, 51.59, 51.87, 51.83, 51.68] },
                { country: "France", countryCode: "FR", gender: "男", data: [60.73, 60.40, 60.32, 60.21, 59.66, 58.88, 59.85, 60.18, 59.80, 59.57] },
                { country: "United Kingdom", countryCode: "GB", gender: "女", data: [56.70, 57.05, 57.25, 57.51, 58.01, 58.25, 58.00, 57.70, 57.37, 57.28] },
                { country: "United Kingdom", countryCode: "GB", gender: "男", data: [68.08, 68.01, 67.80, 67.97, 67.43, 67.06, 66.10, 66.32, 66.42, 66.29] },
                { country: "Greece", countryCode: "GR", gender: "女", data: [44.03, 44.09, 43.83, 43.39, 43.51, 42.72, 43.26, 44.41, 44.67, 44.49] },
                { country: "Greece", countryCode: "GR", gender: "男", data: [59.03, 58.86, 58.88, 58.89, 58.84, 58.01, 58.00, 59.87, 59.58, 59.37] },
                { country: "Croatia", countryCode: "HR", gender: "女", data: [46.70, 45.20, 45.30, 45.20, 44.91, 44.48, 45.68, 46.92, 47.14, 47.02] },
                { country: "Croatia", countryCode: "HR", gender: "男", data: [59.20, 57.80, 58.27, 57.49, 57.71, 58.20, 58.77, 59.00, 57.86, 57.63] },
                { country: "Hungary", countryCode: "HU", gender: "女", data: [49.90, 50.83, 51.05, 51.58, 51.41, 51.38, 52.30, 53.12, 53.94, 53.89] },
                { country: "Hungary", countryCode: "HU", gender: "男", data: [63.30, 64.53, 65.40, 65.89, 66.41, 66.42, 66.90, 67.48, 67.89, 67.87] },
                { country: "Indonesia", countryCode: "ID", gender: "男", data: [82.49, 81.77, 81.53, 82.25, 82.60, 81.67, 79.74, 81.55, 81.46, 81.42] },
                { country: "Indonesia", countryCode: "ID", gender: "女", data: [50.77, 50.95, 51.94, 53.13, 53.95, 53.20, 52.07, 52.56, 52.55, 52.58] },
                { country: "Ireland", countryCode: "IE", gender: "男", data: [69.02, 68.96, 68.49, 68.51, 68.64, 67.35, 69.49, 70.02, 70.48, 70.44] },
                { country: "Ireland", countryCode: "IE", gender: "女", data: [54.81, 55.53, 55.59, 56.00, 56.21, 55.06, 57.97, 59.23, 59.97, 60.12] },
                { country: "Italy", countryCode: "IT", gender: "女", data: [39.39, 40.07, 40.58, 40.74, 40.89, 39.51, 39.88, 40.52, 41.31, 41.28] },
                { country: "Italy", countryCode: "IT", gender: "男", data: [58.59, 58.96, 59.07, 59.08, 58.87, 57.58, 57.56, 58.09, 58.82, 58.63] },
                { country: "Japan", countryCode: "JP", gender: "女", data: [49.41, 50.21, 51.03, 52.37, 53.24, 53.09, 53.52, 54.17, 54.85, 55.30] },
                { country: "Japan", countryCode: "JP", gender: "男", data: [70.21, 70.36, 70.44, 71.08, 71.32, 71.35, 71.27, 71.36, 71.46, 71.59] },
                { country: "Cambodia", countryCode: "KH", gender: "男", data: [86.36, 88.08, 86.85, 87.44, 88.03, 87.83, 85.80, 86.53, 86.47, 86.46] },
                { country: "Cambodia", countryCode: "KH", gender: "女", data: [73.42, 75.92, 76.42, 76.84, 77.28, 77.09, 73.71, 74.00, 73.99, 73.96] },
                { country: "Korea, Rep.", countryCode: "KR", gender: "女", data: [52.39, 52.57, 53.07, 53.22, 53.77, 53.14, 53.65, 55.03, 56.04, 56.02] },
                { country: "Korea, Rep.", countryCode: "KR", gender: "男", data: [72.80, 72.74, 72.81, 72.36, 72.29, 71.50, 71.55, 72.66, 72.58, 72.46] },
                { country: "Lao PDR", countryCode: "LA", gender: "女", data: [56.20, 56.11, 56.02, 57.05, 58.09, 58.62, 60.10, 61.37, 61.37, 61.47] },
                { country: "Lao PDR", countryCode: "LA", gender: "男", data: [63.87, 63.71, 63.54, 64.87, 66.22, 67.06, 68.53, 70.64, 70.60, 70.74] },
                { country: "Lithuania", countryCode: "LT", gender: "女", data: [54.43, 55.61, 55.82, 56.49, 57.23, 57.36, 57.37, 58.04, 57.91, 57.87] },
                { country: "Lithuania", countryCode: "LT", gender: "男", data: [64.88, 66.01, 66.42, 67.62, 67.83, 68.87, 68.04, 68.21, 68.62, 68.54] },
                { country: "Luxembourg", countryCode: "LU", gender: "女", data: [54.25, 53.83, 54.21, 54.96, 55.06, 55.93, 56.93, 57.00, 57.21, 57.10] },
                { country: "Luxembourg", countryCode: "LU", gender: "男", data: [65.52, 64.60, 63.46, 63.77, 65.13, 64.25, 66.00, 64.86, 65.81, 65.50] },
                { country: "Latvia", countryCode: "LV", gender: "女", data: [54.03, 54.86, 55.06, 55.64, 55.47, 55.84, 54.17, 55.30, 55.38, 55.05] },
                { country: "Latvia", countryCode: "LV", gender: "男", data: [67.40, 67.07, 67.80, 68.31, 67.92, 68.51, 67.23, 67.75, 67.74, 67.30] },
                { country: "Mexico", countryCode: "MX", gender: "男", data: [78.57, 78.27, 78.24, 78.17, 78.06, 72.49, 76.67, 77.31, 77.55, 77.42] },
                { country: "Mexico", countryCode: "MX", gender: "女", data: [43.93, 43.99, 43.63, 44.13, 45.57, 41.70, 44.62, 46.00, 47.32, 47.36] },
                { country: "Malta", countryCode: "MT", gender: "男", data: [68.26, 67.91, 68.50, 69.89, 70.74, 70.88, 71.50, 71.31, 71.59, 71.48] },
                { country: "Malta", countryCode: "MT", gender: "女", data: [43.02, 44.45, 46.00, 48.71, 50.42, 52.23, 53.33, 55.47, 55.02, 55.29] },
                { country: "Myanmar", countryCode: "MM", gender: "女", data: [50.80, 49.23, 47.66, 48.44, 46.29, 44.73, 41.04, 41.04, 41.06, 40.95] },
                { country: "Myanmar", countryCode: "MM", gender: "男", data: [78.95, 77.86, 76.74, 76.63, 75.07, 75.97, 69.72, 69.66, 69.79, 69.71] },
                { country: "Malaysia", countryCode: "MY", gender: "女", data: [50.83, 50.98, 51.28, 51.62, 51.78, 51.39, 51.39, 51.60, 51.57, 51.60] },
                { country: "Malaysia", countryCode: "MY", gender: "男", data: [78.18, 77.80, 77.69, 78.05, 78.42, 78.06, 78.42, 78.30, 78.34, 78.37] },
                { country: "Netherlands", countryCode: "NL", gender: "男", data: [72.32, 71.86, 71.45, 71.69, 71.79, 71.32, 71.17, 71.89, 72.33, 72.15] },
                { country: "Netherlands", countryCode: "NL", gender: "女", data: [60.76, 60.80, 60.86, 61.09, 61.59, 61.70, 61.80, 62.44, 62.94, 62.88] },
                { country: "Philippines", countryCode: "PH", gender: "女", data: [48.67, 48.19, 45.05, 45.53, 46.57, 42.68, 44.20, 50.38, 50.37, 49.95] },
                { country: "Philippines", countryCode: "PH", gender: "男", data: [74.44, 75.28, 73.53, 72.71, 72.59, 67.07, 69.00, 72.74, 72.65, 72.33] },
                { country: "Poland", countryCode: "PL", gender: "男", data: [65.22, 65.59, 66.01, 65.85, 65.98, 66.10, 66.72, 66.59, 66.50, 66.17] },
                { country: "Poland", countryCode: "PL", gender: "女", data: [49.14, 49.18, 49.32, 49.43, 49.18, 48.92, 50.57, 51.17, 51.87, 51.60] },
                { country: "Portugal", countryCode: "PT", gender: "男", data: [64.04, 64.02, 64.39, 64.22, 64.10, 62.62, 61.79, 62.55, 63.12, 62.89] },
                { country: "Portugal", countryCode: "PT", gender: "女", data: [53.69, 53.39, 53.93, 54.31, 54.52, 53.12, 53.35, 54.17, 54.89, 54.69] },
                { country: "Romania", countryCode: "RO", gender: "男", data: [60.81, 60.55, 61.28, 61.52, 61.87, 62.05, 63.02, 62.86, 62.11, 61.87] },
                { country: "Romania", countryCode: "RO", gender: "女", data: [42.68, 42.28, 43.31, 43.06, 43.06, 42.80, 42.77, 43.17, 42.01, 41.79] },
                { country: "Russian Federation", countryCode: "RU", gender: "男", data: [71.35, 71.57, 71.16, 70.94, 70.04, 69.55, 70.23, 69.92, 69.50, 68.84] },
                { country: "Russian Federation", countryCode: "RU", gender: "女", data: [55.61, 55.73, 55.35, 55.45, 54.82, 54.66, 55.17, 55.30, 55.20, 54.63] },
                { country: "Singapore", countryCode: "SG", gender: "男", data: [77.00, 76.52, 76.52, 75.80, 75.66, 75.21, 76.54, 76.09, 76.27, 76.79] },
                { country: "Singapore", countryCode: "SG", gender: "女", data: [61.31, 61.31, 60.81, 60.89, 61.82, 61.72, 64.41, 62.92, 61.97, 62.35] },
                { country: "Slovak Republic", countryCode: "SK", gender: "男", data: [67.86, 68.03, 67.66, 67.72, 67.44, 66.49, 66.16, 66.99, 67.03, 66.64] },
                { country: "Slovak Republic", countryCode: "SK", gender: "女", data: [51.93, 52.51, 52.63, 52.24, 52.17, 51.80, 54.62, 55.69, 55.72, 55.43] },
                { country: "Slovenia", countryCode: "SI", gender: "女", data: [52.28, 52.11, 53.54, 53.72, 53.38, 53.11, 53.47, 53.88, 53.53, 53.26] },
                { country: "Slovenia", countryCode: "SI", gender: "男", data: [63.07, 61.71, 63.69, 64.27, 63.42, 62.52, 63.29, 64.23, 63.82, 63.45] },
                { country: "Sweden", countryCode: "SE", gender: "女", data: [60.58, 60.71, 61.06, 61.28, 61.35, 60.62, 60.93, 61.22, 61.76, 61.68] },
                { country: "Sweden", countryCode: "SE", gender: "男", data: [67.34, 67.51, 67.79, 67.78, 67.87, 67.76, 67.84, 68.27, 68.27, 68.21] },
                { country: "Thailand", countryCode: "TH", gender: "男", data: [77.92, 76.92, 76.18, 76.53, 75.49, 75.45, 75.25, 75.32, 75.06, 74.69] },
                { country: "Thailand", countryCode: "TH", gender: "女", data: [61.07, 60.17, 59.35, 59.57, 58.90, 59.11, 59.18, 59.58, 59.29, 58.85] },
                { country: "United States", countryCode: "US", gender: "女", data: [55.94, 56.10, 56.40, 56.47, 56.87, 55.70, 55.63, 56.03, 56.60, 56.51] },
                { country: "United States", countryCode: "US", gender: "男", data: [68.64, 68.79, 68.72, 68.72, 68.82, 67.40, 67.36, 67.55, 67.55, 67.37] },
                { country: "Viet Nam", countryCode: "VN", gender: "女", data: [72.86, 72.53, 72.58, 72.90, 71.51, 69.10, 69.06, 69.87, 69.53, 69.13] },
                { country: "Viet Nam", countryCode: "VN", gender: "男", data: [82.42, 81.79, 82.20, 82.41, 82.09, 80.03, 78.68, 79.43, 78.99, 78.60] }
            ];

            // 年份列表
            const years = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024'];

            // 构建国家映射对象，用于地图显示
            const countryMap = {};
            rawData.forEach(item => {
                if (!countryMap[item.country]) {
                    countryMap[item.country] = {
                        name: item.country,
                        femaleData: [],
                        maleData: []
                    };
                }
                if (item.gender === "女") {
                    countryMap[item.country].femaleData = item.data;
                } else {
                    countryMap[item.country].maleData = item.data;
                }
            });

            // 准备时间轴选项
            const timelineOptions = [];
            for (let i = 0; i < years.length; i++) {
                const seriesDataFemale = [];
                const seriesDataMale = [];

                Object.keys(countryMap).forEach(code => {
                    const countryInfo = countryMap[code];
                    if (countryInfo.femaleData[i] !== undefined) {
                        seriesDataFemale.push({ name: code, value: countryInfo.femaleData[i] });
                    }
                    if (countryInfo.maleData[i] !== undefined) {
                        seriesDataMale.push({ name: code, value: countryInfo.maleData[i] });
                    }
                });

                timelineOptions.push({
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataFemale
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            data: seriesDataMale
                        }
                    ]
                });
            }

            // 配置项
            const option = {
                baseOption: {
                    timeline: {
                        axisType: 'category',
                        autoPlay: true,
                        playInterval: 2000,
                        data: years.map((year, idx) => ({
                            value: year
                        }))
                    },
                    title: {
                        text: '全球劳动参与率变化趋势(2015-2024)',
                        subtext: '按性别划分'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name+`<br/>`+params.seriesName+":"+ params.value+`%`;
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 100,
                        inRange: {
                            color: ['#fff5f0', '#fc4e2a']
                        },
                        text: ['高', '低'],
                        calculable: true
                    },
                    legend: {
                        orient: 'vertical',
                        right: 10,
                        top: 'middle',
                        selectedMode: 'single',
                        selected: {
                            '女性': true,
                            '男性': false
                        },
                        data: ['女性', '男性']
                    },
                    series: [
                        {
                            name: '女性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        },
                        {
                            name: '男性',
                            type: 'map',
                            mapType: 'world',
                            roam: true,
                            emphasis: {
                                label: {
                                    show: true
                                }
                            }
                        }
                    ]
                },
                options: timelineOptions
            };
            myChart.resize();
            myChart.setOption(option,true);
        }
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
<%@ include file="title.jsp" %>
<div class="hed"></div>
<div class="subcolumn_nav_met_16_1 border-bottom1" m-id='8' m-type='nocontent'>
    <div class="container" style="height: auto;overflow: auto;">
        <div class="subcolumn-nav text-xs-center col-lg-2" style="padding: 0px 10px;">
            <ul class="subcolumn_nav_met_16_1-ul experiment-menu" style="border: solid 1px silver;padding: 0px 0px;border-radius: 3px;">
                <li>
                    <a href="" title="实验室建设目的" class="experiment-menu-item"><p style="font-weight: bold;">经济生产 ▼</p></a>
                </li>
                <li>
                    <a href="#ldcyl" data-val="1" title="劳动参与率" class="experiment-menu-item">&nbsp;&nbsp;劳动参与率</a>
                </li>
                <li>
                    <a href="#nyxbfb" data-val="2" title="农业性别分布" class="experiment-menu-item">&nbsp;&nbsp;农业性别分布</a>
                </li>
                <li>
                    <a href="#gyxbfb" data-val="3" title="工业性别分布" class="experiment-menu-item">&nbsp;&nbsp;工业性别分布</a>
                </li>
                <li>
                    <a href="#fwxbfb" data-val="4" title="服务业分布" class="experiment-menu-item">&nbsp;&nbsp;服务业分布</a>
                </li>
                <li>
                    <a href="javascript:void(0)" data-val="3" title="社会再生产" class="experiment-menu-item"><p style="font-weight: bold;">社会再生产 ▼</p></a>
                </li>
                <li>
                    <a href="#shzsc" data-val="5" title="无酬劳动时间（分性别）" class="experiment-menu-item">&nbsp;&nbsp;无偿家务和照料时间占比</a>
                </li>


                <li>
                    <a href="javascript:void(0)" data-val="6" title="教育发展" class="experiment-menu-item"><p style="font-weight: bold;">教育发展 ▼</p></a>
                </li>
                <li>
                    <a href="#zdjy" data-val="6" title="中等教育人口占比" class="experiment-menu-item">&nbsp;&nbsp;中等教育人口占比</a>
                </li>
                <li>
                    <a href="#sjly" data-val="7" title="中等教育人口占比" class="experiment-menu-item">&nbsp;&nbsp;中等教育人口占比</a>
                </li>
            </ul>
        </div>
        <div class="col-lg-10 ac" style="border: solid 1px #cccccc;background: white;padding: 10px 10px;margin-bottom: 25px;overflow: hidden;overflow-y: auto;">
            <section class="">
                <a name="ldcyl"></a>
                <div id="ldcyl" style="width: 100%;height: 500px;"></div>
                <div class="experiment-body active" data-val="1" style="overflow: auto;">

                    <div class="thp" style="height: auto;">
                        <div class="mint">
                            <span>劳动参与率(超过15岁)</span>
                        </div>
                        <div class="scdw">
                            <table>
                                <thead>
                                <tr>
                                    <th style="width: 60px;">国家</th>
                                    <th style="width: 60px;">性别</th>
                                    <th>2015</th>
                                    <th>2016</th>
                                    <th>2017</th>
                                    <th>2018</th>
                                    <th>2019</th>
                                    <th>2020</th>
                                    <th>2021</th>
                                    <th>2022</th>
                                    <th>2023</th>
                                    <th>2024</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">中国</td>
                                    <td>女</td>
                                    <td>62.57</td>
                                    <td>62.29</td>
                                    <td>61.91</td>
                                    <td>61.53</td>
                                    <td>61.25</td>
                                    <td>59.91</td>
                                    <td>61.18</td>
                                    <td>59.89</td>
                                    <td>59.95</td>
                                    <td>59.56</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>75.88</td>
                                    <td>75.33</td>
                                    <td>74.65</td>
                                    <td>73.95</td>
                                    <td>73.38</td>
                                    <td>71.92</td>
                                    <td>72.92</td>
                                    <td>71.59</td>
                                    <td>71.60</td>
                                    <td>71.11</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">澳大利亚</td>
                                    <td>女</td>
                                    <td>59.15</td>
                                    <td>59.38</td>
                                    <td>59.88</td>
                                    <td>60.52</td>
                                    <td>60.96</td>
                                    <td>60.21</td>
                                    <td>61.27</td>
                                    <td>62.31</td>
                                    <td>62.37</td>
                                    <td>62.36</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>71.18</td>
                                    <td>70.70</td>
                                    <td>70.79</td>
                                    <td>71.07</td>
                                    <td>71.23</td>
                                    <td>70.16</td>
                                    <td>70.81</td>
                                    <td>71.23</td>
                                    <td>71.33</td>
                                    <td>71.21</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">奥地利</td>
                                    <td>女</td>
                                    <td>54.83</td>
                                    <td>55.35</td>
                                    <td>55.35</td>
                                    <td>55.43</td>
                                    <td>55.51</td>
                                    <td>55.22</td>
                                    <td>55.35</td>
                                    <td>55.69</td>
                                    <td>55.81</td>
                                    <td>55.55</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>65.93</td>
                                    <td>66.32</td>
                                    <td>66.24</td>
                                    <td>66.68</td>
                                    <td>66.54</td>
                                    <td>65.75</td>
                                    <td>66.17</td>
                                    <td>66.33</td>
                                    <td>66.13</td>
                                    <td>65.82</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">比利时</td>
                                    <td>女</td>
                                    <td>48.05</td>
                                    <td>47.81</td>
                                    <td>47.97</td>
                                    <td>48.77</td>
                                    <td>49.10</td>
                                    <td>48.66</td>
                                    <td>49.37</td>
                                    <td>50.03</td>
                                    <td>49.83</td>
                                    <td>49.80</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>58.95</td>
                                    <td>58.77</td>
                                    <td>58.95</td>
                                    <td>58.79</td>
                                    <td>58.91</td>
                                    <td>58.31</td>
                                    <td>58.93</td>
                                    <td>59.32</td>
                                    <td>59.16</td>
                                    <td>58.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">保加利亚</td>
                                    <td>男</td>
                                    <td>60.11</td>
                                    <td>59.64</td>
                                    <td>61.67</td>
                                    <td>61.96</td>
                                    <td>63.40</td>
                                    <td>62.69</td>
                                    <td>62.10</td>
                                    <td>63.21</td>
                                    <td>63.15</td>
                                    <td>62.96</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>48.73</td>
                                    <td>47.44</td>
                                    <td>49.60</td>
                                    <td>49.18</td>
                                    <td>50.22</td>
                                    <td>49.31</td>
                                    <td>49.03</td>
                                    <td>50.65</td>
                                    <td>51.04</td>
                                    <td>50.90</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">文莱</td>
                                    <td>女</td>
                                    <td>57.38</td>
                                    <td>57.41</td>
                                    <td>57.46</td>
                                    <td>57.72</td>
                                    <td>55.06</td>
                                    <td>54.56</td>
                                    <td>54.79</td>
                                    <td>53.70</td>
                                    <td>53.53</td>
                                    <td>53.19</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>72.97</td>
                                    <td>72.43</td>
                                    <td>71.94</td>
                                    <td>74.02</td>
                                    <td>73.26</td>
                                    <td>72.26</td>
                                    <td>71.79</td>
                                    <td>73.11</td>
                                    <td>73.09</td>
                                    <td>72.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">加拿大</td>
                                    <td>男</td>
                                    <td>70.94</td>
                                    <td>70.53</td>
                                    <td>70.64</td>
                                    <td>70.25</td>
                                    <td>70.48</td>
                                    <td>68.93</td>
                                    <td>69.86</td>
                                    <td>69.55</td>
                                    <td>69.69</td>
                                    <td>69.56</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>60.97</td>
                                    <td>60.88</td>
                                    <td>61.07</td>
                                    <td>60.97</td>
                                    <td>61.25</td>
                                    <td>59.38</td>
                                    <td>60.64</td>
                                    <td>61.05</td>
                                    <td>61.13</td>
                                    <td>61.03</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">塞浦路斯</td>
                                    <td>男</td>
                                    <td>69.16</td>
                                    <td>69.18</td>
                                    <td>69.77</td>
                                    <td>71.08</td>
                                    <td>72.07</td>
                                    <td>72.36</td>
                                    <td>73.37</td>
                                    <td>73.99</td>
                                    <td>73.29</td>
                                    <td>73.06</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>59.10</td>
                                    <td>58.28</td>
                                    <td>58.92</td>
                                    <td>59.63</td>
                                    <td>60.10</td>
                                    <td>59.05</td>
                                    <td>59.53</td>
                                    <td>61.22</td>
                                    <td>62.48</td>
                                    <td>62.41</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">捷克</td>
                                    <td>女</td>
                                    <td>51.19</td>
                                    <td>51.74</td>
                                    <td>52.11</td>
                                    <td>52.56</td>
                                    <td>52.30</td>
                                    <td>51.46</td>
                                    <td>51.56</td>
                                    <td>52.19</td>
                                    <td>53.24</td>
                                    <td>53.06</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>67.96</td>
                                    <td>68.29</td>
                                    <td>68.41</td>
                                    <td>68.54</td>
                                    <td>68.28</td>
                                    <td>67.81</td>
                                    <td>67.69</td>
                                    <td>67.87</td>
                                    <td>67.93</td>
                                    <td>67.61</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">德国</td>
                                    <td>女</td>
                                    <td>54.44</td>
                                    <td>54.81</td>
                                    <td>55.14</td>
                                    <td>55.21</td>
                                    <td>55.71</td>
                                    <td>55.11</td>
                                    <td>55.02</td>
                                    <td>55.60</td>
                                    <td>55.85</td>
                                    <td>55.64</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>66.26</td>
                                    <td>66.24</td>
                                    <td>66.40</td>
                                    <td>66.72</td>
                                    <td>67.12</td>
                                    <td>66.05</td>
                                    <td>65.98</td>
                                    <td>66.47</td>
                                    <td>66.59</td>
                                    <td>66.33</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">丹麦</td>
                                    <td>女</td>
                                    <td>56.84</td>
                                    <td>57.68</td>
                                    <td>57.74</td>
                                    <td>57.65</td>
                                    <td>58.06</td>
                                    <td>57.85</td>
                                    <td>58.22</td>
                                    <td>59.55</td>
                                    <td>59.81</td>
                                    <td>59.77</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>66.11</td>
                                    <td>65.91</td>
                                    <td>66.01</td>
                                    <td>66.26</td>
                                    <td>66.93</td>
                                    <td>66.50</td>
                                    <td>67.32</td>
                                    <td>67.55</td>
                                    <td>67.79</td>
                                    <td>67.75</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">西班牙</td>
                                    <td>女</td>
                                    <td>52.62</td>
                                    <td>52.49</td>
                                    <td>52.28</td>
                                    <td>51.87</td>
                                    <td>52.04</td>
                                    <td>50.92</td>
                                    <td>52.39</td>
                                    <td>52.57</td>
                                    <td>52.84</td>
                                    <td>52.60</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>64.92</td>
                                    <td>64.46</td>
                                    <td>64.11</td>
                                    <td>63.70</td>
                                    <td>63.51</td>
                                    <td>62.17</td>
                                    <td>62.74</td>
                                    <td>63.19</td>
                                    <td>62.82</td>
                                    <td>62.41</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱沙尼亚</td>
                                    <td>女</td>
                                    <td>55.75</td>
                                    <td>56.30</td>
                                    <td>57.01</td>
                                    <td>57.28</td>
                                    <td>57.34</td>
                                    <td>57.13</td>
                                    <td>57.78</td>
                                    <td>60.14</td>
                                    <td>61.05</td>
                                    <td>60.83</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>68.95</td>
                                    <td>70.07</td>
                                    <td>70.52</td>
                                    <td>70.70</td>
                                    <td>69.86</td>
                                    <td>69.81</td>
                                    <td>69.37</td>
                                    <td>70.79</td>
                                    <td>70.79</td>
                                    <td>70.44</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">芬兰</td>
                                    <td>女</td>
                                    <td>55.41</td>
                                    <td>54.98</td>
                                    <td>55.03</td>
                                    <td>55.69</td>
                                    <td>55.68</td>
                                    <td>55.18</td>
                                    <td>55.93</td>
                                    <td>57.27</td>
                                    <td>57.49</td>
                                    <td>57.44</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>62.28</td>
                                    <td>62.27</td>
                                    <td>62.46</td>
                                    <td>63.08</td>
                                    <td>62.83</td>
                                    <td>62.66</td>
                                    <td>63.75</td>
                                    <td>63.69</td>
                                    <td>63.16</td>
                                    <td>63.12</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">法国</td>
                                    <td>女</td>
                                    <td>50.96</td>
                                    <td>50.83</td>
                                    <td>50.63</td>
                                    <td>50.81</td>
                                    <td>50.62</td>
                                    <td>50.05</td>
                                    <td>51.59</td>
                                    <td>51.87</td>
                                    <td>51.83</td>
                                    <td>51.68</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>60.73</td>
                                    <td>60.40</td>
                                    <td>60.32</td>
                                    <td>60.21</td>
                                    <td>59.66</td>
                                    <td>58.88</td>
                                    <td>59.85</td>
                                    <td>60.18</td>
                                    <td>59.80</td>
                                    <td>59.57</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">英国</td>
                                    <td>女</td>
                                    <td>56.70</td>
                                    <td>57.05</td>
                                    <td>57.25</td>
                                    <td>57.51</td>
                                    <td>58.01</td>
                                    <td>58.25</td>
                                    <td>58.00</td>
                                    <td>57.70</td>
                                    <td>57.37</td>
                                    <td>57.28</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>68.08</td>
                                    <td>68.01</td>
                                    <td>67.80</td>
                                    <td>67.97</td>
                                    <td>67.43</td>
                                    <td>67.06</td>
                                    <td>66.10</td>
                                    <td>66.32</td>
                                    <td>66.42</td>
                                    <td>66.29</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">希腊</td>
                                    <td>女</td>
                                    <td>44.03</td>
                                    <td>44.09</td>
                                    <td>43.83</td>
                                    <td>43.39</td>
                                    <td>43.51</td>
                                    <td>42.72</td>
                                    <td>43.26</td>
                                    <td>44.41</td>
                                    <td>44.67</td>
                                    <td>44.49</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>59.03</td>
                                    <td>58.86</td>
                                    <td>58.88</td>
                                    <td>58.89</td>
                                    <td>58.84</td>
                                    <td>58.01</td>
                                    <td>58.00</td>
                                    <td>59.87</td>
                                    <td>59.58</td>
                                    <td>59.37</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">克罗地亚</td>
                                    <td>女</td>
                                    <td>46.70</td>
                                    <td>45.20</td>
                                    <td>45.30</td>
                                    <td>45.20</td>
                                    <td>44.91</td>
                                    <td>44.48</td>
                                    <td>45.68</td>
                                    <td>46.92</td>
                                    <td>47.14</td>
                                    <td>47.02</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>59.20</td>
                                    <td>57.80</td>
                                    <td>58.27</td>
                                    <td>57.49</td>
                                    <td>57.71</td>
                                    <td>58.20</td>
                                    <td>58.77</td>
                                    <td>59.00</td>
                                    <td>57.86</td>
                                    <td>57.63</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">匈牙利</td>
                                    <td>女</td>
                                    <td>49.90</td>
                                    <td>50.83</td>
                                    <td>51.05</td>
                                    <td>51.58</td>
                                    <td>51.41</td>
                                    <td>51.38</td>
                                    <td>52.30</td>
                                    <td>53.12</td>
                                    <td>53.94</td>
                                    <td>53.89</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>63.30</td>
                                    <td>64.53</td>
                                    <td>65.40</td>
                                    <td>65.89</td>
                                    <td>66.41</td>
                                    <td>66.42</td>
                                    <td>66.90</td>
                                    <td>67.48</td>
                                    <td>67.89</td>
                                    <td>67.87</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">印度尼西亚</td>
                                    <td>男</td>
                                    <td>82.49</td>
                                    <td>81.77</td>
                                    <td>81.53</td>
                                    <td>82.25</td>
                                    <td>82.60</td>
                                    <td>81.67</td>
                                    <td>79.74</td>
                                    <td>81.55</td>
                                    <td>81.46</td>
                                    <td>81.42</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>50.77</td>
                                    <td>50.95</td>
                                    <td>51.94</td>
                                    <td>53.13</td>
                                    <td>53.95</td>
                                    <td>53.20</td>
                                    <td>52.07</td>
                                    <td>52.56</td>
                                    <td>52.55</td>
                                    <td>52.58</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱尔兰</td>
                                    <td>男</td>
                                    <td>69.02</td>
                                    <td>68.96</td>
                                    <td>68.49</td>
                                    <td>68.51</td>
                                    <td>68.64</td>
                                    <td>67.35</td>
                                    <td>69.49</td>
                                    <td>70.02</td>
                                    <td>70.48</td>
                                    <td>70.44</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>54.81</td>
                                    <td>55.53</td>
                                    <td>55.59</td>
                                    <td>56.00</td>
                                    <td>56.21</td>
                                    <td>55.06</td>
                                    <td>57.97</td>
                                    <td>59.23</td>
                                    <td>59.97</td>
                                    <td>60.12</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">意大利</td>
                                    <td>女</td>
                                    <td>39.39</td>
                                    <td>40.07</td>
                                    <td>40.58</td>
                                    <td>40.74</td>
                                    <td>40.89</td>
                                    <td>39.51</td>
                                    <td>39.88</td>
                                    <td>40.52</td>
                                    <td>41.31</td>
                                    <td>41.28</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>58.59</td>
                                    <td>58.96</td>
                                    <td>59.07</td>
                                    <td>59.08</td>
                                    <td>58.87</td>
                                    <td>57.58</td>
                                    <td>57.56</td>
                                    <td>58.09</td>
                                    <td>58.82</td>
                                    <td>58.63</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">日本</td>
                                    <td>女</td>
                                    <td>49.41</td>
                                    <td>50.21</td>
                                    <td>51.03</td>
                                    <td>52.37</td>
                                    <td>53.24</td>
                                    <td>53.09</td>
                                    <td>53.52</td>
                                    <td>54.17</td>
                                    <td>54.85</td>
                                    <td>55.30</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>70.21</td>
                                    <td>70.36</td>
                                    <td>70.44</td>
                                    <td>71.08</td>
                                    <td>71.32</td>
                                    <td>71.35</td>
                                    <td>71.27</td>
                                    <td>71.36</td>
                                    <td>71.46</td>
                                    <td>71.59</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">柬埔寨</td>
                                    <td>男</td>
                                    <td>86.36</td>
                                    <td>88.08</td>
                                    <td>86.85</td>
                                    <td>87.44</td>
                                    <td>88.03</td>
                                    <td>87.83</td>
                                    <td>85.80</td>
                                    <td>86.53</td>
                                    <td>86.47</td>
                                    <td>86.46</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>73.42</td>
                                    <td>75.92</td>
                                    <td>76.42</td>
                                    <td>76.84</td>
                                    <td>77.28</td>
                                    <td>77.09</td>
                                    <td>73.71</td>
                                    <td>74.00</td>
                                    <td>73.99</td>
                                    <td>73.96</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">韩国</td>
                                    <td>女</td>
                                    <td>52.39</td>
                                    <td>52.57</td>
                                    <td>53.07</td>
                                    <td>53.22</td>
                                    <td>53.77</td>
                                    <td>53.14</td>
                                    <td>53.65</td>
                                    <td>55.03</td>
                                    <td>56.04</td>
                                    <td>56.02</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>72.80</td>
                                    <td>72.74</td>
                                    <td>72.81</td>
                                    <td>72.36</td>
                                    <td>72.29</td>
                                    <td>71.50</td>
                                    <td>71.55</td>
                                    <td>72.66</td>
                                    <td>72.58</td>
                                    <td>72.46</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">老挝</td>
                                    <td>女</td>
                                    <td>56.20</td>
                                    <td>56.11</td>
                                    <td>56.02</td>
                                    <td>57.05</td>
                                    <td>58.09</td>
                                    <td>58.62</td>
                                    <td>60.10</td>
                                    <td>61.37</td>
                                    <td>61.37</td>
                                    <td>61.47</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>63.87</td>
                                    <td>63.71</td>
                                    <td>63.54</td>
                                    <td>64.87</td>
                                    <td>66.22</td>
                                    <td>67.06</td>
                                    <td>68.53</td>
                                    <td>70.64</td>
                                    <td>70.60</td>
                                    <td>70.74</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">立陶宛</td>
                                    <td>女</td>
                                    <td>54.43</td>
                                    <td>55.61</td>
                                    <td>55.82</td>
                                    <td>56.49</td>
                                    <td>57.23</td>
                                    <td>57.36</td>
                                    <td>57.37</td>
                                    <td>58.04</td>
                                    <td>57.91</td>
                                    <td>57.87</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>64.88</td>
                                    <td>66.01</td>
                                    <td>66.42</td>
                                    <td>67.62</td>
                                    <td>67.83</td>
                                    <td>68.87</td>
                                    <td>68.04</td>
                                    <td>68.21</td>
                                    <td>68.62</td>
                                    <td>68.54</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">卢森堡</td>
                                    <td>女</td>
                                    <td>54.25</td>
                                    <td>53.83</td>
                                    <td>54.21</td>
                                    <td>54.96</td>
                                    <td>55.06</td>
                                    <td>55.93</td>
                                    <td>56.93</td>
                                    <td>57.00</td>
                                    <td>57.21</td>
                                    <td>57.10</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>65.52</td>
                                    <td>64.60</td>
                                    <td>63.46</td>
                                    <td>63.77</td>
                                    <td>65.13</td>
                                    <td>64.25</td>
                                    <td>66.00</td>
                                    <td>64.86</td>
                                    <td>65.81</td>
                                    <td>65.50</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">拉脱维亚</td>
                                    <td>女</td>
                                    <td>54.03</td>
                                    <td>54.86</td>
                                    <td>55.06</td>
                                    <td>55.64</td>
                                    <td>55.47</td>
                                    <td>55.84</td>
                                    <td>54.17</td>
                                    <td>55.30</td>
                                    <td>55.38</td>
                                    <td>55.05</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>67.40</td>
                                    <td>67.07</td>
                                    <td>67.80</td>
                                    <td>68.31</td>
                                    <td>67.92</td>
                                    <td>68.51</td>
                                    <td>67.23</td>
                                    <td>67.75</td>
                                    <td>67.74</td>
                                    <td>67.30</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">墨西哥</td>
                                    <td>男</td>
                                    <td>78.57</td>
                                    <td>78.27</td>
                                    <td>78.24</td>
                                    <td>78.17</td>
                                    <td>78.06</td>
                                    <td>72.49</td>
                                    <td>76.67</td>
                                    <td>77.31</td>
                                    <td>77.55</td>
                                    <td>77.42</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>43.93</td>
                                    <td>43.99</td>
                                    <td>43.63</td>
                                    <td>44.13</td>
                                    <td>45.57</td>
                                    <td>41.70</td>
                                    <td>44.62</td>
                                    <td>46.00</td>
                                    <td>47.32</td>
                                    <td>47.36</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马耳他</td>
                                    <td>男</td>
                                    <td>68.26</td>
                                    <td>67.91</td>
                                    <td>68.50</td>
                                    <td>69.89</td>
                                    <td>70.74</td>
                                    <td>70.88</td>
                                    <td>71.50</td>
                                    <td>71.31</td>
                                    <td>71.59</td>
                                    <td>71.48</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>43.02</td>
                                    <td>44.45</td>
                                    <td>46.00</td>
                                    <td>48.71</td>
                                    <td>50.42</td>
                                    <td>52.23</td>
                                    <td>53.33</td>
                                    <td>55.47</td>
                                    <td>55.02</td>
                                    <td>55.29</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">缅甸</td>
                                    <td>女</td>
                                    <td>50.80</td>
                                    <td>49.23</td>
                                    <td>47.66</td>
                                    <td>48.44</td>
                                    <td>46.29</td>
                                    <td>44.73</td>
                                    <td>41.04</td>
                                    <td>41.04</td>
                                    <td>41.06</td>
                                    <td>40.95</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>78.95</td>
                                    <td>77.86</td>
                                    <td>76.74</td>
                                    <td>76.63</td>
                                    <td>75.07</td>
                                    <td>75.97</td>
                                    <td>69.72</td>
                                    <td>69.66</td>
                                    <td>69.79</td>
                                    <td>69.71</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马来西亚</td>
                                    <td>女</td>
                                    <td>50.83</td>
                                    <td>50.98</td>
                                    <td>51.28</td>
                                    <td>51.62</td>
                                    <td>51.78</td>
                                    <td>51.39</td>
                                    <td>51.39</td>
                                    <td>51.60</td>
                                    <td>51.57</td>
                                    <td>51.60</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>78.18</td>
                                    <td>77.80</td>
                                    <td>77.69</td>
                                    <td>78.05</td>
                                    <td>78.42</td>
                                    <td>78.06</td>
                                    <td>78.42</td>
                                    <td>78.30</td>
                                    <td>78.34</td>
                                    <td>78.37</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">荷兰</td>
                                    <td>男</td>
                                    <td>72.32</td>
                                    <td>71.86</td>
                                    <td>71.45</td>
                                    <td>71.69</td>
                                    <td>71.79</td>
                                    <td>71.32</td>
                                    <td>71.17</td>
                                    <td>71.89</td>
                                    <td>72.33</td>
                                    <td>72.15</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>60.76</td>
                                    <td>60.80</td>
                                    <td>60.86</td>
                                    <td>61.09</td>
                                    <td>61.59</td>
                                    <td>61.70</td>
                                    <td>61.80</td>
                                    <td>62.44</td>
                                    <td>62.94</td>
                                    <td>62.88</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">菲律宾</td>
                                    <td>女</td>
                                    <td>48.67</td>
                                    <td>48.19</td>
                                    <td>45.05</td>
                                    <td>45.53</td>
                                    <td>46.57</td>
                                    <td>42.68</td>
                                    <td>44.20</td>
                                    <td>50.38</td>
                                    <td>50.37</td>
                                    <td>49.95</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>74.44</td>
                                    <td>75.28</td>
                                    <td>73.53</td>
                                    <td>72.71</td>
                                    <td>72.59</td>
                                    <td>67.07</td>
                                    <td>69.00</td>
                                    <td>72.74</td>
                                    <td>72.65</td>
                                    <td>72.33</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">波兰</td>
                                    <td>男</td>
                                    <td>65.22</td>
                                    <td>65.59</td>
                                    <td>66.01</td>
                                    <td>65.85</td>
                                    <td>65.98</td>
                                    <td>66.10</td>
                                    <td>66.72</td>
                                    <td>66.59</td>
                                    <td>66.50</td>
                                    <td>66.17</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>49.14</td>
                                    <td>49.18</td>
                                    <td>49.32</td>
                                    <td>49.43</td>
                                    <td>49.18</td>
                                    <td>48.92</td>
                                    <td>50.57</td>
                                    <td>51.17</td>
                                    <td>51.87</td>
                                    <td>51.60</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">葡萄牙</td>
                                    <td>男</td>
                                    <td>64.04</td>
                                    <td>64.02</td>
                                    <td>64.39</td>
                                    <td>64.22</td>
                                    <td>64.10</td>
                                    <td>62.62</td>
                                    <td>61.79</td>
                                    <td>62.55</td>
                                    <td>63.12</td>
                                    <td>62.89</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>53.69</td>
                                    <td>53.39</td>
                                    <td>53.93</td>
                                    <td>54.31</td>
                                    <td>54.52</td>
                                    <td>53.12</td>
                                    <td>53.35</td>
                                    <td>54.17</td>
                                    <td>54.89</td>
                                    <td>54.69</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">罗马尼亚</td>
                                    <td>男</td>
                                    <td>60.81</td>
                                    <td>60.55</td>
                                    <td>61.28</td>
                                    <td>61.52</td>
                                    <td>61.87</td>
                                    <td>62.05</td>
                                    <td>63.02</td>
                                    <td>62.86</td>
                                    <td>62.11</td>
                                    <td>61.87</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>42.68</td>
                                    <td>42.28</td>
                                    <td>43.31</td>
                                    <td>43.06</td>
                                    <td>43.06</td>
                                    <td>42.80</td>
                                    <td>42.77</td>
                                    <td>43.17</td>
                                    <td>42.01</td>
                                    <td>41.79</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">俄罗斯联邦</td>
                                    <td>男</td>
                                    <td>71.35</td>
                                    <td>71.57</td>
                                    <td>71.16</td>
                                    <td>70.94</td>
                                    <td>70.04</td>
                                    <td>69.55</td>
                                    <td>70.23</td>
                                    <td>69.92</td>
                                    <td>69.50</td>
                                    <td>68.84</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>55.61</td>
                                    <td>55.73</td>
                                    <td>55.35</td>
                                    <td>55.45</td>
                                    <td>54.82</td>
                                    <td>54.66</td>
                                    <td>55.17</td>
                                    <td>55.30</td>
                                    <td>55.20</td>
                                    <td>54.63</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">新加坡</td>
                                    <td>男</td>
                                    <td>77.00</td>
                                    <td>76.52</td>
                                    <td>76.52</td>
                                    <td>75.80</td>
                                    <td>75.66</td>
                                    <td>75.21</td>
                                    <td>76.54</td>
                                    <td>76.09</td>
                                    <td>76.27</td>
                                    <td>76.79</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>61.31</td>
                                    <td>61.31</td>
                                    <td>60.81</td>
                                    <td>60.89</td>
                                    <td>61.82</td>
                                    <td>61.72</td>
                                    <td>64.41</td>
                                    <td>62.92</td>
                                    <td>61.97</td>
                                    <td>62.35</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛伐克</td>
                                    <td>男</td>
                                    <td>67.86</td>
                                    <td>68.03</td>
                                    <td>67.66</td>
                                    <td>67.72</td>
                                    <td>67.44</td>
                                    <td>66.49</td>
                                    <td>66.16</td>
                                    <td>66.99</td>
                                    <td>67.03</td>
                                    <td>66.64</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>51.93</td>
                                    <td>52.51</td>
                                    <td>52.63</td>
                                    <td>52.24</td>
                                    <td>52.17</td>
                                    <td>51.80</td>
                                    <td>54.62</td>
                                    <td>55.69</td>
                                    <td>55.72</td>
                                    <td>55.43</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛文尼亚</td>
                                    <td>女</td>
                                    <td>52.28</td>
                                    <td>52.11</td>
                                    <td>53.54</td>
                                    <td>53.72</td>
                                    <td>53.38</td>
                                    <td>53.11</td>
                                    <td>53.47</td>
                                    <td>53.88</td>
                                    <td>53.53</td>
                                    <td>53.26</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>63.07</td>
                                    <td>61.71</td>
                                    <td>63.69</td>
                                    <td>64.27</td>
                                    <td>63.42</td>
                                    <td>62.52</td>
                                    <td>63.29</td>
                                    <td>64.23</td>
                                    <td>63.82</td>
                                    <td>63.45</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">瑞典</td>
                                    <td>女</td>
                                    <td>60.58</td>
                                    <td>60.71</td>
                                    <td>61.06</td>
                                    <td>61.28</td>
                                    <td>61.35</td>
                                    <td>60.62</td>
                                    <td>60.93</td>
                                    <td>61.22</td>
                                    <td>61.76</td>
                                    <td>61.68</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>67.34</td>
                                    <td>67.51</td>
                                    <td>67.79</td>
                                    <td>67.78</td>
                                    <td>67.87</td>
                                    <td>67.76</td>
                                    <td>67.84</td>
                                    <td>68.27</td>
                                    <td>68.27</td>
                                    <td>68.21</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">泰国</td>
                                    <td>男</td>
                                    <td>77.92</td>
                                    <td>76.92</td>
                                    <td>76.18</td>
                                    <td>76.53</td>
                                    <td>75.49</td>
                                    <td>75.45</td>
                                    <td>75.25</td>
                                    <td>75.32</td>
                                    <td>75.06</td>
                                    <td>74.69</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>61.07</td>
                                    <td>60.17</td>
                                    <td>59.35</td>
                                    <td>59.57</td>
                                    <td>58.90</td>
                                    <td>59.11</td>
                                    <td>59.18</td>
                                    <td>59.58</td>
                                    <td>59.29</td>
                                    <td>58.85</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">美国</td>
                                    <td>女</td>
                                    <td>55.94</td>
                                    <td>56.10</td>
                                    <td>56.40</td>
                                    <td>56.47</td>
                                    <td>56.87</td>
                                    <td>55.70</td>
                                    <td>55.63</td>
                                    <td>56.03</td>
                                    <td>56.60</td>
                                    <td>56.51</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>68.64</td>
                                    <td>68.79</td>
                                    <td>68.72</td>
                                    <td>68.72</td>
                                    <td>68.82</td>
                                    <td>67.40</td>
                                    <td>67.36</td>
                                    <td>67.55</td>
                                    <td>67.55</td>
                                    <td>67.37</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">越南</td>
                                    <td>女</td>
                                    <td>72.86</td>
                                    <td>72.53</td>
                                    <td>72.58</td>
                                    <td>72.90</td>
                                    <td>71.51</td>
                                    <td>69.10</td>
                                    <td>69.06</td>
                                    <td>69.87</td>
                                    <td>69.53</td>
                                    <td>69.13</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>82.42</td>
                                    <td>81.79</td>
                                    <td>82.20</td>
                                    <td>82.41</td>
                                    <td>82.09</td>
                                    <td>80.03</td>
                                    <td>78.68</td>
                                    <td>79.43</td>
                                    <td>78.99</td>
                                    <td>78.60</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="nyxbfb" style="width: 100%;height: 500px;"></div>
                <div class="experiment-body active" data-val="2" style="overflow: auto;">
                    <div class="thp" style="height: auto;">
                        <div class="mint">
                            <span>农业领域女/男性就业人数（占女/男性就业人数的百分比）</span>
                        </div>
                        <div class="scdw">
                            <table>
                                <tr>
                                    <th style="width: 60px;">国家</th>
                                    <th style="width: 60px;">性别</th>
                                    <th>2015</th>
                                    <th>2016</th>
                                    <th>2017</th>
                                    <th>2018</th>
                                    <th>2019</th>
                                    <th>2020</th>
                                    <th>2021</th>
                                    <th>2022</th>
                                    <th>2023</th>
                                </tr>
                                <tr>
                                    <td rowspan="2">中国</td>
                                    <td>女</td>
                                    <td>24.13</td>
                                    <td>23.28</td>
                                    <td>22.63</td>
                                    <td>21.75</td>
                                    <td>20.69</td>
                                    <td>19.58</td>
                                    <td>19.66</td>
                                    <td>18.98</td>
                                    <td>18.60</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>31.71</td>
                                    <td>30.81</td>
                                    <td>30.01</td>
                                    <td>29.04</td>
                                    <td>28.05</td>
                                    <td>26.92</td>
                                    <td>26.49</td>
                                    <td>25.89</td>
                                    <td>25.44</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">澳大利亚</td>
                                    <td>女</td>
                                    <td>1.85</td>
                                    <td>1.75</td>
                                    <td>1.66</td>
                                    <td>1.68</td>
                                    <td>1.72</td>
                                    <td>1.91</td>
                                    <td>1.79</td>
                                    <td>1.36</td>
                                    <td>1.49</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>3.31</td>
                                    <td>3.37</td>
                                    <td>3.42</td>
                                    <td>3.44</td>
                                    <td>3.30</td>
                                    <td>3.53</td>
                                    <td>3.12</td>
                                    <td>2.92</td>
                                    <td>2.74</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">奥地利</td>
                                    <td>女</td>
                                    <td>4.21</td>
                                    <td>3.93</td>
                                    <td>3.68</td>
                                    <td>3.28</td>
                                    <td>3.19</td>
                                    <td>3.38</td>
                                    <td>3.39</td>
                                    <td>3.18</td>
                                    <td>2.58</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>4.82</td>
                                    <td>4.72</td>
                                    <td>4.15</td>
                                    <td>4.05</td>
                                    <td>4.07</td>
                                    <td>4.29</td>
                                    <td>4.03</td>
                                    <td>3.85</td>
                                    <td>3.59</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">比利时</td>
                                    <td>女</td>
                                    <td>0.73</td>
                                    <td>0.75</td>
                                    <td>0.71</td>
                                    <td>0.64</td>
                                    <td>0.63</td>
                                    <td>0.64</td>
                                    <td>0.55</td>
                                    <td>0.56</td>
                                    <td>0.65</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>1.56</td>
                                    <td>1.68</td>
                                    <td>1.55</td>
                                    <td>1.31</td>
                                    <td>1.17</td>
                                    <td>1.16</td>
                                    <td>1.27</td>
                                    <td>1.21</td>
                                    <td>1.48</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">文莱</td>
                                    <td>女</td>
                                    <td>0.42</td>
                                    <td>0.42</td>
                                    <td>0.43</td>
                                    <td>0.53</td>
                                    <td>0.69</td>
                                    <td>0.63</td>
                                    <td>0.29</td>
                                    <td>0.95</td>
                                    <td>0.86</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>2.00</td>
                                    <td>2.00</td>
                                    <td>2.00</td>
                                    <td>1.41</td>
                                    <td>2.76</td>
                                    <td>1.79</td>
                                    <td>2.12</td>
                                    <td>1.87</td>
                                    <td>1.92</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">保加利亚</td>
                                    <td>女</td>
                                    <td>4.33</td>
                                    <td>4.24</td>
                                    <td>4.54</td>
                                    <td>4.24</td>
                                    <td>4.30</td>
                                    <td>4.25</td>
                                    <td>4.09</td>
                                    <td>4.25</td>
                                    <td>3.58</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>9.09</td>
                                    <td>8.94</td>
                                    <td>9.18</td>
                                    <td>8.61</td>
                                    <td>8.63</td>
                                    <td>8.59</td>
                                    <td>8.19</td>
                                    <td>8.37</td>
                                    <td>7.53</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">柬埔寨</td>
                                    <td>女</td>
                                    <td>44.71</td>
                                    <td>40.49</td>
                                    <td>40.34</td>
                                    <td>40.60</td>
                                    <td>40.87</td>
                                    <td>39.51</td>
                                    <td>39.69</td>
                                    <td>39.00</td>
                                    <td>38.31</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>40.39</td>
                                    <td>34.77</td>
                                    <td>36.16</td>
                                    <td>37.54</td>
                                    <td>38.91</td>
                                    <td>34.41</td>
                                    <td>34.75</td>
                                    <td>34.49</td>
                                    <td>33.88</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">加拿大</td>
                                    <td>女</td>
                                    <td>1.03</td>
                                    <td>1.13</td>
                                    <td>0.96</td>
                                    <td>0.96</td>
                                    <td>1.01</td>
                                    <td>1.02</td>
                                    <td>0.92</td>
                                    <td>0.83</td>
                                    <td>0.85</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>2.19</td>
                                    <td>2.68</td>
                                    <td>2.01</td>
                                    <td>2.02</td>
                                    <td>2.01</td>
                                    <td>2.02</td>
                                    <td>1.76</td>
                                    <td>1.74</td>
                                    <td>1.65</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">克罗地亚</td>
                                    <td>女</td>
                                    <td>7.43</td>
                                    <td>5.55</td>
                                    <td>5.13</td>
                                    <td>5.07</td>
                                    <td>4.42</td>
                                    <td>4.49</td>
                                    <td>4.96</td>
                                    <td>3.95</td>
                                    <td>3.27</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>10.77</td>
                                    <td>9.35</td>
                                    <td>8.54</td>
                                    <td>7.23</td>
                                    <td>7.70</td>
                                    <td>8.12</td>
                                    <td>8.37</td>
                                    <td>7.56</td>
                                    <td>5.92</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">塞浦路斯</td>
                                    <td>女</td>
                                    <td>2.05</td>
                                    <td>1.62</td>
                                    <td>1.07</td>
                                    <td>1.01</td>
                                    <td>1.27</td>
                                    <td>1.54</td>
                                    <td>1.18</td>
                                    <td>0.86</td>
                                    <td>0.77</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>5.64</td>
                                    <td>5.31</td>
                                    <td>3.74</td>
                                    <td>3.12</td>
                                    <td>3.34</td>
                                    <td>3.70</td>
                                    <td>4.19</td>
                                    <td>3.59</td>
                                    <td>3.74</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">捷克</td>
                                    <td>女</td>
                                    <td>1.64</td>
                                    <td>1.72</td>
                                    <td>1.79</td>
                                    <td>1.76</td>
                                    <td>1.74</td>
                                    <td>1.60</td>
                                    <td>1.51</td>
                                    <td>1.75</td>
                                    <td>1.79</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>3.93</td>
                                    <td>3.83</td>
                                    <td>3.60</td>
                                    <td>3.63</td>
                                    <td>3.40</td>
                                    <td>3.40</td>
                                    <td>3.37</td>
                                    <td>3.41</td>
                                    <td>3.52</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">丹麦</td>
                                    <td>女</td>
                                    <td>1.00</td>
                                    <td>0.91</td>
                                    <td>0.93</td>
                                    <td>0.95</td>
                                    <td>1.10</td>
                                    <td>0.98</td>
                                    <td>0.92</td>
                                    <td>1.07</td>
                                    <td>0.99</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>3.80</td>
                                    <td>3.60</td>
                                    <td>3.16</td>
                                    <td>3.29</td>
                                    <td>3.21</td>
                                    <td>3.11</td>
                                    <td>3.04</td>
                                    <td>3.06</td>
                                    <td>2.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱沙尼亚</td>
                                    <td>女</td>
                                    <td>2.56</td>
                                    <td>1.95</td>
                                    <td>1.86</td>
                                    <td>1.65</td>
                                    <td>1.54</td>
                                    <td>1.56</td>
                                    <td>1.42</td>
                                    <td>1.64</td>
                                    <td>1.17</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>5.43</td>
                                    <td>5.76</td>
                                    <td>5.31</td>
                                    <td>5.11</td>
                                    <td>5.02</td>
                                    <td>4.52</td>
                                    <td>3.90</td>
                                    <td>3.55</td>
                                    <td>4.00</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">芬兰</td>
                                    <td>女</td>
                                    <td>2.20</td>
                                    <td>2.09</td>
                                    <td>2.15</td>
                                    <td>2.07</td>
                                    <td>2.06</td>
                                    <td>2.05</td>
                                    <td>2.14</td>
                                    <td>1.96</td>
                                    <td>1.73</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>6.13</td>
                                    <td>5.51</td>
                                    <td>5.25</td>
                                    <td>5.22</td>
                                    <td>5.37</td>
                                    <td>5.13</td>
                                    <td>5.92</td>
                                    <td>5.45</td>
                                    <td>5.40</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">法国</td>
                                    <td>女</td>
                                    <td>1.65</td>
                                    <td>1.64</td>
                                    <td>1.57</td>
                                    <td>1.38</td>
                                    <td>1.46</td>
                                    <td>1.43</td>
                                    <td>1.45</td>
                                    <td>1.56</td>
                                    <td>1.60</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>3.76</td>
                                    <td>4.01</td>
                                    <td>3.56</td>
                                    <td>3.53</td>
                                    <td>3.50</td>
                                    <td>3.21</td>
                                    <td>3.52</td>
                                    <td>3.55</td>
                                    <td>3.36</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">德国</td>
                                    <td>女</td>
                                    <td>0.95</td>
                                    <td>0.89</td>
                                    <td>0.88</td>
                                    <td>0.85</td>
                                    <td>0.83</td>
                                    <td>0.82</td>
                                    <td>0.93</td>
                                    <td>0.89</td>
                                    <td>0.82</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>1.77</td>
                                    <td>1.67</td>
                                    <td>1.62</td>
                                    <td>1.60</td>
                                    <td>1.53</td>
                                    <td>1.57</td>
                                    <td>1.52</td>
                                    <td>1.55</td>
                                    <td>1.53</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">希腊</td>
                                    <td>女</td>
                                    <td>11.73</td>
                                    <td>11.07</td>
                                    <td>10.85</td>
                                    <td>11.04</td>
                                    <td>10.15</td>
                                    <td>9.20</td>
                                    <td>10.26</td>
                                    <td>9.77</td>
                                    <td>9.83</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>13.07</td>
                                    <td>12.56</td>
                                    <td>12.27</td>
                                    <td>12.44</td>
                                    <td>11.89</td>
                                    <td>11.09</td>
                                    <td>12.17</td>
                                    <td>12.18</td>
                                    <td>12.73</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">匈牙利</td>
                                    <td>女</td>
                                    <td>2.69</td>
                                    <td>2.89</td>
                                    <td>2.89</td>
                                    <td>2.77</td>
                                    <td>2.88</td>
                                    <td>2.88</td>
                                    <td>2.63</td>
                                    <td>2.56</td>
                                    <td>2.56</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>6.85</td>
                                    <td>6.94</td>
                                    <td>6.91</td>
                                    <td>6.66</td>
                                    <td>6.31</td>
                                    <td>6.37</td>
                                    <td>5.92</td>
                                    <td>5.94</td>
                                    <td>6.08</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">印度尼西亚</td>
                                    <td>女</td>
                                    <td>32.63</td>
                                    <td>30.09</td>
                                    <td>28.85</td>
                                    <td>27.60</td>
                                    <td>26.59</td>
                                    <td>27.17</td>
                                    <td>26.02</td>
                                    <td>26.56</td>
                                    <td>26.12</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>33.30</td>
                                    <td>32.92</td>
                                    <td>32.04</td>
                                    <td>31.09</td>
                                    <td>30.13</td>
                                    <td>31.16</td>
                                    <td>30.95</td>
                                    <td>31.06</td>
                                    <td>30.49</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱尔兰</td>
                                    <td>女</td>
                                    <td>1.60</td>
                                    <td>1.54</td>
                                    <td>1.56</td>
                                    <td>1.46</td>
                                    <td>1.21</td>
                                    <td>1.46</td>
                                    <td>1.31</td>
                                    <td>1.25</td>
                                    <td>1.27</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>8.45</td>
                                    <td>8.46</td>
                                    <td>8.01</td>
                                    <td>7.56</td>
                                    <td>7.18</td>
                                    <td>7.04</td>
                                    <td>7.24</td>
                                    <td>6.37</td>
                                    <td>6.46</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">意大利</td>
                                    <td>女</td>
                                    <td>2.44</td>
                                    <td>2.52</td>
                                    <td>2.35</td>
                                    <td>2.39</td>
                                    <td>2.38</td>
                                    <td>2.41</td>
                                    <td>2.47</td>
                                    <td>2.33</td>
                                    <td>2.18</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>4.69</td>
                                    <td>4.86</td>
                                    <td>4.81</td>
                                    <td>4.74</td>
                                    <td>4.99</td>
                                    <td>5.11</td>
                                    <td>5.19</td>
                                    <td>4.84</td>
                                    <td>4.63</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">日本</td>
                                    <td>女</td>
                                    <td>3.06</td>
                                    <td>2.90</td>
                                    <td>2.84</td>
                                    <td>2.93</td>
                                    <td>2.83</td>
                                    <td>2.69</td>
                                    <td>2.55</td>
                                    <td>2.57</td>
                                    <td>2.44</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>3.83</td>
                                    <td>3.75</td>
                                    <td>3.70</td>
                                    <td>3.76</td>
                                    <td>3.61</td>
                                    <td>3.51</td>
                                    <td>3.47</td>
                                    <td>3.53</td>
                                    <td>3.47</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">韩国</td>
                                    <td>女</td>
                                    <td>5.38</td>
                                    <td>4.99</td>
                                    <td>4.78</td>
                                    <td>4.75</td>
                                    <td>4.85</td>
                                    <td>4.95</td>
                                    <td>4.80</td>
                                    <td>4.89</td>
                                    <td>4.75</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>5.13</td>
                                    <td>4.90</td>
                                    <td>5.03</td>
                                    <td>5.18</td>
                                    <td>5.37</td>
                                    <td>5.69</td>
                                    <td>5.76</td>
                                    <td>5.85</td>
                                    <td>5.77</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">老挝</td>
                                    <td>女</td>
                                    <td>66.38</td>
                                    <td>64.94</td>
                                    <td>63.33</td>
                                    <td>64.47</td>
                                    <td>65.65</td>
                                    <td>67.02</td>
                                    <td>68.38</td>
                                    <td>69.56</td>
                                    <td>69.84</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>62.12</td>
                                    <td>60.66</td>
                                    <td>59.02</td>
                                    <td>61.19</td>
                                    <td>63.37</td>
                                    <td>65.75</td>
                                    <td>67.25</td>
                                    <td>69.57</td>
                                    <td>69.46</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">拉脱维亚</td>
                                    <td>女</td>
                                    <td>5.04</td>
                                    <td>5.06</td>
                                    <td>4.20</td>
                                    <td>4.01</td>
                                    <td>4.35</td>
                                    <td>4.07</td>
                                    <td>3.84</td>
                                    <td>4.22</td>
                                    <td>3.95</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>10.86</td>
                                    <td>10.41</td>
                                    <td>9.58</td>
                                    <td>9.99</td>
                                    <td>10.28</td>
                                    <td>10.40</td>
                                    <td>9.73</td>
                                    <td>9.39</td>
                                    <td>9.58</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">立陶宛</td>
                                    <td>女</td>
                                    <td>6.63</td>
                                    <td>5.55</td>
                                    <td>5.41</td>
                                    <td>4.69</td>
                                    <td>4.15</td>
                                    <td>3.70</td>
                                    <td>3.52</td>
                                    <td>3.69</td>
                                    <td>3.42</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>11.61</td>
                                    <td>10.53</td>
                                    <td>10.28</td>
                                    <td>9.72</td>
                                    <td>8.77</td>
                                    <td>7.67</td>
                                    <td>7.09</td>
                                    <td>7.22</td>
                                    <td>6.67</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">卢森堡</td>
                                    <td>女</td>
                                    <td>0.75</td>
                                    <td>0.61</td>
                                    <td>0.70</td>
                                    <td>0.47</td>
                                    <td>0.43</td>
                                    <td>0.50</td>
                                    <td>0.56</td>
                                    <td>0.71</td>
                                    <td>0.53</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>1.29</td>
                                    <td>1.37</td>
                                    <td>1.98</td>
                                    <td>1.55</td>
                                    <td>0.90</td>
                                    <td>1.01</td>
                                    <td>1.64</td>
                                    <td>1.40</td>
                                    <td>1.16</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马来西亚</td>
                                    <td>女</td>
                                    <td>7.81</td>
                                    <td>6.74</td>
                                    <td>6.72</td>
                                    <td>6.26</td>
                                    <td>5.97</td>
                                    <td>6.06</td>
                                    <td>6.06</td>
                                    <td>5.83</td>
                                    <td>5.72</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>15.20</td>
                                    <td>14.08</td>
                                    <td>13.97</td>
                                    <td>13.18</td>
                                    <td>12.71</td>
                                    <td>13.04</td>
                                    <td>12.76</td>
                                    <td>12.47</td>
                                    <td>12.27</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马耳他</td>
                                    <td>女</td>
                                    <td>0.37</td>
                                    <td>0.23</td>
                                    <td>0.21</td>
                                    <td>0.32</td>
                                    <td>0.45</td>
                                    <td>0.30</td>
                                    <td>0.38</td>
                                    <td>0.27</td>
                                    <td>0.38</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>2.16</td>
                                    <td>1.77</td>
                                    <td>1.52</td>
                                    <td>1.46</td>
                                    <td>1.39</td>
                                    <td>1.63</td>
                                    <td>1.21</td>
                                    <td>1.18</td>
                                    <td>1.63</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">墨西哥</td>
                                    <td>女</td>
                                    <td>4.32</td>
                                    <td>4.29</td>
                                    <td>4.43</td>
                                    <td>4.25</td>
                                    <td>4.32</td>
                                    <td>4.50</td>
                                    <td>4.97</td>
                                    <td>5.01</td>
                                    <td>4.77</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>19.78</td>
                                    <td>19.28</td>
                                    <td>19.22</td>
                                    <td>18.94</td>
                                    <td>18.59</td>
                                    <td>18.64</td>
                                    <td>18.62</td>
                                    <td>17.63</td>
                                    <td>16.77</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">缅甸</td>
                                    <td>女</td>
                                    <td>50.00</td>
                                    <td>48.18</td>
                                    <td>46.31</td>
                                    <td>43.39</td>
                                    <td>43.52</td>
                                    <td>39.41</td>
                                    <td>39.22</td>
                                    <td>38.23</td>
                                    <td>37.87</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>52.80</td>
                                    <td>53.71</td>
                                    <td>54.51</td>
                                    <td>52.52</td>
                                    <td>53.70</td>
                                    <td>50.68</td>
                                    <td>50.17</td>
                                    <td>49.75</td>
                                    <td>49.58</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">荷兰</td>
                                    <td>女</td>
                                    <td>1.52</td>
                                    <td>1.39</td>
                                    <td>1.47</td>
                                    <td>1.30</td>
                                    <td>1.38</td>
                                    <td>1.28</td>
                                    <td>1.45</td>
                                    <td>1.27</td>
                                    <td>1.35</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>3.01</td>
                                    <td>3.01</td>
                                    <td>2.96</td>
                                    <td>2.80</td>
                                    <td>2.69</td>
                                    <td>2.77</td>
                                    <td>2.97</td>
                                    <td>2.48</td>
                                    <td>2.41</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">菲律宾</td>
                                    <td>女</td>
                                    <td>19.07</td>
                                    <td>17.41</td>
                                    <td>15.42</td>
                                    <td>14.45</td>
                                    <td>13.78</td>
                                    <td>15.12</td>
                                    <td>15.50</td>
                                    <td>15.12</td>
                                    <td>14.73</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>35.94</td>
                                    <td>33.23</td>
                                    <td>31.69</td>
                                    <td>30.55</td>
                                    <td>28.78</td>
                                    <td>31.02</td>
                                    <td>30.06</td>
                                    <td>28.27</td>
                                    <td>27.75</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">波兰</td>
                                    <td>女</td>
                                    <td>10.36</td>
                                    <td>9.40</td>
                                    <td>8.87</td>
                                    <td>8.42</td>
                                    <td>8.08</td>
                                    <td>8.28</td>
                                    <td>7.00</td>
                                    <td>6.92</td>
                                    <td>6.09</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>12.49</td>
                                    <td>11.55</td>
                                    <td>11.32</td>
                                    <td>10.59</td>
                                    <td>10.01</td>
                                    <td>10.64</td>
                                    <td>9.55</td>
                                    <td>9.37</td>
                                    <td>8.88</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">葡萄牙</td>
                                    <td>女</td>
                                    <td>5.38</td>
                                    <td>4.77</td>
                                    <td>4.17</td>
                                    <td>3.91</td>
                                    <td>3.61</td>
                                    <td>3.47</td>
                                    <td>1.60</td>
                                    <td>1.65</td>
                                    <td>1.71</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>9.53</td>
                                    <td>8.91</td>
                                    <td>8.46</td>
                                    <td>8.05</td>
                                    <td>7.26</td>
                                    <td>7.17</td>
                                    <td>3.79</td>
                                    <td>3.90</td>
                                    <td>4.14</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">罗马尼亚</td>
                                    <td>女</td>
                                    <td>25.61</td>
                                    <td>22.64</td>
                                    <td>22.29</td>
                                    <td>22.22</td>
                                    <td>21.01</td>
                                    <td>19.94</td>
                                    <td>18.22</td>
                                    <td>17.37</td>
                                    <td>16.98</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>25.56</td>
                                    <td>23.46</td>
                                    <td>23.16</td>
                                    <td>22.38</td>
                                    <td>21.42</td>
                                    <td>20.93</td>
                                    <td>19.35</td>
                                    <td>18.89</td>
                                    <td>18.57</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">俄罗斯联邦</td>
                                    <td>女</td>
                                    <td>5.11</td>
                                    <td>5.02</td>
                                    <td>4.03</td>
                                    <td>3.99</td>
                                    <td>4.00</td>
                                    <td>4.16</td>
                                    <td>3.92</td>
                                    <td>3.85</td>
                                    <td>3.80</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>8.22</td>
                                    <td>8.32</td>
                                    <td>7.66</td>
                                    <td>7.67</td>
                                    <td>7.56</td>
                                    <td>7.75</td>
                                    <td>7.68</td>
                                    <td>7.65</td>
                                    <td>7.50</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">新加坡</td>
                                    <td>女</td>
                                    <td>0.20</td>
                                    <td>0.18</td>
                                    <td>0.17</td>
                                    <td>0.15</td>
                                    <td>0.14</td>
                                    <td>0.12</td>
                                    <td>0.11</td>
                                    <td>0.08</td>
                                    <td>0.08</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>0.28</td>
                                    <td>0.23</td>
                                    <td>0.20</td>
                                    <td>0.17</td>
                                    <td>0.14</td>
                                    <td>0.12</td>
                                    <td>0.11</td>
                                    <td>0.10</td>
                                    <td>0.10</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛伐克</td>
                                    <td>女</td>
                                    <td>1.25</td>
                                    <td>1.41</td>
                                    <td>1.36</td>
                                    <td>1.19</td>
                                    <td>1.34</td>
                                    <td>1.17</td>
                                    <td>1.79</td>
                                    <td>1.23</td>
                                    <td>1.28</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>4.57</td>
                                    <td>4.08</td>
                                    <td>3.82</td>
                                    <td>3.20</td>
                                    <td>3.98</td>
                                    <td>3.75</td>
                                    <td>4.47</td>
                                    <td>3.70</td>
                                    <td>3.35</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛文尼亚</td>
                                    <td>女</td>
                                    <td>7.06</td>
                                    <td>4.11</td>
                                    <td>4.76</td>
                                    <td>4.81</td>
                                    <td>3.45</td>
                                    <td>3.69</td>
                                    <td>3.64</td>
                                    <td>3.83</td>
                                    <td>3.38</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>6.86</td>
                                    <td>5.66</td>
                                    <td>6.06</td>
                                    <td>5.76</td>
                                    <td>4.91</td>
                                    <td>4.28</td>
                                    <td>4.29</td>
                                    <td>4.64</td>
                                    <td>4.58</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">西班牙</td>
                                    <td>女</td>
                                    <td>2.10</td>
                                    <td>2.13</td>
                                    <td>2.27</td>
                                    <td>2.16</td>
                                    <td>2.04</td>
                                    <td>1.94</td>
                                    <td>2.09</td>
                                    <td>1.89</td>
                                    <td>1.92</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>5.78</td>
                                    <td>5.94</td>
                                    <td>6.07</td>
                                    <td>5.89</td>
                                    <td>5.68</td>
                                    <td>5.67</td>
                                    <td>5.72</td>
                                    <td>5.41</td>
                                    <td>5.07</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">瑞典</td>
                                    <td>女</td>
                                    <td>1.02</td>
                                    <td>1.00</td>
                                    <td>1.02</td>
                                    <td>0.84</td>
                                    <td>0.70</td>
                                    <td>0.76</td>
                                    <td>1.01</td>
                                    <td>0.81</td>
                                    <td>0.83</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>2.96</td>
                                    <td>2.69</td>
                                    <td>2.57</td>
                                    <td>2.54</td>
                                    <td>2.58</td>
                                    <td>2.59</td>
                                    <td>2.83</td>
                                    <td>2.78</td>
                                    <td>2.61</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">泰国</td>
                                    <td>女</td>
                                    <td>29.84</td>
                                    <td>28.45</td>
                                    <td>28.52</td>
                                    <td>29.21</td>
                                    <td>28.31</td>
                                    <td>27.97</td>
                                    <td>28.41</td>
                                    <td>27.00</td>
                                    <td>26.62</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>34.40</td>
                                    <td>33.53</td>
                                    <td>34.01</td>
                                    <td>34.67</td>
                                    <td>34.13</td>
                                    <td>34.25</td>
                                    <td>34.83</td>
                                    <td>33.31</td>
                                    <td>33.06</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">英国</td>
                                    <td>女</td>
                                    <td>0.65</td>
                                    <td>0.63</td>
                                    <td>0.65</td>
                                    <td>0.62</td>
                                    <td>0.59</td>
                                    <td>0.58</td>
                                    <td>0.58</td>
                                    <td>0.57</td>
                                    <td>0.56</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>1.57</td>
                                    <td>1.56</td>
                                    <td>1.62</td>
                                    <td>1.47</td>
                                    <td>1.46</td>
                                    <td>1.46</td>
                                    <td>1.44</td>
                                    <td>1.40</td>
                                    <td>1.38</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">美国</td>
                                    <td>女</td>
                                    <td>0.96</td>
                                    <td>0.97</td>
                                    <td>0.95</td>
                                    <td>0.96</td>
                                    <td>0.95</td>
                                    <td>1.03</td>
                                    <td>0.99</td>
                                    <td>0.99</td>
                                    <td>0.99</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>2.46</td>
                                    <td>2.45</td>
                                    <td>2.44</td>
                                    <td>2.32</td>
                                    <td>2.28</td>
                                    <td>2.33</td>
                                    <td>2.22</td>
                                    <td>2.14</td>
                                    <td>2.06</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">越南</td>
                                    <td>女</td>
                                    <td>45.49</td>
                                    <td>43.53</td>
                                    <td>41.50</td>
                                    <td>38.81</td>
                                    <td>35.86</td>
                                    <td>33.83</td>
                                    <td>28.76</td>
                                    <td>34.66</td>
                                    <td>34.13</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>42.59</td>
                                    <td>40.26</td>
                                    <td>38.86</td>
                                    <td>36.69</td>
                                    <td>33.63</td>
                                    <td>31.49</td>
                                    <td>29.31</td>
                                    <td>32.32</td>
                                    <td>31.90</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="gyxbfb" style="width: 100%;height: 500px;"></div>
                <div class="experiment-body active" data-val="3" style="overflow: auto;">
                    <div class="thp" style="height: auto;">
                        <div class="mint">
                            <span>工业领域女/男性就业人数（占女/男性就业人数的百分比）</span>
                        </div>
                            <div class="scdw">
                            <table>
                                <tr>
                                    <th style="width: 60px;">国家</th>
                                    <th style="width: 60px;">性别</th>
                                    <th>2015</th>
                                    <th>2016</th>
                                    <th>2017</th>
                                    <th>2018</th>
                                    <th>2019</th>
                                    <th>2020</th>
                                    <th>2021</th>
                                    <th>2022</th>
                                    <th>2023</th>
                                </tr>
                                <tr>
                                    <td rowspan="2">中国</td>
                                    <td>女</td>
                                    <td>27.56</td>
                                    <td>27.67</td>
                                    <td>27.77</td>
                                    <td>27.94</td>
                                    <td>28.13</td>
                                    <td>28.55</td>
                                    <td>28.42</td>
                                    <td>28.24</td>
                                    <td>28.27</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>30.72</td>
                                    <td>31.27</td>
                                    <td>31.84</td>
                                    <td>32.46</td>
                                    <td>33.04</td>
                                    <td>33.79</td>
                                    <td>34.34</td>
                                    <td>34.53</td>
                                    <td>34.80</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">澳大利亚</td>
                                    <td>女</td>
                                    <td>7.83</td>
                                    <td>7.72</td>
                                    <td>7.66</td>
                                    <td>8.18</td>
                                    <td>7.50</td>
                                    <td>8.16</td>
                                    <td>8.03</td>
                                    <td>7.71</td>
                                    <td>7.98</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>30.53</td>
                                    <td>30.05</td>
                                    <td>29.69</td>
                                    <td>30.17</td>
                                    <td>29.28</td>
                                    <td>28.99</td>
                                    <td>28.64</td>
                                    <td>28.41</td>
                                    <td>29.17</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">奥地利</td>
                                    <td>女</td>
                                    <td>12.15</td>
                                    <td>11.98</td>
                                    <td>11.42</td>
                                    <td>11.88</td>
                                    <td>11.80</td>
                                    <td>11.47</td>
                                    <td>12.27</td>
                                    <td>12.81</td>
                                    <td>12.81</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>37.83</td>
                                    <td>37.59</td>
                                    <td>36.88</td>
                                    <td>37.30</td>
                                    <td>37.25</td>
                                    <td>36.70</td>
                                    <td>37.35</td>
                                    <td>38.34</td>
                                    <td>37.19</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">比利时</td>
                                    <td>女</td>
                                    <td>8.37</td>
                                    <td>8.18</td>
                                    <td>8.59</td>
                                    <td>8.58</td>
                                    <td>8.44</td>
                                    <td>8.32</td>
                                    <td>8.22</td>
                                    <td>8.55</td>
                                    <td>7.89</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>32.77</td>
                                    <td>32.47</td>
                                    <td>31.13</td>
                                    <td>31.98</td>
                                    <td>31.71</td>
                                    <td>30.98</td>
                                    <td>29.20</td>
                                    <td>28.39</td>
                                    <td>29.65</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">文莱</td>
                                    <td>女</td>
                                    <td>9.09</td>
                                    <td>9.03</td>
                                    <td>9.01</td>
                                    <td>8.77</td>
                                    <td>9.03</td>
                                    <td>9.55</td>
                                    <td>9.13</td>
                                    <td>9.32</td>
                                    <td>9.38</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>21.83</td>
                                    <td>21.33</td>
                                    <td>21.02</td>
                                    <td>26.44</td>
                                    <td>28.25</td>
                                    <td>32.74</td>
                                    <td>32.87</td>
                                    <td>29.13</td>
                                    <td>28.96</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">保加利亚</td>
                                    <td>女</td>
                                    <td>22.74</td>
                                    <td>22.35</td>
                                    <td>22.54</td>
                                    <td>22.40</td>
                                    <td>22.23</td>
                                    <td>22.60</td>
                                    <td>22.61</td>
                                    <td>21.58</td>
                                    <td>21.25</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>36.23</td>
                                    <td>36.25</td>
                                    <td>36.31</td>
                                    <td>36.80</td>
                                    <td>36.75</td>
                                    <td>36.95</td>
                                    <td>37.92</td>
                                    <td>37.38</td>
                                    <td>36.93</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">柬埔寨</td>
                                    <td>女</td>
                                    <td>24.35</td>
                                    <td>24.46</td>
                                    <td>24.55</td>
                                    <td>23.79</td>
                                    <td>23.06</td>
                                    <td>23.32</td>
                                    <td>23.55</td>
                                    <td>23.60</td>
                                    <td>23.94</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>25.45</td>
                                    <td>26.99</td>
                                    <td>26.40</td>
                                    <td>26.08</td>
                                    <td>25.83</td>
                                    <td>26.89</td>
                                    <td>29.08</td>
                                    <td>29.13</td>
                                    <td>29.66</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">加拿大</td>
                                    <td>女</td>
                                    <td>8.62</td>
                                    <td>8.64</td>
                                    <td>8.58</td>
                                    <td>8.61</td>
                                    <td>8.35</td>
                                    <td>8.75</td>
                                    <td>8.80</td>
                                    <td>8.64</td>
                                    <td>8.65</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>30.26</td>
                                    <td>29.30</td>
                                    <td>29.77</td>
                                    <td>29.64</td>
                                    <td>29.14</td>
                                    <td>28.99</td>
                                    <td>28.74</td>
                                    <td>29.04</td>
                                    <td>28.74</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">克罗地亚</td>
                                    <td>女</td>
                                    <td>15.03</td>
                                    <td>14.55</td>
                                    <td>13.51</td>
                                    <td>15.19</td>
                                    <td>16.12</td>
                                    <td>15.75</td>
                                    <td>16.07</td>
                                    <td>15.84</td>
                                    <td>15.27</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>36.69</td>
                                    <td>37.51</td>
                                    <td>37.30</td>
                                    <td>37.81</td>
                                    <td>37.45</td>
                                    <td>38.72</td>
                                    <td>39.53</td>
                                    <td>39.11</td>
                                    <td>38.26</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">塞浦路斯</td>
                                    <td>女</td>
                                    <td>6.26</td>
                                    <td>6.34</td>
                                    <td>6.84</td>
                                    <td>6.31</td>
                                    <td>6.99</td>
                                    <td>6.81</td>
                                    <td>6.99</td>
                                    <td>7.39</td>
                                    <td>7.01</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>24.66</td>
                                    <td>25.90</td>
                                    <td>25.54</td>
                                    <td>25.19</td>
                                    <td>27.71</td>
                                    <td>29.77</td>
                                    <td>26.63</td>
                                    <td>25.03</td>
                                    <td>24.07</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">捷克</td>
                                    <td>女</td>
                                    <td>23.73</td>
                                    <td>24.12</td>
                                    <td>24.18</td>
                                    <td>23.89</td>
                                    <td>23.57</td>
                                    <td>23.54</td>
                                    <td>22.79</td>
                                    <td>22.03</td>
                                    <td>21.54</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>49.10</td>
                                    <td>49.00</td>
                                    <td>48.98</td>
                                    <td>48.30</td>
                                    <td>48.12</td>
                                    <td>48.03</td>
                                    <td>47.85</td>
                                    <td>48.70</td>
                                    <td>47.15</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">丹麦</td>
                                    <td>女</td>
                                    <td>9.59</td>
                                    <td>9.29</td>
                                    <td>8.87</td>
                                    <td>8.68</td>
                                    <td>8.75</td>
                                    <td>8.98</td>
                                    <td>8.83</td>
                                    <td>9.26</td>
                                    <td>9.61</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>28.05</td>
                                    <td>27.72</td>
                                    <td>27.91</td>
                                    <td>27.96</td>
                                    <td>27.19</td>
                                    <td>27.65</td>
                                    <td>28.60</td>
                                    <td>27.92</td>
                                    <td>27.97</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱沙尼亚</td>
                                    <td>女</td>
                                    <td>17.69</td>
                                    <td>17.36</td>
                                    <td>17.63</td>
                                    <td>17.70</td>
                                    <td>17.55</td>
                                    <td>16.71</td>
                                    <td>16.94</td>
                                    <td>16.36</td>
                                    <td>14.50</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>44.19</td>
                                    <td>42.50</td>
                                    <td>42.13</td>
                                    <td>41.89</td>
                                    <td>40.46</td>
                                    <td>41.96</td>
                                    <td>40.68</td>
                                    <td>40.61</td>
                                    <td>39.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">芬兰</td>
                                    <td>女</td>
                                    <td>8.72</td>
                                    <td>8.80</td>
                                    <td>8.54</td>
                                    <td>8.89</td>
                                    <td>8.79</td>
                                    <td>9.40</td>
                                    <td>9.20</td>
                                    <td>9.61</td>
                                    <td>9.55</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>33.94</td>
                                    <td>34.54</td>
                                    <td>34.73</td>
                                    <td>34.71</td>
                                    <td>33.61</td>
                                    <td>33.49</td>
                                    <td>32.65</td>
                                    <td>32.43</td>
                                    <td>33.11</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">法国</td>
                                    <td>女</td>
                                    <td>9.42</td>
                                    <td>9.29</td>
                                    <td>9.89</td>
                                    <td>9.57</td>
                                    <td>9.54</td>
                                    <td>9.23</td>
                                    <td>9.69</td>
                                    <td>9.74</td>
                                    <td>9.78</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>30.55</td>
                                    <td>30.47</td>
                                    <td>30.07</td>
                                    <td>30.06</td>
                                    <td>30.47</td>
                                    <td>29.94</td>
                                    <td>28.76</td>
                                    <td>28.23</td>
                                    <td>28.20</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">德国</td>
                                    <td>女</td>
                                    <td>13.84</td>
                                    <td>13.77</td>
                                    <td>13.84</td>
                                    <td>13.92</td>
                                    <td>13.89</td>
                                    <td>13.92</td>
                                    <td>14.05</td>
                                    <td>13.66</td>
                                    <td>13.16</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>39.68</td>
                                    <td>39.18</td>
                                    <td>39.22</td>
                                    <td>38.97</td>
                                    <td>38.73</td>
                                    <td>39.12</td>
                                    <td>39.26</td>
                                    <td>38.41</td>
                                    <td>38.18</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">希腊</td>
                                    <td>女</td>
                                    <td>8.12</td>
                                    <td>8.31</td>
                                    <td>8.33</td>
                                    <td>7.90</td>
                                    <td>7.86</td>
                                    <td>7.83</td>
                                    <td>8.41</td>
                                    <td>7.85</td>
                                    <td>8.09</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>20.17</td>
                                    <td>20.55</td>
                                    <td>20.78</td>
                                    <td>20.81</td>
                                    <td>20.79</td>
                                    <td>20.35</td>
                                    <td>20.36</td>
                                    <td>21.28</td>
                                    <td>21.94</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">匈牙利</td>
                                    <td>女</td>
                                    <td>19.16</td>
                                    <td>19.40</td>
                                    <td>20.12</td>
                                    <td>20.25</td>
                                    <td>20.16</td>
                                    <td>19.77</td>
                                    <td>19.85</td>
                                    <td>19.84</td>
                                    <td>19.40</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>40.19</td>
                                    <td>40.21</td>
                                    <td>41.43</td>
                                    <td>43.02</td>
                                    <td>42.37</td>
                                    <td>42.30</td>
                                    <td>41.45</td>
                                    <td>41.44</td>
                                    <td>41.49</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">印度尼西亚</td>
                                    <td>女</td>
                                    <td>15.77</td>
                                    <td>16.00</td>
                                    <td>16.66</td>
                                    <td>16.98</td>
                                    <td>16.65</td>
                                    <td>15.81</td>
                                    <td>15.91</td>
                                    <td>16.32</td>
                                    <td>16.46</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>25.93</td>
                                    <td>25.34</td>
                                    <td>25.47</td>
                                    <td>25.72</td>
                                    <td>26.02</td>
                                    <td>25.32</td>
                                    <td>25.65</td>
                                    <td>25.48</td>
                                    <td>25.74</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱尔兰</td>
                                    <td>女</td>
                                    <td>8.52</td>
                                    <td>8.96</td>
                                    <td>8.74</td>
                                    <td>8.50</td>
                                    <td>8.84</td>
                                    <td>9.24</td>
                                    <td>9.32</td>
                                    <td>9.63</td>
                                    <td>9.53</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>26.20</td>
                                    <td>26.69</td>
                                    <td>27.42</td>
                                    <td>27.57</td>
                                    <td>27.24</td>
                                    <td>26.94</td>
                                    <td>26.97</td>
                                    <td>27.58</td>
                                    <td>26.17</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">意大利</td>
                                    <td>女</td>
                                    <td>13.28</td>
                                    <td>12.94</td>
                                    <td>12.79</td>
                                    <td>13.08</td>
                                    <td>13.01</td>
                                    <td>13.36</td>
                                    <td>13.37</td>
                                    <td>14.01</td>
                                    <td>13.76</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>36.13</td>
                                    <td>35.57</td>
                                    <td>35.52</td>
                                    <td>35.49</td>
                                    <td>35.18</td>
                                    <td>35.71</td>
                                    <td>36.22</td>
                                    <td>36.18</td>
                                    <td>36.04</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">日本</td>
                                    <td>女</td>
                                    <td>14.30</td>
                                    <td>14.09</td>
                                    <td>14.06</td>
                                    <td>13.94</td>
                                    <td>13.78</td>
                                    <td>13.58</td>
                                    <td>13.49</td>
                                    <td>13.55</td>
                                    <td>13.70</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>33.18</td>
                                    <td>32.91</td>
                                    <td>33.01</td>
                                    <td>32.68</td>
                                    <td>32.57</td>
                                    <td>32.36</td>
                                    <td>32.17</td>
                                    <td>31.66</td>
                                    <td>31.92</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">韩国</td>
                                    <td>女</td>
                                    <td>13.81</td>
                                    <td>13.38</td>
                                    <td>13.75</td>
                                    <td>13.56</td>
                                    <td>12.92</td>
                                    <td>12.91</td>
                                    <td>12.98</td>
                                    <td>12.92</td>
                                    <td>12.75</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>33.76</td>
                                    <td>33.80</td>
                                    <td>33.75</td>
                                    <td>33.85</td>
                                    <td>33.35</td>
                                    <td>33.45</td>
                                    <td>33.41</td>
                                    <td>33.27</td>
                                    <td>32.75</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">老挝</td>
                                    <td>女</td>
                                    <td>7.41</td>
                                    <td>7.56</td>
                                    <td>7.70</td>
                                    <td>7.28</td>
                                    <td>6.88</td>
                                    <td>6.57</td>
                                    <td>6.17</td>
                                    <td>5.64</td>
                                    <td>5.61</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>11.08</td>
                                    <td>11.29</td>
                                    <td>11.55</td>
                                    <td>10.78</td>
                                    <td>10.09</td>
                                    <td>9.53</td>
                                    <td>9.21</td>
                                    <td>8.52</td>
                                    <td>8.85</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">拉脱维亚</td>
                                    <td>女</td>
                                    <td>12.73</td>
                                    <td>13.33</td>
                                    <td>12.86</td>
                                    <td>13.01</td>
                                    <td>11.90</td>
                                    <td>13.22</td>
                                    <td>12.62</td>
                                    <td>12.61</td>
                                    <td>12.47</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>34.67</td>
                                    <td>35.23</td>
                                    <td>33.95</td>
                                    <td>34.50</td>
                                    <td>35.69</td>
                                    <td>34.18</td>
                                    <td>34.36</td>
                                    <td>34.82</td>
                                    <td>33.47</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">立陶宛</td>
                                    <td>女</td>
                                    <td>16.47</td>
                                    <td>15.59</td>
                                    <td>15.59</td>
                                    <td>16.62</td>
                                    <td>16.55</td>
                                    <td>16.26</td>
                                    <td>16.36</td>
                                    <td>16.21</td>
                                    <td>16.47</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>34.02</td>
                                    <td>35.17</td>
                                    <td>35.15</td>
                                    <td>35.11</td>
                                    <td>35.03</td>
                                    <td>34.41</td>
                                    <td>36.05</td>
                                    <td>35.20</td>
                                    <td>35.03</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">卢森堡</td>
                                    <td>女</td>
                                    <td>4.42</td>
                                    <td>4.90</td>
                                    <td>3.41</td>
                                    <td>4.23</td>
                                    <td>4.41</td>
                                    <td>3.86</td>
                                    <td>3.69</td>
                                    <td>3.79</td>
                                    <td>3.81</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>19.21</td>
                                    <td>17.98</td>
                                    <td>17.05</td>
                                    <td>18.18</td>
                                    <td>16.21</td>
                                    <td>15.97</td>
                                    <td>14.20</td>
                                    <td>13.89</td>
                                    <td>14.57</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马来西亚</td>
                                    <td>女</td>
                                    <td>19.15</td>
                                    <td>19.88</td>
                                    <td>19.70</td>
                                    <td>19.61</td>
                                    <td>19.50</td>
                                    <td>19.52</td>
                                    <td>19.42</td>
                                    <td>19.10</td>
                                    <td>19.00</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>32.43</td>
                                    <td>31.95</td>
                                    <td>31.90</td>
                                    <td>32.06</td>
                                    <td>32.16</td>
                                    <td>32.43</td>
                                    <td>32.87</td>
                                    <td>32.88</td>
                                    <td>32.92</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马耳他</td>
                                    <td>女</td>
                                    <td>8.44</td>
                                    <td>8.39</td>
                                    <td>9.42</td>
                                    <td>8.75</td>
                                    <td>8.61</td>
                                    <td>8.10</td>
                                    <td>7.70</td>
                                    <td>7.48</td>
                                    <td>8.59</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>27.31</td>
                                    <td>27.28</td>
                                    <td>26.68</td>
                                    <td>25.29</td>
                                    <td>26.04</td>
                                    <td>25.25</td>
                                    <td>25.13</td>
                                    <td>23.84</td>
                                    <td>24.03</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">墨西哥</td>
                                    <td>女</td>
                                    <td>16.46</td>
                                    <td>16.84</td>
                                    <td>17.30</td>
                                    <td>17.45</td>
                                    <td>16.91</td>
                                    <td>16.98</td>
                                    <td>17.12</td>
                                    <td>17.45</td>
                                    <td>17.64</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>28.58</td>
                                    <td>29.08</td>
                                    <td>29.31</td>
                                    <td>29.49</td>
                                    <td>29.38</td>
                                    <td>28.64</td>
                                    <td>29.13</td>
                                    <td>29.87</td>
                                    <td>29.97</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">缅甸</td>
                                    <td>女</td>
                                    <td>14.51</td>
                                    <td>14.85</td>
                                    <td>15.16</td>
                                    <td>16.73</td>
                                    <td>16.70</td>
                                    <td>18.08</td>
                                    <td>18.07</td>
                                    <td>18.24</td>
                                    <td>18.37</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>18.24</td>
                                    <td>17.10</td>
                                    <td>16.04</td>
                                    <td>17.20</td>
                                    <td>16.60</td>
                                    <td>18.87</td>
                                    <td>19.04</td>
                                    <td>18.98</td>
                                    <td>18.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">荷兰</td>
                                    <td>女</td>
                                    <td>6.10</td>
                                    <td>6.24</td>
                                    <td>6.24</td>
                                    <td>6.36</td>
                                    <td>6.33</td>
                                    <td>6.58</td>
                                    <td>5.55</td>
                                    <td>5.75</td>
                                    <td>5.79</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>25.35</td>
                                    <td>25.35</td>
                                    <td>25.49</td>
                                    <td>24.77</td>
                                    <td>24.75</td>
                                    <td>24.28</td>
                                    <td>21.39</td>
                                    <td>21.35</td>
                                    <td>21.45</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">菲律宾</td>
                                    <td>女</td>
                                    <td>10.03</td>
                                    <td>10.00</td>
                                    <td>9.92</td>
                                    <td>9.87</td>
                                    <td>9.75</td>
                                    <td>9.19</td>
                                    <td>8.74</td>
                                    <td>8.81</td>
                                    <td>8.79</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>20.30</td>
                                    <td>22.33</td>
                                    <td>23.48</td>
                                    <td>24.91</td>
                                    <td>25.22</td>
                                    <td>24.20</td>
                                    <td>25.44</td>
                                    <td>25.23</td>
                                    <td>25.30</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">波兰</td>
                                    <td>女</td>
                                    <td>16.45</td>
                                    <td>16.85</td>
                                    <td>17.21</td>
                                    <td>17.40</td>
                                    <td>17.49</td>
                                    <td>17.15</td>
                                    <td>16.88</td>
                                    <td>16.54</td>
                                    <td>16.59</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>42.00</td>
                                    <td>43.30</td>
                                    <td>43.37</td>
                                    <td>43.54</td>
                                    <td>43.89</td>
                                    <td>43.31</td>
                                    <td>42.49</td>
                                    <td>42.75</td>
                                    <td>40.69</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">葡萄牙</td>
                                    <td>女</td>
                                    <td>15.22</td>
                                    <td>15.13</td>
                                    <td>15.26</td>
                                    <td>15.34</td>
                                    <td>15.00</td>
                                    <td>15.41</td>
                                    <td>15.70</td>
                                    <td>15.68</td>
                                    <td>15.75</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>32.97</td>
                                    <td>33.36</td>
                                    <td>33.67</td>
                                    <td>33.90</td>
                                    <td>33.88</td>
                                    <td>33.71</td>
                                    <td>33.09</td>
                                    <td>33.11</td>
                                    <td>33.89</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">罗马尼亚</td>
                                    <td>女</td>
                                    <td>20.03</td>
                                    <td>21.05</td>
                                    <td>21.70</td>
                                    <td>21.46</td>
                                    <td>20.92</td>
                                    <td>20.28</td>
                                    <td>22.27</td>
                                    <td>22.06</td>
                                    <td>22.61</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>35.02</td>
                                    <td>36.72</td>
                                    <td>36.71</td>
                                    <td>36.64</td>
                                    <td>37.06</td>
                                    <td>36.85</td>
                                    <td>39.77</td>
                                    <td>40.21</td>
                                    <td>40.99</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">俄罗斯联邦</td>
                                    <td>女</td>
                                    <td>16.14</td>
                                    <td>16.07</td>
                                    <td>15.78</td>
                                    <td>15.72</td>
                                    <td>15.44</td>
                                    <td>15.17</td>
                                    <td>15.13</td>
                                    <td>14.76</td>
                                    <td>14.80</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>37.60</td>
                                    <td>37.19</td>
                                    <td>37.48</td>
                                    <td>37.25</td>
                                    <td>37.50</td>
                                    <td>37.22</td>
                                    <td>37.46</td>
                                    <td>37.24</td>
                                    <td>37.41</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">新加坡</td>
                                    <td>女</td>
                                    <td>12.12</td>
                                    <td>11.42</td>
                                    <td>11.21</td>
                                    <td>11.37</td>
                                    <td>10.54</td>
                                    <td>10.71</td>
                                    <td>10.68</td>
                                    <td>10.68</td>
                                    <td>10.51</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>20.91</td>
                                    <td>19.51</td>
                                    <td>19.22</td>
                                    <td>19.43</td>
                                    <td>18.22</td>
                                    <td>17.97</td>
                                    <td>17.38</td>
                                    <td>17.55</td>
                                    <td>17.31</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛伐克</td>
                                    <td>女</td>
                                    <td>20.82</td>
                                    <td>21.11</td>
                                    <td>21.26</td>
                                    <td>20.55</td>
                                    <td>20.22</td>
                                    <td>21.10</td>
                                    <td>21.51</td>
                                    <td>20.27</td>
                                    <td>18.98</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>48.45</td>
                                    <td>48.87</td>
                                    <td>50.30</td>
                                    <td>49.52</td>
                                    <td>49.15</td>
                                    <td>49.30</td>
                                    <td>49.60</td>
                                    <td>49.59</td>
                                    <td>49.02</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛文尼亚</td>
                                    <td>女</td>
                                    <td>18.27</td>
                                    <td>19.16</td>
                                    <td>19.01</td>
                                    <td>20.39</td>
                                    <td>20.44</td>
                                    <td>19.15</td>
                                    <td>16.71</td>
                                    <td>17.03</td>
                                    <td>18.35</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>43.56</td>
                                    <td>45.26</td>
                                    <td>45.39</td>
                                    <td>44.37</td>
                                    <td>45.62</td>
                                    <td>46.60</td>
                                    <td>41.17</td>
                                    <td>41.14</td>
                                    <td>43.72</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">西班牙</td>
                                    <td>女</td>
                                    <td>8.65</td>
                                    <td>8.40</td>
                                    <td>8.84</td>
                                    <td>9.11</td>
                                    <td>9.41</td>
                                    <td>9.54</td>
                                    <td>9.05</td>
                                    <td>9.39</td>
                                    <td>9.14</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>29.13</td>
                                    <td>28.80</td>
                                    <td>29.29</td>
                                    <td>29.59</td>
                                    <td>29.55</td>
                                    <td>29.61</td>
                                    <td>29.56</td>
                                    <td>29.05</td>
                                    <td>29.05</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">瑞典</td>
                                    <td>女</td>
                                    <td>6.90</td>
                                    <td>6.94</td>
                                    <td>7.09</td>
                                    <td>7.14</td>
                                    <td>7.11</td>
                                    <td>7.32</td>
                                    <td>7.89</td>
                                    <td>7.37</td>
                                    <td>7.32</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>28.67</td>
                                    <td>28.48</td>
                                    <td>28.23</td>
                                    <td>28.19</td>
                                    <td>28.60</td>
                                    <td>28.12</td>
                                    <td>27.26</td>
                                    <td>25.95</td>
                                    <td>26.22</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">泰国</td>
                                    <td>女</td>
                                    <td>20.82</td>
                                    <td>20.55</td>
                                    <td>19.90</td>
                                    <td>19.99</td>
                                    <td>19.79</td>
                                    <td>19.44</td>
                                    <td>19.02</td>
                                    <td>19.05</td>
                                    <td>18.98</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>26.12</td>
                                    <td>26.35</td>
                                    <td>25.37</td>
                                    <td>25.21</td>
                                    <td>25.46</td>
                                    <td>25.25</td>
                                    <td>25.00</td>
                                    <td>24.93</td>
                                    <td>24.80</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">英国</td>
                                    <td>女</td>
                                    <td>7.72</td>
                                    <td>7.66</td>
                                    <td>7.71</td>
                                    <td>7.49</td>
                                    <td>7.78</td>
                                    <td>7.85</td>
                                    <td>7.86</td>
                                    <td>7.86</td>
                                    <td>7.75</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>28.35</td>
                                    <td>28.09</td>
                                    <td>27.68</td>
                                    <td>27.63</td>
                                    <td>27.54</td>
                                    <td>27.53</td>
                                    <td>27.62</td>
                                    <td>27.19</td>
                                    <td>26.91</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">美国</td>
                                    <td>女</td>
                                    <td>8.55</td>
                                    <td>8.42</td>
                                    <td>8.43</td>
                                    <td>8.47</td>
                                    <td>8.59</td>
                                    <td>8.59</td>
                                    <td>8.45</td>
                                    <td>8.56</td>
                                    <td>8.64</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>28.60</td>
                                    <td>28.54</td>
                                    <td>28.48</td>
                                    <td>28.71</td>
                                    <td>28.72</td>
                                    <td>28.30</td>
                                    <td>28.06</td>
                                    <td>28.16</td>
                                    <td>28.32</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">越南</td>
                                    <td>女</td>
                                    <td>19.33</td>
                                    <td>20.79</td>
                                    <td>21.82</td>
                                    <td>22.88</td>
                                    <td>24.89</td>
                                    <td>26.81</td>
                                    <td>29.34</td>
                                    <td>26.71</td>
                                    <td>27.30</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>26.05</td>
                                    <td>28.61</td>
                                    <td>29.57</td>
                                    <td>30.35</td>
                                    <td>32.75</td>
                                    <td>34.99</td>
                                    <td>36.72</td>
                                    <td>34.45</td>
                                    <td>34.96</td>
                                </tr>
                            </table>
                            </div>

                        </div>
                </div>


                <div id="fwxbfb" style="width: 100%;height: 500px;"></div>
                <div class="experiment-body active" data-val="4" style="overflow: auto;">
                    <div class="thp" style="height: auto;">
                        <div class="mint">
                            <span>服务业领域女/男性就业人数（占女/男性就业人数的百分比）</span>
                        </div>
                        <div class="scdw">
                            <table>
                                <thead>
                                <tr>
                                    <th style="width: 60px;">国家</th>
                                    <th style="width: 60px;">性别</th>
                                    <th>2015</th>
                                    <th>2016</th>
                                    <th>2017</th>
                                    <th>2018</th>
                                    <th>2019</th>
                                    <th>2020</th>
                                    <th>2021</th>
                                    <th>2022</th>
                                    <th>2023</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">中国</td>
                                    <td>女</td>
                                    <td>48.31</td>
                                    <td>49.05</td>
                                    <td>49.59</td>
                                    <td>50.31</td>
                                    <td>51.17</td>
                                    <td>51.87</td>
                                    <td>51.92</td>
                                    <td>52.78</td>
                                    <td>53.13</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>37.58</td>
                                    <td>37.93</td>
                                    <td>38.15</td>
                                    <td>38.49</td>
                                    <td>38.91</td>
                                    <td>39.29</td>
                                    <td>39.16</td>
                                    <td>39.58</td>
                                    <td>39.76</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">澳大利亚</td>
                                    <td>女</td>
                                    <td>90.32</td>
                                    <td>90.52</td>
                                    <td>90.69</td>
                                    <td>90.14</td>
                                    <td>90.78</td>
                                    <td>89.93</td>
                                    <td>90.18</td>
                                    <td>90.94</td>
                                    <td>90.53</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>66.16</td>
                                    <td>66.58</td>
                                    <td>66.89</td>
                                    <td>66.39</td>
                                    <td>67.42</td>
                                    <td>67.49</td>
                                    <td>68.24</td>
                                    <td>68.67</td>
                                    <td>68.08</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">奥地利</td>
                                    <td>女</td>
                                    <td>83.64</td>
                                    <td>84.09</td>
                                    <td>84.90</td>
                                    <td>84.84</td>
                                    <td>85.01</td>
                                    <td>85.15</td>
                                    <td>84.33</td>
                                    <td>84.01</td>
                                    <td>84.61</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>57.35</td>
                                    <td>57.69</td>
                                    <td>58.97</td>
                                    <td>58.64</td>
                                    <td>58.69</td>
                                    <td>59.01</td>
                                    <td>58.62</td>
                                    <td>57.81</td>
                                    <td>59.22</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">比利时</td>
                                    <td>女</td>
                                    <td>90.90</td>
                                    <td>91.06</td>
                                    <td>90.71</td>
                                    <td>90.79</td>
                                    <td>90.92</td>
                                    <td>91.04</td>
                                    <td>91.23</td>
                                    <td>90.88</td>
                                    <td>91.46</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>65.66</td>
                                    <td>65.85</td>
                                    <td>67.31</td>
                                    <td>66.72</td>
                                    <td>67.11</td>
                                    <td>67.87</td>
                                    <td>69.53</td>
                                    <td>70.40</td>
                                    <td>68.88</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">文莱</td>
                                    <td>女</td>
                                    <td>90.50</td>
                                    <td>90.54</td>
                                    <td>90.56</td>
                                    <td>90.70</td>
                                    <td>90.28</td>
                                    <td>89.82</td>
                                    <td>90.58</td>
                                    <td>89.73</td>
                                    <td>89.76</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>76.17</td>
                                    <td>76.66</td>
                                    <td>76.98</td>
                                    <td>72.15</td>
                                    <td>68.99</td>
                                    <td>65.47</td>
                                    <td>65.01</td>
                                    <td>69.00</td>
                                    <td>69.12</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">保加利亚</td>
                                    <td>女</td>
                                    <td>72.93</td>
                                    <td>73.41</td>
                                    <td>72.92</td>
                                    <td>73.36</td>
                                    <td>73.47</td>
                                    <td>73.14</td>
                                    <td>73.29</td>
                                    <td>74.18</td>
                                    <td>75.17</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>54.68</td>
                                    <td>54.81</td>
                                    <td>54.51</td>
                                    <td>54.59</td>
                                    <td>54.62</td>
                                    <td>54.45</td>
                                    <td>53.90</td>
                                    <td>54.26</td>
                                    <td>55.54</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">柬埔寨</td>
                                    <td>女</td>
                                    <td>30.93</td>
                                    <td>35.05</td>
                                    <td>35.11</td>
                                    <td>35.60</td>
                                    <td>36.07</td>
                                    <td>37.17</td>
                                    <td>36.76</td>
                                    <td>37.40</td>
                                    <td>37.75</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>34.17</td>
                                    <td>38.24</td>
                                    <td>37.44</td>
                                    <td>36.38</td>
                                    <td>35.26</td>
                                    <td>38.70</td>
                                    <td>36.16</td>
                                    <td>36.39</td>
                                    <td>36.46</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">加拿大</td>
                                    <td>女</td>
                                    <td>90.34</td>
                                    <td>90.23</td>
                                    <td>90.46</td>
                                    <td>90.43</td>
                                    <td>90.64</td>
                                    <td>90.22</td>
                                    <td>90.29</td>
                                    <td>90.53</td>
                                    <td>90.50</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>67.55</td>
                                    <td>68.02</td>
                                    <td>68.22</td>
                                    <td>68.34</td>
                                    <td>68.85</td>
                                    <td>68.99</td>
                                    <td>69.50</td>
                                    <td>69.22</td>
                                    <td>69.60</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">克罗地亚</td>
                                    <td>女</td>
                                    <td>77.54</td>
                                    <td>79.91</td>
                                    <td>81.36</td>
                                    <td>79.73</td>
                                    <td>79.46</td>
                                    <td>79.76</td>
                                    <td>78.97</td>
                                    <td>80.21</td>
                                    <td>81.46</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>52.54</td>
                                    <td>53.14</td>
                                    <td>54.16</td>
                                    <td>54.96</td>
                                    <td>54.85</td>
                                    <td>53.16</td>
                                    <td>52.10</td>
                                    <td>53.33</td>
                                    <td>55.82</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">塞浦路斯</td>
                                    <td>女</td>
                                    <td>91.68</td>
                                    <td>92.04</td>
                                    <td>92.09</td>
                                    <td>92.67</td>
                                    <td>91.74</td>
                                    <td>91.65</td>
                                    <td>91.83</td>
                                    <td>91.75</td>
                                    <td>92.22</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>69.70</td>
                                    <td>68.79</td>
                                    <td>70.72</td>
                                    <td>71.70</td>
                                    <td>68.95</td>
                                    <td>66.53</td>
                                    <td>69.18</td>
                                    <td>71.38</td>
                                    <td>72.19</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">捷克</td>
                                    <td>女</td>
                                    <td>74.63</td>
                                    <td>74.16</td>
                                    <td>74.03</td>
                                    <td>74.35</td>
                                    <td>74.69</td>
                                    <td>74.86</td>
                                    <td>75.70</td>
                                    <td>76.22</td>
                                    <td>76.67</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>46.97</td>
                                    <td>47.17</td>
                                    <td>47.41</td>
                                    <td>48.08</td>
                                    <td>48.48</td>
                                    <td>48.57</td>
                                    <td>48.79</td>
                                    <td>47.89</td>
                                    <td>49.33</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">丹麦</td>
                                    <td>女</td>
                                    <td>89.41</td>
                                    <td>89.80</td>
                                    <td>90.20</td>
                                    <td>90.36</td>
                                    <td>90.15</td>
                                    <td>90.04</td>
                                    <td>90.25</td>
                                    <td>89.68</td>
                                    <td>89.40</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>68.15</td>
                                    <td>68.68</td>
                                    <td>68.94</td>
                                    <td>68.75</td>
                                    <td>69.60</td>
                                    <td>69.24</td>
                                    <td>68.36</td>
                                    <td>69.02</td>
                                    <td>69.08</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱沙尼亚</td>
                                    <td>女</td>
                                    <td>79.75</td>
                                    <td>80.69</td>
                                    <td>80.51</td>
                                    <td>80.65</td>
                                    <td>80.90</td>
                                    <td>81.73</td>
                                    <td>81.63</td>
                                    <td>82.00</td>
                                    <td>84.34</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>50.38</td>
                                    <td>51.74</td>
                                    <td>52.55</td>
                                    <td>53.00</td>
                                    <td>54.52</td>
                                    <td>53.52</td>
                                    <td>55.42</td>
                                    <td>55.84</td>
                                    <td>56.05</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">芬兰</td>
                                    <td>女</td>
                                    <td>89.08</td>
                                    <td>89.11</td>
                                    <td>89.31</td>
                                    <td>89.05</td>
                                    <td>89.15</td>
                                    <td>88.56</td>
                                    <td>88.66</td>
                                    <td>88.43</td>
                                    <td>88.71</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>59.93</td>
                                    <td>59.94</td>
                                    <td>60.01</td>
                                    <td>60.06</td>
                                    <td>61.02</td>
                                    <td>61.38</td>
                                    <td>61.43</td>
                                    <td>62.12</td>
                                    <td>61.49</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">法国</td>
                                    <td>女</td>
                                    <td>88.93</td>
                                    <td>89.07</td>
                                    <td>88.54</td>
                                    <td>89.05</td>
                                    <td>89.01</td>
                                    <td>89.34</td>
                                    <td>88.86</td>
                                    <td>88.69</td>
                                    <td>88.61</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>65.70</td>
                                    <td>65.52</td>
                                    <td>66.37</td>
                                    <td>66.42</td>
                                    <td>66.04</td>
                                    <td>66.85</td>
                                    <td>67.72</td>
                                    <td>68.22</td>
                                    <td>68.44</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">德国</td>
                                    <td>女</td>
                                    <td>85.20</td>
                                    <td>85.34</td>
                                    <td>85.28</td>
                                    <td>85.23</td>
                                    <td>85.28</td>
                                    <td>85.26</td>
                                    <td>85.02</td>
                                    <td>85.45</td>
                                    <td>86.02</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>58.55</td>
                                    <td>59.15</td>
                                    <td>59.16</td>
                                    <td>59.43</td>
                                    <td>59.74</td>
                                    <td>59.32</td>
                                    <td>59.22</td>
                                    <td>60.04</td>
                                    <td>60.29</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">希腊</td>
                                    <td>女</td>
                                    <td>80.15</td>
                                    <td>80.63</td>
                                    <td>80.82</td>
                                    <td>81.06</td>
                                    <td>81.99</td>
                                    <td>82.96</td>
                                    <td>81.33</td>
                                    <td>82.38</td>
                                    <td>82.08</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>66.76</td>
                                    <td>66.88</td>
                                    <td>66.95</td>
                                    <td>66.75</td>
                                    <td>67.32</td>
                                    <td>68.55</td>
                                    <td>67.46</td>
                                    <td>66.53</td>
                                    <td>65.34</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">匈牙利</td>
                                    <td>女</td>
                                    <td>78.15</td>
                                    <td>77.71</td>
                                    <td>76.99</td>
                                    <td>76.98</td>
                                    <td>76.96</td>
                                    <td>77.36</td>
                                    <td>77.52</td>
                                    <td>77.60</td>
                                    <td>78.03</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>52.96</td>
                                    <td>52.85</td>
                                    <td>51.67</td>
                                    <td>50.32</td>
                                    <td>51.32</td>
                                    <td>51.33</td>
                                    <td>52.62</td>
                                    <td>52.61</td>
                                    <td>52.43</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">印度尼西亚</td>
                                    <td>女</td>
                                    <td>51.61</td>
                                    <td>53.91</td>
                                    <td>54.49</td>
                                    <td>55.41</td>
                                    <td>56.76</td>
                                    <td>57.02</td>
                                    <td>58.06</td>
                                    <td>57.12</td>
                                    <td>57.42</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>40.77</td>
                                    <td>41.75</td>
                                    <td>42.49</td>
                                    <td>43.19</td>
                                    <td>43.85</td>
                                    <td>43.52</td>
                                    <td>43.40</td>
                                    <td>43.46</td>
                                    <td>43.76</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱尔兰</td>
                                    <td>女</td>
                                    <td>89.88</td>
                                    <td>89.50</td>
                                    <td>89.70</td>
                                    <td>90.04</td>
                                    <td>89.95</td>
                                    <td>89.30</td>
                                    <td>89.37</td>
                                    <td>89.12</td>
                                    <td>89.20</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>65.35</td>
                                    <td>64.85</td>
                                    <td>64.58</td>
                                    <td>64.87</td>
                                    <td>65.59</td>
                                    <td>66.02</td>
                                    <td>65.79</td>
                                    <td>66.05</td>
                                    <td>67.37</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">意大利</td>
                                    <td>女</td>
                                    <td>84.29</td>
                                    <td>84.54</td>
                                    <td>84.86</td>
                                    <td>84.53</td>
                                    <td>84.61</td>
                                    <td>84.23</td>
                                    <td>84.16</td>
                                    <td>83.66</td>
                                    <td>84.06</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>59.18</td>
                                    <td>59.57</td>
                                    <td>59.67</td>
                                    <td>59.77</td>
                                    <td>59.83</td>
                                    <td>59.18</td>
                                    <td>58.59</td>
                                    <td>58.98</td>
                                    <td>59.33</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">日本</td>
                                    <td>女</td>
                                    <td>82.64</td>
                                    <td>83.02</td>
                                    <td>83.09</td>
                                    <td>83.12</td>
                                    <td>83.39</td>
                                    <td>83.72</td>
                                    <td>83.95</td>
                                    <td>83.89</td>
                                    <td>83.86</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>62.99</td>
                                    <td>63.33</td>
                                    <td>63.30</td>
                                    <td>63.56</td>
                                    <td>63.82</td>
                                    <td>64.13</td>
                                    <td>64.37</td>
                                    <td>64.81</td>
                                    <td>64.61</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">韩国</td>
                                    <td>女</td>
                                    <td>80.81</td>
                                    <td>81.62</td>
                                    <td>81.47</td>
                                    <td>81.68</td>
                                    <td>82.23</td>
                                    <td>82.15</td>
                                    <td>82.23</td>
                                    <td>82.19</td>
                                    <td>82.50</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>61.11</td>
                                    <td>61.30</td>
                                    <td>61.22</td>
                                    <td>60.98</td>
                                    <td>61.29</td>
                                    <td>60.86</td>
                                    <td>60.83</td>
                                    <td>60.89</td>
                                    <td>61.48</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">老挝</td>
                                    <td>女</td>
                                    <td>26.20</td>
                                    <td>27.51</td>
                                    <td>28.98</td>
                                    <td>28.25</td>
                                    <td>27.47</td>
                                    <td>26.41</td>
                                    <td>25.45</td>
                                    <td>24.80</td>
                                    <td>24.55</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>26.80</td>
                                    <td>28.06</td>
                                    <td>29.43</td>
                                    <td>28.03</td>
                                    <td>26.54</td>
                                    <td>24.71</td>
                                    <td>23.54</td>
                                    <td>21.91</td>
                                    <td>21.69</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">拉脱维亚</td>
                                    <td>女</td>
                                    <td>82.23</td>
                                    <td>81.61</td>
                                    <td>82.94</td>
                                    <td>82.99</td>
                                    <td>83.75</td>
                                    <td>82.71</td>
                                    <td>83.55</td>
                                    <td>83.18</td>
                                    <td>83.58</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>54.46</td>
                                    <td>54.36</td>
                                    <td>56.47</td>
                                    <td>55.51</td>
                                    <td>54.03</td>
                                    <td>55.42</td>
                                    <td>55.91</td>
                                    <td>55.79</td>
                                    <td>56.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">立陶宛</td>
                                    <td>女</td>
                                    <td>76.90</td>
                                    <td>78.87</td>
                                    <td>79.01</td>
                                    <td>78.69</td>
                                    <td>79.30</td>
                                    <td>80.05</td>
                                    <td>80.12</td>
                                    <td>80.10</td>
                                    <td>80.10</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>54.38</td>
                                    <td>54.30</td>
                                    <td>54.57</td>
                                    <td>55.16</td>
                                    <td>56.20</td>
                                    <td>57.92</td>
                                    <td>56.86</td>
                                    <td>57.58</td>
                                    <td>58.29</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">卢森堡</td>
                                    <td>女</td>
                                    <td>94.83</td>
                                    <td>94.49</td>
                                    <td>95.89</td>
                                    <td>95.30</td>
                                    <td>95.17</td>
                                    <td>95.64</td>
                                    <td>95.76</td>
                                    <td>95.50</td>
                                    <td>95.65</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>79.50</td>
                                    <td>80.64</td>
                                    <td>80.97</td>
                                    <td>80.27</td>
                                    <td>82.89</td>
                                    <td>83.02</td>
                                    <td>84.15</td>
                                    <td>84.71</td>
                                    <td>84.26</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马来西亚</td>
                                    <td>女</td>
                                    <td>73.04</td>
                                    <td>73.38</td>
                                    <td>73.59</td>
                                    <td>74.13</td>
                                    <td>74.53</td>
                                    <td>74.42</td>
                                    <td>74.52</td>
                                    <td>75.06</td>
                                    <td>75.27</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>52.37</td>
                                    <td>53.97</td>
                                    <td>54.14</td>
                                    <td>54.75</td>
                                    <td>55.13</td>
                                    <td>54.53</td>
                                    <td>54.38</td>
                                    <td>54.65</td>
                                    <td>54.81</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马耳他</td>
                                    <td>女</td>
                                    <td>91.18</td>
                                    <td>91.38</td>
                                    <td>90.37</td>
                                    <td>90.93</td>
                                    <td>90.95</td>
                                    <td>91.60</td>
                                    <td>91.93</td>
                                    <td>92.25</td>
                                    <td>91.04</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>70.54</td>
                                    <td>70.95</td>
                                    <td>71.80</td>
                                    <td>73.25</td>
                                    <td>72.57</td>
                                    <td>73.12</td>
                                    <td>73.66</td>
                                    <td>74.98</td>
                                    <td>74.33</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">墨西哥</td>
                                    <td>女</td>
                                    <td>79.22</td>
                                    <td>78.87</td>
                                    <td>78.27</td>
                                    <td>78.30</td>
                                    <td>78.77</td>
                                    <td>78.52</td>
                                    <td>77.91</td>
                                    <td>77.54</td>
                                    <td>77.59</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>51.65</td>
                                    <td>51.63</td>
                                    <td>51.46</td>
                                    <td>51.57</td>
                                    <td>52.03</td>
                                    <td>52.72</td>
                                    <td>52.25</td>
                                    <td>52.51</td>
                                    <td>53.26</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">缅甸</td>
                                    <td>女</td>
                                    <td>35.48</td>
                                    <td>36.97</td>
                                    <td>38.52</td>
                                    <td>39.88</td>
                                    <td>39.78</td>
                                    <td>42.51</td>
                                    <td>42.71</td>
                                    <td>43.52</td>
                                    <td>43.76</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>28.96</td>
                                    <td>29.19</td>
                                    <td>29.45</td>
                                    <td>30.28</td>
                                    <td>29.70</td>
                                    <td>30.44</td>
                                    <td>30.79</td>
                                    <td>31.26</td>
                                    <td>31.46</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">荷兰</td>
                                    <td>女</td>
                                    <td>92.39</td>
                                    <td>92.37</td>
                                    <td>92.29</td>
                                    <td>92.34</td>
                                    <td>92.29</td>
                                    <td>92.14</td>
                                    <td>93.00</td>
                                    <td>92.97</td>
                                    <td>92.87</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>71.64</td>
                                    <td>71.63</td>
                                    <td>71.55</td>
                                    <td>72.43</td>
                                    <td>72.55</td>
                                    <td>72.96</td>
                                    <td>75.64</td>
                                    <td>76.16</td>
                                    <td>76.15</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">菲律宾</td>
                                    <td>女</td>
                                    <td>70.90</td>
                                    <td>72.59</td>
                                    <td>74.66</td>
                                    <td>75.68</td>
                                    <td>76.47</td>
                                    <td>75.69</td>
                                    <td>75.76</td>
                                    <td>76.06</td>
                                    <td>76.48</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>43.75</td>
                                    <td>44.44</td>
                                    <td>44.83</td>
                                    <td>44.54</td>
                                    <td>46.01</td>
                                    <td>44.78</td>
                                    <td>44.50</td>
                                    <td>46.50</td>
                                    <td>46.95</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">波兰</td>
                                    <td>女</td>
                                    <td>73.19</td>
                                    <td>73.76</td>
                                    <td>73.92</td>
                                    <td>74.18</td>
                                    <td>74.43</td>
                                    <td>74.57</td>
                                    <td>76.12</td>
                                    <td>76.54</td>
                                    <td>77.32</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>45.51</td>
                                    <td>45.15</td>
                                    <td>45.32</td>
                                    <td>45.87</td>
                                    <td>46.10</td>
                                    <td>46.05</td>
                                    <td>47.97</td>
                                    <td>47.89</td>
                                    <td>50.43</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">葡萄牙</td>
                                    <td>女</td>
                                    <td>79.40</td>
                                    <td>80.10</td>
                                    <td>80.58</td>
                                    <td>80.75</td>
                                    <td>81.39</td>
                                    <td>81.12</td>
                                    <td>82.70</td>
                                    <td>82.67</td>
                                    <td>82.54</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>57.50</td>
                                    <td>57.73</td>
                                    <td>57.86</td>
                                    <td>58.05</td>
                                    <td>58.86</td>
                                    <td>59.13</td>
                                    <td>63.12</td>
                                    <td>62.99</td>
                                    <td>61.97</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">罗马尼亚</td>
                                    <td>女</td>
                                    <td>54.35</td>
                                    <td>56.32</td>
                                    <td>56.01</td>
                                    <td>56.33</td>
                                    <td>58.07</td>
                                    <td>59.78</td>
                                    <td>59.50</td>
                                    <td>60.56</td>
                                    <td>60.41</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>39.41</td>
                                    <td>39.82</td>
                                    <td>40.13</td>
                                    <td>40.98</td>
                                    <td>41.52</td>
                                    <td>42.22</td>
                                    <td>40.88</td>
                                    <td>40.90</td>
                                    <td>40.44</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">俄罗斯联邦</td>
                                    <td>女</td>
                                    <td>78.75</td>
                                    <td>78.91</td>
                                    <td>80.19</td>
                                    <td>80.29</td>
                                    <td>80.56</td>
                                    <td>80.68</td>
                                    <td>80.95</td>
                                    <td>81.39</td>
                                    <td>81.39</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>54.18</td>
                                    <td>54.49</td>
                                    <td>54.86</td>
                                    <td>55.08</td>
                                    <td>54.94</td>
                                    <td>55.03</td>
                                    <td>54.86</td>
                                    <td>55.11</td>
                                    <td>55.09</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">新加坡</td>
                                    <td>女</td>
                                    <td>87.68</td>
                                    <td>88.40</td>
                                    <td>88.62</td>
                                    <td>88.48</td>
                                    <td>89.32</td>
                                    <td>89.17</td>
                                    <td>89.21</td>
                                    <td>89.24</td>
                                    <td>89.41</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>78.81</td>
                                    <td>80.25</td>
                                    <td>80.58</td>
                                    <td>80.40</td>
                                    <td>81.64</td>
                                    <td>81.91</td>
                                    <td>82.52</td>
                                    <td>82.35</td>
                                    <td>82.59</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛伐克</td>
                                    <td>女</td>
                                    <td>77.93</td>
                                    <td>77.48</td>
                                    <td>77.38</td>
                                    <td>78.26</td>
                                    <td>78.44</td>
                                    <td>77.74</td>
                                    <td>76.70</td>
                                    <td>78.50</td>
                                    <td>79.74</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>46.98</td>
                                    <td>47.05</td>
                                    <td>45.88</td>
                                    <td>47.27</td>
                                    <td>46.87</td>
                                    <td>46.94</td>
                                    <td>45.93</td>
                                    <td>46.71</td>
                                    <td>47.64</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛文尼亚</td>
                                    <td>女</td>
                                    <td>74.68</td>
                                    <td>76.74</td>
                                    <td>76.24</td>
                                    <td>74.80</td>
                                    <td>76.11</td>
                                    <td>77.16</td>
                                    <td>79.65</td>
                                    <td>79.14</td>
                                    <td>78.27</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>49.58</td>
                                    <td>49.08</td>
                                    <td>48.55</td>
                                    <td>49.87</td>
                                    <td>49.47</td>
                                    <td>49.11</td>
                                    <td>54.53</td>
                                    <td>54.22</td>
                                    <td>51.70</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">西班牙</td>
                                    <td>女</td>
                                    <td>89.25</td>
                                    <td>89.47</td>
                                    <td>88.89</td>
                                    <td>88.73</td>
                                    <td>88.55</td>
                                    <td>88.52</td>
                                    <td>88.86</td>
                                    <td>88.73</td>
                                    <td>88.93</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>65.09</td>
                                    <td>65.26</td>
                                    <td>64.64</td>
                                    <td>64.53</td>
                                    <td>64.77</td>
                                    <td>64.72</td>
                                    <td>64.73</td>
                                    <td>65.54</td>
                                    <td>65.88</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">瑞典</td>
                                    <td>女</td>
                                    <td>92.07</td>
                                    <td>92.06</td>
                                    <td>91.90</td>
                                    <td>92.02</td>
                                    <td>92.19</td>
                                    <td>91.92</td>
                                    <td>91.10</td>
                                    <td>91.81</td>
                                    <td>91.85</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>68.37</td>
                                    <td>68.82</td>
                                    <td>69.20</td>
                                    <td>69.26</td>
                                    <td>68.82</td>
                                    <td>69.29</td>
                                    <td>69.91</td>
                                    <td>71.26</td>
                                    <td>71.17</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">泰国</td>
                                    <td>女</td>
                                    <td>49.34</td>
                                    <td>51.00</td>
                                    <td>51.58</td>
                                    <td>50.80</td>
                                    <td>51.90</td>
                                    <td>52.60</td>
                                    <td>52.57</td>
                                    <td>53.95</td>
                                    <td>54.40</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>39.49</td>
                                    <td>40.13</td>
                                    <td>40.62</td>
                                    <td>40.12</td>
                                    <td>40.41</td>
                                    <td>40.51</td>
                                    <td>40.17</td>
                                    <td>41.76</td>
                                    <td>42.15</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">英国</td>
                                    <td>女</td>
                                    <td>91.63</td>
                                    <td>91.71</td>
                                    <td>91.63</td>
                                    <td>91.89</td>
                                    <td>91.63</td>
                                    <td>91.57</td>
                                    <td>91.56</td>
                                    <td>91.56</td>
                                    <td>91.69</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>70.09</td>
                                    <td>70.35</td>
                                    <td>70.70</td>
                                    <td>70.90</td>
                                    <td>71.01</td>
                                    <td>71.01</td>
                                    <td>70.94</td>
                                    <td>71.41</td>
                                    <td>71.72</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">美国</td>
                                    <td>女</td>
                                    <td>90.49</td>
                                    <td>90.61</td>
                                    <td>90.62</td>
                                    <td>90.57</td>
                                    <td>90.45</td>
                                    <td>90.38</td>
                                    <td>90.56</td>
                                    <td>90.45</td>
                                    <td>90.37</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>68.94</td>
                                    <td>69.01</td>
                                    <td>69.07</td>
                                    <td>68.97</td>
                                    <td>68.99</td>
                                    <td>69.37</td>
                                    <td>69.73</td>
                                    <td>69.70</td>
                                    <td>69.62</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">越南</td>
                                    <td>女</td>
                                    <td>35.18</td>
                                    <td>35.69</td>
                                    <td>36.68</td>
                                    <td>38.32</td>
                                    <td>39.25</td>
                                    <td>39.36</td>
                                    <td>41.90</td>
                                    <td>38.63</td>
                                    <td>38.58</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>31.36</td>
                                    <td>31.13</td>
                                    <td>31.57</td>
                                    <td>32.96</td>
                                    <td>33.62</td>
                                    <td>33.52</td>
                                    <td>33.97</td>
                                    <td>33.24</td>
                                    <td>33.14</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>




                <a name="shzsc"></a>
                <div id="shzsc" style="width: 100%;height: 500px;"></div>
                <div class="experiment-body active" data-val="5" style="overflow: auto;">
                    <div class="thp" style="height: auto;">
                        <div class="mint">
                            <span>用于无偿家务和照护工作的时间比例</span>
                        </div>
                        <div class="scdw">
                            <table>
                                <thead>
                                <tr>
                                    <th style="width: 60px;">国家</th>
                                    <th style="width: 60px;">性别</th>
                                    <th>2015</th>
                                    <th>2016</th>
                                    <th>2017</th>
                                    <th>2018</th>
                                    <th>2019</th>
                                    <th>2020</th>
                                    <th>2021</th>
                                    <th>2022</th>
                                    <th>2023</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">中国</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>15.35</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>5.90</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">澳大利亚</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>11.18</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>17.12</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">奥地利</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>8.63</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>15.79</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">比利时</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">保加利亚</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">文莱达鲁萨兰国（文莱）</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">加拿大</td>
                                    <td>女</td>
                                    <td></td>
                                    <td>14.17</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>16.46</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td>10.00</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>11.63</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">塞浦路斯</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">捷克</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">德国</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>15.71</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>10.54</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">丹麦</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">西班牙</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱沙尼亚</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>10.33</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>15.54</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">芬兰</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>14.06</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>10.75</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">法国</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">英国</td>
                                    <td>男</td>
                                    <td>6.97</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>12.25</td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>12.65</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>16.01</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">希腊</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">克罗地亚</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">匈牙利</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">印度尼西亚</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">爱尔兰</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">意大利</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">日本</td>
                                    <td>男</td>
                                    <td></td>
                                    <td>3.13</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>3.75</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td>15.14</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>14.71</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">柬埔寨</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">韩国</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>12.85</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>3.82</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">老挝</td>
                                    <td>女</td>
                                    <td></td>
                                    <td>13.60</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td>10.06</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">立陶宛</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">卢森堡</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">拉脱维亚</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">墨西哥</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>8.82</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>24.21</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马耳他</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">缅甸</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">马来西亚</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">荷兰</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">菲律宾</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">波兰</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">葡萄牙</td>
                                    <td>女</td>
                                    <td>17.81</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>10.24</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">罗马尼亚</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">俄罗斯联邦</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>18.00</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>7.80</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">新加坡</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛伐克</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">斯洛文尼亚</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">瑞典</td>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">泰国</td>
                                    <td>男</td>
                                    <td>3.25</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>女</td>
                                    <td>11.04</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">美国</td>
                                    <td>女</td>
                                    <td>15.88</td>
                                    <td>15.92</td>
                                    <td>15.42</td>
                                    <td>15.38</td>
                                    <td>15.33</td>
                                    <td></td>
                                    <td>15.54</td>
                                    <td>15.08</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>9.75</td>
                                    <td>9.79</td>
                                    <td>9.88</td>
                                    <td>9.54</td>
                                    <td>9.67</td>
                                    <td></td>
                                    <td>10.13</td>
                                    <td>10.08</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>


                <a name="zdjy"></a>
                <div id="zdjy" style="width: 100%;height: 500px;"></div>
                <div class="experiment-body active" data-val="6" style="overflow: auto;">
                    <div class="thp" style="height: auto;">
                        <div class="mint">
                            <span>中等教育人口占比</span>
                        </div>
                        <div class="scdw">
                            <table>
                                <thead>
                                <tr>
                                    <th>国家</th>
                                    <th>性别</th>
                                    <th>2015</th>
                                    <th>2016</th>
                                    <th>2017</th>
                                    <th>2018</th>
                                    <th>2019</th>
                                    <th>2020</th>
                                    <th>2021</th>
                                    <th>2022</th>
                                    <th>2023</th>
                                    <th>2024</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">中国</td>
                                    <td>女</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td rowspan="2">澳大利亚</td>
                                    <td>女</td>
                                    <td>69.02</td>
                                    <td>70.77</td>
                                    <td>69.96</td>
                                    <td>67.77</td>
                                    <td>67.67</td>
                                    <td>66.08</td>
                                    <td>67.20</td>
                                    <td>69.00</td>
                                    <td>68.32</td>
                                    <td>68.30</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>81.04</td>
                                    <td>80.16</td>
                                    <td>79.81</td>
                                    <td>75.97</td>
                                    <td>76.05</td>
                                    <td>73.67</td>
                                    <td>74.87</td>
                                    <td>75.63</td>
                                    <td>75.51</td>
                                    <td>74.57</td>
                                </tr>
                                <tr>
                                    <td rowspan="2">奥地利</td>
                                    <td>女</td>
                                    <td>59.87</td>
                                    <td>59.63</td>
                                    <td>59.21</td>
                                    <td>59.66</td>
                                    <td>59.13</td>
                                    <td>58.01</td>
                                    <td>57.56</td>
                                    <td>60.31</td>
                                    <td>59.53</td>
                                    <td>57.43</td>
                                </tr>
                                <tr>
                                    <td>男</td>
                                    <td>67.28</td>
                                    <td>67.61</td>
                                    <td>67.49</td>
                                    <td>67.86</td>
                                    <td>67.51</td>
                                    <td>65.89</td>
                                    <td>66.19</td>
                                    <td>67.25</td>
                                    <td>67.12</td>
                                    <td>65.97</td>
                                </tr>
                                <!-- 更多国家数据按相同模式继续 -->
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

                <a name="sjly"></a>
                <div class="experiment-body active" data-val="7">
                    <div class="thp">
                        <div class="mint">
                            <span>数据来源</span>
                        </div>
                        <div class="scdw">
                            <div class="ind">中国知网，人口普查数据库：</div>
                            <div class="ind">https://data.cnki.net/npcd/censusData/single?code=N2013060044</div>
                            <div class="ind">《中国人口普查数据库》是以1953年以来历次人口普查资料为基础的数值型数据库和普查数据分析系统。资料涵盖了性别、年龄、民族、受教育程度、行业、职业、迁移流动、社会保障、婚姻生育、死亡、住房情况等全国人口和数据的基本情况。</div>
                        </div>
                        <div class="scdw">
                            <div class="ind">联合国UN Women妇女数据库：</div>
                            <div class="ind">https://data.unwomen.org/</div>
                            <div class="ind">《UN Women近期发布的数据主要聚焦于性别平等进展、气候变化中的性别议题及数字鸿沟影响，包含统计与预测数据。</div>
                        </div>
                        <div class="scdw">
                            <div class="ind">OECD Family Database：</div>
                            <div class="ind">https://www.oecd.org/en/data/datasets/oecd-family-database.html#main-content</div>
                            <div class="ind">OECD家庭数据库是经济合作与发展组织（OECD）发布的关于家庭、儿童及就业状况的综合数据平台，涵盖全球多国的家庭结构、育儿政策、性别平等及工作与家庭平衡等主题。</div>
                        </div>
                        <div class="scdw">
                            <div class="ind">国家统计局，第三次全国时间利用调查公报：</div>
                            <div class="ind">https://www.stats.gov.cn/zwfwck/sjfb/202410/t20241031_1957216.html</div>
                            <div class="ind">调查对象需连续记录调查日0点至次日0点24小时内所进行的各项活动。陪伴照料家人活动每日平均时间为30分钟。</div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>
<script src="${pageContext.request.contextPath}/jsp/index/js/basic.js"></script>
<script src="${pageContext.request.contextPath}/jsp/index/js/show.js"></script>
</body>
</html>
<script>
    $(document).ready(function() {
        <%--var menuId = '${menu_id}'--%>
        <%--$("#menu_"+menuId).addClass("active");--%>
        <%--var id="<%=id%>";--%>
        <%--if(!id || id == 'null'){--%>
        <%--    id = 1--%>
        <%--}--%>
        <%--if(id){--%>
        <%--    setTimeout(function() {--%>
        <%--        $(".experiment-menu-item").removeClass('active')--%>
        <%--        $(".experiment-menu-item[data-val='"+id+"']").addClass('active')--%>
        <%--        $(".experiment-body").removeClass('active')--%>
        <%--        $(".experiment-body[data-val='"+id+"']").addClass('active')--%>
        <%--    }, 100);--%>
        <%--}--%>

        <%--$(".experiment-menu-item").on('click',function(){--%>
        <%--    $(".experiment-menu-item").removeClass('active')--%>
        <%--    $(this).addClass('active')--%>
        <%--    var bodyIndex = $(this).data().val--%>
        <%--    $(".experiment-body").removeClass('active')--%>
        <%--    $(".experiment-body[data-val='"+bodyIndex+"']").addClass('active')--%>
        <%--})--%>
    })
</script>
