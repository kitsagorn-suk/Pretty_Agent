<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="member_outstanding.aspx.cs" Inherits="Pretty_Gaming.Menu_StockManagement.member_outstanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Stock Management"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Member Outstanding"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-12">
            <h1 set-lan="text:Member Outstanding"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Login name_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search"></button>
        </div>
    </div>
    <div id="navMenu" style="margin-top: 1rem; color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-left: 10px !important; padding-right: 10px !important;">
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight" style="text-align: center;">
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
            </tfoot>
        </table>
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
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menuStockManage , #menuStockManage > a").addClass("active");
            $("#menuStockManage > div").css("display", "block");

            $("#myModalLoad").modal();

            $("#navMenu , #tbData > thead , #tbData > tbody , #tbData > tfoot").html("");
            var htmlThead = "";
            var htmlTbody = "";
            var htmlTfoot = "";
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = _id;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/outStanding",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        var dataMenu = data.data.parentList;
                        var htmlMenu = "";
                        for (var i = 0; i < dataMenu.length; i++) {
                            var objMenu = dataMenu[i];
                            if ((dataMenu.length - 1) == i) {
                                if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                                }
                                else {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTable(\"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                                }
                            }
                            else {
                                if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                                }
                                else {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTable(\"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                                }
                            }
                        }
                        $("#navMenu").append(htmlMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        var dataTotal = data.data.list;
                        if (dataTotal.length > 0) {
                            if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                                htmlThead += "<tr>";
                                htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle;' set-lan='text:Position'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Company Total'></th>";
                                htmlThead += "</tr>";

                                var dataTotal = data.data.list;
                                var no = 1;
                                var val = 0;
                                var val2 = 0;
                                var val3 = 0;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlTbody += "<tr>";
                                    htmlTbody += "<td class='aligncenter'>" + no + "</td>";
                                    if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        htmlTbody += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlTbody += "<td><p onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var position = "";
                                    if (obj._id.position.toLowerCase() == "company") {
                                        position = "Company";
                                    }
                                    else if (obj._id.position.toLowerCase() == "b2b_sh_holder" || obj._id.position.toLowerCase() == "b2c_sh_holder") {
                                        position = "Shareholder";
                                    }
                                    else if (obj._id.position.toLowerCase() == "agent_none_api" || obj._id.position.toLowerCase() == "agent_api") {
                                        position = "Agent";
                                    }
                                    else if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        position = "Member";
                                    }

                                    htmlTbody += "<td class='aligncenter' set-lan='text:" + position + "'></td>";
                                    htmlTbody += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (turnOverAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptAmt = parseFloat(obj.ptAmt).toFixed(2);
                                    if (ptAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlTbody += "</tr>";

                                    val = parseFloat(val) + parseFloat(turnOverAmt);
                                    val2 = parseFloat(val2) + parseFloat(ptAmt);
                                    val3 = parseInt(val3) + parseInt(obj.countTicket);

                                    no++;
                                }

                                htmlTfoot += "<tr>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td set-lan='text:Total'></td>";
                                htmlTfoot += "<td>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                val = parseFloat(val).toFixed(2);
                                val2 = parseFloat(val2).toFixed(2);
                                if (val < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val2 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                htmlTfoot += "</tr>";
                            }
                            else {
                                htmlThead += "<tr>";
                                htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle;' set-lan='text:Position'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Member Total'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Agent Total'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Company Total'></th>";
                                htmlThead += "</tr>";

                                var dataTotal = data.data.list;
                                var no = 1;
                                var val = 0;
                                var val2 = 0;
                                var val3 = 0;
                                var val4 = 0;
                                var val5 = 0;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlTbody += "<tr>";
                                    htmlTbody += "<td class='aligncenter'>" + no + "</td>";
                                    if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        htmlTbody += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlTbody += "<td><p onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var position = "";
                                    if (obj._id.position.toLowerCase() == "company") {
                                        position = "Company";
                                    }
                                    else if (obj._id.position.toLowerCase() == "b2b_sh_holder" || obj._id.position.toLowerCase() == "b2c_sh_holder") {
                                        position = "Shareholder";
                                    }
                                    else if (obj._id.position.toLowerCase() == "agent_none_api" || obj._id.position.toLowerCase() == "agent_api") {
                                        position = "Agent";
                                    }
                                    else if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        position = "Member";
                                    }

                                    htmlTbody += "<td class='aligncenter' set-lan='text:" + position + "'></td>";
                                    htmlTbody += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (turnOverAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var betValue = parseFloat(obj.betValue).toFixed(2);
                                    if (betValue < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + betValue.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + betValue.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptAmt = parseFloat(obj.ptAmt).toFixed(2);
                                    if (ptAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var betToTop = parseFloat(obj.betToTop).toFixed(2);
                                    if (betToTop < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + betToTop.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + betToTop.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlTbody += "</tr>";

                                    val = parseFloat(val) + parseFloat(turnOverAmt);
                                    val2 = parseFloat(val2) + parseFloat(betValue);
                                    val3 = parseFloat(val3) + parseFloat(ptAmt);
                                    val4 = parseFloat(val4) + parseFloat(betToTop);

                                    no++;
                                }

                                htmlTfoot += "<tr>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td set-lan='text:Total'></td>";
                                htmlTfoot += "<td></td>";
                                val = parseFloat(val).toFixed(2);
                                val2 = parseFloat(val2).toFixed(2);
                                val3 = parseFloat(val3).toFixed(2);
                                val4 = parseFloat(val4).toFixed(2);
                                if (val < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val2 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val3 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val4 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                htmlTfoot += "</tr>";
                            }
                        }
                        else {
                            htmlThead += "<tr>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle;' set-lan='text:Position'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Company Total'></th>";
                            htmlThead += "</tr>";

                            htmlTbody += "<tr>";
                            htmlTbody += "<td colspan='6' style='text-align: center;' set-lan='text:No data.'></td>";
                            htmlTbody += "</tr>";

                            htmlTfoot += "<tr>";
                            htmlTfoot += "<td colspan='6' style='text-align: center;'></td>";
                            htmlTfoot += "</tr>";
                        }

                        $("#tbData > thead").append(htmlThead);
                        $("#tbData > tbody").append(htmlTbody);
                        $("#tbData > tfoot").append(htmlTfoot);

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
        });

        function GetDataTable(val) {
            $("#myModalLoad").modal();

            $("#navMenu , #tbData > thead , #tbData > tbody , #tbData > tfoot").html("");
            var htmlThead = "";
            var htmlTbody = "";
            var htmlTfoot = "";
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = val;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/outStanding",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        var dataMenu = data.data.parentList;
                        var htmlMenu = "";
                        for (var i = 0; i < dataMenu.length; i++) {
                            var objMenu = dataMenu[i];
                            if ((dataMenu.length - 1) == i) {
                                if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                                }
                                else {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTable(\"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                                }
                            }
                            else {
                                if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                                }
                                else {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTable(\"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                                }
                            }
                        }
                        $("#navMenu").append(htmlMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        var dataTotal = data.data.list;
                        if (dataTotal.length > 0) {
                            if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                                htmlThead += "<tr>";
                                htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle;' set-lan='text:Position'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                                htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Company Total'></th>";
                                htmlThead += "</tr>";

                                var dataTotal = data.data.list;
                                var no = 1;
                                var val = 0;
                                var val2 = 0;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlTbody += "<tr>";
                                    htmlTbody += "<td class='aligncenter'>" + no + "</td>";
                                    if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        htmlTbody += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlTbody += "<td><p onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var position = "";
                                    if (obj._id.position.toLowerCase() == "company") {
                                        position = "Company";
                                    }
                                    else if (obj._id.position.toLowerCase() == "b2b_sh_holder" || obj._id.position.toLowerCase() == "b2c_sh_holder") {
                                        position = "Shareholder";
                                    }
                                    else if (obj._id.position.toLowerCase() == "agent_none_api" || obj._id.position.toLowerCase() == "agent_api") {
                                        position = "Agent";
                                    }
                                    else if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        position = "Member";
                                    }

                                    htmlTbody += "<td class='aligncenter' set-lan='text:" + position + "'></td>";
                                    htmlTbody += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (turnOverAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptAmt = parseFloat(obj.ptAmt).toFixed(2);
                                    if (ptAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlTbody += "</tr>";

                                    val = parseFloat(val) + parseFloat(turnOverAmt);
                                    val2 = parseFloat(val2) + parseFloat(ptAmt);

                                    no++;
                                }

                                htmlTfoot += "<tr>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td set-lan='text:Total'></td>";
                                htmlTfoot += "<td></td>";
                                val = parseFloat(val).toFixed(2);
                                val2 = parseFloat(val2).toFixed(2);
                                if (val < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val2 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                htmlTfoot += "</tr>";
                            }
                            else {
                                htmlThead += "<tr>";
                                htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle;' set-lan='text:Position'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Member Total'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Agent Total'></th>";
                                htmlThead += "<th style='width: 12%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Company Total'></th>";
                                htmlThead += "</tr>";

                                var dataTotal = data.data.list;
                                var no = 1;
                                var val = 0;
                                var val2 = 0;
                                var val3 = 0;
                                var val4 = 0;
                                var val5 = 0;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlTbody += "<tr>";
                                    htmlTbody += "<td class='aligncenter'>" + no + "</td>";
                                    if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        htmlTbody += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlTbody += "<td><p onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var position = "";
                                    if (obj._id.position.toLowerCase() == "company") {
                                        position = "Company";
                                    }
                                    else if (obj._id.position.toLowerCase() == "b2b_sh_holder" || obj._id.position.toLowerCase() == "b2c_sh_holder") {
                                        position = "Shareholder";
                                    }
                                    else if (obj._id.position.toLowerCase() == "agent_none_api" || obj._id.position.toLowerCase() == "agent_api") {
                                        position = "Agent";
                                    }
                                    else if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                        position = "Member";
                                    }

                                    htmlTbody += "<td class='aligncenter' set-lan='text:" + position + "'></td>";
                                    htmlTbody += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (turnOverAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var betValue = parseFloat(obj.betValue).toFixed(2);
                                    if (betValue < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + betValue.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + betValue.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptAmt = parseFloat(obj.ptAmt).toFixed(2);
                                    if (ptAmt < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + ptAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var betToTop = parseFloat(obj.betToTop).toFixed(2);
                                    if (betToTop < 0) {
                                        htmlTbody += "<td class='alignright txtRed'>" + betToTop.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlTbody += "<td class='alignright'>" + betToTop.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlTbody += "</tr>";

                                    val = parseFloat(val) + parseFloat(turnOverAmt);
                                    val2 = parseFloat(val2) + parseFloat(betValue);
                                    val3 = parseFloat(val3) + parseFloat(ptAmt);
                                    val4 = parseFloat(val4) + parseFloat(betToTop);

                                    no++;
                                }

                                htmlTfoot += "<tr>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td></td>";
                                htmlTfoot += "<td set-lan='text:Total'></td>";
                                htmlTfoot += "<td></td>";
                                val = parseFloat(val).toFixed(2);
                                val2 = parseFloat(val2).toFixed(2);
                                val3 = parseFloat(val3).toFixed(2);
                                val4 = parseFloat(val4).toFixed(2);
                                if (val < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val2 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val3 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                if (val4 < 0) {
                                    htmlTfoot += "<td class='txtRed'>" + val4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTfoot += "<td>" + val4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                htmlTfoot += "</tr>";
                            }
                        }
                        else {
                            htmlThead += "<tr>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle;' set-lan='text:Position'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                            htmlThead += "<th style='width: 15%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Company Total'></th>";
                            htmlThead += "</tr>";

                            htmlTbody += "<tr>";
                            htmlTbody += "<td colspan='6' style='text-align: center;' set-lan='text:No data.'></td>";
                            htmlTbody += "</tr>";

                            htmlTfoot += "<tr>";
                            htmlTfoot += "<td colspan='6' style='text-align: center;'></td>";
                            htmlTfoot += "</tr>";
                        }

                        $("#tbData > thead").append(htmlThead);
                        $("#tbData > tbody").append(htmlTbody);
                        $("#tbData > tfoot").append(htmlTfoot);

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

        function GetDataTableMember(val) {
            $("#myModalLoad").modal();

            $("#navMenu , #tbData > thead , #tbData > tbody , #tbData > tfoot").html("");
            var htmlThead = "";
            var htmlTbody = "";
            var htmlTfoot = "";
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = val;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/outStandingTransaction",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        var dataMenu = data.data.parentList;
                        var htmlMenu = "";
                        for (var i = 0; i < dataMenu.length; i++) {
                            var objMenu = dataMenu[i];
                            if ((dataMenu.length - 1) == i) {
                                if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                                }
                                else {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTable(\"" + objMenu._id + "\")'>" + objMenu.username + "</a>";
                                }
                            }
                            else {
                                if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                                }
                                else {
                                    htmlMenu += "<a class='linkNav' onclick='GetDataTable(\"" + objMenu._id + "\")'>" + objMenu.username + "</a> / ";
                                }
                            }
                        }
                        $("#navMenu").append(htmlMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        var dataTotal = data.data.list;
                        if (dataTotal.length > 0) {
                            htmlThead += "<tr>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Event & Details'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:Login date'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login IP'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Bet Type'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:Currency'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                            htmlThead += "</tr>";

                            var dataTotal = data.data.list;
                            var no = 1;
                            var val = 0;
                            for (var i = 0; i < dataTotal.length; i++) {
                                var obj = dataTotal[i];
                                htmlTbody += "<tr>";
                                htmlTbody += "<td class='aligncenter'>" + no + "</td>";
                                htmlTbody += "<td><p class='overflow ellipsis' title='" + obj.memberUsername + "'>" + obj.memberUsername + "</p></td>";
                                htmlTbody += "<td><b set-lan='text:Game ID'></b> <b>: " + obj.gameId + "</b><br/><span set-lan='text:" + obj.type + "'></span><br/><span set-lan='text:" + obj.betPosition + "'></span></td>";

                                if (obj.updateDate != null) {
                                    var dataLogin = obj.updateDate;
                                    var dateLog = new Date(dataLogin);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                    htmlTbody += "<td class='aligncenter'>" + txtDate + "</td>";
                                }
                                else {
                                    htmlTbody += "<td class='aligncenter'>-</td>";
                                }

                                if (obj.ip != null) {
                                    htmlTbody += "<td><p class='overflow ellipsis' title='" + obj.ip + "'>" + obj.ip + "</p></td>";
                                }
                                else {
                                    htmlTbody += "<td>-</td>";
                                }

                                if (obj.type == "Baccarat") {
                                    htmlTbody += "<td set-lan='text:Original'></td>";
                                }
                                else {
                                    htmlTbody += "<td set-lan='text:" + obj.type + "'></td>";
                                }

                                htmlTbody += "<td class='aligncenter'>" + obj.currency + "</td>";

                                var betAmt = parseFloat(obj.betAmt * -1).toFixed(2);
                                if (betAmt < 0) {
                                    htmlTbody += "<td class='alignright txtRed'>" + betAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlTbody += "<td class='alignright'>" + betAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlTbody += "</tr>";

                                val = parseFloat(val) + parseFloat(betAmt);

                                no++;
                            }

                            htmlTfoot += "<tr>";
                            htmlTfoot += "<td></td>";
                            htmlTfoot += "<td></td>";
                            htmlTfoot += "<td></td>";
                            htmlTfoot += "<td></td>";
                            htmlTfoot += "<td></td>";
                            htmlTfoot += "<td></td>";
                            htmlTfoot += "<td set-lan='text:Total'></td>";

                            val = parseFloat(val).toFixed(2);
                            if (val < 0) {
                                htmlTfoot += "<td class='txtRed'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlTfoot += "<td>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            htmlTfoot += "</tr>";
                        }
                        else {
                            htmlThead += "<tr>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:No'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Event & Details'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:Login date'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login IP'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Bet Type'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle;' set-lan='text:Currency'></th>";
                            htmlThead += "<th style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:No.Ticket'></th>";
                            htmlThead += "</tr>";

                            htmlTbody += "<tr>";
                            htmlTbody += "<td colspan='8' style='text-align: center;' set-lan='text:No data.'></td>";
                            htmlTbody += "</tr>";

                            htmlTfoot += "<tr>";
                            htmlTfoot += "<td colspan='8' style='text-align: center;'></td>";
                            htmlTfoot += "</tr>";
                        }

                        $("#tbData > thead").append(htmlThead);
                        $("#tbData > tbody").append(htmlTbody);
                        $("#tbData > tfoot").append(htmlTfoot);

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
    </script>
</asp:Content>

