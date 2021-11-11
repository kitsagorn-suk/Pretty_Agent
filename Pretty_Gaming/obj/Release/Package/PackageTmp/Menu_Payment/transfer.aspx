<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transfer.aspx.cs" Inherits="Pretty_Gaming.Menu_Payment.transfer" %>

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

        .testDate {
            position: relative;
            color: white;
        }

            .testDate:before {
                position: absolute;
                content: attr(data-date);
                display: inline-block;
                color: black;
            }

            .testDate::-webkit-datetime-edit, .testDate::-webkit-inner-spin-button, .testDate::-webkit-clear-button {
                display: none;
            }

            .testDate::-webkit-calendar-picker-indicator {
                /*position: absolute;
                top: 9px;
                right: 10px;
                color: black;
                opacity: 1;*/
                background: transparent;
                bottom: 0;
                color: transparent;
                /*cursor: pointer;*/
                height: auto;
                left: 0;
                position: absolute;
                right: 0;
                top: 0;
                width: auto;
                z-index: 999;
            }

        .input-wrapper {
            position: relative;
        }

        .iconCalendar {
            position: absolute;
            top: 12px;
            left: 145px;
            z-index: 9;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Payment"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Deposit / Withdrawal"></li>
        </ol>
    </nav>
    <h1 class="txtHead" set-lan="text:Deposit / Withdrawal"></h1>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Login name_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="searchLogin();"></button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8" style="padding-top: 1.4rem;"><b set-lan="text:Credit_"></b>&nbsp;<b style="color: #007bff;" id="txtCredit">-</b></div>
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
                    <th style="width: 4%;" set-lan="text:No"></th>
                    <th style="width: 9%; text-align: left; padding-left: 5px;" set-lan="text:Login name"></th>
                    <th style="width: 5%; text-align: left; padding-left: 5px;" set-lan="text:Nickname"></th>
                    <th style="width: 7%;" set-lan="text:Level"></th>
                    <th style="width: 6%;" set-lan="text:Currency"></th>
                    <th style="width: 9%; text-align: right; padding-right: 5px;" set-lan="text:Credit"></th>
                    <th style="width: 6%;" class="zonenone" set-lan="text:Deposit"></th>
                    <th style="width: 6%;" class="zonenone" set-lan="text:Withdrawal"></th>
                    <th style="width: 8%;" set-lan="text:Detail"></th>
                    <th style="width: 9%;" set-lan="text:Last login date"></th>
                    <th style="width: 5%; text-align: left; padding-left: 5px;" set-lan="text:Last login IP"></th>
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
                    <td set-lan="text:Total"></td>
                    <td id="totalCredit">-</td>
                    <td class="zonenone"></td>
                    <td class="zonenone"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalGetDeposit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Deposit"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Account-"></label>
                        <label id="txtDepositName" class="col-8 col-form-label"></label>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Deposit-"></label>
                        <div class="col-8">
                            <input type="text" id="deposit" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="AddDeposit()" type="button" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
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
    <div class="modal fade" id="modalGetWithdrawal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Withdrawal"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Account-"></label>
                        <label id="txtWithdrawalName" class="col-8 col-form-label"></label>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Withdrawal-"></label>
                        <div class="col-8">
                            <input type="text" id="withdrawal" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="AddWithdrawal()" type="button" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalGetDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:History Detail"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="form-group row" style="margin-left: 15px !important;">
                            <label for="email" class="col-form-label" set-lan="text:Start date_"></label>
                            <div style="padding-left: 1rem;" class="input-wrapper">
                                <i class="far fa-calendar iconCalendar"></i>
                                <input type="date" data-date="" id="datestartDetail" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 155px;" />
                            </div>
                        </div>
                        <div class="form-group row" style="padding-left: 2.5rem;">
                            <label for="email" class="col-form-label" set-lan="text:To date_"></label>
                            <div style="padding-left: 1rem;" class="input-wrapper">
                                <i class="far fa-calendar iconCalendar"></i>
                                <input type="date" data-date="" id="dateendDetail" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 155px;" />
                            </div>
                        </div>
                        <div class="form-group row" style="padding-left: 2rem;">
                            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="searchHis();"></button>
                        </div>
                        <%--<div class="col-5">
                            <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                                <label for="email" class="col-4 col-form-label alignright" set-lan="text:Start date_"></label>
                                <div style="padding-left: 1rem;" class="col-8 input-wrapper">
                                    <i class="fa fa-calendar iconCalendar"></i>
                                    <input type="date" data-date="" id="datestartDetail" class="testDate form-control" data-date-format="DD-MM-YYYY" />
                                </div>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                                <label for="email" class="col-4 col-form-label alignright" set-lan="text:To date_"></label>
                                <div style="padding-left: 1rem;" class="col-8 input-wrapper">
                                    <i class="fa fa-calendar iconCalendar"></i>
                                    <input type="date" data-date="" id="dateendDetail" class="testDate form-control" data-date-format="DD-MM-YYYY" />
                                </div>
                            </div>
                        </div>
                        <div class="col-2">
                            <a class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" set-lan="text:Search" onclick="searchHis();"></a>
                        </div>--%>
                    </div>
                    <div id="wrapper2" style="float: right; margin-top: .5rem;">
                        <section>
                            <div class="data-container"></div>
                            <div id="pagination-demo22"></div>
                        </section>
                    </div>
                    <table class="table table-border" id="tbData2" style="margin-top: 3rem;">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th set-lan="text:No"></th>
                                <th set-lan="text:Action"></th>
                                <th set-lan="text:Amount"></th>
                                <th set-lan="text:Date"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">No cash transactions</td>
                            </tr>
                        </tbody>
                        <tfoot class="rgba-yellow-slight">
                            <tr class="total">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
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
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalAlertSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Success"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label id="lbAlertAction"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script src="../js/moment.min.js"></script>
    <script>
        var _idUser = "";
        $(document).ready(function () {
            $("#menuPayment , #menuPayment > a").addClass("active");
            $("#menuPayment > div").css("display", "block");

            //$("#datestartDetail , #dateendDetail").datepicker({
            //    format: 'dd/mm/yyyy',
            //    todayHighlight: true,
            //    autoclose: true,
            //});

            GetData("");
        });

        var NumPage;
        var TotalData;
        function searchLogin() {
            NumPage = null;
            TotalData = null;
            GetData($('#searchLoginname').val());
        }

        function GetData(user) {
            $("#myModalLoad").modal();

            if (NumPage == null) {
                NumPage = 1;
            }

            var dataAdd = new Object();
            if (user != "") {
                dataAdd.username = user;
            }
            else {
                dataAdd.username = null;
            }
            dataAdd.page = NumPage;
            dataAdd.limit = 20;
            $.ajax({
                url: apiURL + '/apiRoute/paymentRouter/memberList',
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
                        NumPage = data.data.page;
                        TotalData = data.data.totalDocs;
                        GetNumPage(NumPage, user);
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

        function GetNumPage(NumPage, user) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: NumPage,
                        pageSize: 20,
                        dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPage + '/20',
                        locator: 'docs',
                        callback: function (response, pagination) {
                            NumPage = container.pagination('getSelectedPageNum');
                            GetTable(NumPage, user);
                        }
                    });
                })('demo2');
            });
        }

        function GetTable(Num, user) {
            var htmlData = "";
            $("#tbData > tbody").html("");
            var dataAdd = new Object();
            if (user != "") {
                dataAdd.username = user;
            }
            else {
                dataAdd.username = null;
            }
            dataAdd.page = Num;
            dataAdd.limit = 20;
            $.ajax({
                url: apiURL + '/apiRoute/paymentRouter/memberList',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (res) {
                    if (res.code == 0 || res.code == null) {
                        var arr = res.data.docs;
                        var data;
                        var no = 1;
                        if (arr.length > 0) {
                            data = arr.sort(rankingSorter("isLocked", "isSuspend", "username"));
                            for (var i = 0; i < data.length; i++) {
                                var obj = data[i];

                                if (obj.isLocked == true || obj.isSuspend == true) {
                                    htmlData += "<tr style='background-color: #e9ecef;'>";
                                }
                                else {
                                    htmlData += "<tr>";
                                }

                                htmlData += "<td class='aligncenter'>" + (((Num - 1) * 20) + no) + "</td>";
                                htmlData += "<td><p class='overflowlg ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                                htmlData += "<td><p class='overflowlg ellipsis' title='" + obj.nickname + "'>" + obj.nickname + "</p></td>";
                                if (obj.position.toLowerCase() == "b2b_sh_holder" || obj.position.toLowerCase() == "b2c_sh_holder") {
                                    obj.position = "Shareholder";
                                }
                                else if (obj.position.toLowerCase() == "agent_none_api" || obj.position.toLowerCase() == "agent_api") {
                                    obj.position = "Agent";
                                }
                                else if (obj.position.toLowerCase() == "member_none_api" || obj.position.toLowerCase() == "member_api") {
                                    obj.position = "Member";
                                }
                                htmlData += "<td class='aligncenter' set-lan='text:" + obj.position + "'></td>";
                                htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalCurrency(\"" + obj.currency + "\", \"" + obj.username + "\");' style='line-height: 0rem !important;' set-lan='text:View'></button></td>";
                                var valCredit = parseFloat(obj.balance.$numberDecimal).toFixed(2);
                                htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                htmlData += "<td class='aligncenter zonenone'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDeposit(\"" + obj.username + "\",\"" + obj._id + "\");' style='line-height: 0rem !important;'>+</button></td>";
                                htmlData += "<td class='aligncenter zonenone'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalWithdrawal(\"" + obj.username + "\",\"" + obj._id + "\");' style='line-height: 0rem !important;'>-</button></td>";
                                htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDetail(\"" + obj.username + "\",\"" + obj._id + "\");' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";

                                if (obj.lastLogin != null) {
                                    var dataLogin = obj.lastLogin.date;
                                    var dateLog = new Date(dataLogin);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                    htmlData += "<td class='aligncenter'>" + txtDate + "</td>";

                                    if (obj.lastLogin.ip != null) {
                                        htmlData += "<td><p class='overflow ellipsis' title='" + obj.lastLogin.ip + "'>" + obj.lastLogin.ip + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td>-</td>";
                                    }
                                }
                                else {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                    htmlData += "<td>-</td>";
                                }

                                htmlData += "</tr>";

                                no++;
                            }

                            $("#tbData > tbody").append(htmlData);

                            var allCredit2 = parseFloat(res.total).toFixed(2);
                            $("#totalCredit").text(allCredit2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }
                        else {
                            $("#tbData > tbody").append("<tr><td colspan='11' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            $("#totalCredit").text("-");

                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }

                        if (localStorage.getItem("isSupport") == "true") {
                            if (localStorage.getItem("Status_Payment") == "VIEW") {
                                $('.zonenone').css('display', 'none');
                            }
                        }

                        if (localStorage.getItem("Position").toLowerCase() == "agent_api") {
                            $('.zonenone').css('display', 'none');
                        }

                        $("#txtCredit").text(localStorage.getItem("Balance").toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
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

        function getModalDeposit(valName, valId) {
            $("#deposit").val("");
            $('#txtDepositName').text(valName);
            _idUser = valId;
            $('#modalGetDeposit').modal('show');
        }

        function getModalWithdrawal(valName, valId) {
            $("#withdrawal").val("");
            $('#txtWithdrawalName').text(valName);
            _idUser = valId;
            $('#modalGetWithdrawal').modal('show');
        }

        var user = "";
        function getModalDetail(valName, valId) {
            user = valName;
            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#datestartDetail").val(dateSet);
            $("#dateendDetail").val(dateSet);

            $("input[type=date]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")

            searchHis();
        }

        function getModalCurrency(valCur, valName) {
            $('#txtName').text(valName);
            $('#txtCurrency').text(valCur);
            $('#modalGetCurrency').modal('show');
        }

        function AddDeposit() {
            $("#myModalLoad").modal();

            var dataAdd = new Object();
            dataAdd.balance = parseFloat($("#deposit").val().replace(/,/g, ""));
            dataAdd.under = _idUser;
            $.ajax({
                url: apiURL + '/apiRoute/paymentRouter/dp',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        $('#modalGetDeposit').modal('hide');

                        document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Update deposit success");
                        SetLan(localStorage.getItem("Language"));

                        $("#myModalLoad").modal('hide');
                        $('#modalAlertSuccess').modal();

                        setTimeout(function () {
                            location.reload();
                        }, 1500);
                    }
                    else if (data.code == 911001) {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:Insufficient balance.");
                        SetLan(localStorage.getItem("Language"));
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

        function AddWithdrawal() {
            $("#myModalLoad").modal();

            var dataAdd = new Object();
            dataAdd.balance = parseFloat($("#withdrawal").val().replace(/,/g, ""));
            dataAdd.under = _idUser;
            $.ajax({
                url: apiURL + '/apiRoute/paymentRouter/wd',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        $('#modalGetWithdrawal').modal('hide');

                        document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Update withdrawal success");
                        SetLan(localStorage.getItem("Language"));

                        $("#myModalLoad").modal('hide');
                        $('#modalAlertSuccess').modal();

                        setTimeout(function () {
                            location.reload();
                        }, 1500);
                    }
                    else if (data.code == 911001) {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:Insufficient balance.");
                        SetLan(localStorage.getItem("Language"));
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

        function searchHis() {
            if ($("#datestartDetail").val() != "" && $("#dateendDetail").val() != "") {
                GetData2($("#datestartDetail").val(), $("#dateendDetail").val());
            }
            else {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'date' field");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        function GetFormattedDate(txtDate) {
            var month = txtDate.split('/')[1];
            var day = txtDate.split('/')[0];
            var year = txtDate.split('/')[2];
            return year + "-" + month + "-" + day;
        }

        var NumPage2;
        var TotalData2;
        function GetData2(start, end) {
            $("#myModalLoad").modal();

            if (NumPage2 == null) {
                NumPage2 = 1;
            }

            var dataAdd = new Object();
            if (start == "") {
                start = $("#datestartDetail").val();
            }

            if (end == "") {
                end = $("#dateendDetail").val();
            }

            dataAdd.startDate = start;
            dataAdd.endDate = end;
            dataAdd.username = user;
            dataAdd.page = NumPage2;
            dataAdd.limit = 20;
            $.ajax({
                url: apiURL + "/apiRoute/paymentRouter/Statement",
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
                        NumPage2 = data.data.page;
                        TotalData2 = data.data.totalDocs;
                        GetNumPage2(NumPage2, start, end);
                    } else {
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

        function GetNumPage2(NumPage2, start, end) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData2,
                        pageNumber: NumPage2,
                        pageSize: 20,
                        dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPage2 + '/20',
                        locator: 'docs',
                        callback: function (response, pagination) {
                            NumPage2 = container.pagination('getSelectedPageNum');
                            GetTable2(NumPage2, start, end);
                        }
                    });
                })('demo22');
            });
        }

        function GetTable2(Num2, start, end) {
            var htmlData = "";
            $("#tbData2 > tbody").html("");
            $("#wrapper2").css("display", "block");
            var dataAdd = new Object();
            dataAdd.startDate = start;
            dataAdd.endDate = end;
            dataAdd.username = user;
            dataAdd.page = Num2;
            dataAdd.limit = 20;
            $.ajax({
                url: apiURL + "/apiRoute/paymentRouter/Statement",
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
                        var dataTotal = data.data.docs;
                        var no = 1;
                        if (dataTotal.length > 0) {
                            for (var i = 0; i < dataTotal.length; i++) {
                                var obj = dataTotal[i];
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + (((Num2 - 1) * 20) + no) + "</td>";
                                htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                                var Amt = parseFloat(obj.amt).toFixed(2);

                                htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (obj.date != null) {
                                    var dateLog = new Date(obj.date);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                    htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                }

                                htmlData += "</tr>";
                                no++;
                            }

                            $("#tbData2 > tbody").append(htmlData);
                            SetLan(localStorage.getItem("Language"));
                            $('#modalGetDetail').modal('show');
                            $("#myModalLoad").modal('hide');
                        }
                        else {
                            htmlData += "<tr>";
                            htmlData += "<td colspan='4' class='aligncenter' set-lan='text:No data.'></td>";
                            htmlData += "</tr>";


                            $("#tbData2 > tbody").append(htmlData);
                            SetLan(localStorage.getItem("Language"));
                            $('#modalGetDetail').modal('show');
                            $("#myModalLoad").modal('hide');
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
    </script>
</asp:Content>
