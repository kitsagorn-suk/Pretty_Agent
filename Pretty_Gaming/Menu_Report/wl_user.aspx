<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wl_user.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.wl_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn-toolbar .select-wrapper {
            max-width: none !important;
        }

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

        .chk[type=checkbox]:checked, .chk[type=checkbox]:not(:checked) {
            position: initial !important;
            opacity: initial !important;
        }

        .checkbox-inline {
            font-size: .8rem;
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
            left: 121px;
            z-index: 9;
        }

        .iconTime {
            position: absolute;
            top: 12px;
            left: 121px;
            z-index: 9;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Report"></a></li>
            <li class="breadcrumb-item active" set-lan="text:W/L User"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-12">
            <h1 set-lan="text:W/L User"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="col-md-12 row">
            <div class="form-group row fieldLogin" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Username_"></label>
                <div style="padding-left: 1rem; padding-right: 1rem;">
                    <input type="text" class="form-control" id="searchUsername">
                </div>
            </div>
            <div class="form-group row fieldLogin filterCom" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Type_"></label>
                <div style="padding-left: 1rem;">
                    <div class="select-outline">
                        <select class="mdb-select" id="ddl_Type">
                            <option value="" disabled>Select Type</option>
                            <option value="Baccarat" set-lan="text:Baccarat"></option>
                            <option value="4Point" set-lan="text:4Point"></option>
                            <option value="Super6" set-lan="text:Super6"></option>
                            <option value="CowCow" set-lan="text:CowCow"></option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group row fieldStart" style="padding-left: 2.5rem;">
                <label for="email" class="col-form-label" set-lan="text:Start date_"></label>
                <div style="padding-left: 1rem;" class="input-wrapper">
                    <i class="far fa-calendar iconCalendar"></i>
                    <input type="date" data-date="" id="startdate" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 130px;" />
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2.5rem;">
                <label for="email" class="col-form-label" set-lan="text:To date_"></label>
                <div style="padding-left: 1rem;" class="input-wrapper">
                    <i class="far fa-calendar iconCalendar"></i>
                    <input type="date" data-date="" id="todate" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 130px;" />
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2.5rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" onclick="btnClickSearch('1');" set-lan="text:Search"></button>
                <%--                <a onclick="btnExport();" id="btnExport" set-lan="title:Export Excel">
                    <img src="../img/excel_logo.png" style="width: 37px; margin-left: 1rem; padding-top: 3px;" /></a><label set-lan="text:ExportNote" style="font-size: 10pt; width: 185px; margin-left: .5rem; line-height: 1rem;"></label>--%>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div id="wrapper" style="float: right; display: none; margin-top: 0rem;">
                <section>
                    <div class="data-container"></div>
                    <div id="pagination-demo2"></div>
                </section>
            </div>
        </div>
    </div>
    <div class="table-wrapper" style="overflow: auto; margin-bottom: 10px; width: 100%;" id="tb">
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
    <script src="../js/pagination.js"></script>
    <script src="../js/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.31/moment-timezone-with-data.js"></script>
    <script>
        var tableNameExport = "";
        var underOldID = "";
        var NumPage = "";
        $(document).ready(function () {
            $("#menuReport , #menuReport > a").addClass("active");
            $("#menuReport > div").css("display", "block");

            $("#tb").append("<table class='table table-border' style='margin-top: 1rem;'><tr><td style='text-align: center;' set-lan='text:No data.'></td></tr></table>");

            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSet);
            $("#todate").val(dateSet);

            $("input[type=date]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")
        });

        var statusLoad = false;
        var NumPage;
        var arrSort = [];
        function btnClickSearch(page) {
            $("#tb").html("");

            statusLoad = false;
            if ($('#myModalLoad').is(':hidden')) {
                $("#myModalLoad").modal();
            }
            var dataAdd = new Object();

            var ddlType = $('#ddl_Type').val();
            dataAdd.username = $('#searchUsername').val();
            dataAdd.type = ddlType;
            dataAdd.page = parseInt(page);
            dataAdd.size = 100;
            dataAdd.start_date = $('#startdate').val();
            dataAdd.end_date = $('#todate').val()
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/gameIdByusernameEs",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        var htmlData = "";
                        if (data.data.list.length > 0) {
                            htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;"><label style="font-weight: bold;" set-lan="text:Username_"></label> ' + $('#searchUsername').val() + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';

                            htmlData += '<section style="margin-top: -2.3rem; float: right;">';
                            htmlData += '<div id="pagination"></div>';
                            htmlData += '</section>';

                            htmlData += '<table class="table table-border" style="margin-bottom: 1rem;"><thead class="rgba-green-slight" style="text-align: center;">';
                            htmlData += "<tr>";
                            htmlData += "<th style='width: 5%; vertical-align: middle; border-radius: initial !important; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:No'></th>";
                            htmlData += "<th style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Game ID'></th>";

                            if (ddlType == "Baccarat" || ddlType == "4Point" || ddlType == "Super6") {
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Banker</th>";
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Player</th>";
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Tie</th>";
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Banker Pair</th>";
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Player Pair</th>";
                                htmlData += "<th style='width: 10%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Banker Natural</th>";
                                htmlData += "<th style='width: 10%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Player Natural</th>";
                                htmlData += "<th style='width: 6%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Big</th>";
                                htmlData += "<th style='width: 6%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Small</th>";

                                if (ddlType == "Super6") {
                                    htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Super6</th>";
                                }
                            }
                            else if (ddlType == "CowCow") {
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Banker</th>";
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Player</th>";
                                htmlData += "<th style='width: 8%; padding-right: 5px; vertical-align: middle; text-align: right; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'>Tie</th>";
                            }

                            htmlData += "</tr>";
                            htmlData += '</thead><tbody>';

                            var no = 1;
                            var arr = data.data.list;
                            for (var j = 0; j < arr.length; j++) {
                                var obj = arr[j];

                                var objBet = obj.betPosition;

                                var bankerChk = objBet.filter(x => x.key === 'banker').length > 0 ? objBet.filter(x => x.key === 'banker')[0].doc_count : '0'
                                var playerChk = objBet.filter(x => x.key === 'player').length > 0 ? objBet.filter(x => x.key === 'player')[0].doc_count : '0'

                                if (parseInt(bankerChk) > 0 && parseInt(playerChk) > 0) {
                                    htmlData += "<tr style='background: #f8e8c3;'>";
                                }
                                else {
                                    htmlData += "<tr>";
                                }

                                htmlData += "<td style='text-align: center;'>" + (((page - 1) * 100) + no) + "</td>";
                                htmlData += "<td><p style='font-weight: bold;margin-bottom: 0;'>" + obj.gameId + "</p></td>";


                                if (ddlType == "Baccarat" || ddlType == "4Point" || ddlType == "Super6") {
                                    var banker = objBet.filter(x => x.key === 'banker').length > 0 ? objBet.filter(x => x.key === 'banker')[0].doc_count : '0'
                                    var player = objBet.filter(x => x.key === 'player').length > 0 ? objBet.filter(x => x.key === 'player')[0].doc_count : '0'
                                    var tie = objBet.filter(x => x.key === 'tie').length > 0 ? objBet.filter(x => x.key === 'tie')[0].doc_count : '0'
                                    var bankerPair = objBet.filter(x => x.key === 'bankerPair').length > 0 ? objBet.filter(x => x.key === 'bankerPair')[0].doc_count : '0'
                                    var playerPair = objBet.filter(x => x.key === 'playerPair').length > 0 ? objBet.filter(x => x.key === 'playerPair')[0].doc_count : '0'
                                    var bankerNatural = objBet.filter(x => x.key === 'bankerNatural').length > 0 ? objBet.filter(x => x.key === 'bankerNatural')[0].doc_count : '0'
                                    var playerNatural = objBet.filter(x => x.key === 'playerNatural').length > 0 ? objBet.filter(x => x.key === 'playerNatural')[0].doc_count : '0'
                                    var big = objBet.filter(x => x.key === 'big').length > 0 ? objBet.filter(x => x.key === 'big')[0].doc_count : '0'
                                    var small = objBet.filter(x => x.key === 'small').length > 0 ? objBet.filter(x => x.key === 'small')[0].doc_count : '0'

                                    htmlData += "<td style='text-align: right;'>" + banker + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + player + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + tie + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + bankerPair + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + playerPair + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + bankerNatural + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + playerNatural + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + big + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + small + "</td>";

                                    if (ddlType == "Super6") {
                                        var super6 = objBet.filter(x => x.key === 'super6').length > 0 ? objBet.filter(x => x.key === 'super6')[0].doc_count : '0'
                                        htmlData += "<td style='text-align: right;'>" + super6 + "</td>";
                                    }
                                }
                                else if (ddlType == "CowCow") {
                                    var banker = objBet.filter(x => x.key === 'banker').length > 0 ? objBet.filter(x => x.key === 'banker')[0].doc_count : '0'
                                    var player = objBet.filter(x => x.key === 'player').length > 0 ? objBet.filter(x => x.key === 'player')[0].doc_count : '0'
                                    var tie = objBet.filter(x => x.key === 'tie').length > 0 ? objBet.filter(x => x.key === 'tie')[0].doc_count : '0'

                                    htmlData += "<td style='text-align: right;'>" + banker + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + player + "</td>";
                                    htmlData += "<td style='text-align: right;'>" + tie + "</td>";
                                }

                                htmlData += "</tr>";
                                no++;
                            }


                            htmlData += "<tfoot class='rgba-yellow-slight'><tr>";
                            htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'></td>";
                            htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;' set-lan='text:Total'></td>";

                            var objBetTotal = data.data.total.betPosition;
                            if (ddlType == "Baccarat" || ddlType == "4Point" || ddlType == "Super6") {
                                var banker = objBetTotal.filter(x => x.key === 'banker').length > 0 ? objBetTotal.filter(x => x.key === 'banker')[0].doc_count : '0'
                                var player = objBetTotal.filter(x => x.key === 'player').length > 0 ? objBetTotal.filter(x => x.key === 'player')[0].doc_count : '0'
                                var tie = objBetTotal.filter(x => x.key === 'tie').length > 0 ? objBetTotal.filter(x => x.key === 'tie')[0].doc_count : '0'
                                var bankerPair = objBetTotal.filter(x => x.key === 'bankerPair').length > 0 ? objBetTotal.filter(x => x.key === 'bankerPair')[0].doc_count : '0'
                                var playerPair = objBetTotal.filter(x => x.key === 'playerPair').length > 0 ? objBetTotal.filter(x => x.key === 'playerPair')[0].doc_count : '0'
                                var bankerNatural = objBetTotal.filter(x => x.key === 'bankerNatural').length > 0 ? objBetTotal.filter(x => x.key === 'bankerNatural')[0].doc_count : '0'
                                var playerNatural = objBetTotal.filter(x => x.key === 'playerNatural').length > 0 ? objBetTotal.filter(x => x.key === 'playerNatural')[0].doc_count : '0'
                                var big = objBetTotal.filter(x => x.key === 'big').length > 0 ? objBetTotal.filter(x => x.key === 'big')[0].doc_count : '0'
                                var small = objBetTotal.filter(x => x.key === 'small').length > 0 ? objBetTotal.filter(x => x.key === 'small')[0].doc_count : '0'

                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + banker + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + player + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + tie + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + bankerPair + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + playerPair + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + bankerNatural + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + playerNatural + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + big + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + small + "</td>";

                                if (ddlType == "Super6") {
                                    var super6 = objBetTotal.filter(x => x.key === 'super6').length > 0 ? objBetTotal.filter(x => x.key === 'super6')[0].doc_count : '0'
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + super6 + "</td>";
                                }
                            }
                            else if (ddlType == "CowCow") {
                                var banker = objBetTotal.filter(x => x.key === 'banker').length > 0 ? objBetTotal.filter(x => x.key === 'banker')[0].doc_count : '0'
                                var player = objBetTotal.filter(x => x.key === 'player').length > 0 ? objBetTotal.filter(x => x.key === 'player')[0].doc_count : '0'
                                var tie = objBetTotal.filter(x => x.key === 'tie').length > 0 ? objBetTotal.filter(x => x.key === 'tie')[0].doc_count : '0'

                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + banker + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + player + "</td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + tie + "</td>";
                            }

                            htmlData += '<caption style="display: none;">&nbsp;</caption>';
                            htmlData += "</tr></tfoot></table>";

                            var totalCount = data.data.total.count;
                            $(function () {
                                var container = $('#pagination');
                                container.pagination({
                                    totalNumber: totalCount,
                                    pageNumber: parseInt(page),
                                    pageSize: 100,
                                    dataSource: apiURL + '/apiRoute/betLimit/list/' + page.toString() + '/100',
                                    locator: 'docs',
                                    afterPageOnClick: function (response, pagination) {
                                        btnClickSearch(pagination);
                                    },

                                    afterNextOnClick: function (response, pagination) {
                                        btnClickSearch(pagination);
                                    },

                                    afterPreviousOnClick: function (response, pagination) {
                                        btnClickSearch(pagination);
                                    },
                                });
                            });
                        }
                        else {
                            $("#tb").append("<table class='table table-border' style='margin-top: 1rem;'><tr><td style='text-align: center;' set-lan='text:No data.'></td></tr></table>");
                        }

                        $("#tb").append(htmlData);

                        $("#myModalLoad").modal('hide');
                        SetLan(localStorage.getItem("Language"));

                        $("select#ddl_Type").find("option[value='Baccarat']").attr("selected", false);
                        $("select#ddl_Type").find("option[value='4Point']").attr("selected", false);
                        $("select#ddl_Type").find("option[value='Super6']").attr("selected", false);
                        $("select#ddl_Type").find("option[value='CowCow']").attr("selected", false);
                        $("select#ddl_Type").find("option[value='" + ddlType + "']").attr("selected", true);

                        $("#tb").css('display', 'block');
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

