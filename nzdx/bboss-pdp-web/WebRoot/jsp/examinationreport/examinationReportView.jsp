<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>在线模拟</title>
	<meta name="renderer" content="webkit">
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
	<meta name="format-detection" content="telephone=no"/>
    <%@ include file="../index/front_head.jsp" %>
	<meta name="description" content="平台服务主要包括提供水价决策虚拟仿真教学平台、配套数据的开发及维护、以及对中国经济重要的经济问题进行研究分析，为政府部门提供决策支持"/>
	<meta name="keywords" content="水价决策虚拟仿真教学平台"/>
	<meta name="generator" content="水价决策虚拟仿真教学平台" data-variable=""/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/fSelect/css/fSelect.css">

<%--
</script>--%>
<%--
</script>--%>

<%--	<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>

	<style>
		.ptext {
			margin-top: 1px;
			margin-bottom: 1px;
			line-height: 2;
			font-size: 12pt;
			word-break: break-all;
			text-indent: 35px;
		}
		.mt-element-step .step-line .mt-step-col {
			padding: 20px 0;
		}

		.dropdown-toggle::after {
			margin-top: -3px;
		}
		.dropdown-toggle:after {
			margin-right: 0;
			margin-left: .3em;
		}
		.dropdown-toggle::after {
			display: inline-block;
			width: 0;
			height: 0;
			margin-left: .286rem;
			content: '';
			vertical-align: middle;
			border-top: .286rem solid;
			border-right: .286rem solid transparent;
			border-left: .286rem solid transparent;
		}
		*, ::after, ::before {
			-webkit-box-sizing: inherit;
			-moz-box-sizing: inherit;
			box-sizing: inherit;
		}
	</style>





</head>
<body class="met-navfixed">
<div class="news_list_met_21_4 met-index-body met-index-imgnews" m-id='4'>
	<div class="container">

		<div class="row">
			<div class="col-md-4">
				<div class="form-group form-md-line-input">
					<label class="col-md-4 control-label" >实验名称:</label>
					<div class="col-md-6">
						${examinationReport.experName}
					</div>
				</div>
			</div>
			<div class="col-md-4">
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group form-md-line-input">
					<label class="col-md-4 control-label" >开始时间:</label>
					<div class="col-md-6">
						${examinationReport.startTime}
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group form-md-line-input">
					<label class="col-md-4 control-label" >结束时间:</label>
					<div class="col-md-6">
						${examinationReport.endTime}
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group form-md-line-input">
					<label class="col-md-4 control-label" >操作耗时:</label>
					<div class="col-md-6">
						${examinationReport.costTime}
					</div>
				</div>
			</div>
	    </div>

		<div class="row">
			<%--<div class="col-md-4">--%>
				<%--<div class="form-group form-md-line-input">--%>
					<%--<label class="col-md-4 control-label" >政策计划书</label>--%>
					<%--<div class="col-md-6">--%>
						<%--<a onclick="downDoc('0','${experDoc.planDoc}')">${experDoc.planDoc}</a>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
			<%--<div class="col-md-4">--%>
				<%--<div class="form-group form-md-line-input">--%>
					<%--<label class="col-md-4 control-label" >评分:</label>--%>
					<%--<div class="col-md-6">--%>
						<%--${experDoc.planSocre}--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
			<div class="col-md-4">
				<div class="form-group form-md-line-input">
					<label class="col-md-4 control-label" >操作得分:</label>
					<div class="col-md-6">
						${examinationReport.operatSocre}
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<%--<div class="col-md-4">--%>
				<%--<div class="form-group form-md-line-input">--%>
					<%--<label class="col-md-4 control-label" >实验报告</label>--%>
					<%--<div class="col-md-6">--%>
						<%--<a onclick="downDoc('1','${experDoc.reportDoc}')">${experDoc.reportDoc}</a>--%>
				    <%--</div>--%>
			    <%--</div>--%>
			<%--</div>--%>
			<%--<div class="col-md-4">--%>
				<%--<label class="col-md-4 control-label" >评分</label>--%>
				<%--<div class="col-md-6">--%>
					<%--${experDoc.reportSocre}--%>
				<%--</div>--%>
			<%--</div>--%>
			<div class="col-md-4">
				<div class="form-group form-md-line-input">
					<label class="col-md-4 control-label" >总分:</label>
					<div class="col-md-6">
						${examinationReport.totalSocre}
					</div>
				</div>
			</div>
		</div>

		<div class="row" >
			<hr style="color: #002a80"/>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="col-md-3">
					<div id="tree-Result" class="tree-demo" style="height:580px;overflow-x:auto;overflow-y: auto;background-color: #ffffff;"> </div>
				</div>
				<div class="col-md-9">
					<div class="row" style="background-color: #ffffff;">
						<div class="col-md-12" >
							<div id="me_div" style="float: right;text-align: center;">
								<form class="form-inline">
									<div class="form-group">
										<label id="div_sel_RSverb3_1"></label>&nbsp;
										<label id="div_sel_RSverb3_2"></label>&nbsp;
										<label id="div_sel_RSverb3_3"></label>&nbsp;
										<label id="div_sel_RSverb2_1"></label>&nbsp;
										<label id="div_sel_RSverb2_2"></label>&nbsp;
										<label id="div_sel_RSverb1"></label>&nbsp;
										<div id="radioRSDiv" style="float: left;">
											<input type="radio" id="rtype1" name="rtype" value="1" checked onclick="showRSRadio(1)"  >&nbsp;<label for="rtype1">数据</label>&nbsp;
											<input type="radio" id="rtype2" name="rtype" value="2" onclick="showRSRadio(2)" >&nbsp;<label for="rtype2">图形</label>&nbsp;
										</div>
										<a class="btn btn-success" title="下载变量解释" href="${pageContext.request.contextPath}/modelrun/downParamExplain.page">变量解释</a>
										<a class="btn btn-success" title="下载结果数据" href="#" onclick="allRunRSData()">结果下载</a>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" style="overflow-x:auto;overflow-y: hidden;background-color: #ffffff;">
							<div id="csv-rs" style="text-align: center;"></div>
							<div id="echarts-rs" style="width: 900px;height:520px; display: none" ></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- BEGIN CORE PLUGINS -->
<%--<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>
<script src="${pageContext.request.contextPath}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
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
<script src="${pageContext.request.contextPath}/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/echarts.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/fSelect/fSelect.js" type="text/javascript"></script>

<script>
    var usercontextpath = "<%=request.getContextPath()%>";
	var currentRSNode=null ;
	var iA_RS = [];
	var tA_RS = [];
	var initCsv_RS = [];

	var SERIES_RS = [];
	var VALUE_RS = [];

	var VERB1_RS = [];

	var VERB2_RS1 = [];
	var VERB2_RS2 = [];


	var VERB3_RS1 = [];
	var VERB3_RS2 = [];
	var VERB3_RS3 = [];

	var runErr_RS = [];
	var fistRSNode = 0;
	var jstreeResult  = null;


	function isInArray(arr,value){
		for(var i = 0; i < arr.length; i++){
			if(value === arr[i]){
				return true;
			}
		}
		return false;
	}

	function reUnionArray(arr,row,col,arr2){

		var temp = [];
		for(var i = row; i < arr.length; i++){
			var key = arr[i].split(",")[col];
			if(arr2 != null) {
				for(var j = 0;j <arr2.length;j++) {
					if(key == arr2[j]) {
						temp.push(arr[i]);
					}
				}
			}else {
				temp.push(arr[i]);
			}

		}
		return temp;
	}

	function reUnionValArray(verb2_1,verb2_2,arr){

		for(var i = 0; i < arr.length; i++){
			var key0 = arr[i].split(",")[0];
			var key1 = arr[i].split(",")[1];
			var val = arr[i].split(",")[2];

			if((key0 == verb2_1) && (key1 == verb2_2)) {
				return val;
			}
		}

		return null;
	}

	function reUnionValArray2(verb3_2,verb3_3,arr){

		for(var i = 0; i < arr.length; i++){
			var key0 = arr[i].split(",")[1];
			var key1 = arr[i].split(",")[2];
			var val = arr[i].split(",")[3];

			if((key0 == verb3_2) && (key1 == verb3_3)) {
				return val;
			}
		}

		return null;
	}

	function isNumber(val){
		var loc = val.indexOf(".");
		if( loc > 0) {
			var num = new Number(val);
			return num.toFixed(2) ;
		}else {
			return val;
		}
	}

	var ajaxTreeResult = function () {
	    debugger;
        var experId = '${examinationReport.experId}';
		return  $("#tree-Result").jstree({
			"core" : {
				"themes" : {
					"responsive": false
				},
				"check_callback" : true,
				'data' : {
					'url' : function (node) {
						return usercontextpath + '/modeljz/refSimulateTree.page?id='+node.id+"&parent="+node.parent+"&experId="+experId;
					},
					'data' : function (node) {
						return { 'parent' : node.id,'experId':experId};
					},
					'success': function (retvel) {
						 if(retvel.length != 0){
							 fistRSNode = retvel[0].id;
							 for (var key in retvel) {
								 if (retvel.hasOwnProperty(key)) {
									 var c = retvel[key].children;
									 if(c == false) {
										 var i = retvel[key].id;
										 var t = retvel[key].title;
										 iA_RS.push(i);
										 tA_RS.push(t);
									 }
								 }
								 if(retvel[key].runStatus == '0'||retvel[key].runStatus == '9') {
									 var id = retvel[key].id;
									 runErr_RS.push(id)
								 }


							 }
						 }

					}
				}
			},
			"types" : {
				"default" : {
					"icon" : "fa fa-folder icon-state-warning icon-lg"
				},
				"file" : {
					"icon" : "fa fa-file icon-state-warning icon-lg"
				}
			},
			"state" : { "key" : "demo3" },
			"plugins" : ["contextmenu","dnd", "state", "types" ],
			"contextmenu": {
				'items' : customRSMenu
			},
		}).bind("select_node.jstree", function(event, data) {
			var inst = data.instance;
			var selectedNode = inst.get_node(data.selected);
			var level = $("#"+selectedNode.id).attr("aria-level");
			if(parseInt(level) == 1){
				currentRSNode = selectedNode;
			}else if(parseInt(level) == 3){
				currentRSNode = selectedNode;
				$.ajax({
                    url: usercontextpath + '/modeljz/readCsvToMap.page',
                    data: {"id": selectedNode.id, "csv": selectedNode.original.csv},
					dataType : "json",
					type : "POST",
					success : function(data) {
						if(data) {
							handleInitRSCsv(data.csv);
							var vd = currentRSNode.original.dimension;
							if(vd!=0){
								$(":radio[name='rtype'][value='1']").prop("checked", "checked");
							}
							$("#echarts-rs").hide();
							$("#csv-rs").show()
							showRSCsv(data.csv);
						}else{
							$("#echarts-rs").html("暂无数据！");
						}
					}
				});


			}
		}).on("open_node.jstree", function (e, data) {


			for (var i in iA_RS) { //title显示
				$("#" + iA_RS[i] + "_anchor").attr("title",tA_RS[i]);
			}

			for (var i in runErr_RS) { //运行错误，字体颜色标红
				$("#" + runErr_RS[i] + "_anchor").css("color","#ff1e20");
			}

			var runStatus = data.node.original.runStatus;
			if(runStatus == '0'||runStatus == '9') {
				PlatformCommonUtils.warn("红色文件夹表示模拟结果出错，请右键查看日志！");
				return;
			}


		}).on("ready.jstree", function (event, data) {
			data.instance.open_node(fistRSNode);  //默认打开第一个节点
		});


	}


    // jQuery(document).ready(function () {
     //    alert(6666);
    //
	// });

	$(function(){
        jstreeResult =  ajaxTreeResult();
	});
	function handleInitRSCsv(data) {
		initCsv_RS = [];
		initCsv_RS = data; //保存原始数据；
		var dimension = currentRSNode.original.dimension;
		var rows = data.length;
		var cols = data[0].split(",").length;
		if(dimension == 0) {
			$("#radioRSDiv").hide();
			$('label[id^="div_sel_"]').html("");
		}

		if(dimension == 1) {
			$("#radioRSDiv").show();
			VALUE_RS = [];
			VERB1_RS = [];
			var label = data[0].split(",")[0];
			for(var i = 1; i < rows; i++ ){
				var key = data[i].split(",")[0];
				var val = data[i].split(",")[1];
				VERB1_RS.push(key);
				VALUE_RS.push(isNumber(val));
			}

			$('label[id^="div_sel_"]').html("");
			$("#div_sel_RSverb1").html(label+":&nbsp;");
			createRSSelect('sel_RSverb1',VERB1_RS);
			EChartsRS0Or1();

		}

		if(dimension == 2) {
			$("#radioRSDiv").show();
			VERB2_RS1 = [];
			VERB2_RS2 = [];
			SERIES_RS =[];

			var label1 = data[0].split(",")[0];
			var label2 = data[0].split(",")[1];

			for(var i = 1; i < rows; i++ ){
				var key0 = data[i].split(",")[0];
				var key1 = data[i].split(",")[1];
				// var val = data[i].split(",")[2];

				if(!isInArray(VERB2_RS1,key0)) {
					VERB2_RS1.push(key0);
				}

				if(!isInArray(VERB2_RS2,key1)) {
					VERB2_RS2.push(key1);
				}

			}
			for (var i = 0;i< VERB2_RS1.length;i++) {
				var data = []
				for(var j = 0;j<VERB2_RS2.length;j++) {
					var v = reUnionValArray(VERB2_RS1[i],VERB2_RS2[j],initCsv_RS);
					if( v != null) {
						data.push(v);
					}
				}
				SERIES_RS.push({name: VERB2_RS1[i], type: 'bar', data: data});
			}


			$('label[id^="div_sel_"]').html("");
			$("#div_sel_RSverb2_1").html(label1+":&nbsp;");
			createRSSelect('sel_RSverb2_1',VERB2_RS1);

			$("#div_sel_RSverb2_2").html(label2+":&nbsp;");
			createRSSelect('sel_RSverb2_2',VERB2_RS2);

			EChartsRS02(VERB2_RS1,VERB2_RS2);

		}

		if(dimension == 3) {
			$("#radioRSDiv").show();
			var label1 = data[0].split(",")[0];
			var label2 = data[0].split(",")[1];
			var label3 = data[0].split(",")[2];


			VERB3_RS1 = [];
			VERB3_RS2 = [];
			VERB3_RS3 = [];
			SERIES_RS =[];

			for(var i = 1; i < rows; i++ ){
				var key0 = data[i].split(",")[0];
				var key1 = data[i].split(",")[1];
				var key2 = data[i].split(",")[2];

				if(!isInArray(VERB3_RS1,key0)) {
					VERB3_RS1.push(key0);
				}

				if(!isInArray(VERB3_RS2,key1)) {
					VERB3_RS2.push(key1);
				}
				if(!isInArray(VERB3_RS3,key2)) {
					VERB3_RS3.push(key2);
				}

			}


			$('label[id^="div_sel_"]').html("");
			$("#div_sel_RSverb3_1").html(label1+":&nbsp;");
			createRSSelect('sel_RSverb3_1',VERB3_RS1);

			$("#div_sel_RSverb3_2").html(label2+":&nbsp;");
			createRSSelect('sel_RSverb3_2',VERB3_RS2);

			$("#div_sel_RSverb3_3").html(label3+":&nbsp;");
			createRSSelect('sel_RSverb3_3',VERB3_RS3);

			var xAxis = [];

			for (var i = 0;i< VERB3_RS2.length;i++) {

				for(var j = 0;j<VERB3_RS3.length;j++) {
					var x = VERB3_RS2[i]+"&"+VERB3_RS3[j];
					var v = reUnionValArray2(VERB3_RS2[i],VERB3_RS3[j],initCsv_RS);
					if( v != null) {
						xAxis.push(x);
					}
				}
			}



			for(var i = 0;i<VERB3_RS1.length;i++) {
				var data = [];
				for(var j = 1;j<initCsv_RS.length;j++) {
					var key = initCsv_RS[j].split(",")[0];
					var key1 = VERB3_RS1[i];
					if(key == key1) {
						data.push(isNumber(initCsv_RS[j].split(",")[3]));
					}

				}

				SERIES_RS.push({name: VERB3_RS1[i], type: 'bar', data: data});
			}


			EChartsRS03(xAxis,VERB3_RS1);
		}



	}
	function createRSSelect(id,data) {
		var select = document.createElement("select");
		select.setAttribute('id',id);
		select.setAttribute('multiple','multiple');
		for(var i = 0;i<data.length;i++) {
			select.options[i] = new Option(data[i], data[i]);
		}

		$("#div_"+id).append(select);
		$("#"+id).fSelect();

		$("#"+id).bind("change", function(){
			handleRSSel($("#"+id).val())
		})

	}
	function handleRSSel(v) {
		var dimension = currentRSNode.original.dimension;
		if(dimension == 1) {
			if(v != null) {
				VALUE_RS = [];
				VERB1_RS = [];
				var temCsv = [];

				temCsv.push(initCsv_RS[0]);
				for(var i = 1; i < initCsv_RS.length; i++ ){
					var reg = initCsv_RS[i].split(",")[0];
					var val = initCsv_RS[i].split(",")[1];

					for(var j = 0; j < v.length;j++)

						if(reg == v[j]) {
							VERB1_RS.push(reg);
							VALUE_RS.push(isNumber(val));
							temCsv.push(initCsv_RS[i]);
						}

				}
				showRSCsv(temCsv);
				EChartsRS0Or1();
			}else {
				showRSCsv(initCsv_RS);
				handleInitRSCsv(initCsv_RS)
			}
		}

		if(dimension == 2) {
			var sel_RSverb2_1 = $("#sel_RSverb2_1").val();
			var sel_RSverb2_2 = $("#sel_RSverb2_2").val();
			if(sel_RSverb2_1 == null) {
				sel_RSverb2_1 = VERB2_RS1;
			}
			if(sel_RSverb2_2 == null) {
				sel_RSverb2_2 = VERB2_RS2;
			}
			SERIES_RS =[];
			var temCsv = [];
			temCsv.push(initCsv_RS[0]);
			var uArr = reUnionArray(initCsv_RS,1,0,sel_RSverb2_1);
			var uArr2 = reUnionArray(uArr,0,1,sel_RSverb2_2);
			temCsv = temCsv.concat(uArr2);

			for (var i = 0;i< sel_RSverb2_1.length;i++) {
				var data = [];
				for(var j = 0;j<sel_RSverb2_2.length;j++) {
					var v = reUnionValArray(sel_RSverb2_1[i],sel_RSverb2_2[j],temCsv);
					if( v != null) {
						data.push(isNumber(v));
					}
				}
				SERIES_RS.push({name: sel_RSverb2_1[i], type: 'bar', data: data});
			}
			showRSCsv(temCsv);
			EChartsRS02(sel_RSverb2_1,sel_RSverb2_2);

		}

		if(dimension == 3) {
			var sel_RSverb3_1 = $("#sel_RSverb3_1").val();
			var sel_RSverb3_2 = $("#sel_RSverb3_2").val();
			var sel_RSverb3_3 = $("#sel_RSverb3_3").val();


			SERIES_RS =[];
			var temCsv = [];
			temCsv.push(initCsv_RS[0]);
			var uArr = reUnionArray(initCsv_RS,1,0,sel_RSverb3_1);
			var uArr2 = reUnionArray(uArr,0,1,sel_RSverb3_2);
			var uArr3 = reUnionArray(uArr2,0,2,sel_RSverb3_3);
			temCsv = temCsv.concat(uArr3);
			showRSCsv(temCsv);



			if(sel_RSverb3_1 == null) {
				sel_RSverb3_1 = VERB3_RS1
			}
			if(sel_RSverb3_2 == null) {
				sel_RSverb3_2 = VERB3_RS2
			}

			if(sel_RSverb3_3 == null) {
				sel_RSverb3_3 = VERB3_RS3
			}
			var xAxis = [];

			for (var i = 0;i< sel_RSverb3_2.length;i++) {

				for(var j = 0;j<sel_RSverb3_3.length;j++) {
					var x = sel_RSverb3_2[i]+"&"+sel_RSverb3_3[j];
					var v = reUnionValArray2(sel_RSverb3_2[i],sel_RSverb3_3[j],temCsv);
					if( v != null) {
						xAxis.push(x);
					}
				}
			}



			for(var i = 0;i<sel_RSverb3_1.length;i++) {
				var data = [];
				for(var j = 1;j<temCsv.length;j++) {
					var key = temCsv[j].split(",")[0];
					var key1 = sel_RSverb3_1[i];
					if(key == key1) {
						data.push(isNumber(temCsv[j].split(",")[3]));
					}

				}

				SERIES_RS.push({name: sel_RSverb3_1[i], type: 'bar', data: data});
			}


			EChartsRS03(xAxis,sel_RSverb3_1);

		}

	}
	function handleInitRSCsv(data) {
		initCsv_RS = [];
		initCsv_RS = data; //保存原始数据；
		var dimension = currentRSNode.original.dimension;
		var rows = data.length;
		var cols = data[0].split(",").length;
		if(dimension == 0) {
			$("#radioRSDiv").hide();
			$('label[id^="div_sel_"]').html("");
		}

		if(dimension == 1) {
			$("#radioRSDiv").show();
			VALUE_RS = [];
			VERB1_RS = [];
			var label = data[0].split(",")[0];
			for(var i = 1; i < rows; i++ ){
				var key = data[i].split(",")[0];
				var val = data[i].split(",")[1];
				VERB1_RS.push(key);
				VALUE_RS.push(isNumber(val));
			}

			$('label[id^="div_sel_"]').html("");
			$("#div_sel_RSverb1").html(label+":&nbsp;");
			createRSSelect('sel_RSverb1',VERB1_RS);
			EChartsRS0Or1();

		}

		if(dimension == 2) {
			$("#radioRSDiv").show();
			VERB2_RS1 = [];
			VERB2_RS2 = [];
			SERIES_RS =[];

			var label1 = data[0].split(",")[0];
			var label2 = data[0].split(",")[1];

			for(var i = 1; i < rows; i++ ){
				var key0 = data[i].split(",")[0];
				var key1 = data[i].split(",")[1];
				// var val = data[i].split(",")[2];

				if(!isInArray(VERB2_RS1,key0)) {
					VERB2_RS1.push(key0);
				}

				if(!isInArray(VERB2_RS2,key1)) {
					VERB2_RS2.push(key1);
				}

			}
			for (var i = 0;i< VERB2_RS1.length;i++) {
				var data = []
				for(var j = 0;j<VERB2_RS2.length;j++) {
					var v = reUnionValArray(VERB2_RS1[i],VERB2_RS2[j],initCsv_RS);
					if( v != null) {
						data.push(v);
					}
				}
				SERIES_RS.push({name: VERB2_RS1[i], type: 'bar', data: data});
			}


			$('label[id^="div_sel_"]').html("");
			$("#div_sel_RSverb2_1").html(label1+":&nbsp;");
			createRSSelect('sel_RSverb2_1',VERB2_RS1);

			$("#div_sel_RSverb2_2").html(label2+":&nbsp;");
			createRSSelect('sel_RSverb2_2',VERB2_RS2);

			EChartsRS02(VERB2_RS1,VERB2_RS2);

		}

		if(dimension == 3) {
			$("#radioRSDiv").show();
			var label1 = data[0].split(",")[0];
			var label2 = data[0].split(",")[1];
			var label3 = data[0].split(",")[2];


			VERB3_RS1 = [];
			VERB3_RS2 = [];
			VERB3_RS3 = [];
			SERIES_RS =[];

			for(var i = 1; i < rows; i++ ){
				var key0 = data[i].split(",")[0];
				var key1 = data[i].split(",")[1];
				var key2 = data[i].split(",")[2];

				if(!isInArray(VERB3_RS1,key0)) {
					VERB3_RS1.push(key0);
				}

				if(!isInArray(VERB3_RS2,key1)) {
					VERB3_RS2.push(key1);
				}
				if(!isInArray(VERB3_RS3,key2)) {
					VERB3_RS3.push(key2);
				}

			}


			$('label[id^="div_sel_"]').html("");
			$("#div_sel_RSverb3_1").html(label1+":&nbsp;");
			createRSSelect('sel_RSverb3_1',VERB3_RS1);

			$("#div_sel_RSverb3_2").html(label2+":&nbsp;");
			createRSSelect('sel_RSverb3_2',VERB3_RS2);

			$("#div_sel_RSverb3_3").html(label3+":&nbsp;");
			createRSSelect('sel_RSverb3_3',VERB3_RS3);



			var xAxis = [];

			for (var i = 0;i< VERB3_RS2.length;i++) {

				for(var j = 0;j<VERB3_RS3.length;j++) {
					var x = VERB3_RS2[i]+"&"+VERB3_RS3[j];
					var v = reUnionValArray2(VERB3_RS2[i],VERB3_RS3[j],initCsv_RS);
					if( v != null) {
						xAxis.push(x);
					}
				}
			}



			for(var i = 0;i<VERB3_RS1.length;i++) {
				var data = [];
				for(var j = 1;j<initCsv_RS.length;j++) {
					var key = initCsv_RS[j].split(",")[0];
					var key1 = VERB3_RS1[i];
					if(key == key1) {
						data.push(isNumber(initCsv_RS[j].split(",")[3]));
					}

				}

				SERIES_RS.push({name: VERB3_RS1[i], type: 'bar', data: data});
			}


			EChartsRS03(xAxis,VERB3_RS1);
		}



	}

	function EChartsRS0Or1(){
		var myChart = echarts.init(document.getElementById('echarts-rs'));

		// var rootId = currentRSNode.id.split('_')[0];
		// var rootName = $("#"+rootId+"_anchor").text();
		option = {
			title : {
				x:'center',
				text: currentRSNode.original.title + '('+currentRSNode.original.unit+')'
			},
			tooltip : {
				trigger: 'axis'
			},
			legend: {
				y:'bottom',
				data:[currentRSNode.text]
			},
			toolbox: {
				show : true,
				feature : {
					mark : {show: true},
					dataView : {show: false, readOnly: false},
					magicType : {show: true, type: ['line', 'bar']},
					restore : {show: true},
					saveAsImage : {show: true}
				}
			},
			calculable : false,
			xAxis : [
				{
					type : 'category',
					data : VERB1_RS
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name:currentRSNode.text,
					type:'bar',
					data:VALUE_RS
				}
			]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option,true);
	}


	function EChartsRS02(sel_RSverb2_1,sel_RSverb2_2){
		var myChart = echarts.init(document.getElementById('echarts-rs'));
		option = {
			title: {
				x:'center',
				text: currentRSNode.original.title + '('+currentRSNode.original.unit+')'
			},
			tooltip: {
				trigger: 'item',
				backgroundColor: 'rgba(0,0,0,0.7)',
				axisPointer: {
					type: 'shadow'
				},
				/*    formatter: function(params) {
                        // for text color
                        var color = colorList[params[0].dataIndex];
                        var res = '<div style="color:' + color + '">';
                        res += '<strong>' + params[0].name + '</strong>'

                        for (var i = 0, l = params.length; i < l; i++) {
                            res += '<br/>' + params[i].seriesName + ' : ' + params[i].value
                        }
                        res += '</div>';
                        return res;
                    }*/
			},
			legend: {
				show:false,
				y:'bottom',
				data:sel_RSverb2_1
			},
			toolbox: {
				show: true,
				orient: 'vertical',
				y: 'center',
				feature: {
					mark: {show: true},
					dataView: {show: false, readOnly: false},
					restore: {show: false},
					saveAsImage: {show: true}
				}
			},
			calculable: true,
			// grid: {
			//     y: 80,
			//     y2: 40,
			//     x2: 20
			// },
			xAxis: [
				{
					type: 'category',
					data: sel_RSverb2_2
				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],
			series: SERIES_RS
		};

		myChart.setOption(option,true);
	}

	function EChartsRS03(xAxis,sel_RSverb3_1){
		var myChart = echarts.init(document.getElementById('echarts-rs'));
		option = {
			title: {
				x:'center',
				text: currentRSNode.original.title + '('+currentRSNode.original.unit+')'
			},
			tooltip: {
				trigger: 'item',
				backgroundColor: 'rgba(0,0,0,0.7)',
				axisPointer: {
					type: 'shadow'
				}
			},
			legend: {
				show:false
			},
			toolbox: {
				show: true,
				orient: 'vertical',
				y: 'center',
				feature: {
					mark: {show: true},
					dataView: {show: false, readOnly: false},
					restore: {show: false},
					saveAsImage: {show: true}
				}
			},
			calculable: true,
			xAxis: [
				{
					type: 'category',
					data: xAxis
				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],
			series: SERIES_RS
		};

		myChart.setOption(option,true);
	}

	function showRSCsv(data) {
		$("#csv-rs").html("");
		var rows = data.length;
		var cols = data[0].split(",").length;
		var tableNode = document.createElement("table");//获得对象
		tableNode.setAttribute("class","table table-bordered");


		var trNode1 = tableNode.insertRow();
		trNode1.setAttribute("bgcolor","#F0FFFF")
		var tdNode1 = trNode1.insertCell();
		tdNode1.setAttribute("colspan",cols);
		tdNode1.innerHTML ="<h4>"+ currentRSNode.original.title + '('+currentRSNode.original.unit+')'+"</h4>";


		for(var i = 0; i < rows; i++ ){
			var trNode = tableNode.insertRow();
			if(i == 0) {
				trNode.setAttribute("bgcolor","#F0FFFF")
			}

			for(var y = 0;y < cols;y++){
				var tdNode = trNode.insertCell();
				var val = data[i].split(",")[y];
				tdNode.innerHTML = isNumber(val);
			}
		}

		document.getElementById("csv-rs").appendChild(tableNode);//添加到那个位置

	}

	function customRSMenu(node) {

		if (node.parent == '#') {
			var items={};
			if(node.original.isSymbol=="1"){
				items = {
					'info' : {
						'label' : '运行详情',
						'action' : function (obj) {
							showInfo(node.id)
						}
					},
					'log' : {
						'label' : '日志下载',
						'action' : function (obj) {
							window.open(usercontextpath + "/modelrun/downloadRunLog.page?runId=" + node.id);
						}
					}
				}
			}else{
				items = {
					'info' : {
						'label' : '运行详情',
						'action' : function (obj) {
							showInfo(node.id)
						}
					},
					'log' : {
						'label' : '日志下载',
						'action' : function (obj) {
							window.open(usercontextpath + "/modelrun/downloadRunLog.page?runId=" + node.id);
						}
					},
					'del' : {
						'label' : '数据删除',
						'action' : function (obj) {
							PDP.confirm("确定删除『" + node.text + "』 数据吗?", function (isConfirm) {
								if (isConfirm) {
									$.post( usercontextpath + '/modelrun/deleteModelRun.page', {"runId": node.id},
											function (data) {
												if(data == "success") {
													PDP.success("删除成功!");
													var inst = jQuery.jstree.reference(obj.reference);
													inst.delete_node(obj.reference);
												}else {
													PlatformCommonUtils.warn("删除失败!");
													return;
												}
											});
								}
							});
						}
					}
				}
			}
			return items;
		}
		function createRSSelect(id,data) {
			var select = document.createElement("select");
			select.setAttribute('id',id);
			select.setAttribute('multiple','multiple');
			for(var i = 0;i<data.length;i++) {
				select.options[i] = new Option(data[i], data[i]);
			}

			$("#div_"+id).append(select);
			$("#"+id).fSelect();

			$("#"+id).bind("change", function(){
				handleSel($("#"+id).val())
			})

		}

		function ECharts0ORSr1(){
			var myChart = echarts.init(document.getElementById('echarts-demo'));
			option = {
				title : {
					x:'center',
					text: currentNode.original.title + '('+currentNode.original.unit+')'
				},
				tooltip : {
					trigger: 'axis'
				},
				legend: {
					y:'bottom',
					data:[currentNode.text]
				},
				toolbox: {
					show : true,
					feature : {
						mark : {show: true},
						dataView : {show: false, readOnly: false},
						magicType : {show: true, type: ['line', 'bar']},
						restore : {show: true},
						saveAsImage : {show: true}
					}
				},
				calculable : false,
				xAxis : [
					{
						type : 'category',
						data : VERB1
					}
				],
				yAxis : [
					{
						type : 'value'
					}
				],
				series : [
					{
						name:currentNode.text,
						type:'bar',
						data:VALUE
					}
				]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option,true);
		}
	}

	function showRSRadio(type) {
		if(type == 1) {
			$("#echarts-rs").hide();
			$("#csv-rs").show();
		}else {
			$("#echarts-rs").show();
			$("#csv-rs").hide();
		}
	}


	function allRunRSData(){
		if(currentRSNode===undefined){
			PlatformCommonUtils.warn("请选择数据!");
			return;
		}else{
			window.location.href=(usercontextpath + "/modelrun/donwnloadResultZip.page?runId=" + currentRSNode.id);

		}
	}
</script>


</body>
</html>