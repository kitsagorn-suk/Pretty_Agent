<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shareholder.aspx.cs" Inherits="Pretty_Gaming.Shareholder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #wrapper {
            margin: 20px auto;
        }

        #pagination-data-container {
            margin-top: 5px;
        }

            #pagination-data-container ul {
                padding: 0;
                margin: 0;
            }

            #pagination-data-container li {
                margin-bottom: 5px;
                padding: 5px 10px;
                background: #eee;
                color: #666;
            }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Member Management"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Shareholder"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Shareholder"></h1>
        </div>
        <%--<div class="col-md-4" style="text-align: right;">
            <a href="/Menu_MemberManagement/shareholder_add.aspx" class="btn btn-primary" set-lan="html:Add Shareholder_"></a>
        </div>--%>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="col-md-12 row">
            <div class="form-group row fieldLogin" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Login name_"></label>
                <div style="padding-left: 1rem;">
                    <input type="text" class="form-control" id="searchLoginname">
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="btnClickSearch();"></button>
            </div>
        </div>
    </div>

    <%--<div class="btn-toolbar mb-3" role="toolbar">
        <div class="btn-group mr-auto">
            <div class="btn-group mr-3" aria-label="Adding member btn">
                <a href="/Menu_MemberManagement/shareholder_add.aspx" class="btn btn-primary"><i class="fas fa-plus mr-1"></i>Add Shareholder</a>
            </div>
            <div class="btn-group mr-3" aria-label="Editing btn">
                <button class="btn btn-primary" type="button" data-toggle="modal" data-openmodal="modals/edit-columns.html"><i class="fas fa-edit mr-1"></i>Edit columns</button>
            </div>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-md-8">
            <div id="navMenu" style="margin-top: 1rem; color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-left: 10px !important; padding-right: 10px !important;">
            </div>
        </div>
        <div class="col-md-4">
            <div id="wrapper" style="float: right;">
                <section>
                    <div class="data-container"></div>
                    <div id="pagination-demo2"></div>
                </section>
            </div>
        </div>
    </div>
    <div class="table-wrapper" style="margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 3%;" set-lan="text:No"></th>
                    <th style="width: 14%;" set-lan="text:Level"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Login name"></th>
                    <th style="width: 5%; text-align: left; padding-left: 5px;" set-lan="text:Nickname"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Phone"></th>
                    <th style="width: 4%;" class="edit" set-lan="text:Edit"></th>
                    <th class="thSus" style="width: 6%;" set-lan="text:Suspend"></th>
                    <th class="thLock" style="width: 6%;" set-lan="text:Lock"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:Credit"></th>
                    <th style="width: 4%;" set-lan="text:PT"></th>
                    <th style="width: 5%;" set-lan="text:Currency"></th>
                    <th style="width: 6%;" set-lan="text:Commission"></th>
                    <th style="width: 16%;" set-lan="text:Last login date"></th>
                    <th style="text-align: center;" set-lan="text:Last login IP"></th>
                    <th style="text-align: center;" set-lan="text:Create date"></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="edit"></td>
                    <td set-lan="text:Total"></td>
                    <td id="totalCredit">-</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>
    <%--<a onclick="btnExport();">test</a>--%>
    <div class="modal fade" id="modalGetCurrency" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Currency"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Account-"></label>
                        <label id="txtName" class="col-8 col-form-label"></label>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Currency_"></label>
                        <label id="txtCurrency" class="col-8 col-form-label"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalGetLastloginIP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Last login IP"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label alignright" set-lan="text:Last login IP_"></label>
                        <label id="txtLastloginIP" class="col-7 col-form-label"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalGetCreteDate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Create date"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label alignright" set-lan="text:Create date_"></label>
                        <label id="txtCreatedate" class="col-7 col-form-label"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalGetCommission" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Commission"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Original Baccarat_"></label>
                            <label id="txtnormalBaccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Super6 Baccarat_"></label>
                            <label id="txtsuper6Baccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Bacarrat 4 Point_"></label>
                            <label id="txtfourPointBaccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Cow Cow_"></label>
                            <label id="txtcowCowBaccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Dragon Tiger_"></label>
                            <label id="txtdragonTiger" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Roulete_"></label>
                            <label id="txtroulette" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Sicbo_"></label>
                            <label id="txtsicBo" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label id="lbAlert"></label>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script type="text/javascript" src="//unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
    <script type="text/javascript">
        var NumPage;
        var TotalData;
        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            var idMain = localStorage.getItem("_ID");
            GetData(1, idMain);
        });

        function btnClickSearch() {
            var idMain = localStorage.getItem("_ID");
            GetData(1, idMain);
        }

        function GetData(numPage, _id) {
            if (numPage == null) {
                NumPage = 1;
            }
            else {
                NumPage = numPage;
            }

            $("#myModalLoad").modal();

            $("#tbData > tbody , #navMenu").html("");

            if ($("#searchLoginname").val() != "" && numPage != null) {
                var dataAdd = new Object();
                dataAdd.username = $("#searchLoginname").val();
                $.ajax({
                    type: "POST",
                    url: apiURL + "/apiRoute/reportRouter/findMember",
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    headers: {
                        "Authorization": localStorage.getItem("Token"),
                        "Content-Type": "application/json"
                    },
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            _id = data.data._id;

                            var dataAdd = new Object();
                            dataAdd.self_uuid = localStorage.getItem("_ID");
                            dataAdd.under_uuid = _id;
                            dataAdd.page = NumPage;
                            dataAdd.limit = 100;
                            $.ajax({
                                url: apiURL + '/apiRoute/member/memberList',
                                type: 'POST',
                                dataType: 'json',
                                data: JSON.stringify(dataAdd),
                                contentType: 'application/json; charset=utf-8',
                                headers: {
                                    "Authorization": localStorage.getItem("Token"),
                                    "Content-Type": "application/json"
                                },
                                success: function (data) {
                                    if (data.code == 0 || data.code == null) {
                                        TotalData = data.data.totalDocs;
                                        GetNumPage(_id);
                                    }
                                    else {
                                        document.getElementById('lbAlert').innerHTML = data.msg;
                                        $("#myModalLoad").modal('hide');
                                        $('#modalAlert').modal('show');
                                    }
                                },
                                error: function (xhr, exception) {
                                    var msg = '';
                                    if (xhr.status === 0) {
                                        msg = 'Not connect. Verify Network.';
                                    } else if (xhr.status == 404) {
                                        msg = 'Requested page not found. [404]';
                                    } else if (xhr.status == 500) {
                                        msg = 'Internal Server Error [500].';
                                    } else if (exception === 'parsererror') {
                                        msg = 'Requested JSON parse failed.';
                                    } else if (exception === 'timeout') {
                                        msg = 'Time out error.';
                                    } else if (exception === 'abort') {
                                        msg = 'Ajax request aborted.';
                                    } else {
                                        msg = 'Uncaught Error.\n' + xhr.responseText;
                                    }
                                    document.getElementById('lbAlert').innerHTML = msg;
                                    $("#myModalLoad").modal('hide');
                                    $('#modalAlert').modal('show');
                                }
                            });
                        }
                        else if (data.code == 998) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Login name not found.");
                            $("#totalCredit").text("-");
                            $("#tbData > tbody").append("<tr><td colspan='14' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            SetLan(localStorage.getItem("Language"));
                            $(function () {
                                (function (name) {
                                    var container = $('#pagination-' + name);
                                    container.pagination({
                                        totalNumber: 0,
                                        pageNumber: 1,
                                        pageSize: 100,
                                        dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                                        locator: 'items',
                                        callback: function (response, pagination) {
                                            NumPage = container.pagination('getSelectedPageNum');
                                        }
                                    });
                                })('demo2');
                            });
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else {
                            document.getElementById('lbAlert').innerHTML = data.msg;
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                    },
                    error: function (xhr, exception) {
                        var msg = '';
                        if (xhr.status === 0) {
                            msg = 'Not connect. Verify Network.';
                        } else if (xhr.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (xhr.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + xhr.responseText;
                        }
                        document.getElementById('lbAlert').innerHTML = msg;
                        $("#myModalLoad").modal('hide');
                        $('#modalAlert').modal('show');
                    }
                });
            }
            else {
                var dataAdd = new Object();
                dataAdd.self_uuid = localStorage.getItem("_ID");
                dataAdd.under_uuid = _id;
                dataAdd.page = NumPage;
                dataAdd.limit = 100;
                $.ajax({
                    url: apiURL + '/apiRoute/member/memberList',
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    headers: {
                        "Authorization": localStorage.getItem("Token"),
                        "Content-Type": "application/json"
                    },
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            TotalData = data.data.totalDocs;
                            GetNumPage(_id);
                        }
                        else {
                            document.getElementById('lbAlert').innerHTML = data.msg;
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                    },
                    error: function (xhr, exception) {
                        var msg = '';
                        if (xhr.status === 0) {
                            msg = 'Not connect. Verify Network.';
                        } else if (xhr.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (xhr.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + xhr.responseText;
                        }
                        document.getElementById('lbAlert').innerHTML = msg;
                        $("#myModalLoad").modal('hide');
                        $('#modalAlert').modal('show');
                    }
                });
            }
        }

        function GetNumPage(_id) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: NumPage,
                        pageSize: 100,
                        dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                        locator: 'items',
                        callback: function (response, pagination) {
                            NumPage = container.pagination('getSelectedPageNum');
                            GetTable(NumPage, _id);
                        }
                    });
                })('demo2');
            });
        }

        function GetTable(numpage, _id) {
            $("#tbData > tbody , #navMenu").html("");
            var dataAdd = new Object();
            dataAdd.self_uuid = localStorage.getItem("_ID");
            dataAdd.under_uuid = _id;
            dataAdd.page = numpage;
            dataAdd.limit = 100;
            $.ajax({
                url: apiURL + "/apiRoute/member/memberList",
                type: 'POST',
                headers: { "Authorization": localStorage.getItem('Token') },
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        var dataMenu = data.parentList;
                        var htmlMenu = "";
                        for (var i = 0; i < dataMenu.length; i++) {
                            var objMenu = dataMenu[i];
                            if ((dataMenu.length - 1) == i) {
                                htmlMenu += "<a class='linkNav' onclick='GetData(null, \"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                            }
                            else {
                                htmlMenu += "<a class='linkNav' onclick='GetData(null, \"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                            }
                        }
                        $("#navMenu").append(htmlMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        var arr = data.data.docs;
                        var dataTotal = arr;
                        var no = 1;
                        var htmlData = "";
                        for (var i = 0; i < dataTotal.length; i++) {
                            var obj = dataTotal[i];
                            if (obj.isLocked == true || obj.isSuspend == true) {
                                htmlData += "<tr style='background-color: #e9ecef;'>";
                            }
                            else {
                                htmlData += "<tr>";
                            }

                            htmlData += "<td class='aligncenter'>" + (((numpage - 1) * 100) + no) + "</td>";

                            if (obj.position.toLowerCase() == "b2b_sh_holder") {
                                obj.position = "Shareholder (B2B)";
                            }
                            else if (obj.position.toLowerCase() == "b2c_sh_holder") {
                                obj.position = "Shareholder (B2C)";
                            }
                            else if (obj.position.toLowerCase() == "agent_none_api") {
                                obj.position = "Agent";
                            }
                            else if (obj.position.toLowerCase() == "agent_api") {
                                obj.position = "Agent (API)";
                            }
                            else if (obj.position.toLowerCase() == "member_none_api" || obj.position.toLowerCase() == "member_api") {
                                obj.position = "Member";
                            }
                            htmlData += "<td class='aligncenter' set-lan='text:" + obj.position + "'></td>";

                            if (obj.position == "Member") {
                                htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                            }
                            else {
                                htmlData += "<td><p onclick='GetData(null, \"" + obj._id + "\")' class='link overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                            }
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.nickname + "'>" + obj.nickname + "</p></td>";

                            if (obj.tel == null) {
                                obj.tel = "-";
                            }
                            htmlData += "<td>" + obj.tel + "</td>";

                            if (obj.isSuspend == false) {
                                obj.isSuspend = "No";
                            }
                            else {
                                obj.isSuspend = "Yes";
                            }

                            if (obj.isLocked == false) {
                                obj.isLocked = "Unlock";
                            }
                            else {
                                obj.isLocked = "Lock";
                            }

                            var sus = obj.isSuspend;
                            var lock = obj.isLocked;
                            htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj._id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                            htmlData += "<td class='colSus aligncenter' set-lan='text:" + obj.isSuspend + "Sus'></td>";
                            htmlData += "<td class='colLock aligncenter' set-lan='text:" + obj.isLocked + "'></td>";

                            var valCredit = parseFloat(obj.balance).toFixed(2);
                            htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='aligncenter'>" + obj.positionTracking + "%</td>";
                            htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalCurrency(\"" + obj.currency + "\", \"" + obj.username + "\");' style='line-height: 0rem !important;' set-lan='text:View'></button></td>";
                            htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalCommission(" + obj.commission.normalBaccarat + ", " + obj.commission.fourPointBaccarat + ", " + obj.commission.super6Baccarat + ", " + obj.commission.cowCowBaccarat + ", " + obj.commission.dragonTiger + ", " + obj.commission.roulette + ", " + obj.commission.sicBo + ");' style='line-height: 0rem !important;' set-lan='text:View'></button></td>";

                            if (obj.lastLogin != null) {
                                var dataLogin = obj.lastLogin.date;
                                var dateLog = new Date(dataLogin);
                                var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                htmlData += "<td class='aligncenter'>" + txtDate + "</td>";

                                if (obj.lastLogin.ip != null) {
                                    htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalLastloginIP(\"" + obj.lastLogin.ip + "\");' style='line-height: 0rem !important;' set-lan='text:View'></button></td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                }
                            }
                            else {
                                htmlData += "<td class='aligncenter'>-</td>";
                                htmlData += "<td class='aligncenter'>-</td>";
                            }

                            var dataCreate = obj.createDate;
                            var dateCreate_ = new Date(dataCreate);
                            var txtDateCreate = ("0" + dateCreate_.getDate()).slice(-2) + "-" + ("0" + (dateCreate_.getMonth() + 1)).slice(-2) + "-" + ("0" + dateCreate_.getFullYear()).slice(-2) + " " + ("0" + dateCreate_.getHours()).slice(-2) + ":" + ("0" + dateCreate_.getMinutes()).slice(-2) + ":" + ("0" + dateCreate_.getSeconds()).slice(-2);
                            htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalCreteDate(\"" + txtDateCreate + "\");' style='line-height: 0rem !important;' set-lan='text:View'></button></td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        if (dataTotal.length == 0) {
                            if (dataMenu.length > 1) {
                                $("#tbData > tbody").append("<tr><td colspan='14' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            }
                            else {
                                $("#tbData > tbody").append("<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            }
                            $("#totalCredit").text("-");
                        }
                        else {
                            $("#tbData > tbody").append(htmlData);
                            var balance2 = parseFloat(data.total).toFixed(2);
                            $("#totalCredit").text(balance2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        }

                        if (dataMenu.length > 1) {
                            $('.edit , .colEdit').css('display', 'none');
                            $('#tbData > thead > tr > th:nth-child(15)').addClass('lastTH');
                            $('#tbData > tfoot > tr > td:nth-child(15)').addClass('lastBT');
                        }
                        else {
                            $('.edit , .colEdit').css('display', 'table-cell');
                            $('#tbData > thead > tr > th:nth-child(15)').removeClass('lastTH');
                            $('#tbData > tfoot > tr > td:nth-child(15)').removeClass('lastBT');
                        }

                        if (localStorage.getItem("isSupport") == "true") {
                            if (localStorage.getItem("Status_Member") == "VIEW") {
                                $('.zonenone , .edit').css('display', 'none');
                            }
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
                        $("#myModalLoad").modal('hide');
                        $('#modalAlert').modal('show');
                    }
                },
                error: function (xhr, exception) {
                    var msg = '';
                    if (xhr.status === 0) {
                        msg = 'Not connect. Verify Network.';
                    } else if (xhr.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (xhr.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + xhr.responseText;
                    }
                    document.getElementById('lbAlert').innerHTML = msg;
                    $("#myModalLoad").modal('hide');
                    $('#modalAlert').modal('show');
                }
            });
        }

        function getModalCurrency(valCur, valName) {
            $('#txtName').text(valName);
            $('#txtCurrency').text(valCur);
            $('#modalGetCurrency').modal('show');
        }

        function getModalLastloginIP(valIP) {
            $('#txtLastloginIP').text(valIP);
            $('#modalGetLastloginIP').modal('show');
        }

        function getModalCreteDate(valDate) {
            $('#txtCreatedate').text(valDate);
            $('#modalGetCreteDate').modal('show');
        }

        function getModalCommission(valnormalBaccarat, valfourPointBaccarat, valsuper6Baccarat, valcowCowBaccarat, valdragonTiger, valroulette, valsicBo) {
            $('#txtnormalBaccarat').text(parseFloat(valnormalBaccarat).toFixed(1));
            $('#txtfourPointBaccarat').text(parseFloat(valfourPointBaccarat).toFixed(1));
            $('#txtsuper6Baccarat').text(parseFloat(valsuper6Baccarat).toFixed(1));
            $('#txtcowCowBaccarat').text(parseFloat(valcowCowBaccarat).toFixed(1));
            $('#txtdragonTiger').text(parseFloat(valdragonTiger).toFixed(1));
            $('#txtroulette').text(parseFloat(valroulette).toFixed(1));
            $('#txtsicBo').text(parseFloat(valsicBo).toFixed(1));
            $('#modalGetCommission').modal('show');
        }

        function viewEdit(val) {
            $("#myModalLoad").modal();

            $.ajax({
                url: apiURL + '/apiRoute/member/viewUnderProfile/' + val,
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (response) {
                    if (response.code == 0 || response.code == null) {
                        $("#myModalLoad").modal('hide');

                        if (response.position.toLowerCase() == "b2b_sh_holder" || response.position.toLowerCase() == "b2c_sh_holder") {
                            window.location.href = "/Menu_MemberManagement/shareholder_edit.aspx?itemid=" + val;
                        }
                        else if (response.position.toLowerCase() == "agent_none_api" || response.position.toLowerCase() == "agent_api") {
                            window.location.href = "/Menu_MemberManagement/agent_edit.aspx?itemid=" + val;
                        }
                        else if (response.position.toLowerCase() == "member_none_api" || response.position.toLowerCase() == "member_api") {
                            window.location.href = "/Menu_MemberManagement/member_agent_edit_member_credit.aspx?itemid=" + val;
                        }
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
                        $("#myModalLoad").modal('hide');
                        $('#modalAlert').modal('show');
                    }
                },
                error: function (xhr, exception) {
                    var msg = '';
                    if (xhr.status === 0) {
                        msg = 'Not connect. Verify Network.';
                    } else if (xhr.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (xhr.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + xhr.responseText;
                    }
                    document.getElementById('lbAlert').innerHTML = msg;
                    $("#myModalLoad").modal('hide');
                    $('#modalAlert').modal('show');
                }
            });
        }

        function rankingSorter(firstKey, secondKey, thirdKey) {
            return function (a, b) {
                if (a[firstKey] < b[firstKey]) {
                    return -1;
                } else if (a[firstKey] > b[firstKey]) {
                    return 1;
                }
                else {
                    if (a[secondKey] > b[secondKey]) {
                        return 1;
                    } else if (a[secondKey] < b[secondKey]) {
                        return -1;
                    } else {
                        if (a[thirdKey] > b[thirdKey]) {
                            return 1;
                        } else if (a[thirdKey] < b[thirdKey]) {
                            return -1;
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }

        function btnExport() {
            var arrBet = [];
            var targetDiv = document.querySelectorAll('.linkNav');
            for (var i = 0; i < targetDiv.length; i++) {
                arrBet.push(targetDiv[i].textContent);
            }

            var date = new Date();
            var dateSet = ("0" + date.getDate()).slice(-2) + "" + ("0" + (date.getMonth() + 1)).slice(-2) + "" + ("0" + date.getFullYear()).slice(-2) + "_" + ("0" + date.getHours()).slice(-2) + "" + ("0" + date.getMinutes()).slice(-2);
            var startDate = $("#startdate").attr("data-date") + " " + $("#starttime").attr("data-date");
            var toDate = $("#todate").attr("data-date") + " " + $("#totime").attr("data-date");
            var arrBetType = [];
            $.each($("input[name='chkBet']:checked"), function () {
                arrBetType.push($(this).val());
            });
            var betType = arrBetType;
            if ("ActiveXObject" in window) {
                alert("Export excel is not support an internet explorer program.");
            } else {
                var cache = {};
                this.tmpl = function tmpl(str, data) {
                    var fn = !/\W/.test(str) ? cache[str] = cache[str] || tmpl(document.getElementById(str).innerHTML) :
                    new Function("obj",
                                 "var p=[],print=function(){p.push.apply(p,arguments);};" +
                                 "with(obj){p.push('" +
                                 str.replace(/[\r\t\n]/g, " ")
                                 .split("{{").join("\t")
                                 .replace(/((^|}})[^\t]*)'/g, "$1\r")
                                 .replace(/\t=(.*?)}}/g, "',$1,'")
                                 .split("\t").join("');")
                                 .split("}}").join("p.push('")
                                 .split("\r").join("\\'") + "');}return p.join('');");
                    return data ? fn(data) : fn;
                };
                var txtTemp = "";
                if (arrBet.length == 1) {
                    txtTemp = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{{=worksheet}}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body>{{for(var i=0; i<tables.length;i++){ }}<table>{{=tables[i]}}</table>{{ } }}</body></html>';
                }
                else {
                    txtTemp = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{{=worksheet}}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body>{{for(var i=0; i<tables.length;i++){ }}<table>{{=tables[i]}}</table>{{ } }}</body></html>';
                }
                var tableToExcel = (function () {
                    var uri = 'data:application/vnd.ms-excel;base64,',
                        template = txtTemp;
                    base64 = function (s) {
                        return window.btoa(unescape(encodeURIComponent(s)));
                    },
                    format = function (s, c) {
                        return s.replace(/{(\w+)}/g, function (m, p) {
                            return c[p];
                        });
                    };
                    return function (tableList, name) {
                        if (!tableList.length > 0 && !tableList[0].nodeType) table = document.getElementById(table);
                        var tables = [];
                        for (var i = 0; i < tableList.length; i++) {
                            tables.push(tableList[i].innerHTML);
                        }
                        var ctx = {
                            worksheet: name || 'Worksheet',
                            tables: tables
                        };
                        var a = document.createElement('a');
                        a.href = uri + base64(tmpl(template, ctx));
                        a.download = 'Report_Shareholder_' + dateSet + '.xls';
                        a.click();
                    };
                })();
                tableToExcel(document.getElementsByTagName("table"), "Shareholder");
            }
        }
    </script>
</asp:Content>
