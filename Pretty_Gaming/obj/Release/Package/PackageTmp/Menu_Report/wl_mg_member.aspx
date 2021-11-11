<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wl_mg_member.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.wl_mg_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="">Report</a></li>
            <li class="breadcrumb-item active">W/L Member (MongoDB)</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-12">
            <h1>W/L Member (MongoDB)</h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row col-md-4">
            <label for="email" class="col-4 col-form-label alignright">Login name :</label>
            <div class="col-8">
                <input type="text" class="form-control" id="searchLoginname" placeholder="Enter Login name">
            </div>
        </div>
        <div class="form-group row col-md-4">
            <label for="email" class="col-4 col-form-label alignright">Transaction :</label>
            <div class="col-8">
                <input type="text" class="form-control" id="searchTransaction" placeholder="Enter Transaction">
            </div>
        </div>
        <div class="form-group row col-md-4">
        </div>
        <div class="form-group row col-md-4">
            <label for="email" class="col-4 col-form-label alignright">Start date :</label>
            <div class="col-8">
                <input class="form-control" id="startdate" placeholder="Enter start date" type="text"/>
            </div>
        </div>
        <div class="form-group row col-md-4">
            <label for="email" class="col-4 col-form-label alignright">To date :</label>
            <div class="col-8">
                <input type="text" class="form-control" id="todate" placeholder="Enter to date">
            </div>
        </div>
        <div class="form-group row col-md-4" style="padding-left: 5%;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button">Search</button>
        </div>
    </div>
    <div class="btn-toolbar mb-3" role="toolbar" style="margin-top: 1rem;">
        <div class="btn-group mr-auto">
            <div class="btn-group btn-group-green mr-3" data-toggle="buttons">
                <label class="btn btn-white border border-success z-depth-0 form-check-label active">
                    <input class="form-check-input" type="radio" name="options" id="option" autocomplete="off" checked>
                    All
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option1" autocomplete="off">
                    Previous
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option2" autocomplete="off">
                    Today
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option3" autocomplete="off">
                    Yesterday
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option4" autocomplete="off">
                    This week
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option5" autocomplete="off">
                    Last week
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option6" autocomplete="off">
                    This month
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option7" autocomplete="off">
                    Last month
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label">
                    <input class="form-check-input" type="radio" name="options" id="option8" autocomplete="off">
                    Next
                </label>
            </div>
        </div>
    </div>
    <div id="navMenu" style="color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-left: 10px !important; padding-right: 10px !important;">
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px; width: 100%; display: none;" id="tb">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight" style="text-align: center;">
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
            </tfoot>
        </table>
    </div>
    <div style="margin-top: 10px; margin-bottom: 10px; width: 100%; overflow: auto; height: 40em; display: none;" id="tb2">
        <table class="table table-border tableMaxWidth" id="tbData2" style="table-layout: fixed;">
            <thead class="rgba-green-slight" style="text-align: center;">
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
            </tfoot>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/card.js"></script>
    <script>
        $(document).ready(function () {
            $("#menuReport , #menuReport > a").addClass("active");
            $("#menuReport > div").css("display", "block");

            $("#myModalLoad").modal();

            $("#startdate , #todate").datepicker({
                format: 'dd/mm/yyyy',
                //todayHighlight: true,
                autoclose: true,
            });

            $("#navMenu , #tbData > thead , #tbData > tbody , #tbData > tfoot").html("");
            var htmlThead = "";
            var htmlTfoot = "";
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = _id;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLose",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
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

                    if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                        htmlThead += "<tr>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle;'>No</th>";
                        htmlThead += "<th rowspan='2' style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;'>Login name</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle;'>Cur</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;'>Turnover</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;'>Valid turn</th>";
                        htmlThead += "<th rowspan='2' style='width: 9%; vertical-align: middle; text-align: right; padding-right: 5px;'>Amount</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;'>Gross Comm</th>";
                        htmlThead += "<th colspan='3' style='vertical-align: middle;'>Company</th>";
                        htmlThead += "</tr>";
                        htmlThead += "<tr>";
                        htmlThead += "<th style='width: 10%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 10%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='border-radius: 0px !important; width: 10%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "</tr>";

                        var dataTotal = data.data.list;
                        var no = 1;
                        var htmlData = "";
                        var Total_turnOverAmt = 0;
                        var Total_validAmt = 0;
                        var Total_countTicket = 0;
                        var Total_grossCom = 0;
                        var Total_ptTotalBet = 0;
                        var Total_ptPayoutCom = 0;
                        var Total_ptPayoutTotal = 0;
                        for (var i = 0; i < dataTotal.length; i++) {
                            var obj = dataTotal[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + no + "</td>";

                            if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                htmlData += "<td><a onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }

                            htmlData += "<td class='aligncenter'>" + obj._id.username + "</td>";

                            var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                            if (obj.turnOverAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var validAmt = parseFloat(obj.validAmt).toFixed(2);
                            if (obj.validAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "<td class='alignright'>" + obj.countTicket + "</td>";

                            var grossCom = parseFloat(obj.grossCom).toFixed(2);
                            if (obj.grossCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                            if (obj.ptTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                            if (obj.ptPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                            if (obj.ptPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "</tr>";
                            no++;

                            Total_turnOverAmt = Total_turnOverAmt + obj.turnOverAmt;
                            Total_validAmt = Total_validAmt + obj.validAmt;
                            Total_countTicket = Total_countTicket + obj.countTicket;
                            Total_grossCom = Total_grossCom + obj.grossCom;
                            Total_ptTotalBet = Total_ptTotalBet + obj.ptTotalBet;
                            Total_ptPayoutCom = Total_ptPayoutCom + obj.ptPayoutCom;
                            Total_ptPayoutTotal = Total_ptPayoutTotal + obj.ptPayoutTotal;
                        }

                        Total_turnOverAmt = parseFloat(Total_turnOverAmt).toFixed(2);
                        Total_validAmt = parseFloat(Total_validAmt).toFixed(2);
                        Total_grossCom = parseFloat(Total_grossCom).toFixed(2);
                        Total_ptTotalBet = parseFloat(Total_ptTotalBet).toFixed(2);
                        Total_ptPayoutCom = parseFloat(Total_ptPayoutCom).toFixed(2);
                        Total_ptPayoutTotal = parseFloat(Total_ptPayoutTotal).toFixed(2);

                        htmlTfoot += "<tr>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td>Total :</td>";
                        if (Total_turnOverAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_validAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "<td>" + Total_countTicket + "</td>";

                        if (Total_grossCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "</tr>";

                        if (dataTotal.length == 0) {
                            $("#tbData > tbody").append("<tr><td colspan='10' style='text-align: center;'>No data.</td></tr>");
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }
                        else {
                            $("#tbData > tbody").append(htmlData);
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }

                        $('#tbData').css('width', '100%');
                    }
                    else if (dataMenu[0].position.toLowerCase() == "member_none_api" || dataMenu[0].position.toLowerCase() == "member_api") {
                        GetDataTableMember(_id);
                    }
                    else {
                        htmlThead += "<tr>";
                        htmlThead += "<th rowspan='2' style='width: 2.5%; vertical-align: middle;'>No</th>";
                        htmlThead += "<th rowspan='2' style='width: 7.5%; vertical-align: middle; text-align: left; padding-left: 5px;'>Login name</th>";
                        htmlThead += "<th rowspan='2' style='width: 4%; vertical-align: middle;'>Cur</th>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;'>Turnover</th>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;'>Valid turn</th>";
                        htmlThead += "<th rowspan='2' style='width: 4%; vertical-align: middle; text-align: right; padding-right: 5px;'>Amount</th>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;'>Gross Comm</th>";
                        htmlThead += "<th colspan='3' style='width: 18%; vertical-align: middle;'>Member</th>";
                        htmlThead += "<th colspan='3' style='width: 18%; vertical-align: middle;'>Agent</th>";
                        htmlThead += "<th colspan='3' style='width: 18%; vertical-align: middle;'>Company</th>";
                        htmlThead += "</tr>";
                        htmlThead += "<tr>";
                        htmlThead += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "</tr>";

                        var dataTotal = data.data.list;
                        var no = 1;
                        var htmlData = "";
                        var Total_turnOverAmt = 0;
                        var Total_validAmt = 0;
                        var Total_countTicket = 0;
                        var Total_grossCom = 0;
                        var Total_memberTotalBet = 0;
                        var Total_memberPayoutCom = 0;
                        var Total_memberPayoutTotal = 0;
                        var Total_ptTotalBet = 0;
                        var Total_ptPayoutCom = 0;
                        var Total_ptPayoutTotal = 0;
                        var Total_comTotalBet = 0;
                        var Total_comPayoutCom = 0;
                        var Total_comPayoutTotal = 0;
                        for (var i = 0; i < dataTotal.length; i++) {
                            var obj = dataTotal[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + no + "</td>";

                            if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                htmlData += "<td><a onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }

                            htmlData += "<td class='aligncenter'>THB</td>";

                            var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                            if (obj.turnOverAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var validAmt = parseFloat(obj.validAmt).toFixed(2);
                            if (obj.validAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "<td class='alignright'>" + obj.countTicket + "</td>";

                            var grossCom = parseFloat(obj.grossCom).toFixed(2);
                            if (obj.grossCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var memberTotalBet = parseFloat(obj.memberTotalBet).toFixed(2);
                            if (obj.memberTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var memberPayoutCom = parseFloat(obj.memberPayoutCom).toFixed(2);
                            if (obj.memberPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var memberPayoutTotal = parseFloat(obj.memberPayoutTotal).toFixed(2);
                            if (obj.memberPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                            if (obj.ptTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                            if (obj.ptPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                            if (obj.ptPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var comTotalBet = parseFloat(obj.comTotalBet).toFixed(2);
                            if (obj.comTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var comPayoutCom = parseFloat(obj.comPayoutCom).toFixed(2);
                            if (obj.comPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var comPayoutTotal = parseFloat(obj.comPayoutTotal).toFixed(2);
                            if (obj.comPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            htmlData += "</tr>";
                            no++;

                            Total_turnOverAmt = Total_turnOverAmt + obj.turnOverAmt;
                            Total_validAmt = Total_validAmt + obj.validAmt;
                            Total_countTicket = Total_countTicket + obj.countTicket;
                            Total_grossCom = Total_grossCom + obj.grossCom;
                            Total_memberTotalBet = Total_memberTotalBet + obj.memberTotalBet;
                            Total_memberPayoutCom = Total_memberPayoutCom + obj.memberPayoutCom;
                            Total_memberPayoutTotal = Total_memberPayoutTotal + obj.memberPayoutTotal;
                            Total_ptTotalBet = Total_ptTotalBet + obj.ptTotalBet;
                            Total_ptPayoutCom = Total_ptPayoutCom + obj.ptPayoutCom;
                            Total_ptPayoutTotal = Total_ptPayoutTotal + obj.ptPayoutTotal;
                            Total_comTotalBet = Total_comTotalBet + obj.comTotalBet;
                            Total_comPayoutCom = Total_comPayoutCom + obj.comPayoutCom;
                            Total_comPayoutTotal = Total_comPayoutTotal + obj.comPayoutTotal;
                        }

                        Total_turnOverAmt = parseFloat(Total_turnOverAmt).toFixed(2);
                        Total_validAmt = parseFloat(Total_validAmt).toFixed(2);
                        Total_grossCom = parseFloat(Total_grossCom).toFixed(2);
                        Total_memberTotalBet = parseFloat(Total_memberTotalBet).toFixed(2);
                        Total_memberPayoutCom = parseFloat(Total_memberPayoutCom).toFixed(2);
                        Total_memberPayoutTotal = parseFloat(Total_memberPayoutTotal).toFixed(2);
                        Total_ptTotalBet = parseFloat(Total_ptTotalBet).toFixed(2);
                        Total_ptPayoutCom = parseFloat(Total_ptPayoutCom).toFixed(2);
                        Total_ptPayoutTotal = parseFloat(Total_ptPayoutTotal).toFixed(2);
                        Total_comTotalBet = parseFloat(Total_comTotalBet).toFixed(2);
                        Total_comPayoutCom = parseFloat(Total_comPayoutCom).toFixed(2);
                        Total_comPayoutTotal = parseFloat(Total_comPayoutTotal).toFixed(2);

                        htmlTfoot += "<tr>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td>Total :</td>";
                        if (Total_turnOverAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_validAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "<td>" + Total_countTicket + "</td>";

                        if (Total_grossCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_memberTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_memberPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_memberPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_comTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_comPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_comPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "</tr>";

                        if (dataTotal.length == 0) {
                            $("#tbData > tbody").append("<tr><td colspan='16' style='text-align: center;'>No data.</td></tr>");
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }
                        else {
                            $("#tbData > tbody").append(htmlData);
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }

                        $('#tbData').css('width', '100%');
                    }

                    $("#tb").css('display', 'initial');
                    $("#tb2").css('display', 'none');

                    $("#myModalLoad").modal('hide');
                },
                error: function (xhr, status, error) {
                    console.log("Error! :" + xhr.status);
                }
            });
        });

        function GetDataTable(val) {
            $("#myModalLoad").modal();

            $("#navMenu , #tbData > thead , #tbData > tbody , #tbData > tfoot").html("");
            var htmlThead = "";
            var htmlTfoot = "";
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = val;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLose",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
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

                    if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                        htmlThead += "<tr>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle;'>No</th>";
                        htmlThead += "<th rowspan='2' style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;'>Login name</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle;'>Cur</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;'>Turnover</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;'>Valid turn</th>";
                        htmlThead += "<th rowspan='2' style='width: 9%; vertical-align: middle; text-align: right; padding-right: 5px;'>Amount</th>";
                        htmlThead += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;'>Gross Comm</th>";
                        htmlThead += "<th colspan='3' style='vertical-align: middle;'>Company</th>";
                        htmlThead += "</tr>";
                        htmlThead += "<tr>";
                        htmlThead += "<th style='width: 10%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 10%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='border-radius: 0px !important; width: 10%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "</tr>";

                        var dataTotal = data.data.list;
                        var no = 1;
                        var htmlData = "";
                        var Total_turnOverAmt = 0;
                        var Total_validAmt = 0;
                        var Total_countTicket = 0;
                        var Total_grossCom = 0;
                        var Total_ptTotalBet = 0;
                        var Total_ptPayoutCom = 0;
                        var Total_ptPayoutTotal = 0;
                        for (var i = 0; i < dataTotal.length; i++) {
                            var obj = dataTotal[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + no + "</td>";

                            if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                htmlData += "<td><a onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }

                            htmlData += "<td class='aligncenter'>THB</td>";

                            var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                            if (obj.turnOverAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var validAmt = parseFloat(obj.validAmt).toFixed(2);
                            if (obj.validAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "<td class='alignright'>" + obj.countTicket + "</td>";

                            var grossCom = parseFloat(obj.grossCom).toFixed(2);
                            if (obj.grossCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                            if (obj.ptTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                            if (obj.ptPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                            if (obj.ptPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "</tr>";
                            no++;

                            Total_turnOverAmt = Total_turnOverAmt + obj.turnOverAmt;
                            Total_validAmt = Total_validAmt + obj.validAmt;
                            Total_countTicket = Total_countTicket + obj.countTicket;
                            Total_grossCom = Total_grossCom + obj.grossCom;
                            Total_ptTotalBet = Total_ptTotalBet + obj.ptTotalBet;
                            Total_ptPayoutCom = Total_ptPayoutCom + obj.ptPayoutCom;
                            Total_ptPayoutTotal = Total_ptPayoutTotal + obj.ptPayoutTotal;
                        }

                        Total_turnOverAmt = parseFloat(Total_turnOverAmt).toFixed(2);
                        Total_validAmt = parseFloat(Total_validAmt).toFixed(2);
                        Total_grossCom = parseFloat(Total_grossCom).toFixed(2);
                        Total_ptTotalBet = parseFloat(Total_ptTotalBet).toFixed(2);
                        Total_ptPayoutCom = parseFloat(Total_ptPayoutCom).toFixed(2);
                        Total_ptPayoutTotal = parseFloat(Total_ptPayoutTotal).toFixed(2);

                        htmlTfoot += "<tr>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td>Total :</td>";
                        if (Total_turnOverAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_validAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "<td>" + Total_countTicket + "</td>";

                        if (Total_grossCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "</tr>";

                        if (dataTotal.length == 0) {
                            $("#tbData > tbody").append("<tr><td colspan='10' style='text-align: center;'>No data.</td></tr>");
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }
                        else {
                            $("#tbData > tbody").append(htmlData);
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }

                        $('#tbData').css('width', '100%');
                    }
                    else {
                        htmlThead += "<tr>";
                        htmlThead += "<th rowspan='2' style='width: 2.5%; vertical-align: middle;'>No</th>";
                        htmlThead += "<th rowspan='2' style='width: 7.5%; vertical-align: middle; text-align: left; padding-left: 5px;'>Login name</th>";
                        htmlThead += "<th rowspan='2' style='width: 4%; vertical-align: middle;'>Cur</th>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;'>Turnover</th>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;'>Valid turn</th>";
                        htmlThead += "<th rowspan='2' style='width: 4%; vertical-align: middle; text-align: right; padding-right: 5px;'>Amount</th>";
                        htmlThead += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;'>Gross Comm</th>";
                        htmlThead += "<th colspan='3' style='width: 18%; vertical-align: middle;'>Member</th>";
                        htmlThead += "<th colspan='3' style='width: 18%; vertical-align: middle;'>Agent</th>";
                        htmlThead += "<th colspan='3' style='width: 18%; vertical-align: middle;'>Company</th>";
                        htmlThead += "</tr>";
                        htmlThead += "<tr>";
                        htmlThead += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Win lose</th>";
                        htmlThead += "<th style='width: 6%; text-align: right; padding-right: 5px;'>Comm</th>";
                        htmlThead += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px;'>Total</th>";
                        htmlThead += "</tr>";

                        var dataTotal = data.data.list;
                        var no = 1;
                        var htmlData = "";
                        var Total_turnOverAmt = 0;
                        var Total_validAmt = 0;
                        var Total_countTicket = 0;
                        var Total_grossCom = 0;
                        var Total_memberTotalBet = 0;
                        var Total_memberPayoutCom = 0;
                        var Total_memberPayoutTotal = 0;
                        var Total_ptTotalBet = 0;
                        var Total_ptPayoutCom = 0;
                        var Total_ptPayoutTotal = 0;
                        var Total_comTotalBet = 0;
                        var Total_comPayoutCom = 0;
                        var Total_comPayoutTotal = 0;
                        for (var i = 0; i < dataTotal.length; i++) {
                            var obj = dataTotal[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + no + "</td>";

                            if (obj._id.position.toLowerCase() == "member_none_api" || obj._id.position.toLowerCase() == "member_api") {
                                htmlData += "<td><a onclick='GetDataTableMember(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='GetDataTable(\"" + obj._id._id + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</a></td>";
                            }

                            htmlData += "<td class='aligncenter'>THB</td>";

                            var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                            if (obj.turnOverAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var validAmt = parseFloat(obj.validAmt).toFixed(2);
                            if (obj.validAmt < 0) {
                                htmlData += "<td class='alignright txtRed'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "<td class='alignright'>" + obj.countTicket + "</td>";

                            var grossCom = parseFloat(obj.grossCom).toFixed(2);
                            if (obj.grossCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var memberTotalBet = parseFloat(obj.memberTotalBet).toFixed(2);
                            if (obj.memberTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var memberPayoutCom = parseFloat(obj.memberPayoutCom).toFixed(2);
                            if (obj.memberPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var memberPayoutTotal = parseFloat(obj.memberPayoutTotal).toFixed(2);
                            if (obj.memberPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                            if (obj.ptTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                            if (obj.ptPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                            if (obj.ptPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var comTotalBet = parseFloat(obj.comTotalBet).toFixed(2);
                            if (obj.comTotalBet < 0) {
                                htmlData += "<td class='alignright txtRed'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var comPayoutCom = parseFloat(obj.comPayoutCom).toFixed(2);
                            if (obj.comPayoutCom < 0) {
                                htmlData += "<td class='alignright txtRed'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var comPayoutTotal = parseFloat(obj.comPayoutTotal).toFixed(2);
                            if (obj.comPayoutTotal < 0) {
                                htmlData += "<td class='alignright txtRed'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            htmlData += "</tr>";
                            no++;

                            Total_turnOverAmt = Total_turnOverAmt + obj.turnOverAmt;
                            Total_validAmt = Total_validAmt + obj.validAmt;
                            Total_countTicket = Total_countTicket + obj.countTicket;
                            Total_grossCom = Total_grossCom + obj.grossCom;
                            Total_memberTotalBet = Total_memberTotalBet + obj.memberTotalBet;
                            Total_memberPayoutCom = Total_memberPayoutCom + obj.memberPayoutCom;
                            Total_memberPayoutTotal = Total_memberPayoutTotal + obj.memberPayoutTotal;
                            Total_ptTotalBet = Total_ptTotalBet + obj.ptTotalBet;
                            Total_ptPayoutCom = Total_ptPayoutCom + obj.ptPayoutCom;
                            Total_ptPayoutTotal = Total_ptPayoutTotal + obj.ptPayoutTotal;
                            Total_comTotalBet = Total_comTotalBet + obj.comTotalBet;
                            Total_comPayoutCom = Total_comPayoutCom + obj.comPayoutCom;
                            Total_comPayoutTotal = Total_comPayoutTotal + obj.comPayoutTotal;
                        }

                        Total_turnOverAmt = parseFloat(Total_turnOverAmt).toFixed(2);
                        Total_validAmt = parseFloat(Total_validAmt).toFixed(2);
                        Total_grossCom = parseFloat(Total_grossCom).toFixed(2);
                        Total_memberTotalBet = parseFloat(Total_memberTotalBet).toFixed(2);
                        Total_memberPayoutCom = parseFloat(Total_memberPayoutCom).toFixed(2);
                        Total_memberPayoutTotal = parseFloat(Total_memberPayoutTotal).toFixed(2);
                        Total_ptTotalBet = parseFloat(Total_ptTotalBet).toFixed(2);
                        Total_ptPayoutCom = parseFloat(Total_ptPayoutCom).toFixed(2);
                        Total_ptPayoutTotal = parseFloat(Total_ptPayoutTotal).toFixed(2);
                        Total_comTotalBet = parseFloat(Total_comTotalBet).toFixed(2);
                        Total_comPayoutCom = parseFloat(Total_comPayoutCom).toFixed(2);
                        Total_comPayoutTotal = parseFloat(Total_comPayoutTotal).toFixed(2);

                        htmlTfoot += "<tr>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td></td>";
                        htmlTfoot += "<td>Total :</td>";
                        if (Total_turnOverAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_validAmt < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "<td>" + Total_countTicket + "</td>";

                        if (Total_grossCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_memberTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_memberPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_memberPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_ptPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_comTotalBet < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_comPayoutCom < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (Total_comPayoutTotal < 0) {
                            htmlTfoot += "<td class='txtRed'>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlTfoot += "<td>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlTfoot += "</tr>";

                        if (dataTotal.length == 0) {
                            $("#tbData > tbody").append("<tr><td colspan='16' style='text-align: center;'>No data.</td></tr>");
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }
                        else {
                            $("#tbData > tbody").append(htmlData);
                            $("#tbData > thead").append(htmlThead);
                            $("#tbData > tfoot").append(htmlTfoot);
                        }

                        $('#tbData').css('width', '100%');
                    }

                    $("#tb").css('display', 'initial');
                    $("#tb2").css('display', 'none');

                    $("#myModalLoad").modal('hide');
                },
                error: function (xhr, status, error) {
                    console.log("Error! :" + xhr.status);
                }
            });
        }

        function GetDataTableMember(val) {
            $("#myModalLoad").modal();

            $("#navMenu , #tbData2 > thead , #tbData2 > tbody , #tbData2 > tfoot").html("");
            $("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');
            var htmlThead = "";
            var htmlTfoot = "";
            var htmlTbody = "";
            var totalStake = 0;
            var totalMember = 0;
            var totalMember2 = 0;
            var totalMember3 = 0;
            var countTotal = 0;
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = val;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLoseTransaction ",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    console.log(data);
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

                    htmlThead += "<tr>";
                    htmlThead += "<th rowspan='2' style='width: 40px; vertical-align: middle;'>No</th>";
                    htmlThead += "<th rowspan='2' style='width: 150px; vertical-align: middle; text-align: left; padding-left: 5px;'>Information</th>";
                    htmlThead += "<th rowspan='2' style='width: 130px; vertical-align: middle; text-align: left; padding-left: 5px;'>Event & Details</th>";
                    htmlThead += "<th rowspan='2' style='width: 85px; vertical-align: middle; text-align: left; padding-left: 5px;'>Bet Type</th>";
                    htmlThead += "<th rowspan='2' style='width: 100px; vertical-align: middle; text-align: right; padding-right: 5px;'>Amount</th>";
                    htmlThead += "<th rowspan='2' style='width: 160px; vertical-align: middle; text-align: left; padding-left: 5px;'>Result</th>";
                    htmlThead += "<th rowspan='2' style='width: 160px; vertical-align: middle; text-align: left; padding-left: 5px;'><div style='display: flex; padding-top: 15px;'><p style='text-align:left; margin-left:-10px' class='col-md-3'>Level</p><p style='text-align:right; margin-left:10px' class='col-md-9'>PT & Comm</p></div></th>";
                    htmlThead += "<th rowspan='2' style='width: 160px; vertical-align: middle; z-index: 1;'>Credit/Cash</th>";
                    htmlThead += "<th style='vertical-align: middle;' class='theadWin'>Win/Loss & Comm & Total</th>";
                    htmlThead += "</tr>";
                    htmlThead += "<tr>";
                    //htmlThead += "<th style='width: 100px; text-align: right; padding-right: 5px;'>Before</th>";
                    //htmlThead += "<th style='width: 100px; text-align: right; padding-right: 5px;'>Win/Loss</th>";
                    //htmlThead += "<th style='width: 100px; text-align: right; padding-right: 5px;'>After</th>";
                    htmlThead += "<th style='width: 100px; text-align: right; padding-right: 5px;'>Member</th>";

                    var dataHead = data.data.list;
                    var dtHead = dataHead[0].shareHolder;
                    var txtPositionTH = "";
                    var positionNoTH = 0;

                    var arrThead = [];
                    for (var i = 0; i < dtHead.length; i++) {
                        var txtGet = "";
                        if (dtHead[i].position.toLowerCase() == "company") {
                            txtGet = "Company";
                        }
                        else if (dtHead[i].position.toLowerCase() == "b2b_sh_holder" || dtHead[i].position.toLowerCase() == "b2c_sh_holder") {
                            txtGet = "Partner";
                        }
                        else if (dtHead[i].position.toLowerCase() == "agent_none_api" || dtHead[i].position.toLowerCase() == "agent_api") {
                            txtGet = "Agent";
                        }
                        else if (dtHead[i].position.toLowerCase() == "member_none_api" || dtHead[i].position.toLowerCase() == "member_api") {
                            txtGet = "Member";
                        }

                        arrThead.push(txtGet);
                    }

                    for (var i = 0; i < dtHead.length; i++) {
                        var txtPosition = "";
                        if (dtHead[i].position.toLowerCase() == "company") {
                            txtPositionTH = "Company";
                        }
                        else if (dtHead[i].position.toLowerCase() == "b2b_sh_holder" || dtHead[i].position.toLowerCase() == "b2c_sh_holder") {
                            txtPositionTH = "Partner";
                        }
                        else if (dtHead[i].position.toLowerCase() == "agent_none_api" || dtHead[i].position.toLowerCase() == "agent_api") {
                            txtPositionTH = "Agent";
                        }
                        else if (dtHead[i].position.toLowerCase() == "member_none_api" || dtHead[i].position.toLowerCase() == "member_api") {
                            txtPositionTH = "Member";
                        }

                        var txt = "";
                        var numOfTrue = arrThead.filter(function (x) { return x === txtPositionTH; }).length;
                        if (numOfTrue > 0) {
                            positionNoTH = parseInt(positionNoTH) + 1;
                        }
                        else if (numOfTrue == 0) {
                            positionNoTH = 0;
                        }

                        if (numOfTrue == 1) {
                            htmlThead += "<th style='width: 100px; text-align: right; padding-right: 5px;'>" + txtPositionTH + "</th>";
                        }
                        else {
                            htmlThead += "<th style='width: 100px; text-align: right; padding-right: 5px;'>" + txtPositionTH + " " + positionNoTH + "</th>";
                        }
                    }

                    htmlThead += "</tr>";

                    var dataTotal = data.data.list;
                    var no = 1;
                    var valBefore = 0;
                    var valAfter = 0;
                    for (var i = 0; i < dataTotal.length; i++) {
                        var obj = dataTotal[i];
                        htmlTbody += "<tr>";
                        htmlTbody += "<td class='aligncenter'>" + no + "</td>";
                        var dateLog = new Date(obj.updateDate);
                        var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                        htmlTbody += "<td><b>User : " + obj.memberUsername + "</b><br/><b>ID : " + obj.ticketId + "</b><br/>" + txtDate + "<br/>IP&nbsp;:&nbsp;" + obj.ip + "</td>";
                        htmlTbody += "<td><b>Game ID : " + obj.gameId + "</b><br/>" + obj.type + "<br/>" + obj.betPosition + "</td>";
                        if (obj.type == "Baccarat") {
                            htmlTbody += "<td>Original<br/>" + obj.type + "</td>";
                        }
                        else {
                            htmlTbody += "<td>" + obj.type + "</td>";
                        }

                        var betAmt = parseFloat(obj.betAmt * -1).toFixed(2);
                        var winLose = parseFloat(obj.winLose).toFixed(2);
                        htmlTbody += "<td class='alignright'>";
                        htmlTbody += "<p class='bottom0'>" + betAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>" + obj.currency;
                        htmlTbody += "</td>";
                        if (obj.betStatus == "Lose") {
                            htmlTbody += "<td><b style='color: red; margin-bottom: 0px !important;'>" + obj.betStatus + "</b>";
                            htmlTbody += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: 40px;'> Play Clip</i>";
                        }
                        else if (obj.betStatus == "Win") {
                            htmlTbody += "<td><b style='color: green; margin-bottom: 0px !important;'>" + obj.betStatus + "</b>";
                            htmlTbody += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: 45px;'> Play Clip</i>";
                        }
                        else {
                            htmlTbody += "<td><b style='color: #007bff; margin-bottom: 0px !important;'>" + obj.betStatus + "</b>";
                            htmlTbody += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: 50px;'> Play Clip</i>";
                        }

                        if (obj.type.toLowerCase() == "baccarat" || obj.type.toLowerCase() == "cowcow" || obj.type.toLowerCase() == "super6" || obj.type.toLowerCase() == "4point") {
                            var result = obj.result.rsBc;
                            htmlTbody += "<div class='row' style='margin-top: 5px;'><p class='bottom0 col-md-6'>Player : " + (result.player123 % 10) + "</p>";
                            htmlTbody += "<img src='../img/Card/" + result.player_1 + ".png' style='width: 13%; margin-left: -5px;' />";
                            htmlTbody += "<img src='../img/Card/" + result.player_2 + ".png' style='width: 13%;' />";
                            if (result.player_3 != null) {
                                htmlTbody += "<div class='vertical'></div>";
                                htmlTbody += "<img src='../img/Card/" + result.player_3 + ".png' style='width: 13%; transform: rotate(-90deg);' />";
                            }
                            htmlTbody += "</div>";

                            htmlTbody += "<div class='row' style='margin-top: 5px;'><p class='bottom0 col-md-6'>Banker : " + (result.banker123 % 10) + "</p>";
                            htmlTbody += "<img src='../img/Card/" + result.banker_1 + ".png' style='width: 13%;margin-left: -5px;' />";
                            htmlTbody += "<img  src='../img/Card/" + result.banker_2 + ".png' style='width: 13%;' />";
                            if (result.banker_3 != null) {
                                htmlTbody += "<div class='vertical'></div>";
                                htmlTbody += "<img src='../img/Card/" + result.banker_3 + ".png' style='width: 13%; transform: rotate(-90deg);' />";
                            }
                            htmlTbody += "</div>";

                            if (obj.result.winBc != null) {
                                htmlTbody += "<div class='row' style='margin-top: 5px;'><p class='col-md-5'>Result : </p><p class='col-md-7'>" + obj.result.winBc + "</p></div>";
                            }
                            else {
                                htmlTbody += "<div class='row' style='margin-top: 5px;'><p class='col-md-5'>Result : </p><p class='col-md-7'>-</p></div>";
                            }
                        }

                        htmlTbody += "</td>";
                        htmlTbody += "<td>";
                        htmlTbody += "<div style='margin-left: 0.9rem'>";
                        htmlTbody += "<div class='row'><p class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;'>Member</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>100%</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + obj.commissionRate + "%</p></div>";

                        var valPT = obj.shareHolder;
                        var positionNoTD = 0;
                        for (var j = 0; j < valPT.length; j++) {
                            var txtPositionTD = "";

                            if (valPT[j].position.toLowerCase() == "company") {
                                txtPositionTD = "Company";
                            }
                            else if (valPT[j].position.toLowerCase() == "b2b_sh_holder" || valPT[j].position.toLowerCase() == "b2c_sh_holder") {
                                txtPositionTD = "Partner";
                            }
                            else if (valPT[j].position.toLowerCase() == "agent_none_api" || valPT[j].position.toLowerCase() == "agent_api") {
                                txtPositionTD = "Agent";
                            }
                            else if (valPT[j].position.toLowerCase() == "member_none_api" || valPT[j].position.toLowerCase() == "member_api") {
                                txtPositionTD = "Member";
                            }

                            var txt = "";
                            var numOfTrue = arrThead.filter(function (x) { return x === txtPositionTD; }).length;
                            if (numOfTrue > 0) {
                                positionNoTD = parseInt(positionNoTD) + 1;
                            }
                            else if (numOfTrue == 0) {
                                positionNoTD = 0;
                            }

                            if (numOfTrue == 1) {
                                htmlTbody += "<div class='row'><p class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;'>" + txtPositionTD + "</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</p></div>";
                            }
                            else {
                                htmlTbody += "<div class='row'><p class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;'>" + txtPositionTD + " " + positionNoTD + "</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</p></div>";
                            }
                        }

                        htmlTbody += "</div>";
                        htmlTbody += "</td>";

                        var before = parseFloat(obj.beForCredit).toFixed(2);
                        var after = parseFloat(obj.afterCredit).toFixed(2);

                        var total = parseFloat(obj.winLose + (obj.payOutCom * -1)).toFixed(2);
                        var total2 = parseFloat(obj.payOutCom).toFixed(2);
                        var total3 = parseFloat(obj.winLose).toFixed(2);

                        htmlTbody += "<td>";
                        if (before < 0) {
                            htmlTbody += "<div class='row'><p class='col-md-6 bottom0'>Before</p><p class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + before.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                        }
                        else {
                            htmlTbody += "<div class='row'><p class='col-md-6 bottom0'>Before</p><p class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + before.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                        }

                        if (total3 < 0) {
                            htmlTbody += "<div class='row'><p class='col-md-6 bottom0'>Win/Loss</p><p class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                        }
                        else {
                            htmlTbody += "<div class='row'><p class='col-md-6 bottom0'>Win/Loss</p><p class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                        }

                        if (after < 0) {
                            htmlTbody += "<div class='row'><p class='col-md-6 bottom0'>After</p><p class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + after.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                        }
                        else {
                            htmlTbody += "<div class='row'><p class='col-md-6 bottom0'>After</p><p class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + after.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                        }
                        htmlTbody += "</td>";

                        valBefore = parseFloat(valBefore) + parseFloat(obj.beForCredit);
                        valAfter = parseFloat(valAfter) + parseFloat(obj.afterCredit);

                        htmlTbody += "<td>";
                        if (total < 0) {
                            htmlTbody += "<p class='bottom0 alignright txtRed'>" + total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        else {
                            htmlTbody += "<p class='bottom0 alignright'>" + total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        if (total2 < 0) {
                            htmlTbody += "<p class='bottom0 alignright txtRed'>" + total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        else {
                            htmlTbody += "<p class='bottom0 alignright'>" + total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        if (total3 < 0) {
                            htmlTbody += "<p class='bottom0 alignright txtRed'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                        }
                        else {
                            htmlTbody += "<p class='bottom0 alignright'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                        }

                        var valShar = obj.shareHolder;
                        countTotal = valShar.length;
                        for (var j = 0; j < valShar.length; j++) {
                            //var val = parseFloat(valShar[j].ptPayOutToUnder).toFixed(2);
                            var val = parseFloat(valShar[j].ptPayOutToUnder).toFixed(2);
                            var val2 = parseFloat((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1)).toFixed(2);
                            var val3 = parseFloat(valShar[j].ptPayOutToUnder + ((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1))).toFixed(2);
                            htmlTbody += "<td class='alignright'>";

                            var count = valShar[j].ptPayOutToUnder;
                            var count2 = (valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1);
                            var count3 = valShar[j].ptPayOutToUnder + ((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1));

                            if (val < 0) {
                                htmlTbody += "<p class='bottom0 alignright txtRed val_" + j + "' attr-val='" + count + "'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlTbody += "<p class='bottom0 alignright val_" + j + "' attr-val='" + count + "'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (val2 < 0) {
                                htmlTbody += "<p class='bottom0 alignright txtRed val2_" + j + "' attr-val='" + count2 + "'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlTbody += "<p class='bottom0 alignright val2_" + j + "' attr-val='" + count2 + "'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (val3 < 0) {
                                htmlTbody += "<p class='bottom0 alignright txtRed val3_" + j + "' attr-val='" + count3 + "'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlTbody += "<p class='bottom0 alignright val3_" + j + "' attr-val='" + count3 + "'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                        }

                        htmlTbody += "</tr>";
                        no++;
                        totalStake = parseFloat(totalStake) + parseFloat(obj.betAmt * -1);
                        totalMember = parseFloat(totalMember) + parseFloat(obj.winLose + (obj.payOutCom * -1));
                        totalMember2 = parseFloat(totalMember2) + parseFloat(obj.payOutCom);
                        totalMember3 = parseFloat(totalMember3) + parseFloat(obj.winLose);
                    }

                    $("#tbData2 > thead").append(htmlThead);
                    $("#tbData2 > tbody").append(htmlTbody);

                    htmlTfoot += "<tr>";
                    htmlTfoot += "<td></td>";
                    htmlTfoot += "<td></td>";
                    htmlTfoot += "<td></td>";
                    htmlTfoot += "<td>Total :</td>";
                    totalStake = parseFloat(totalStake).toFixed(2);
                    htmlTfoot += "<td>" + totalStake.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    htmlTfoot += "<td></td>";
                    htmlTfoot += "<td></td>";

                    valBefore = parseFloat(valBefore).toFixed(2);
                    valAfter = parseFloat(valAfter).toFixed(2);

                    totalMember = parseFloat(totalMember).toFixed(2);
                    totalMember2 = parseFloat(totalMember2).toFixed(2);
                    totalMember3 = parseFloat(totalMember3).toFixed(2);

                    htmlTfoot += "<td>";
                    //if (valBefore < 0) {
                    //    htmlTfoot += "<p class='bottom0 alignright txtRed'>" + valBefore.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    //}
                    //else {
                    //    htmlTfoot += "<p class='bottom0 alignright'>" + valBefore.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    //}

                    //if (totalMember3 < 0) {
                    //    htmlTfoot += "<p class='bottom0 alignright txtRed'>" + totalMember3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    //}
                    //else {
                    //    htmlTfoot += "<p class='bottom0 alignright'>" + totalMember3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    //}

                    //if (valAfter < 0) {
                    //    htmlTfoot += "<p class='bottom0 alignright txtRed'>" + valAfter.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    //}
                    //else {
                    //    htmlTfoot += "<p class='bottom0 alignright'>" + valAfter.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    //}
                    htmlTfoot += "</td>";

                    htmlTfoot += "<td>";
                    if (totalMember < 0) {
                        htmlTfoot += "<p class='bottom0 alignright txtRed'>" + totalMember.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    }
                    else {
                        htmlTfoot += "<p class='bottom0 alignright'>" + totalMember.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    }
                    if (totalMember2 < 0) {
                        htmlTfoot += "<p class='bottom0 alignright txtRed'>" + totalMember2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    }
                    else {
                        htmlTfoot += "<p class='bottom0 alignright'>" + totalMember2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    }
                    if (totalMember3 < 0) {
                        htmlTfoot += "<p class='bottom0 alignright txtRed'>" + totalMember3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    }
                    else {
                        htmlTfoot += "<p class='bottom0 alignright'>" + totalMember3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                    }
                    htmlTfoot += "</td>";

                  
                    var arrTotal = [];
                    for (var x = 0; x < countTotal; x++) {
                        var arr = [];
                        var els = document.getElementsByClassName("val_" + x + "");
                        for (var i = 0; i < els.length; i++) {
                            var val = els[i].getAttribute('attr-val');
                            arr.push(parseFloat(val));
                        }
                        arrTotal.push(sum(arr));
                    }

                    var arrTotal2 = [];
                    for (var a = 0; a < countTotal; a++) {
                        var arr2 = [];
                        var els = document.getElementsByClassName("val2_" + a + "");
                        var txt = 0;
                        for (var aa = 0; aa < els.length; aa++) {
                            var val = els[aa].getAttribute('attr-val');
                            arr2.push(parseFloat(val));
                        }
                        arrTotal2.push(sum(arr2));
                    }

                    var arrTotal3 = [];
                    for (var b = 0; b < countTotal; b++) {
                        var arr3 = [];
                        var els = document.getElementsByClassName("val3_" + b + "");
                        var txt = 0;
                        for (var bb = 0; bb < els.length; bb++) {
                            var val = els[bb].getAttribute('attr-val');
                            arr3.push(parseFloat(val));
                        }
                        console.log(arr3);
                        arrTotal3.push(sum(arr3));
                    }

                    for (var z = 0; z < arrTotal.length; z++) {
                        htmlTfoot += "<td>";
                        var num = parseFloat(arrTotal[z]).toFixed(2);
                        var num2 = parseFloat(arrTotal2[z]).toFixed(2);
                        var num3 = parseFloat(arrTotal3[z]).toFixed(2);

                        if (num < 0) {
                            htmlTfoot += "<p class='bottom0 alignright txtRed'>" + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        else {
                            htmlTfoot += "<p class='bottom0 alignright'>" + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        if (num2 < 0) {
                            htmlTfoot += "<p class='bottom0 alignright txtRed'>" + num2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        else {
                            htmlTfoot += "<p class='bottom0 alignright'>" + num2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        if (num3 < 0) {
                            htmlTfoot += "<p class='bottom0 alignright txtRed'>" + num3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        else {
                            htmlTfoot += "<p class='bottom0 alignright'>" + num3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                        }
                        htmlTfoot += "</td>";
                    }

                    htmlTfoot += "</tr>";

                    $("#tbData2 > tfoot").append(htmlTfoot);
                    $("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');

                    var txtWidth = (parseInt(dtHead.length) * 100) + 100;
                    var txtCol = txtWidth / 100;
                    $('.theadWin').css('width', txtWidth);
                    $('.theadWin').attr('colspan', txtCol);

                    $("#myModalLoad").modal('hide');
                },
                error: function (xhr, status, error) {
                    console.log("Error! :" + xhr.status);
                }
            });
        }

        function sum(input) {
            if (toString.call(input) !== "[object Array]")
                return false;

            var total = 0;
            for (var i = 0; i < input.length; i++) {
                if (isNaN(input[i])) {
                    continue;
                }
                total += Number(input[i]);
            }
            return total;
        }
    </script>
</asp:Content>
