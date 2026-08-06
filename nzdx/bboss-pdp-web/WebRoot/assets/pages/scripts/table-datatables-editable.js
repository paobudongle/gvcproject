var TableDatatablesEditable = function () {

    var handleTable = function (tableId, url) {

        function restoreRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);

            for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                oTable.fnUpdate(aData[i], nRow, i, false);
            }

            oTable.fnDraw();
        }

        function editRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
           // jqTds[0].innerHTML = '<input type="text"  class="form-control input-small" value="' + aData[0] + '">';
            jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
            jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[2] + '">';
            jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
            jqTds[3].innerHTML = '<a class="edit" href="">保存</a>';
            jqTds[4].innerHTML = '<a class="cancel" href="">取消</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            if (typeof(jqInputs[1].value) == "undefined" || jqInputs[1].value == null || jqInputs[1].value == "") {
                alert("数据为空，请检查!");
                return;
            } else {
                oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 3, false);
                oTable.fnUpdate('<a class="edit" href="">编辑</a>', nRow, 4, false);
                oTable.fnUpdate('<a class="delete" href="">删除</a>', nRow, 5, false);
                oTable.fnDraw();
            }
        }

        function cancelEditRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
            oTable.fnUpdate('<a class="edit" href="">编辑</a>', nRow,4, false);
            oTable.fnDraw();
        }

        function update(url, oTable, nRow) {
            var type = $('#' + tableId).attr("typeValue");
            var jqInputs = $('input', nRow);
            var aData = oTable.fnGetData(nRow);

            var dfId = aData[0]//jqInputs[0].value;
            var dfTitle = jqInputs[0].value;
            var remark = jqInputs[1].value;
            var sortNo = jqInputs[2].value;
            $.post(url, {"dfId": dfId, "remark": remark, "dfTitle": dfTitle,"sortNo":sortNo,"mdId": miid, "dfType": type},
                function (data) {
                    // refSelect(tableId, type);
                });
        }


        var table = $('#' + tableId);

        var oTable = table.dataTable({

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js).
            // So when dropdowns used the scrollable div should be removed.
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "所有"] // change per page values here
            ],

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // set the initial value
            // "searching":false,
            "bFilter": false,
            "bSort": false,//排序关闭
            "bPaginate": false,
            "pageLength": 5,
            "bAutoWidth" : true,
            "aoColumnDefs": [{ "bVisible": false, "aTargets": [0]}], //隐藏列
            "oLanguage": {
                "sProcessing": "<img src='/images/datatable_loading.gif'>  努力加载数据中.",
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sZeroRecords": "没有检索到数据",
                "sSearch": "模糊查询:  ",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                }
            },

        });

       // oTable.fnSetColumnVis( 0, false);//隐藏列

        var tableWrapper = $("#" + tableId + "_wrapper");

        var nEditing = null;
        var nNew = false;

        $('#' + tableId + '_new').click(function (e) {
            debugger;
            var ms = valiRow();
            if(ms != "") {
                PlatformCommonUtils.warn(ms);
                return;
            }
            e.preventDefault();
            if (nNew && nEditing) {
                var jqInputs = $('input', nEditing);
                if (typeof(jqInputs[1].value) == "undefined" || jqInputs[1].value == null || jqInputs[1].value == "") {
                    alert("数据未保存，请检查!");
                    return;
                }

                if (confirm("数据未保存.是否需要保存 ?")) {
                    saveRow(oTable, nEditing); // save
                    //TODO
                    update(url, oTable, nRow); //数据提交后台修改
                    //$(nEditing).find("td:first").html("Untitled");
                    nEditing = null;
                    nNew = false;
                } else {
                    oTable.fnDeleteRow(nEditing); // cancel
                    nEditing = null;
                    nNew = false;
                    return;
                }
            }
            var total = oTable.fnSettings().fnRecordsTotal() + 1;
            var aiNew = oTable.fnAddData([(new Date()).valueOf(), '', '', total,'', '']);
            var nRow = oTable.fnGetNodes(aiNew[0]);
            editRow(oTable, nRow);
            nEditing = nRow;
            nNew = true;
        });

        table.on('click', '.delete', function (e) {
            e.preventDefault();

            if (confirm("确定是否删除?") == false) {
                return;
            }

            var nRow = $(this).parents('tr')[0];
            //TODO
            deleteRow(oTable, nRow);
            // oTable.fnDeleteRow(nRow);
        });

        function  deleteRow(oTable, nRow) {
            var type = $('#' + tableId).attr("typeValue");
            var jqInputs = $('input', nRow);
           // var doms = jqInputs.context.cells;
            var aData = oTable.fnGetData(nRow);
            var dfId = aData[0];
            $.post( usercontextpath + '/modeljz/deleteJzDfById.page', {"dfId": dfId},
                function (data) {
                    oTable.fnDeleteRow(nRow);
                    // refSelect(tableId, type);
                });
        }

        /**
         * 载入参考区域分类
         */
        $('#' + tableId + '_load').click(function (e) {
            e.preventDefault();
            oTable.fnClearTable();
            var sourMdId = "";
            if("sample_editable_1" == tableId) {
                sourMdId = $('#areaSymb input[name="'+tableId+'_radio"]:checked ').val();
                if(typeof sourMdId == "undefined" ||sourMdId==null||sourMdId==""){
                    alert("请选择参考，区域分类!");
                    return;
                }else{
                    $("#sample_editable_3_tbody").html("正在加载数据...");
                    $("#sample_editable_1_tbody").html("正在加载数据...");
                    var url = usercontextpath + '/modeljz/getSymbDatas.page';
                    $.post(url, {"sourMdId":sourMdId,"type":'0',"mdId":miid},
                        function (json) {
                            var df = json.dfAorI;
                            var ai = json.vAorI;
                            if(df!=null&&df.length>0){
                                $("#sample_editable_1_tbody").html("");
                                var dfStr="";
                                for (var i=0 ; i<df.length ; i++){
                                    var aiNew = oTable.fnAddData([df[i]["dfId"], df[i]["dfTitle"], df[i]["remark"],df[i]["sortNo"], '<a class="edit" href="">编辑</a>', '<a class="delete" href="">删除</a>']);
                                }

                            }
                            if(ai!=null&&ai.length>0){
                                $("#sample_editable_3_tbody").html("");
                                for (var n=0 ; n<ai.length ; n++){
                                    var aiStr="<tr><td>"+ai[n]["aiName"]+"</td><td>"+ai[n]["aiRemark"]+"</td><td>"+ai[n]["aiBlongBefore"]+"</td><td><select name=\"dfTitle\" id=\"dfTitleA_"+n+"\" ondblclick='changeAfterOption("+n+","+ai.length+")' onfocus='refSelOption(this,0)'><option value=\"\">-请选择-</option>";
                                    for (var m=0 ; m<df.length ; m++){
                                        if(ai[n]["aiBlongNew"]==df[m]["dfTitle"]){
                                            aiStr=aiStr+"<option value="+df[m]["dfTitle"]+" selected>"+df[m]["dfTitle"]+"</option>";
                                        }else{
                                            aiStr=aiStr+"<option value="+df[m]["dfTitle"]+">"+df[m]["dfTitle"]+"</option>";
                                        }
                                    }
                                    aiStr=aiStr+"</select></td></tr>";
                                    $("#sample_editable_3_tbody").append(aiStr);
                                }
                            }
                            // area_DTable .draw();
                        });

                }
            }
            if ("sample_editable_2" == tableId) {
                sourMdId = $('#indusSymb input[name="'+tableId+'_radio"]:checked ').val();
                if(typeof sourMdId == "undefined" ||sourMdId==null||sourMdId==""){
                    alert("请选择参考，行业分类!");
                    return;
                }else{
                    $("#sample_editable_4_tbody").html("正在加载数据...");
                    $("#sample_editable_2_tbody").html("正在加载数据...");

                    var url = usercontextpath + '/modeljz/getSymbDatas.page';
                    $.post(url, {"sourMdId":sourMdId,"type":'1',"mdId":miid},
                        function (json) {
                            var df = json.dfAorI;
                            var ai = json.vAorI;
                            if(df!=null&&df.length>0){
                                $("#sample_editable_2_tbody").html("");
                                var dfStr="";
                                for (var i=0 ; i<df.length ; i++){
                                    var aiNew = oTable.fnAddData([df[i]["dfId"], df[i]["dfTitle"], df[i]["remark"],df[i]["sortNo"], '<a class="edit" href="">编辑</a>', '<a class="delete" href="">删除</a>']);
                                }

                            }
                            if(ai!=null&&ai.length>0){
                                $("#sample_editable_4_tbody").html("");
                                for (var n=0 ; n<ai.length ; n++){

                                    var aiStr="<tr><td>"+ai[n]["aiName"]+"</td><td>"+ai[n]["aiRemark"]+"</td><td>"+ai[n]["aiBlongBefore"]+"</td><td><select name=\"dfTitle\" id=\"dfTitleI_"+n+"\" ondblclick='changeIfterOption("+n+","+ai.length+")' onfocus='refSelOption(this,1)'><option value=\"\">-请选择-</option>";
                                    for (var m=0 ; m<df.length ; m++){

                                        if(ai[n]["aiBlongNew"]==df[m]["dfTitle"]){
                                            aiStr=aiStr+"<option value="+df[m]["dfTitle"]+" selected>"+df[m]["dfTitle"]+"</option>";
                                        }else{
                                            aiStr=aiStr+"<option value="+df[m]["dfTitle"]+">"+df[m]["dfTitle"]+"</option>";
                                        }
                                    }
                                    aiStr=aiStr+"</select></td></tr>";
                                    $("#sample_editable_4_tbody").append(aiStr);
                                }
                            }

                        });
                }
            }
        });
        
        table.on('click', '.cancel', function (e) {
            e.preventDefault();
            if (nNew) {
                oTable.fnDeleteRow(nEditing);
                nEditing = null;
                nNew = false;
            } else {
                restoreRow(oTable, nEditing);
                nEditing = null;
            }
        });

        table.on('click', '.edit', function (e) {
            e.preventDefault();
            nNew = false;

            /* Get the row as a parent of the link that was clicked on */
            var nRow = $(this).parents('tr')[0];

            if (nEditing !== null && nEditing != nRow) {
                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                restoreRow(oTable, nEditing);
                editRow(oTable, nRow);
                nEditing = nRow;
            } else if (nEditing == nRow && this.innerHTML == "保存") {
              // var aData = oTable.fnGetData(nRow);
                var jqInputs = $('input', nRow);
                var dfTitle = jqInputs[0].value;
                if(dfTitle.length>12){
                    alert("第一列不能超过12个字符!");
                    return;
                }else{
                    /* Editing this row and want to save it */
                    update(url, oTable, nRow); //数据提交后台修改
                    saveRow(oTable, nEditing);
                    nEditing = null;
                    // alert("Updated! Do not forget to do some ajax to sync with backend :)");
                }
            } else {
                /* No edit in progress - let's start one */
                editRow(oTable, nRow);
                nEditing = nRow;
            }
        });
        return oTable;
    }
    return {

        //main function to initiate the module
        init: function (tableId, url) {
            return handleTable(tableId, url);
        }

    };

}();

