<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wl_member_ver1.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.wl_member_ver1" %>

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
            <li class="breadcrumb-item"><a href="" set-lan="text:Report"></a></li>
            <li class="breadcrumb-item active" set-lan="text:W/L Member"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-12">
            <h1 set-lan="text:W/L Member"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="col-md-12 row">
            <div class="row col-md-4">
                <label for="email" class="col-4 col-form-label alignright" set-lan="text:Login name_"></label>
                <div class="col-8">
                    <input type="text" class="form-control" id="searchLoginname">
                </div>
            </div>
        </div>
        <div class="col-md-12 row" style="margin-top: 1rem; margin-bottom: 1rem;">
            <div class="row col-md-4">
                <label for="email" class="col-4 col-form-label alignright" set-lan="text:Start date_"></label>
                <div class="col-8">
                    <input class="form-control" id="startdate" type="text" />
                </div>
            </div>
            <div class="row col-md-4">
                <label for="email" class="col-4 col-form-label alignright" set-lan="text:To date_"></label>
                <div class="col-8">
                    <input type="text" class="form-control" id="todate">
                </div>
            </div>
            <div class="row col-md-4" style="padding-left: 5%;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" onclick="btnSearch();" set-lan="text:Search"></button>
            </div>
        </div>
    </div>
    <div class="btn-toolbar mb-3" role="toolbar" style="margin-top: 1rem;">
        <div class="btn-group mr-auto">
            <div class="btn-group btn-group-green mr-3" data-toggle="buttons">
                <label class="btn btn-white border border-success z-depth-0 form-check-label active" onclick="btnTime('Today');">
                    <input class="form-check-input" type="radio" name="options" id="option2" autocomplete="off" checked>
                    <span set-lan="text:Today"></span>
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('Yesterday');">
                    <input class="form-check-input" type="radio" name="options" id="option3" autocomplete="off">
                    <span set-lan="text:Yesterday"></span>
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('This week');">
                    <input class="form-check-input" type="radio" name="options" id="option4" autocomplete="off">
                    <span set-lan="text:This week"></span>
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('Last week');">
                    <input class="form-check-input" type="radio" name="options" id="option5" autocomplete="off">
                    <span set-lan="text:Last week"></span>
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('This month');">
                    <input class="form-check-input" type="radio" name="options" id="option6" autocomplete="off">
                    <span set-lan="text:This month"></span>
                </label>
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('Last month');">
                    <input class="form-check-input" type="radio" name="options" id="option7" autocomplete="off">
                    <span set-lan="text:Last month"></span>
                </label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div id="navMenu" style="color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-right: 10px !important;"></div>
        </div>
        <div class="col-md-4">
            <div id="wrapper" style="float: right; display: none; margin-top: 0rem;">
                <section>
                    <div class="data-container"></div>
                    <div id="pagination-demo2"></div>
                </section>
            </div>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px; width: 100%; display: none;" id="tb">
    </div>
    <div style="margin-top: -10px; margin-bottom: 10px; width: 100%; overflow: auto; height: 40em; display: none;" id="tb2">
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
    <script src="../js/card.js"></script>
    <script src="../js/pagination.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#menuReport , #menuReport > a").addClass("active");
            $("#menuReport > div").css("display", "block");

            $("#myModalLoad").modal();

            $("#startdate , #todate").datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: true,
                autoclose: true,
            });

            var date = new Date();
            $("#startdate").datepicker('setDate', date);
            $("#todate").datepicker('setDate', date);
            date = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
            var start = GetFormattedDate(date);
            var end = GetFormattedDate(date);

            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");

            GetData2(_id, currency, start, end, GetData);
        });

        function btnSearch() {
            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");
            GetData2(_id, currency, GetFormattedDate($('#startdate').val()), GetFormattedDate($('#todate').val()), GetData);
        }

        function btnTime(type) {
            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");
            var start = "";
            var end = "";
            var date = new Date();

            if (type == "Today") {
                date = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
                $("#startdate").datepicker('setDate', date);
                $("#todate").datepicker('setDate', date);
                start = GetFormattedDate(date);
                end = GetFormattedDate(date);
            }
            else if (type == "Yesterday") {
                var todayTimeStamp = +new Date; 
                var oneDayTimeStamp = 1000 * 60 * 60 * 24;
                var diff = todayTimeStamp - oneDayTimeStamp;
                var yesterdayDate = new Date(diff);
                var yesterdayString = ("0" + yesterdayDate.getDate()).slice(-2) + "/" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "/" + yesterdayDate.getFullYear();//yesterdayDate.getFullYear() + '-' + (yesterdayDate.getMonth() + 1) + '-' + yesterdayDate.getDate();
                $("#startdate").datepicker('setDate', yesterdayString);
                $("#todate").datepicker('setDate', yesterdayString);
                start = GetFormattedDate(yesterdayString);
                end = GetFormattedDate(yesterdayString);
            }
            else if (type == "This week") {
                var firstday = date.getDate() - date.getDay();
                var lastday = firstday + 6;
                var date1 = new Date(date.setDate(firstday));
                var date2 = new Date(date.setDate(lastday));
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 2)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").datepicker('setDate', startDate);
                $("#todate").datepicker('setDate', endDate);
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);
            }
            else if (type == "Last week") {
                var firstday = (date.getDate() - date.getDay()) - 7;
                var lastday = firstday + 7;
                var date1 = new Date(date.setDate(firstday));
                var date2 = new Date(date.setDate(lastday));
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 2)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").datepicker('setDate', startDate);
                $("#todate").datepicker('setDate', endDate);
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);
            }
            else if (type == "This month") {
                var date1 = new Date(date.getFullYear(), date.getMonth(), 1);
                var date2 = new Date(date.getFullYear(), date.getMonth() + 1, 0);
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").datepicker('setDate', startDate);
                $("#todate").datepicker('setDate', endDate);
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);
            }
            else if (type == "Last month") {
                var date1 = new Date(date.getFullYear(), date.getMonth() - 1, 1);
                var date2 = new Date(date.getFullYear(), date.getMonth(), 0);
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").datepicker('setDate', startDate);
                $("#todate").datepicker('setDate', endDate);
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);
            }

            GetData2(_id, currency, start, end, GetData);
        }

        var countHTML;
        function GetData(x, cur, startDate, toDate, i) {
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = x;
            dataAdd.start_date = startDate;
            dataAdd.end_date = toDate;
            dataAdd.currency = cur[i];
            var curtxt = cur[i];
            var txtNo = i;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLoseEs",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        if (txtNo == 0) {
                            var dataMenu = data.data.parentList;
                            var htmlMenu = "";
                            for (var i = 0; i < dataMenu.length; i++) {
                                var objMenu = dataMenu[i];
                                if ((dataMenu.length - 1) == i) {
                                    if (i == 0) {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a>";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a>";
                                        }
                                    }
                                    else {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a>";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + curtxt + "\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a>";
                                        }
                                    }
                                }
                                else {
                                    if (i == 0) {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a> / ";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a> / ";
                                        }
                                    }
                                    else {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a> / ";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + curtxt + "\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a> / ";
                                        }
                                    }
                                }
                            }
                            $("#navMenu").append(htmlMenu);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        var dataMenu = data.data.parentList;
                        var htmlData = "";

                        if (data.data.list.length > 0) {
                            if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                                if (localStorage.getItem("Language") == "English") {
                                    htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;">Currency : ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';
                                }
                                else if (localStorage.getItem("Language") == "Thai") {
                                    htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;">สกุลเงิน : ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';
                                }
                                else if (localStorage.getItem("Language") == "Chinese") {
                                    htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;">货币 : ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';
                                }

                                htmlData += '<table class="table table-border" style="margin-bottom: 1rem;"><thead class="rgba-green-slight" style="text-align: center;">';
                                htmlData += "<tr>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; border-radius: initial !important;' set-lan='text:No'></th>";
                                htmlData += "<th rowspan='2' style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Valid turn'></th>";
                                htmlData += "<th rowspan='2' style='width: 9%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Gross Comm'></th>";
                                htmlData += "<th colspan='3' style='vertical-align: middle;' set-lan='text:Company'></th>";
                                htmlData += "</tr>";
                                htmlData += "<tr>";
                                htmlData += "<th style='width: 10%; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 10%; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='border-radius: 0px !important; width: 10%; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                                htmlData += "</tr>";
                                htmlData += '</thead><tbody>';

                                var dataTotal = data.data.list;

                                var arr = data.data.list;
                                var dataTotal = arr.sort(rankingSorter("turnOverAmt"));
                                var no = 1;
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

                                    if (obj._id.position == "MEMBER_NONE_API" || obj._id.position == "MEMBER_API") {
                                        htmlData += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\" ,\"" + curtxt + "\",\"" + startDate + "\", \"" + toDate + "\")' class='link overflowlg ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td><p onclick='GetData2(\"" + obj._id._id + "\" ,[\"" + curtxt + "\"],\"" + startDate + "\", \"" + toDate + "\", GetData)' class='link overflowlg ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (obj.turnOverAmt < 0 || obj.turnOverAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var validAmt = parseFloat(obj.validAmt).toFixed(2);
                                    if (obj.validAmt < 0 || obj.validAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var grossCom = parseFloat(obj.grossCom).toFixed(2);
                                    if (obj.grossCom < 0 || obj.grossCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                                    if (obj.ptTotalBet < 0 || obj.ptTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                                    if (obj.ptPayoutCom < 0 || obj.ptPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                                    if (obj.ptPayoutTotal < 0 || obj.ptPayoutTotal.toString() == "-0.00") {
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

                                htmlData += '</tbody><tfoot class="rgba-yellow-slight">';

                                htmlData += "<tr>";
                                htmlData += "<td></td>";
                                htmlData += "<td set-lan='text:Total'></td>";
                                if (Total_turnOverAmt < 0 || Total_turnOverAmt.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_validAmt < 0 || Total_validAmt.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "<td>" + Total_countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (Total_grossCom < 0 || Total_grossCom.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptTotalBet < 0 || Total_ptTotalBet.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutCom < 0 || Total_ptPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutTotal < 0 || Total_ptPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";
                                htmlData += '</tfoot>';
                                htmlData += '</table>';
                            }
                            else if (dataMenu[0].position.toLowerCase() == "member_none_api" || dataMenu[0].position.toLowerCase() == "member_api") {
                                GetDataTableMember(_id);
                            }
                            else {
                                if (localStorage.getItem("Language") == "English") {
                                    htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;">Currency : ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';
                                }
                                else if (localStorage.getItem("Language") == "Thai") {
                                    htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;">สกุลเงิน : ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';
                                }
                                else if (localStorage.getItem("Language") == "Chinese") {
                                    htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;">货币 : ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';
                                }

                                htmlData += '<table class="table table-border" style="margin-bottom: 1rem;"><thead class="rgba-green-slight" style="text-align: center;">';
                                htmlData += "<tr>";
                                htmlData += "<th rowspan='2' style='width: 2.5%; vertical-align: middle; border-radius: initial !important;' set-lan='text:No'></th>";
                                htmlData += "<th rowspan='2' style='width: 7.5%; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Login name'></th>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Valid turn'></th>";
                                htmlData += "<th rowspan='2' style='width: 4%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Gross Comm'></th>";
                                htmlData += "<th colspan='3' style='width: 18%; vertical-align: middle;' set-lan='text:Member'></th>";
                                htmlData += "<th colspan='3' style='width: 18%; vertical-align: middle;' set-lan='text:Agent'></th>";
                                htmlData += "<th colspan='3' style='width: 18%; vertical-align: middle;' set-lan='text:Company'></th>";
                                htmlData += "</tr>";
                                htmlData += "<tr>";
                                htmlData += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px;' set-lan='text:Total-'>Total</th>";
                                htmlData += "</tr>";
                                htmlData += '</thead><tbody>';

                                var arr = data.data.list;
                                var dataTotal = arr.sort(rankingSorter("turnOverAmt"));
                                var no = 1;
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

                                    if (obj._id.position == "MEMBER_NONE_API" || obj._id.position == "MEMBER_API") {
                                        htmlData += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\" ,\"" + curtxt + "\",\"" + startDate + "\", \"" + toDate + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td><p onclick='GetData2(\"" + obj._id._id + "\" ,[\"" + curtxt + "\"],\"" + startDate + "\", \"" + toDate + "\", GetData)' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (obj.turnOverAmt < 0 || obj.turnOverAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var validAmt = parseFloat(obj.validAmt).toFixed(2);
                                    if (obj.validAmt < 0 || obj.validAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var grossCom = parseFloat(obj.grossCom).toFixed(2);
                                    if (obj.grossCom < 0 || obj.grossCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberTotalBet = parseFloat(obj.memberTotalBet).toFixed(2);
                                    if (obj.memberTotalBet < 0 || obj.memberTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberPayoutCom = parseFloat(obj.memberPayoutCom).toFixed(2);
                                    if (obj.memberPayoutCom < 0 || obj.memberPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberPayoutTotal = parseFloat(obj.memberPayoutTotal).toFixed(2);
                                    if (obj.memberPayoutTotal < 0 || obj.memberPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                                    if (obj.ptTotalBet < 0 || obj.ptTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                                    if (obj.ptPayoutCom < 0 || obj.ptPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                                    if (obj.ptPayoutTotal < 0 || obj.ptPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comTotalBet = parseFloat(obj.comTotalBet).toFixed(2);
                                    if (obj.comTotalBet < 0 || obj.comTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comPayoutCom = parseFloat(obj.comPayoutCom).toFixed(2);
                                    if (obj.comPayoutCom < 0 || obj.comPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright txtRed'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comPayoutTotal = parseFloat(obj.comPayoutTotal).toFixed(2);
                                    if (obj.comPayoutTotal < 0 || obj.comPayoutTotal.toString() == "-0.00") {
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

                                htmlData += '</tbody><tfoot class="rgba-yellow-slight">';
                                htmlData += "<tr>";
                                htmlData += "<td></td>";
                                htmlData += "<td set-lan='text:Total'></td>";
                                if (Total_turnOverAmt < 0 || Total_turnOverAmt.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_validAmt < 0 || Total_validAmt.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "<td>" + Total_countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (Total_grossCom < 0 || Total_grossCom.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_memberTotalBet < 0 || Total_memberTotalBet.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_memberPayoutCom < 0 || Total_memberPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_memberPayoutTotal < 0 || Total_memberPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptTotalBet < 0 || Total_ptTotalBet.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutCom < 0 || Total_ptPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutTotal < 0 || Total_ptPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_comTotalBet < 0 || Total_comTotalBet.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_comPayoutCom < 0 || Total_comPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_comPayoutTotal < 0 || Total_comPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td class='txtRed'>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";

                                htmlData += "</tr>";
                                htmlData += '</tfoot>';
                                htmlData += '</table>';
                            }
                        }

                        $("#tb").append(htmlData);

                        if (countHTML == cur.length) {
                            var container_div = document.getElementById('tb');
                            var count = container_div.getElementsByTagName('div').length;
                            if (count == 0) {
                                $("#tb").append("<table class='table table-border' style='margin-top: 1rem;'><tr><td class='aligncenter' set-lan='text:No data.'></td></tr></table>");
                            }

                            $("#myModalLoad").modal('hide');
                        }


                        SetLan(localStorage.getItem("Language"));
                        $("#tb").css('display', 'initial');
                        $("#tb2").css('display', 'none');
                        countHTML++;
                    }
                    else if (data.code == 71017) {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:Can't load report, because you refresh more than 30 times.");
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
                error: function (xhr, status, error) {
                    document.getElementById('lbAlert').innerHTML = xhr.status + " | " + status;
                    $("#myModalLoad").modal('hide');
                    $('#modalAlert').modal('show');
                }
            });
        }

        function GetData2(var1, var2, startD, toD, callback) {
            countHTML = 1;
            $("#myModalLoad").modal();

            $("#navMenu , #tb , #tb2").html("");
            $("#wrapper").css('display', 'none');

            if (var2.toString() == "Main") {
                var localCur = localStorage.getItem("Currency");
                var currency = localCur.split(",");
                var2 = currency;
            }

            for (var i = 0; i < var2.length; i++) {
                callback(var1, var2, startD, toD, i);
            }
        }

        var NumPage;
        var TotalData;
        var arr = [];
        function GetDataTableMember(val, cur, startDate, toDate) {
            $("#myModalLoad").modal();

            $("#navMenu , #tb , #tb2").html("");
            $("#tb2 , #wrapper").css('display', 'flex');
            $("#tb").css('display', 'none');

            if (NumPage == null) {
                NumPage = 1;
            }

            var dataAdd = new Object();
            dataAdd.self_uuid = localStorage.getItem("_ID");
            dataAdd.under_uuid = val;
            dataAdd.page = NumPage;
            dataAdd.size = 20;
            dataAdd.start_date = startDate;
            dataAdd.end_date = toDate;
            dataAdd.currency = cur;
            $.ajax({
                type: "POST",
                url: apiURL + "/apiRoute/reportRouter/winLoseTransactionEs",
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        TotalData = data.data.total.count;
                        GetNumPage(NumPage, val, cur, startDate, toDate);
                        arr.push(data.data.list);
                    }
                    else if (data.code == 71017) {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:Can't load report, because you refresh more than 30 times.");
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
                error: function (xhr, status, error) {
                    document.getElementById('lbAlert').innerHTML = xhr.status + " | " + status;
                    $("#myModalLoad").modal('hide');
                    $('#modalAlert').modal('show');
                }
            });
        }

        function GetNumPage(NumPage, val, cur, startDate, toDate) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: NumPage,
                        pageSize: 20,
                        dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPage + '/20',
                        locator: 'docs',
                        callback: function (arr, pagination) {
                            NumPage = container.pagination('getSelectedPageNum');
                            GetTable(NumPage, val, cur, startDate, toDate);
                        }
                    });
                })('demo2');
            });
        }

        function GetTable(Num, val, currency, startDate, toDate) {
            $("#navMenu , #tb , #tb2").html("");
            $("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');
            var htmlData = "";
            var totalStake = 0;
            var totalMember = 0;
            var totalMember2 = 0;
            var totalMember3 = 0;
            var countTotal = 0;
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            dataAdd.under_uuid = val;
            dataAdd.page = Num;
            dataAdd.size = 20;
            dataAdd.start_date = startDate;
            dataAdd.end_date = toDate;
            dataAdd.currency = currency;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLoseTransactionEs",
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
                                if (i == 0) {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a>";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a>";
                                    }
                                }
                                else {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a>";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + currency + "\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a>";
                                    }
                                }
                            }
                            else {
                                if (i == 0) {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a> / ";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a> / ";
                                    }
                                }
                                else {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\")'>" + objMenu.username + "</a> / ";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + currency + "\"], \"" + startDate + "\", \"" + toDate + "\", GetData)'>" + objMenu.username + "</a> / ";
                                    }
                                }
                            }
                        }
                        $("#navMenu").append(htmlMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        htmlData += '<table class="table table-border tableMaxWidth" style="table-layout: fixed;"><thead class="rgba-green-slight" style="text-align: center;">';
                        htmlData += "<tr>";
                        htmlData += "<th rowspan='2' style='width: 40px; vertical-align: middle;' set-lan='text:No'></th>";
                        htmlData += "<th rowspan='2' style='width: 150px; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Information'></th>";
                        htmlData += "<th rowspan='2' style='width: 130px; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Event & Details'></th>";
                        htmlData += "<th rowspan='2' style='width: 85px; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Bet Type'></th>";
                        htmlData += "<th rowspan='2' style='width: 100px; vertical-align: middle; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                        htmlData += "<th rowspan='2' style='width: 180px; vertical-align: middle; text-align: left; padding-left: 5px;' set-lan='text:Result'></th>";
                        htmlData += "<th rowspan='2' style='width: 160px; vertical-align: middle; text-align: left; padding-left: 5px;'><div style='display: flex; padding-top: 15px;'><p style='text-align:left; margin-left:-7px' class='col-md-3' set-lan='text:Level'></p><p style='text-align:right; margin-left:10px' class='col-md-9' set-lan='text:PT & Comm'></p></div></th>";
                        htmlData += "<th rowspan='2' style='width: 160px; vertical-align: middle; z-index: 1;' set-lan='text:Credit/Cash'></th>";
                        htmlData += "<th style='vertical-align: middle;' class='theadWin' set-lan='text:Win/Loss & Comm & Total'></th>";
                        htmlData += "</tr>";
                        htmlData += "<tr>";
                        htmlData += "<th style='width: 100px; text-align: right; padding-right: 5px;' set-lan='text:Member'></th>";

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
                                htmlData += "<th style='width: 100px; text-align: right; padding-right: 5px;' set-lan='text:" + txtPositionTH + "'></th>";
                            }
                            else {
                                htmlData += "<th style='width: 100px; text-align: right; padding-right: 5px;'><span set-lan='text:" + txtPositionTH + "'>" + txtPositionTH + "</span> <span>" + positionNoTH + "</span></th>";
                            }
                        }

                        htmlData += "</tr>";
                        htmlData += '<thead><tbody>';

                        var dataTotal = data.data.list;
                        var no = 1;
                        var valBefore = 0;
                        var valAfter = 0;
                        for (var i = 0; i < dataTotal.length; i++) {
                            var obj = dataTotal[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((Num - 1) * 20) + no) + "</td>";
                            var dateLog = new Date(obj.updateDate);
                            var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                            htmlData += "<td><b set-lan='text:User'></b> <b>: " + obj.memberUsername + "</b><br/><b set-lan='text:ID'></b><b> : " + obj.ticketId + "</b><br/>" + txtDate + "<br/><span set-lan='text:IP'></span>&nbsp;:&nbsp;" + obj.ip + "</td>";
                            htmlData += "<td><b set-lan='text:Game ID'></b> <b>: " + obj.gameId + "</b><br/><span set-lan='text:" + obj.type + "'></span><br/><span set-lan='text:" + obj.betPosition + "'></span></td>";
                            if (obj.type == "Baccarat") {
                                htmlData += "<td><span set-lan='text:Original'></span><br/><span set-lan='text:" + obj.type + "'></span></td>";
                            }
                            else {
                                htmlData += "<td set-lan='text:" + obj.type + "'></td>";
                            }

                            var betAmt = parseFloat(obj.betAmt * -1).toFixed(2);
                            var winLose = parseFloat(obj.winLose).toFixed(2);
                            htmlData += "<td class='alignright'>";
                            htmlData += "<p class='bottom0'>" + betAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>" + obj.currency;
                            htmlData += "</td>";
                            if (obj.betStatus == "Lose") {
                                htmlData += "<td><div class='row' style='margin-top: 5px;'><b class='bottom0 col-md-6' style='color: red; margin-bottom: 0px !important;' set-lan='text:" + obj.betStatus + "'></b>";
                                htmlData += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: -5px;' set-lan='html:Play Clip'></i></div>";
                            }
                            else if (obj.betStatus == "Win") {
                                htmlData += "<td><div class='row' style='margin-top: 5px;'><b class='bottom0 col-md-6' style='color: green; margin-bottom: 0px !important;' set-lan='text:" + obj.betStatus + "'></b>";
                                htmlData += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: -5px;' set-lan='html:Play Clip'></i></div>";
                            }
                            else {
                                htmlData += "<td><div class='row' style='margin-top: 5px;'><b class='bottom0 col-md-6' style='color: #007bff; margin-bottom: 0px !important;' set-lan='text:" + obj.betStatus + "'></b>";
                                htmlData += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: -5px;' set-lan='html:Play Clip'></i></div>";
                            }

                            if (obj.type.toLowerCase() == "baccarat" || obj.type.toLowerCase() == "cowcow" || obj.type.toLowerCase() == "super6" || obj.type.toLowerCase() == "4point") {
                                var result = obj.result.rsBc;
                                htmlData += "<div class='row' style='margin-top: 5px;'><p class='bottom0 col-md-6'><span set-lan='text:Player'></span> : " + (result.player123 % 10) + "</p>";
                                htmlData += "<img src='../img/Card/" + result.player_1 + ".png' style='width: 13%; margin-left: -5px;' />";
                                htmlData += "<img src='../img/Card/" + result.player_2 + ".png' style='width: 13%;' />";
                                if (result.player_3 != null && result.player_3 != "") {
                                    htmlData += "<div class='vertical'></div>";
                                    htmlData += "<img src='../img/Card/" + result.player_3 + ".png' style='width: 13%; transform: rotate(-90deg);' />";
                                }
                                htmlData += "</div>";

                                htmlData += "<div class='row' style='margin-top: 5px;'><p class='bottom0 col-md-6'><span set-lan='text:Banker'></span> : " + (result.banker123 % 10) + "</p>";
                                htmlData += "<img src='../img/Card/" + result.banker_1 + ".png' style='width: 13%;margin-left: -5px;' />";
                                htmlData += "<img  src='../img/Card/" + result.banker_2 + ".png' style='width: 13%;' />";
                                if (result.banker_3 != null && result.banker_3 != "") {
                                    htmlData += "<div class='vertical'></div>";
                                    htmlData += "<img src='../img/Card/" + result.banker_3 + ".png' style='width: 13%; transform: rotate(-90deg);' />";
                                }
                                htmlData += "</div>";

                                if (obj.result.winBc != null) {
                                    htmlData += "<div class='row' style='margin-top: 5px;'><p class='col-md-5'><span set-lan='text:Result'></span> : </p><p class='col-md-7'>" + obj.result.winBc + "</p></div>";
                                }
                                else {
                                    htmlData += "<div class='row' style='margin-top: 5px;'><p class='col-md-5'><span set-lan='text:Result'></span> : </p><p class='col-md-7'>-</p></div>";
                                }
                            }

                            if (obj.type.toLowerCase() == "dragontiger") {
                                var result = obj.result.rsDr;
                                htmlData += "<div class='row' style='margin-top: 5px;'><p class='bottom0 col-md-6'><span set-lan='text:Dragon'></span> : " + result.dragon_tt + "</p>";
                                htmlData += "<img src='../img/Card/" + result.dragon + ".png' style='width: 13%; margin-left: -5px;' />";
                                htmlData += "</div>";

                                htmlData += "<div class='row' style='margin-top: 5px;'><p class='bottom0 col-md-6'><span set-lan='text:Tiger'></span> : " + result.tiger_tt + "</p>";
                                htmlData += "<img src='../img/Card/" + result.tiger + ".png' style='width: 13%;margin-left: -5px;' />";
                                htmlData += "</div>";

                                if (obj.result.winDr != null) {
                                    htmlData += "<div class='row' style='margin-top: 5px;'><p class='col-md-5'><span set-lan='text:Result'></span> : </p><p class='col-md-7' set-lan='text:" + capitalizeFirstLetter(obj.result.winDr) + "'></p></div>";
                                }
                                else {
                                    htmlData += "<div class='row' style='margin-top: 5px;'><p class='col-md-5'><span set-lan='text:Result'></span> : </p><p class='col-md-7'>-</p></div>";
                                }
                            }

                            htmlData += "</td>";
                            htmlData += "<td>";
                            htmlData += "<div style='margin-left: 0.9rem'>";

                            var valPT = obj.level;
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
                                if (numOfTrue > 1) {
                                    positionNoTD = parseInt(positionNoTD) + 1;
                                }
                                else if (numOfTrue == 0) {
                                    positionNoTD = 0;
                                }

                                if (numOfTrue == 1) {
                                    htmlData += "<div class='row'><p class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;' set-lan='text:" + txtPositionTD + "'></p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</p></div>";
                                }
                                else {
                                    htmlData += "<div class='row'><p class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;'><span set-lan='text:" + txtPositionTD + "'></span> " + positionNoTD + "</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</p></div>";
                                }
                            }

                            htmlData += "<div class='row'><p class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;' set-lan='text:Member'></p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>100%</p><p class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + obj.commissionRate + "%</p></div>";
                            htmlData += "</div>";
                            htmlData += "</td>";

                            var before = parseFloat(obj.beForCredit).toFixed(2);
                            var after = parseFloat(obj.afterCredit).toFixed(2);

                            var total = parseFloat(obj.winLose + (obj.payOutCom * -1)).toFixed(2);
                            var total2 = parseFloat(obj.payOutCom).toFixed(2);
                            var total3 = parseFloat(obj.winLose).toFixed(2);

                            htmlData += "<td>";
                            if (before < 0 || before.toString() == "-0.00") {
                                htmlData += "<div class='row'><p class='col-md-6 bottom0' set-lan='text:Before'></p><p class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + before.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                            }
                            else {
                                htmlData += "<div class='row'><p class='col-md-6 bottom0' set-lan='text:Before'></p><p class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + before.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                            }

                            if (total3 < 0 || total3.toString() == "-0.00") {
                                htmlData += "<div class='row'><p class='col-md-6 bottom0' set-lan='text:Win/Loss'></p><p class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                            }
                            else {
                                htmlData += "<div class='row'><p class='col-md-6 bottom0' set-lan='text:Win/Loss'></p><p class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                            }

                            if (after < 0 || after.toString() == "-0.00") {
                                htmlData += "<div class='row'><p class='col-md-6 bottom0' set-lan='text:After'></p><p class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + after.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                            }
                            else {
                                htmlData += "<div class='row'><p class='col-md-6 bottom0' set-lan='text:After'></p><p class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + after.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></div>";
                            }
                            htmlData += "</td>";

                            valBefore = parseFloat(valBefore) + parseFloat(obj.beForCredit);
                            valAfter = parseFloat(valAfter) + parseFloat(obj.afterCredit);

                            htmlData += "<td>";
                            if (total < 0 || total.toString() == "-0.00") {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (total2 < 0 || total2.toString() == "-0.00") {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (total3 < 0 || total3.toString() == "-0.00") {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                            }

                            var valShar = obj.shareHolder;
                            countTotal = valShar.length;
                            for (var j = 0; j < valShar.length; j++) {
                                var val = parseFloat(valShar[j].ptPayOutToUnder).toFixed(2);
                                var val2 = parseFloat((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1)).toFixed(2);
                                var val3 = parseFloat(valShar[j].ptPayOutToUnder + ((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1))).toFixed(2);
                                htmlData += "<td class='alignright'>";

                                var count = valShar[j].ptPayOutToUnder;
                                var count2 = (valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1);
                                var count3 = valShar[j].ptPayOutToUnder + ((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1));

                                if (val < 0 || val.toString() == "-0.00") {
                                    htmlData += "<p class='bottom0 alignright txtRed val_" + j + "' attr-val='" + count + "'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                }
                                else {
                                    htmlData += "<p class='bottom0 alignright val_" + j + "' attr-val='" + count + "'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                }
                                if (val2 < 0 || val2.toString() == "-0.00") {
                                    htmlData += "<p class='bottom0 alignright txtRed val2_" + j + "' attr-val='" + count2 + "'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                }
                                else {
                                    htmlData += "<p class='bottom0 alignright val2_" + j + "' attr-val='" + count2 + "'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                }
                                if (val3 < 0 || val3.toString() == "-0.00") {
                                    htmlData += "<p class='bottom0 alignright txtRed val3_" + j + "' attr-val='" + count3 + "'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                }
                                else {
                                    htmlData += "<p class='bottom0 alignright val3_" + j + "' attr-val='" + count3 + "'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                }
                            }

                            htmlData += "</tr>";
                            no++;
                            totalStake = parseFloat(totalStake) + parseFloat(obj.betAmt * -1);
                            totalMember = parseFloat(totalMember) + parseFloat(obj.winLose + (obj.payOutCom * -1));
                            totalMember2 = parseFloat(totalMember2) + parseFloat(obj.payOutCom);
                            totalMember3 = parseFloat(totalMember3) + parseFloat(obj.winLose);
                        }

                        htmlData += '</tbody><tfoot class="rgba-yellow-slight">';

                        htmlData += "<tr>";
                        htmlData += "<td></td>";
                        htmlData += "<td></td>";
                        htmlData += "<td></td>";
                        htmlData += "<td set-lan='text:Total'></td>";
                        totalStake = parseFloat(data.data.total.betAmt).toFixed(2);
                        htmlData += "<td>" + totalStake.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td></td>";
                        htmlData += "<td></td>";

                        var valBefore = parseFloat(data.data.total.beForCredit).toFixed(2);
                        var valWin = parseFloat(data.data.total.winLose).toFixed(2);
                        var valAfter = parseFloat(data.data.total.afterCredit).toFixed(2);

                        htmlData += "<td>";
                        htmlData += "</td>";

                        var arrTotal = data.data.total.shareHolder;
                        for (var z = 0; z < arrTotal.length; z++) {
                            htmlData += "<td>";
                            var num = parseFloat(arrTotal[z].win_loss).toFixed(2);
                            var num2 = parseFloat(arrTotal[z].comm).toFixed(2);
                            var num3 = parseFloat(arrTotal[z].total).toFixed(2);

                            if (num < 0 || num.toString() == "-0.00") {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (num2 < 0 || num2.toString() == "-0.00") {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + num2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + num2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (num3 < 0 || num3.toString() == "-0.00") {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + num3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + num3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            htmlData += "</td>";
                        }

                        htmlData += "</tr></tfoot></table>";

                        $("#tb2").append(htmlData);
                        SetLan(localStorage.getItem("Language"));
                        $("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');

                        var txtWidth = (parseInt(dtHead.length) * 100) + 100;
                        var txtCol = txtWidth / 100;
                        $('.theadWin').css('width', txtWidth);
                        $('.theadWin').attr('colspan', txtCol);

                        $("#myModalLoad").modal('hide');
                    }
                    else if (data.code == 71017) {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:Can't load report, because you refresh more than 30 times.");
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
                error: function (xhr, status, error) {
                    document.getElementById('lbAlert').innerHTML = xhr.status + " | " + status;
                    $("#myModalLoad").modal('hide');
                    $('#modalAlert').modal('show');
                }
            });
        }

        function GetFormattedDate(txtDate) {
            var month = txtDate.split('/')[1];
            var day = txtDate.split('/')[0];
            var year = txtDate.split('/')[2];
            return year + "-" + month + "-" + day;
        }

        function capitalizeFirstLetter(string) {
            string = string.toLowerCase();
            return string.charAt(0).toUpperCase() + string.slice(1);
        }

        function rankingSorter(firstKey, secondKey, thirdKey) {
            return function (a, b) {
                if (a[firstKey] > b[firstKey]) {
                    return -1;
                } else if (a[firstKey] < b[firstKey]) {
                    return 1;
                }
                else {
                    if (a[secondKey] < b[secondKey]) {
                        return 1;
                    } else if (a[secondKey] > b[secondKey]) {
                        return -1;
                    } else {
                        if (a[thirdKey] < b[thirdKey]) {
                            return 1;
                        } else if (a[thirdKey] > b[thirdKey]) {
                            return -1;
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }
    </script>
</asp:Content>
