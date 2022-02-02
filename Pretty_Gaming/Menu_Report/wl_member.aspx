<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wl_member.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.wl_member" %>

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
            <div class="form-group row fieldLogin" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Login name_"></label>
                <div style="padding-left: 1rem; padding-right: 1rem;">
                    <input type="text" class="form-control" id="searchLoginname">
                </div>
            </div>
            <div class="form-group row fieldLogin filterCom" style="padding-left: 1rem; display: none;">
                <label for="email" class="col-form-label" set-lan="text:User_"></label>
                <div style="padding-left: 1rem;">
                    <div class="select-outline">
                        <select class="mdb-select" searchable="Search here.." id="ddl_Username" data-live-search="true">
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 row">
            <div class="form-group row fieldStart" style="">
                <label for="email" class="col-form-label" set-lan="text:Start date_"></label>
                <div style="padding-left: 1rem;" class="input-wrapper">
                    <i class="far fa-calendar iconCalendar"></i>
                    <input type="date" data-date="" id="startdate" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 130px;" />
                </div>
            </div>
            <div class="form-group row input-wrapper" style="padding-left: 2rem;">
                <i class="far fa-clock iconTime"></i>
                <input type="time" data-date="" class="testDate form-control" id="starttime" data-date-format="hh:mm A" style="width: 120px;">
            </div>
            <div class="form-group row" style="padding-left: 2.5rem;">
                <label for="email" class="col-form-label" set-lan="text:To date_"></label>
                <div style="padding-left: 1rem;" class="input-wrapper">
                    <i class="far fa-calendar iconCalendar"></i>
                    <input type="date" data-date="" id="todate" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 130px;" />
                </div>
            </div>
            <div class="form-group row input-wrapper" style="padding-left: 2rem;">
                <i class="far fa-clock iconTime"></i>
                <input type="time" data-date="" class="testDate form-control" id="totime" data-date-format="hh:mm A" style="width: 120px;">
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" onclick="btnClickSearch();" set-lan="text:Search"></button>
                <%--<button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" onclick="btnExport();" set-lan="text:Export Excel" style="margin-left: 0.5rem !important;" id="btnExport"></button>--%>
                <a onclick="btnExport();" id="btnExport" set-lan="title:Export Excel">
                    <img src="../img/excel_logo.png" style="width: 37px; margin-left: .5rem; padding-top: 3px;" /></a><label set-lan="text:ExportNote" style="font-size: 10pt; width: 185px; margin-left: .5rem; line-height: 1rem;"></label>
            </div>
        </div>
        <div class="col-md-12 row" style="margin-top: -5px;">
            <div class="form-group row fieldBet" style="">
                <label for="email" class="col-form-label" set-lan="text:Bet Type_"></label>
                <div style="padding-top: .5rem; margin-left: 1rem;">
                    <label class="checkbox-inline">
                        <input type="checkbox" value="" class="chk chkall" onclick="chkAll(this);"><label set-lan="text:All" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="Baccarat" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Original Baccarat" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="4Point" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Bacarrat 4 Point" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="Super6" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Super6 Baccarat" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="CowCow" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Cow Cow" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="DragonTiger" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Dragon Tiger" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="Roulette" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Roulete" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="SicBo" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Sicbo" style="margin-left: .3rem;"></label></label>
                    <label class="checkbox-inline" style="margin-left: 1rem;">
                        <input type="checkbox" value="Tips" class="chk" name="chkBet" onclick="clickBet(this);"><label set-lan="text:Tips" style="margin-left: .3rem;"></label></label>
                </div>
            </div>
        </div>
    </div>
    <div class="btn-toolbar mb-3" role="toolbar" style="margin-top: 1rem;">
        <div class="btn-group mr-auto">
            <div class="btn-group btn-group-green mr-3" data-toggle="buttons">
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTimePN('Previous');">
                    <input class="form-check-input" type="radio" name="options" id="option1" autocomplete="off" checked>
                    <span set-lan="text:Previous"></span>
                </label>
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
                <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTimePN('Next');">
                    <input class="form-check-input" type="radio" name="options" id="option8" autocomplete="off" checked>
                    <span set-lan="text:Next"></span>
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
    <div class="table-wrapper" style="overflow: auto; margin-bottom: 10px; width: 100%; display: none;" id="tb">
    </div>
    <div style="margin-top: -10px; margin-bottom: 10px; width: 100%; overflow: auto; display: none;" id="tb2">
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
    <script src="../js/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.31/moment-timezone-with-data.js"></script>
    <script>
        var ddl_userId = "";
        var typeTime = "Day";
        var tableNameExport = "";
        var underOldID = "";
        $(document).ready(function () {
            var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
            var element = document.getElementById('text');
            if (isMobile) {
                $("#tb2").css("height", "auto");
            } else {
                $("#tb2").css("height", "40em");
            }

            $('input.chk').prop('checked', true);

            $("#menuReport , #menuReport > a").addClass("active");
            $("#menuReport > div").css("display", "block");

            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSet);
            $("#todate").val(dateSet);
            var start = dateSet;
            var end = dateSet;

            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");

            $('#starttime').val('00:00');
            $('#totime').val('23:59');

            var starttime = "00:00";
            var endtime = "23:59";

            GetData2(_id, currency, start, end, starttime, endtime, GetData, "", "", localStorage.getItem("Position"));

            $("input[type=date]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")

            $("input[type=time]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "hh:mm A")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")

            $("#ddl_Username").change(function () {
                if ($("#navMenu a").length > 1) {
                    btnSearch("changeDDL");
                    ddl_userId = $("#ddl_Username").val();
                }
                else {
                    ddl_userId = $("#ddl_Username").val();
                    btnSearch("");
                }
            });
        });

        function btnClickSearch() {
            if ($("#navMenu a").length > 1) {
                btnSearch("changeDDL");
                ddl_userId = $("#ddl_Username").val();
            }
            else {
                ddl_userId = $("#ddl_Username").val();
                btnSearch("");
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
                    txtTemp = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{{=worksheet}}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table><tr><td colspan="10" style="font-weight: bold; text-align: center;">Report W/L Member : ' + arrBet + '</td></tr><tr><td colspan="10" style="font-weight: bold; text-align: center;">Start date : ' + startDate + '&emsp;To date : ' + toDate + '</td></tr><tr><td colspan="10" style="font-weight: bold; text-align: center;">Bet Type : ' + betType + '</td></tr></table>{{for(var i=0; i<tables.length;i++){ }}<table>{{=tables[i]}}</table>{{ } }}</body></html>';
                }
                else {
                    txtTemp = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{{=worksheet}}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table><tr><td colspan="16" style="font-weight: bold; text-align: center;">Report W/L Member : ' + arrBet + '</td></tr><tr><td colspan="16" style="font-weight: bold; text-align: center;">Start date : ' + startDate + '&emsp;To date : ' + toDate + '</td></tr><tr><td colspan="16" style="font-weight: bold; text-align: center;">Bet Type : ' + betType + '</td></tr></table>{{for(var i=0; i<tables.length;i++){ }}<table>{{=tables[i]}}</table>{{ } }}</body></html>';
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
                            tables.push(tableList[i].innerHTML.replace(/<img[^>]*>/gi, "").replace(/<td><\/td>/g, "").replace(/<tr><\/tr>/g, "").replace(/Play Clip/g, "").replace(/เล่นวิดีโอ/g, "").replace(/播放视频/g, ""));
                        }
                        var ctx = {
                            worksheet: name || 'Worksheet',
                            tables: tables
                        };
                        var a = document.createElement('a');
                        a.href = uri + base64(tmpl(template, ctx));
                        a.download = 'Report_WL_Member_' + dateSet + '.xls';
                        a.click();
                    };
                })();
                tableToExcel(document.getElementsByTagName("table"), "W/L Member");
            }
        }

        function chkAll(ele) {
            if (ele.checked) {
                $('input.chk[value="Baccarat"], input.chk[value="4Point"], input.chk[value="Super6"], input.chk[value="CowCow"], input.chk[value="DragonTiger"], input.chk[value="Roulette"], input.chk[value="SicBo"], input.chk[value="Tips"]').prop('checked', true);
            } else {
                $('input.chk[value="Baccarat"], input.chk[value="4Point"], input.chk[value="Super6"], input.chk[value="CowCow"], input.chk[value="DragonTiger"], input.chk[value="Roulette"], input.chk[value="SicBo"], input.chk[value="Tips"]').prop('checked', false);
            }
        }

        function clickBet(ele) {
            if (!ele.checked) {
                $('input.chkall').prop('checked', false);
            }
            else {
                var arrBet = [];
                $.each($("input[name='chkBet']:checked"), function () {
                    arrBet.push($(this).val());
                });

                if (arrBet.length == 8) {
                    $('input.chkall').prop('checked', true);
                }
            }
        }

        function btnSearch(event) {
            if ($("#ddl_Username").val() == "") {
                ddl_userId = "";
            }

            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");
            if ($("#searchLoginname").val() == "") {
                GetData2(_id, currency, $('#startdate').val(), $('#todate').val(), $('#starttime').val(), $('#totime').val(), GetData, "", event, localStorage.getItem("Position"));
            }
            else {
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
                            if (data.data.position.toLowerCase() != "member_none_api" && data.data.position.toLowerCase() != "member_api") {
                                GetData2(data.data._id, currency, $('#startdate').val(), $('#todate').val(), $('#starttime').val(), $('#totime').val(), GetData, "", event, localStorage.getItem("Position"));
                            }
                            else {
                                GetDataTableMember(data.data._id, data.data.currency.toString(), $('#startdate').val(), $('#todate').val(), $('#starttime').val(), $('#totime').val());
                            }
                        }
                        else if (data.code == 998) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Login name not found.");
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
        }

        function btnTime(type) {
            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");
            var start = "";
            var end = "";
            var starttime = "";
            var endtime = "";
            var date = new Date();

            if (type == "Today") {
                date = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
                $("#startdate").val(date);
                $("#todate").val(date);
                start = date;
                end = date;
                typeTime = "Day";
            }
            else if (type == "Yesterday") {
                var todayTimeStamp = +new Date;
                var oneDayTimeStamp = 1000 * 60 * 60 * 24;
                var diff = todayTimeStamp - oneDayTimeStamp;
                var yesterdayDate = new Date(diff);
                var yesterdayString = yesterdayDate.getFullYear() + "-" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "-" + ("0" + yesterdayDate.getDate()).slice(-2);
                $("#startdate").val(yesterdayString);
                $("#todate").val(yesterdayString);
                start = yesterdayString;
                end = yesterdayString;
                typeTime = "Day";
            }
            else if (type == "This week") {
                var firstday = date.getDate() - date.getDay();
                var lastday = firstday + 6;
                var date1 = new Date(date.setDate(firstday));
                var date2 = new Date(date.setDate(lastday));
                var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);
                var endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                $("#startdate").val(startDate);
                $("#todate").val(endDate);
                start = startDate;
                end = endDate;
                typeTime = "Week";
            }
            else if (type == "Last week") {
                var firstday = (date.getDate() - date.getDay()) - 7;
                var lastday = firstday + 6;
                var date1 = new Date(date.setDate(firstday));
                var date2 = new Date(date.setDate(lastday));
                var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);
                var endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                $("#startdate").val(startDate);
                $("#todate").val(endDate);
                start = startDate;
                end = endDate;
                typeTime = "Week";
            }
            else if (type == "This month") {
                var date1 = new Date(date.getFullYear(), date.getMonth(), 1);
                var date2 = new Date(date.getFullYear(), date.getMonth() + 1, 0);
                var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);
                var endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);;
                $("#startdate").val(startDate);
                $("#todate").val(endDate);
                start = startDate;
                end = endDate;
                typeTime = "Month";
            }
            else if (type == "Last month") {
                var date1 = new Date(date.getFullYear(), date.getMonth() - 1, 1);
                var date2 = new Date(date.getFullYear(), date.getMonth(), 0);
                var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);
                var endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                $("#startdate").val(startDate);
                $("#todate").val(endDate);
                start = startDate;
                end = endDate;
                typeTime = "Month";
            }

            $("input[type=date]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")

            starttime = "00:00";
            endtime = "23:59";

            GetData2(_id, currency, start, end, starttime, endtime, GetData, "", "", localStorage.getItem("Position"));
        }

        function btnTimePN(type) {
            var localCur = localStorage.getItem("Currency");
            var currency = localCur.split(",");
            var _id = localStorage.getItem("_ID");
            var startVal = new Date($('#startdate').val());
            var toVal = new Date($('#todate').val());
            var start = "";
            var end = "";
            var starttime = "";
            var endtime = "";

            if (typeTime == "Day") {
                if (type == "Previous") {
                    var todayTimeStamp = startVal;
                    var oneDayTimeStamp = 1000 * 60 * 60 * 24;
                    var diff = todayTimeStamp - oneDayTimeStamp;
                    var yesterdayDate = new Date(diff);
                    var yesterdayString = yesterdayDate.getFullYear() + "-" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "-" + ("0" + yesterdayDate.getDate()).slice(-2);
                    $("#startdate").val(yesterdayString);
                    $("#todate").val(yesterdayString);
                    start = yesterdayString;
                    end = yesterdayString;
                }
                else if (type == "Next") {
                    var Val = new Date(startVal.setDate(startVal.getDate() + 1));
                    var tomorrowString = Val.getFullYear() + "-" + ("0" + (Val.getMonth() + 1)).slice(-2) + "-" + ("0" + Val.getDate()).slice(-2);
                    $("#startdate").val(tomorrowString);
                    $("#todate").val(tomorrowString);
                    start = tomorrowString;
                    end = tomorrowString;
                }
            }
            else if (typeTime == "Week") {
                if (type == "Previous") {
                    var firstday = (startVal.getDate() - startVal.getDay()) - 7;
                    var lastday = firstday + 6;
                    var date1 = new Date(startVal.setDate(firstday));
                    var date2 = new Date(startVal.setDate(lastday));
                    var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);
                    var endDate;
                    if (date1.getDate() > date2.getDate()) {
                        endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 2)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                    }
                    else {
                        endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                    }
                    $("#startdate").val(startDate);
                    $("#todate").val(endDate);
                    start = startDate;
                    end = endDate;
                }
                else if (type == "Next") {
                    var firstday = (startVal.getDate() - startVal.getDay()) + 7;
                    var date1 = new Date(startVal.setDate(firstday));
                    var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);
                    var date2 = new Date(date1.setTime(date1.getTime() + (6 * 24 * 60 * 60 * 1000)));
                    var endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                    $("#startdate").val(startDate);
                    $("#todate").val(endDate);
                    start = startDate;
                    end = endDate;
                }
            }
            else if (typeTime == "Month") {
                if (type == "Previous") {
                    var current = new Date(startVal.getFullYear(), startVal.getMonth() - 1, 1);
                    var tomorrowString = current.getFullYear() + "-" + ("0" + (current.getMonth() + 1)).slice(-2) + "-" + ("0" + current.getDate()).slice(-2);
                    $("#startdate").val(tomorrowString);
                    var current2 = new Date(startVal.getFullYear(), startVal.getMonth(), 0);
                    var tomorrowString2 = current2.getFullYear() + "-" + ("0" + (current2.getMonth() + 1)).slice(-2) + "-" + ("0" + current2.getDate()).slice(-2);
                    $("#todate").val(tomorrowString2);
                    start = tomorrowString;
                    end = tomorrowString2;
                }
                else if (type == "Next") {
                    var current = new Date(startVal.getFullYear(), startVal.getMonth() + 1, 1);
                    var tomorrowString = current.getFullYear() + "-" + ("0" + (current.getMonth() + 1)).slice(-2) + "-" + ("0" + current.getDate()).slice(-2);
                    $("#startdate").val(tomorrowString);
                    var current2 = new Date(startVal.getFullYear(), startVal.getMonth() + 2, 0);
                    var tomorrowString2 = current2.getFullYear() + "-" + ("0" + (current2.getMonth() + 1)).slice(-2) + "-" + ("0" + current2.getDate()).slice(-2);
                    $("#todate").val(tomorrowString2);
                    start = tomorrowString;
                    end = tomorrowString2;
                }
            }

            $("input[type=date]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")

            starttime = "00:00";
            endtime = "23:59";

            GetData2(_id, currency, start, end, starttime, endtime, GetData, "", "", localStorage.getItem("Position"));
        }

        var statusLoad = false;
        var countHTML;
        var NumPage;
        var htmlSort = [];
        var arrSort = [];
        function GetData(x, cur, startDate, toDate, startTime, toTime, i, event) {
            var under_id = "";
            var navArrLast = "";
            htmlSort = [];
            $('#btnExport').css('display', 'initial');

            statusLoad = false;
            if ($('#myModalLoad').is(':hidden')) {
                $("#myModalLoad").modal();
            }
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = _id;
            if (event == "changeDDL") {
                dataAdd.under_uuid = underOldID;
                dataAdd.user_id = ddl_userId;
                under_id = underOldID;
            }
            else {
                dataAdd.under_uuid = x;
                dataAdd.user_id = ddl_userId;
                underOldID = x;
                under_id = x;
            }
            dataAdd.start_date = startDate;
            dataAdd.end_date = toDate;
            dataAdd.start_time = startTime;
            dataAdd.end_time = toTime;
            var arrBet = [];
            $.each($("input[name='chkBet']:checked"), function () {
                arrBet.push($(this).val());
            });
            dataAdd.type = arrBet;
            dataAdd.currency = cur[i];
            dataAdd.page = 1;
            dataAdd.size = 100;
            var curtxt = cur[i];
            var txtNo = i;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLoseEs2",
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
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a>";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a>";
                                        }
                                    }
                                    else {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a>";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + curtxt + "\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a>";
                                        }
                                    }
                                }
                                else {
                                    if (i == 0) {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a> / ";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a> / ";
                                        }
                                    }
                                    else {
                                        if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                            htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + curtxt + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a> / ";
                                        }
                                        else {
                                            htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + curtxt + "\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a> / ";
                                        }
                                    }
                                }
                            }
                            $("#navMenu").append(htmlMenu);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");

                            //if ($("#navMenu a").length > 1) {
                            //    $(".filterCom").css("display", "none");
                            //}
                            //else {
                            //    $(".filterCom").css("display", "flex");
                            //}
                        }

                        var dataMenu = data.data.parentList;
                        var htmlData = "";

                        var dataMenu = data.data.parentList;
                        navArrLast = dataMenu[dataMenu.length - 1].position;
                        if (data.data.list.length > 0) {
                            if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                                NumPage = 1;
                                var TotalData = data.data.total.count;
                                var txtHeadExcel = "";

                                if (localStorage.getItem("Language") == "English") {
                                    txtHeadExcel = 'Currency : ' + curtxt;
                                }
                                else if (localStorage.getItem("Language") == "Thai") {
                                    txtHeadExcel = 'สกุลเงิน : ' + curtxt;
                                }
                                else if (localStorage.getItem("Language") == "Chinese") {
                                    txtHeadExcel = '货币 : ' + curtxt;
                                }

                                htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;"><label style="font-weight: bold;" set-lan="text:Currency_"></label> ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';

                                htmlData += '<section style="margin-top: -2.3rem; float: right;">';
                                htmlData += '<div class="data-container"></div>';
                                htmlData += '<div id="pagination-' + curtxt + '"></div>';
                                htmlData += '</section>';

                                htmlData += '<table class="table table-border" id="tb' + curtxt + '" style="margin-bottom: 1rem;"><thead class="rgba-green-slight" style="text-align: center;">';
                                htmlData += "<tr>";
                                htmlData += "<th colspan='10' style='display:none; vertical-align: middle; background-color: #CFA137; color: #fff; border: 1px #ced4da solid;'>" + txtHeadExcel + "</th>";
                                htmlData += "</tr>";
                                htmlData += "<tr>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; border-radius: initial !important; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:No'></th>";
                                htmlData += "<th rowspan='2' style='width: 15%; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Login name'></th>";
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Turnover'></th>";
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Valid turn'></th>";
                                htmlData += "<th rowspan='2' style='width: 9%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:No.Ticket'></th>";
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Gross Comm'></th>";
                                var house = -(parseFloat(data.data.total.winLose / parseFloat(data.data.total.validAmt)) * 100);
                                house = parseFloat(house).toFixed(2);
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'><label style='margin-bottom: 0rem;' set-lan='text:Member W/L'></label><br/><label>&nbsp;(100%)</label><br/><label style='margin-bottom: 0rem;' set-lan='text:House Edge'></label><br/>";
                                if (house < 0) {
                                    htmlData += "<label style='color: red !important;'>&nbsp;(" + house + "%)</label></th>";
                                }
                                else {
                                    htmlData += "<label>&nbsp;(" + house + "%)</label></th>";
                                }
                                htmlData += "<th rowspan='2' style='width: 9%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Tips'></th>";
                                htmlData += "<th colspan='3' style='vertical-align: middle; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Company'></th>";
                                htmlData += "</tr>";
                                htmlData += "<tr>";
                                htmlData += "<th style='width: 10%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 10%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='border-radius: 0px !important; width: 10%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Total-'></th>";
                                htmlData += "</tr>";
                                htmlData += '</thead><tbody>';

                                var dataTotal = data.data.list;

                                var arr = data.data.list;
                                var dataTotal = arr.sort(rankingSorter("turnOverAmt"));
                                var no = 1;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlData += "<tr>";
                                    htmlData += "<td style='text-align: center;'>" + no + "</td>";

                                    if (obj._id.position == "MEMBER_NONE_API" || obj._id.position == "MEMBER_API") {
                                        htmlData += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\" ,\"" + curtxt + "\",\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")' class='link overflowlg ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td><p onclick='GetData2(\"" + obj._id._id + "\" ,[\"" + curtxt + "\"],\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + obj._id.position + "\")' class='link overflowlg ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (obj.turnOverAmt < 0 || obj.turnOverAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var validAmt = parseFloat(obj.validAmt).toFixed(2);
                                    if (obj.validAmt < 0 || obj.validAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var grossCom = parseFloat(obj.grossCom).toFixed(2);
                                    if (obj.grossCom < 0 || obj.grossCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLose = parseFloat(obj.winLose).toFixed(2);
                                    if (obj.winLose < 0 || obj.winLose.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLoseTips = parseFloat(obj.winLoseTips).toFixed(2);
                                    if (obj.winLoseTips < 0 || obj.winLoseTips.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                                    if (obj.ptTotalBet < 0 || obj.ptTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                                    if (obj.ptPayoutCom < 0 || obj.ptPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                                    if (obj.ptPayoutTotal < 0 || obj.ptPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "</tr>";
                                    no++;
                                }

                                var Total_turnOverAmt = parseFloat(data.data.total.turnOverAmt).toFixed(2);
                                var Total_validAmt = parseFloat(data.data.total.validAmt).toFixed(2);
                                var Total_grossCom = parseFloat(data.data.total.grossCom).toFixed(2);
                                var Total_winLose = parseFloat(data.data.total.winLose).toFixed(2);
                                var Total_winLoseTips = parseFloat(data.data.total.winLoseTips).toFixed(2);
                                var Total_ptTotalBet = parseFloat(data.data.total.ptTotalBet).toFixed(2);
                                var Total_ptPayoutCom = parseFloat(data.data.total.ptPayoutCom).toFixed(2);
                                var Total_ptPayoutTotal = parseFloat(data.data.total.ptPayoutTotal).toFixed(2);

                                htmlData += '</tbody><tfoot class="rgba-yellow-slight">';

                                htmlData += "<tr>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'></td>";
                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;' set-lan='text:Total'></td>";
                                if (Total_turnOverAmt < 0 || Total_turnOverAmt.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_validAmt < 0 || Total_validAmt.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + data.data.total.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (Total_grossCom < 0 || Total_grossCom.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_winLose < 0 || Total_winLose.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_winLoseTips < 0 || Total_winLoseTips.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptTotalBet < 0 || Total_ptTotalBet.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutCom < 0 || Total_ptPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutTotal < 0 || Total_ptPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; color: red;'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be;'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";
                                htmlData += '<caption style="display: none;">&nbsp;</caption>';
                                htmlData += '</tfoot>';
                                htmlData += '</table>';

                                htmlSort.push(htmlData);
                                arrSort.push(data.data.total.turnOverAmt);

                                $(function () {
                                    (function (name, mainID, underID, usersearh) {
                                        var container = $('#pagination-' + name);
                                        container.pagination({
                                            totalNumber: TotalData,
                                            pageNumber: NumPage,
                                            pageSize: 100,
                                            dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPage + '/100',
                                            locator: 'docs',
                                            beforePageOnClick: function (response, pagination) {
                                                NumPage = pagination;
                                            },
                                            afterPageOnClick: function (response, pagination) {
                                                GetData_(NumPage, name, mainID, underID, usersearh);
                                            },

                                            beforeNextOnClick: function (response, pagination) {
                                                NumPage = pagination;
                                            },
                                            afterNextOnClick: function (response, pagination) {
                                                GetData_(NumPage, name, mainID, underID, usersearh);
                                            },

                                            beforePreviousOnClick: function (response, pagination) {
                                                NumPage = pagination;
                                            },
                                            afterPreviousOnClick: function (response, pagination) {
                                                GetData_(NumPage, name, mainID, underID, usersearh);
                                            },
                                        });
                                    })(curtxt, _id, under_id, ddl_userId);
                                });
                            }
                            else if (dataMenu[0].position.toLowerCase() == "member_none_api" || dataMenu[0].position.toLowerCase() == "member_api") {
                                GetDataTableMember(_id);
                            }
                            else {
                                NumPage = 1;
                                var TotalData = data.data.total.count;
                                var txtHeadExcel = "";

                                if (localStorage.getItem("Language") == "English") {
                                    txtHeadExcel = 'Currency : ' + curtxt;
                                }
                                else if (localStorage.getItem("Language") == "Thai") {
                                    txtHeadExcel = 'สกุลเงิน : ' + curtxt;
                                }
                                else if (localStorage.getItem("Language") == "Chinese") {
                                    txtHeadExcel = '货币 : ' + curtxt;
                                }

                                var arr = data.data.list;
                                var dataTotal = arr.sort(rankingSorter("turnOverAmt"));

                                htmlData += '<div style="display: flex;"><div class="navCur" style="margin-top: 1rem;"><label style="font-weight: bold;" set-lan="text:Currency_"></label> ' + curtxt + '</div><div style="border-bottom: 33.5px solid #CFA137; border-right: 50px solid transparent;"></div></div>';

                                htmlData += '<section style="margin-top: -2.3rem; float: right;">';
                                htmlData += '<div class="data-container"></div>';
                                htmlData += '<div id="pagination-' + curtxt + '"></div>';
                                htmlData += '</section>';

                                htmlData += '<table class="table table-border" id="tb2' + curtxt + '" style="margin-bottom: 1rem;"><thead class="rgba-green-slight" style="text-align: center;">';
                                htmlData += "<tr>";
                                htmlData += "<th colspan='16' style='display:none; vertical-align: middle; background-color: #CFA137; color: #fff; border: 1px #ced4da solid;'>" + txtHeadExcel + "</th>";
                                htmlData += "</tr>";
                                htmlData += "<tr>";
                                htmlData += "<th rowspan='2' style='width: 2.5%; vertical-align: middle; border-radius: initial !important; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:No'></th>";
                                htmlData += "<th rowspan='2' style='width: 7.5%; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Login name'></th>";
                                if (dataTotal[0]._id.position != "MEMBER_NONE_API" && dataTotal[0]._id.position != "MEMBER_API") {
                                    htmlData += "<th rowspan='2' style='width: 4%; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Level'></th>";
                                }

                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Turnover'></th>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Valid turn'></th>";
                                htmlData += "<th rowspan='2' style='width: 4%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:No.Ticket'></th>";
                                htmlData += "<th rowspan='2' style='width: 6%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Gross Comm'></th>";
                                var house = -(parseFloat(data.data.total.winLose / parseFloat(data.data.total.validAmt)) * 100);
                                house = parseFloat(house).toFixed(2);
                                htmlData += "<th rowspan='2' style='width: 10%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'><label style='margin-bottom: 0rem;' set-lan='text:Member W/L'></label><br/><label>&nbsp;(100%)</label><br/><label style='margin-bottom: 0rem;' set-lan='text:House Edge'></label><br/>";
                                if (house < 0) {
                                    htmlData += "<label style='color: red !important;'>&nbsp;(" + house + "%)</label></th>";
                                }
                                else {
                                    htmlData += "<label>&nbsp;(" + house + "%)</label></th>";
                                }
                                htmlData += "<th rowspan='2' style='width: 9%; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Tips'></th>";
                                htmlData += "<th colspan='3' style='width: 18%; vertical-align: middle; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Member'></th>";
                                htmlData += "<th colspan='3' style='width: 18%; vertical-align: middle; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Agent'></th>";
                                htmlData += "<th colspan='3' style='width: 18%; vertical-align: middle; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Company'></th>";
                                htmlData += "</tr>";
                                htmlData += "<tr>";
                                htmlData += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Total-'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Total-'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Win lose'></th>";
                                htmlData += "<th style='width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Comm'></th>";
                                htmlData += "<th style='border-radius: 0px !important; width: 6%; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Total-'>Total</th>";
                                htmlData += "</tr>";
                                htmlData += '</thead><tbody>';

                                
                                var no = 1;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlData += "<tr>";
                                    htmlData += "<td style='text-align: center;'>" + no + "</td>";

                                    if (obj._id.position == "MEMBER_NONE_API" || obj._id.position == "MEMBER_API") {
                                        htmlData += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\" ,\"" + curtxt + "\",\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td><p onclick='GetData2(\"" + obj._id._id + "\" ,[\"" + curtxt + "\"],\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + obj._id.position + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var position = "";
                                    if (obj._id.position != null && obj._id.position != "") {
                                        if (obj._id.position.toLowerCase() == "agent_none_api") {
                                            position = "Agent";
                                        }
                                        else if (obj._id.position.toLowerCase() == "agent_api") {
                                            position = "API";
                                        }
                                    }

                                    if (dataTotal[0]._id.position != "MEMBER_NONE_API" && dataTotal[0]._id.position != "MEMBER_API") {
                                        htmlData += "<td style='text-align: center;'>" + position + "</td>";
                                    }

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (obj.turnOverAmt < 0 || obj.turnOverAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var validAmt = parseFloat(obj.validAmt).toFixed(2);
                                    if (obj.validAmt < 0 || obj.validAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var grossCom = parseFloat(obj.grossCom).toFixed(2);
                                    if (obj.grossCom < 0 || obj.grossCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLose = parseFloat(obj.winLose).toFixed(2);
                                    if (obj.winLose < 0 || obj.winLose.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLoseTips = parseFloat(obj.winLoseTips).toFixed(2);
                                    if (obj.winLoseTips < 0 || obj.winLoseTips.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberTotalBet = parseFloat(obj.memberTotalBet).toFixed(2);
                                    if (obj.memberTotalBet < 0 || obj.memberTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberPayoutCom = parseFloat(obj.memberPayoutCom).toFixed(2);
                                    if (obj.memberPayoutCom < 0 || obj.memberPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberPayoutTotal = parseFloat(obj.memberPayoutTotal).toFixed(2);
                                    if (obj.memberPayoutTotal < 0 || obj.memberPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                                    if (obj.ptTotalBet < 0 || obj.ptTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                                    if (obj.ptPayoutCom < 0 || obj.ptPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                                    if (obj.ptPayoutTotal < 0 || obj.ptPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comTotalBet = parseFloat(obj.comTotalBet).toFixed(2);
                                    if (obj.comTotalBet < 0 || obj.comTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; border: 1px #ced4da solid;'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #ffd06373; border: 1px #ced4da solid;'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comPayoutCom = parseFloat(obj.comPayoutCom).toFixed(2);
                                    if (obj.comPayoutCom < 0 || obj.comPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comPayoutTotal = parseFloat(obj.comPayoutTotal).toFixed(2);
                                    if (obj.comPayoutTotal < 0 || obj.comPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    htmlData += "</tr>";
                                    no++;
                                }

                                var Total_turnOverAmt = parseFloat(data.data.total.turnOverAmt).toFixed(2);
                                var Total_validAmt = parseFloat(data.data.total.validAmt).toFixed(2);
                                var Total_grossCom = parseFloat(data.data.total.grossCom).toFixed(2);
                                var Total_winLose = parseFloat(data.data.total.winLose).toFixed(2);
                                var Total_winLoseTips = parseFloat(data.data.total.winLoseTips).toFixed(2);
                                var Total_memberTotalBet = parseFloat(data.data.total.memberTotalBet).toFixed(2);
                                var Total_memberPayoutCom = parseFloat(data.data.total.memberPayoutCom).toFixed(2);
                                var Total_memberPayoutTotal = parseFloat(data.data.total.memberPayoutTotal).toFixed(2);
                                var Total_ptTotalBet = parseFloat(data.data.total.ptTotalBet).toFixed(2);
                                var Total_ptPayoutCom = parseFloat(data.data.total.ptPayoutCom).toFixed(2);
                                var Total_ptPayoutTotal = parseFloat(data.data.total.ptPayoutTotal).toFixed(2);
                                var Total_comTotalBet = parseFloat(data.data.total.comTotalBet).toFixed(2);
                                var Total_comPayoutCom = parseFloat(data.data.total.comPayoutCom).toFixed(2);
                                var Total_comPayoutTotal = parseFloat(data.data.total.comPayoutTotal).toFixed(2);

                                htmlData += '</tbody><tfoot class="rgba-yellow-slight">';
                                htmlData += "<tr>";
                                if (dataTotal[0]._id.position != "MEMBER_NONE_API" && dataTotal[0]._id.position != "MEMBER_API") {
                                    htmlData += "<td colspan='3' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;' set-lan='text:Total'></td>";
                                }
                                else {
                                    htmlData += "<td colspan='2' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;' set-lan='text:Total'></td>";
                                }

                                if (Total_turnOverAmt < 0 || Total_turnOverAmt.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_validAmt < 0 || Total_validAmt.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + data.data.total.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (Total_grossCom < 0 || Total_grossCom.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_winLose < 0 || Total_winLose.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_winLoseTips < 0 || Total_winLoseTips.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_memberTotalBet < 0 || Total_memberTotalBet.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_memberPayoutCom < 0 || Total_memberPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_memberPayoutTotal < 0 || Total_memberPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptTotalBet < 0 || Total_ptTotalBet.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutCom < 0 || Total_ptPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_ptPayoutTotal < 0 || Total_ptPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_comTotalBet < 0 || Total_comTotalBet.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_comPayoutCom < 0 || Total_comPayoutCom.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; color: red;'>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid;'>" + Total_comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (Total_comPayoutTotal < 0 || Total_comPayoutTotal.toString() == "-0.00") {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be; color: red;'>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='font-weight: bold; background-color: #f2e8be;'>" + Total_comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";

                                htmlData += "</tr>";
                                htmlData += '<caption style="display: none;">&nbsp;</caption>';
                                htmlData += '</tfoot>';
                                htmlData += '</table>';

                                $(function () {
                                    (function (name, mainID, underID, usersearh) {
                                        var container = $('#pagination-' + name);
                                        container.pagination({
                                            totalNumber: TotalData,
                                            pageNumber: NumPage,
                                            pageSize: 100,
                                            dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPage + '/100',
                                            locator: 'docs',
                                            beforePageOnClick: function (response, pagination) {
                                                NumPage = pagination;
                                            },
                                            afterPageOnClick: function (response, pagination) {
                                                GetData_(NumPage, name, mainID, underID, usersearh);
                                            },

                                            beforeNextOnClick: function (response, pagination) {
                                                NumPage = pagination;
                                            },
                                            afterNextOnClick: function (response, pagination) {
                                                GetData_(NumPage, name, mainID, underID, usersearh);
                                            },

                                            beforePreviousOnClick: function (response, pagination) {
                                                NumPage = pagination;
                                            },
                                            afterPreviousOnClick: function (response, pagination) {
                                                GetData_(NumPage, name, mainID, underID, usersearh);
                                            },

                                        });
                                    })(curtxt, _id, under_id, ddl_userId);
                                });
                            }

                            if (navArrLast == "COMPANY" || navArrLast == "B2B_SH_HOLDER" || navArrLast == "B2C_SH_HOLDER") {
                                $(".filterCom").css("display", "flex");
                            }
                            else {
                                $(".filterCom").css("display", "none");
                            }
                        }

                        $("#tb").append(htmlData);

                        if (countHTML == cur.length) {
                            var container_div = document.getElementById('tb');
                            var count = container_div.getElementsByTagName('div').length;
                            if (count == 0) {
                                $("#tb").append("<table class='table table-border' style='margin-top: 1rem;'><tr><td style='text-align: center;' set-lan='text:No data.'></td></tr></table>");
                                //$("#myModalLoad").modal('hide');
                            }

                            $("#myModalLoad").modal('hide');
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#tb").css('display', 'block');
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

        function GetData_(nump, zone, mainID, underID, userSearch) {
            $("#myModalLoad").modal();
            var _id = localStorage.getItem("_ID");
            var dataAdd = new Object();
            dataAdd.self_uuid = mainID;
            dataAdd.under_uuid = underID;
            dataAdd.start_date = $('#startdate').val();
            dataAdd.end_date = $('#todate').val();
            dataAdd.start_time = $('#starttime').val();
            dataAdd.end_time = $('#totime').val();
            var arrBet = [];
            $.each($("input[name='chkBet']:checked"), function () {
                arrBet.push($(this).val());
            });
            dataAdd.type = arrBet;
            dataAdd.currency = zone;
            dataAdd.page = nump;
            dataAdd.size = 100;
            var curtxt = zone;
            var startDate = $('#startdate').val();
            var toDate = $('#todate').val();
            var startTime = $('#starttime').val();
            var toTime = $('#totime').val();
            dataAdd.user_id = userSearch;

            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLoseEs2",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        var dataMenu = data.data.parentList;
                        var htmlData = "";

                        if (data.data.list.length > 0) {
                            if (dataMenu[0]._id == _id && dataMenu[0].position == "COMPANY" && dataMenu.length == 1) {
                                $("#tb" + zone + " > tbody").html("");
                                var arr = data.data.list;
                                var dataTotal = arr.sort(rankingSorter("turnOverAmt"));
                                var no = 1;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlData += "<tr>";
                                    htmlData += "<td style='text-align: center;'>" + (((nump - 1) * 100) + no) + "</td>";

                                    if (obj._id.position == "MEMBER_NONE_API" || obj._id.position == "MEMBER_API") {
                                        htmlData += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\" ,\"" + curtxt + "\",\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")' class='link overflowlg ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td><p onclick='GetData2(\"" + obj._id._id + "\" ,[\"" + curtxt + "\"],\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + obj._id.position + "\")' class='link overflowlg ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (obj.turnOverAmt < 0 || obj.turnOverAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var validAmt = parseFloat(obj.validAmt).toFixed(2);
                                    if (obj.validAmt < 0 || obj.validAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var grossCom = parseFloat(obj.grossCom).toFixed(2);
                                    if (obj.grossCom < 0 || obj.grossCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLose = parseFloat(obj.winLose).toFixed(2);
                                    if (obj.winLose < 0 || obj.winLose.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLoseTips = parseFloat(obj.winLoseTips).toFixed(2);
                                    if (obj.winLoseTips < 0 || obj.winLoseTips.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                                    if (obj.ptTotalBet < 0 || obj.ptTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                                    if (obj.ptPayoutCom < 0 || obj.ptPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                                    if (obj.ptPayoutTotal < 0 || obj.ptPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "</tr>";
                                    no++;
                                }

                                htmlData += '</tbody>';
                                $("#tb" + zone + "").append(htmlData);
                            }
                            else {
                                $("#tb2" + zone + " > tbody").html("");
                                var arr = data.data.list;
                                var dataTotal = arr.sort(rankingSorter("turnOverAmt"));
                                var no = 1;
                                for (var i = 0; i < dataTotal.length; i++) {
                                    var obj = dataTotal[i];
                                    htmlData += "<tr>";
                                    htmlData += "<td style='text-align: center;'>" + (((nump - 1) * 100) + no) + "</td>";

                                    if (obj._id.position == "MEMBER_NONE_API" || obj._id.position == "MEMBER_API") {
                                        htmlData += "<td><p onclick='GetDataTableMember(\"" + obj._id._id + "\" ,\"" + curtxt + "\",\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<td><p onclick='GetData2(\"" + obj._id._id + "\" ,[\"" + curtxt + "\"],\"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + obj._id.position + "\")' class='link overflow ellipsis' title='" + obj._id.username + "'>" + obj._id.username + "</p></td>";
                                    }

                                    var position = "";
                                    if (obj._id.position != null && obj._id.position != "") {
                                        if (obj._id.position.toLowerCase() == "agent_none_api") {
                                            position = "Agent";
                                        }
                                        else if (obj._id.position.toLowerCase() == "agent_api") {
                                            position = "API";
                                        }
                                    }

                                    if (dataTotal[0]._id.position != "MEMBER_NONE_API" && dataTotal[0]._id.position != "MEMBER_API") {
                                        htmlData += "<td style='text-align: center;'>" + position + "</td>";
                                    }

                                    var turnOverAmt = parseFloat(obj.turnOverAmt).toFixed(2);
                                    if (obj.turnOverAmt < 0 || obj.turnOverAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + turnOverAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var validAmt = parseFloat(obj.validAmt).toFixed(2);
                                    if (obj.validAmt < 0 || obj.validAmt.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + validAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    htmlData += "<td class='alignright'>" + obj.countTicket.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                    var grossCom = parseFloat(obj.grossCom).toFixed(2);
                                    if (obj.grossCom < 0 || obj.grossCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + grossCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLose = parseFloat(obj.winLose).toFixed(2);
                                    if (obj.winLose < 0 || obj.winLose.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLose.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var winLoseTips = parseFloat(obj.winLoseTips).toFixed(2);
                                    if (obj.winLoseTips < 0 || obj.winLoseTips.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red;'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright'>" + winLoseTips.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberTotalBet = parseFloat(obj.memberTotalBet).toFixed(2);
                                    if (obj.memberTotalBet < 0 || obj.memberTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberPayoutCom = parseFloat(obj.memberPayoutCom).toFixed(2);
                                    if (obj.memberPayoutCom < 0 || obj.memberPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var memberPayoutTotal = parseFloat(obj.memberPayoutTotal).toFixed(2);
                                    if (obj.memberPayoutTotal < 0 || obj.memberPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fff9e06b; border: 1px #ced4da solid;'>" + memberPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptTotalBet = parseFloat(obj.ptTotalBet).toFixed(2);
                                    if (obj.ptTotalBet < 0 || obj.ptTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutCom = parseFloat(obj.ptPayoutCom).toFixed(2);
                                    if (obj.ptPayoutCom < 0 || obj.ptPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var ptPayoutTotal = parseFloat(obj.ptPayoutTotal).toFixed(2);
                                    if (obj.ptPayoutTotal < 0 || obj.ptPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #fcea9e75; border: 1px #ced4da solid;'>" + ptPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comTotalBet = parseFloat(obj.comTotalBet).toFixed(2);
                                    if (obj.comTotalBet < 0 || obj.comTotalBet.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; border: 1px #ced4da solid;'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #ffd06373; border: 1px #ced4da solid;'>" + comTotalBet.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comPayoutCom = parseFloat(obj.comPayoutCom).toFixed(2);
                                    if (obj.comPayoutCom < 0 || obj.comPayoutCom.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutCom.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var comPayoutTotal = parseFloat(obj.comPayoutTotal).toFixed(2);
                                    if (obj.comPayoutTotal < 0 || obj.comPayoutTotal.toString() == "-0.00") {
                                        htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='background-color: #ffd06373; border: 1px #ced4da solid;'>" + comPayoutTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    htmlData += "</tr>";
                                    no++;
                                }

                                htmlData += '</tbody>';
                                $("#tb2" + zone + "").append(htmlData);
                            }
                        }
                        SetLan(localStorage.getItem("Language"));
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

        function GetData2(var1, var2, startD, toD, startT, toT, callback, nav, event, position) {
            countHTML = 1;
            $("#myModalLoad").modal();

            $("#navMenu , #tb , #tb2").html("");
            $("#wrapper").css('display', 'none');

            if (var2.toString() == "Main") {
                var localCur = localStorage.getItem("Currency");
                var currency = localCur.split(",");
                var2 = currency;
            }

            if (nav == "nav") {
                ddl_userId = "";
            }

            //for (var i = 0; i < var2.length; i++) {
            //    callback(var1, var2, startD, toD, startT, toT, i);
            //}

            GetDropdownUser(var1, var2, startD, toD, startT, toT, event, position);
        }

        function getDatas(var1, var2, startD, toD, startT, toT, event) {
            for (var i = 0; i < var2.length; i++) {
                GetData(var1, var2, startD, toD, startT, toT, i, event);
            }
        }

        function GetDropdownUser(x, xx, startDate, toDate, startTime, toTime, event, position) {
            if (position == "COMPANY" || position == "B2B_SH_HOLDER" || position == "B2C_SH_HOLDER") {
                var _id = localStorage.getItem("_ID");
                var dataAdd = new Object();
                dataAdd.self_uuid = _id;
                if (event == "changeDDL") {
                    dataAdd.under_uuid = underOldID;
                }
                else {
                    dataAdd.under_uuid = x;
                }
                dataAdd.start_date = startDate;
                dataAdd.end_date = toDate;
                dataAdd.start_time = startTime;
                dataAdd.end_time = toTime;
                var arrBet = [];
                $.each($("input[name='chkBet']:checked"), function () {
                    arrBet.push($(this).val());
                });
                dataAdd.type = arrBet;
                $.ajax({
                    url: apiURL + "/apiRoute/reportRouter/winLoseGroup",
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        if (data.code == null || data.code == 0) {
                            var arrData = data.data.list;
                            var arrDataLength = arrData.length;
                            var htmlCur = "";
                            for (var i = 0; i < arrDataLength; i++) {
                                htmlCur += "<option value=" + arrData[i]._id._id + ">" + arrData[i]._id.username + "</option>";
                            }
                            document.getElementById('ddl_Username').innerHTML = htmlCur;

                            var options = $('select#ddl_Username option');
                            var arr = options.map(function (_, o) {
                                return {
                                    t: $(o).text(),
                                    v: o.value
                                };
                            }).get();
                            arr.sort(function (o1, o2) {
                                return o1.t > o2.t ? 1 : o1.t < o2.t ? -1 : 0;
                            });
                            options.each(function (i, o) {
                                o.value = arr[i].v;
                                $(o).text(arr[i].t);
                            });

                            if (ddl_userId != "") {
                                $("select#ddl_Username").find("option[value='" + ddl_userId + "']").attr("selected", true);
                            }

                            var htmlCurAll = "<option value=''>All</option>";
                            $(htmlCurAll).insertBefore("#ddl_Username option:first");

                            getDatas(x, xx, startDate, toDate, startTime, toTime, event);
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
                getDatas(x, xx, startDate, toDate, startTime, toTime, event);
            }
        }

        var NumPageMem;
        var TotalData;
        var arr = [];
        function GetDataTableMember(val, cur, startDate, toDate, startTime, toTime) {
            $("#myModalLoad").modal();

            $('.filterCom').css('display', 'none');
            $("#navMenu , #tb , #tb2").html("");
            $("#wrapper").css('display', 'flex');
            $("#tb2").css('display', 'block');
            $("#tb").css('display', 'none');

            if (NumPageMem == null) {
                NumPageMem = 1;
            }

            var dataAdd = new Object();
            dataAdd.self_uuid = localStorage.getItem("_ID");
            dataAdd.under_uuid = val;
            dataAdd.page = NumPageMem;
            dataAdd.size = 100;
            dataAdd.start_date = startDate;
            dataAdd.end_date = toDate;
            dataAdd.start_time = startTime;
            dataAdd.end_time = toTime;
            var arrBet = [];
            $.each($("input[name='chkBet']:checked"), function () {
                arrBet.push($(this).val());
            });
            dataAdd.type = arrBet;
            dataAdd.currency = cur;
            $.ajax({
                type: "POST",
                url: apiURL + "/apiRoute/reportRouter/winLoseTransactionEs2",
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        TotalData = data.data.total.count;
                        GetNumPage(NumPageMem, val, cur, startDate, toDate, startTime, toTime);
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

        function GetNumPage(NumPageMem, val, cur, startDate, toDate, startTime, toTime) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: NumPageMem,
                        pageSize: 100,
                        dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPageMem + '/100',
                        locator: 'docs',
                        callback: function (arr, pagination) {
                            NumPageMem = container.pagination('getSelectedPageNum');
                            GetTable(NumPageMem, val, cur, startDate, toDate, startTime, toTime);
                        }
                    });
                })('demo2');
            });
        }

        function GetTable(Num, val, currency, startDate, toDate, startTime, toTime) {
            if ($('#myModalLoad').is(':hidden')) {
                $("#myModalLoad").modal();
            }

            $("#navMenu , #tb , #tb2").html("");
            $("#tb2").css('display', 'block');
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
            dataAdd.size = 100;
            dataAdd.start_date = startDate;
            dataAdd.end_date = toDate;
            dataAdd.start_time = startTime;
            dataAdd.end_time = toTime;
            var arrBet = [];
            $.each($("input[name='chkBet']:checked"), function () {
                arrBet.push($(this).val());
            });
            dataAdd.type = arrBet;
            dataAdd.currency = currency;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/winLoseTransactionEs2",
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
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a>";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a>";
                                    }
                                }
                                else {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a>";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + currency + "\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a>";
                                    }
                                }
                            }
                            else {
                                if (i == 0) {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a> / ";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"Main\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a> / ";
                                    }
                                }
                                else {
                                    if (objMenu.position.toLowerCase() == "member_none_api" || objMenu.position.toLowerCase() == "member_api") {
                                        htmlMenu += "<a class='linkNav' onclick='GetDataTableMember(\"" + objMenu._id + "\" ,\"" + currency + "\", \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\")'>" + objMenu.username + "</a> / ";
                                    }
                                    else {
                                        htmlMenu += "<a class='linkNav' onclick='GetData2(\"" + objMenu._id + "\" ,[\"" + currency + "\"], \"" + startDate + "\", \"" + toDate + "\", \"" + startTime + "\", \"" + toTime + "\", GetData, \"nav\", \"\", \"" + objMenu.position + "\")'>" + objMenu.username + "</a> / ";
                                    }
                                }
                            }
                        }
                        $("#navMenu").append(htmlMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        var dataHead = data.data.list;
                        if (dataHead.length > 0) {
                            htmlData += '<table class="table table-border tableMaxWidth" style="table-layout: fixed;"><thead class="rgba-green-slight" style="text-align: center;">';
                            htmlData += "<tr>";
                            htmlData += "<th rowspan='2' style='width: 40px; vertical-align: middle; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:No'></th>";
                            htmlData += "<th rowspan='2' style='width: 180px; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Information'></th>";
                            htmlData += "<th rowspan='2' style='width: 130px; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Event & Details'></th>";
                            htmlData += "<th rowspan='2' style='width: 85px; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Bet Type'></th>";
                            htmlData += "<th rowspan='2' style='width: 110px; vertical-align: middle; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Amount'></th>";
                            htmlData += "<th rowspan='2' style='width: 180px; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Result'></th>";
                            htmlData += "<th rowspan='2' style='width: 160px; vertical-align: middle; text-align: left; padding-left: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'><div style='display: flex; padding-top: 15px;'><p style='text-align:left; margin-left:-7px' class='col-md-3' set-lan='text:Level'></p><p style='text-align:right; margin-left:10px' class='col-md-9' set-lan='text:PT & Comm'></p></div></th>";
                            htmlData += "<th rowspan='2' style='width: 160px; vertical-align: middle; z-index: 1; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Credit/Cash'></th>";
                            htmlData += "<th style='vertical-align: middle; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' class='theadWin' set-lan='text:Win/Loss & Comm & Total'></th>";
                            htmlData += "</tr>";
                            htmlData += "<tr>";
                            htmlData += "<th style='width: 100px; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:Member'></th>";

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
                                    htmlData += "<th style='width: 100px; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;' set-lan='text:" + txtPositionTH + "'></th>";
                                }
                                else {
                                    htmlData += "<th style='width: 100px; text-align: right; padding-right: 5px; background-color: rgb(23, 23, 44); color: #f2e8be; border: 1px #ced4da solid;'><span set-lan='text:" + txtPositionTH + "'>" + txtPositionTH + "</span> <span>" + positionNoTH + "</span></th>";
                                }
                            }

                            htmlData += "</tr>";
                            htmlData += '<thead><tbody>';

                            var dataTotal = data.data.list;
                            var no = 1;
                            var valBefore = 0;
                            var valAfter = 0;
                            var arrPer = [];
                            for (var i = 0; i < dataTotal.length; i++) {
                                var obj = dataTotal[i];
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter' style='vertical-align: top; text-align: center; background-color: #f2e8be; border: 1px #ced4da solid;'>" + (((Num - 1) * 100) + no) + "</td>";
                                var test = new Date(obj.createDate).toLocaleString("en-US", { timeZone: "Asia/Bangkok" });
                                var txtDate = moment(test).format('DD-MM-YY HH:mm:ss');

                                var test2 = new Date(obj.updateDate).toLocaleString("en-US", { timeZone: "Asia/Bangkok" });
                                var txtDate2 = moment(test2).format('DD-MM-YY HH:mm:ss');

                                htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid; text-align: left;'><b set-lan='text:User'></b> <b>: " + obj.memberUsername + "</b><br/><b set-lan='text:ID'></b><b> : " + obj.ticketId + "</b><br/> <b set-lan='text:Bet'></b> <b style='font-weight: normal;'>: " + txtDate + "</b><br/> <b set-lan='text:Settle'></b> <b style='font-weight: normal;'>: " + txtDate2 + "</b><br/><b set-lan='text:IP'></b>&nbsp;:&nbsp;<span>" + obj.ip + "</span></td>";
                                htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'><b set-lan='text:Game ID'></b> <a href='https://status.hippo168.com/?gameId=" + obj.gameId + "' target='_blank'><b>: " + obj.gameId + "</b></a><br/><span set-lan='text:" + obj.type + "'></span><br/><span style='font-weight: bold;' set-lan='text:" + obj.betPosition + "'></span></td>";
                                if (obj.type == "Baccarat") {
                                    htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid; vertical-align: top;'><span set-lan='text:Original'></span><br/><span set-lan='text:" + obj.type + "'></span></td>";
                                }
                                else {
                                    htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid; vertical-align: top;' set-lan='text:" + obj.type + "'></td>";
                                }

                                var betAmt = parseFloat(obj.betAmt * -1).toFixed(2);
                                var winLose = parseFloat(obj.winLose).toFixed(2);
                                htmlData += "<td class='alignright' style='background-color: #f2e8be; border: 1px #ced4da solid; text-align: right;'>";
                                htmlData += "<span class='bottom0'>" + betAmt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>" + obj.currency;
                                if (obj.type == "CowCow") {
                                    var betAmount = obj.betAmt * -1;
                                    var totalbetAmount = betAmount / 9;
                                    var totalFormatbetAmount = parseFloat(totalbetAmount).toFixed(2);
                                    htmlData += "<br/><span class='bottom0'>(BET " + totalFormatbetAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + ")</span>";
                                }
                                htmlData += "</td>";

                                if (obj.betStatus == "Lose") {
                                    htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'><div class='row' style='margin-top: 5px;'><b class='bottom0 col-md-6' style='color: red; margin-bottom: 0px !important;' set-lan='text:" + obj.betStatus + "'></b>";
                                    htmlData += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: -5px;' set-lan='html:Play Clip'></i></div>";
                                }
                                else if (obj.betStatus == "Win") {
                                    htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'><div class='row' style='margin-top: 5px;'><b class='bottom0 col-md-6' style='color: green; margin-bottom: 0px !important;' set-lan='text:" + obj.betStatus + "'></b>";
                                    htmlData += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: -5px;' set-lan='html:Play Clip'></i></div>";
                                }
                                else {
                                    htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'><div class='row' style='margin-top: 5px;'><b class='bottom0 col-md-6' style='color: #007bff; margin-bottom: 0px !important;' set-lan='text:" + obj.betStatus + "'></b>";
                                    htmlData += "<i class='far fa-play-circle' style='font-size: 10pt; color: #17172c; cursor: pointer; margin-left: -5px;' set-lan='html:Play Clip'></i></div>";
                                }

                                if (obj.type.toLowerCase() == "baccarat" || obj.type.toLowerCase() == "cowcow" || obj.type.toLowerCase() == "super6" || obj.type.toLowerCase() == "4point") {
                                    var result = obj.result.rsBc;
                                    htmlData += "<div class='row' style='margin-top: 5px;'><span class='bottom0 col-md-6'><span set-lan='text:Player'></span> : " + (result.player123 % 10) + "</span>";
                                    htmlData += "<img src='../img/Card/" + result.player_1 + ".png' style='width: 13%; margin-left: -5px;' />";
                                    htmlData += "<img src='../img/Card/" + result.player_2 + ".png' style='width: 13%;' />";
                                    if (result.player_3 != null && result.player_3 != "") {
                                        htmlData += "<div class='vertical'></div>";
                                        htmlData += "<img src='../img/Card/" + result.player_3 + ".png' style='width: 13%; transform: rotate(-90deg);' />";
                                    }
                                    htmlData += "</div>";

                                    htmlData += "<div class='row' style='margin-top: 5px;'><span class='bottom0 col-md-6'><span set-lan='text:Banker'></span> : " + (result.banker123 % 10) + "</span>";
                                    htmlData += "<img src='../img/Card/" + result.banker_1 + ".png' style='width: 13%;margin-left: -5px;' />";
                                    htmlData += "<img  src='../img/Card/" + result.banker_2 + ".png' style='width: 13%;' />";
                                    if (result.banker_3 != null && result.banker_3 != "") {
                                        htmlData += "<div class='vertical'></div>";
                                        htmlData += "<img src='../img/Card/" + result.banker_3 + ".png' style='width: 13%; transform: rotate(-90deg);' />";
                                    }
                                    htmlData += "</div>";

                                    if (obj.result.winBc != null) {
                                        htmlData += "<div class='row' style='margin-top: 5px;'><span class='col-md-5'><span set-lan='text:Result'></span> : </span><span class='col-md-7'>" + obj.result.winBc + "</span></div>";
                                    }
                                    else {
                                        htmlData += "<div class='row' style='margin-top: 5px;'><span class='col-md-5'><span set-lan='text:Result'></span> : </span><span class='col-md-7'>-</span></div>";
                                    }
                                }

                                if (obj.type.toLowerCase() == "dragontiger") {
                                    var result = obj.result.rsDr;
                                    htmlData += "<div class='row' style='margin-top: 5px;'><span class='bottom0 col-md-6'><span set-lan='text:Dragon'></span> : " + result.dragon_tt + "</span>";
                                    htmlData += "<img src='../img/Card/" + result.dragon + ".png' style='width: 13%; margin-left: -5px;' />";
                                    htmlData += "</div>";

                                    htmlData += "<div class='row' style='margin-top: 5px;'><span class='bottom0 col-md-6'><span set-lan='text:Tiger'></span> : " + result.tiger_tt + "</span>";
                                    htmlData += "<img src='../img/Card/" + result.tiger + ".png' style='width: 13%;margin-left: -5px;' />";
                                    htmlData += "</div>";

                                    if (obj.result.winDr != null) {
                                        htmlData += "<div class='row' style='margin-top: 5px;'><span class='col-md-5'><span set-lan='text:Result'></span> : </span><span class='col-md-7' set-lan='text:" + capitalizeFirstLetter(obj.result.winDr) + "'></span></div>";
                                    }
                                    else {
                                        htmlData += "<div class='row' style='margin-top: 5px;'><span class='col-md-5'><span set-lan='text:Result'></span> : </span><span class='col-md-7'>-</span></div>";
                                    }
                                }

                                htmlData += "</td>";
                                htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'>";
                                htmlData += "<div style='margin-left: 0.7rem; margin-right: 0.1rem;'>";

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
                                        if (valPT[j].position.toLowerCase() == "company") {
                                            htmlData += "<div class='row'><span class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;' set-lan='text:" + txtPositionTD + "'></span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;' id='txt" + j + "_" + i + "'>" + valPT[j].getCommissionRate + "%</span></div>";
                                        }
                                        else if (valPT[j].position.toLowerCase() == "b2b_sh_holder" || valPT[j].position.toLowerCase() == "b2c_sh_holder") {
                                            htmlData += "<div class='row'><span class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;' set-lan='text:" + txtPositionTD + "'></span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</span></div>";
                                            arrPer.push(valPT[j].getCommissionRate + "%");
                                        }
                                        else {
                                            htmlData += "<div class='row'><span class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;' set-lan='text:" + txtPositionTD + "'></span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</span></div>";
                                        }
                                    }
                                    else {
                                        htmlData += "<div class='row'><span class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;'><span set-lan='text:" + txtPositionTD + "'></span> " + positionNoTD + "</span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].ptPercent + "%</span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + valPT[j].getCommissionRate + "%</span></div>";
                                    }
                                }

                                htmlData += "<div class='row'><span class='col-md-5 bottom0' style='padding-left: 0px !important; padding-right: 0px !important;' set-lan='text:Member'></span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>100%</span>&nbsp;<span class='col-md-3 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important;'>" + obj.commissionRate + "%</span></div>";
                                htmlData += "</div>";
                                htmlData += "</td>";

                                var before = parseFloat(obj.beForCredit).toFixed(2);
                                var after = parseFloat(obj.afterCredit).toFixed(2);

                                var total = parseFloat(obj.winLose + (obj.payOutCom * -1)).toFixed(2);
                                var total2 = parseFloat(obj.payOutCom).toFixed(2);
                                var total3 = parseFloat(obj.winLose).toFixed(2);

                                htmlData += "<td style='background-color: #ebebeb; border: 1px #ced4da solid;'>";
                                if (before < 0 || before.toString() == "-0.00") {
                                    htmlData += "<div class='row' style='padding-right: 0.2rem;'><span class='col-md-6 bottom0' set-lan='text:Before'></span>&nbsp;<span class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + before.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></div>";
                                }
                                else {
                                    htmlData += "<div class='row' style='padding-right: 0.2rem;'><span class='col-md-6 bottom0' set-lan='text:Before'></span>&nbsp;<span class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + before.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></div>";
                                }

                                if (total3 < 0 || total3.toString() == "-0.00") {
                                    htmlData += "<div class='row' style='padding-right: 0.2rem;'><span class='col-md-6 bottom0' set-lan='text:Win/Loss'></span>&nbsp;<span class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></div>";
                                }
                                else {
                                    htmlData += "<div class='row' style='padding-right: 0.2rem;'><span class='col-md-6 bottom0' set-lan='text:Win/Loss'></span>&nbsp;<span class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></div>";
                                }

                                if (after < 0 || after.toString() == "-0.00") {
                                    htmlData += "<div class='row' style='padding-right: 0.2rem;'><span class='col-md-6 bottom0' set-lan='text:After'></span>&nbsp;<span class='col-md-6 bottom0 alignright txtRed' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + after.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></div>";
                                }
                                else {
                                    htmlData += "<div class='row' style='padding-right: 0.2rem;'><span class='col-md-6 bottom0' set-lan='text:After'></span>&nbsp;<span class='col-md-6 bottom0 alignright' style='padding-left: 0px !important; padding-right: 0px !important; margin-left: -9px;'>" + after.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></div>";
                                }
                                htmlData += "</td>";

                                valBefore = parseFloat(valBefore) + parseFloat(obj.beForCredit);
                                valAfter = parseFloat(valAfter) + parseFloat(obj.afterCredit);

                                htmlData += "<td class='alignright' style='background-color: #ebebeb; border: 1px #ced4da solid;'>";
                                if (total < 0 || total.toString() == "-0.00") {
                                    htmlData += "<span class='bottom0 alignright txtRed' style='color: red;'>" + total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                else {
                                    htmlData += "<span class='bottom0 alignright'>" + total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                if (total2 < 0 || total2.toString() == "-0.00") {
                                    htmlData += "<span class='bottom0 alignright txtRed' style='color: red;'>" + total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                else {
                                    htmlData += "<span class='bottom0 alignright'>" + total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                if (total3 < 0 || total3.toString() == "-0.00") {
                                    htmlData += "<span class='bottom0 alignright txtRed' style='color: red;'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></td>";
                                }
                                else {
                                    htmlData += "<span class='bottom0 alignright'>" + total3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span></td>";
                                }

                                var valShar = obj.shareHolder;
                                countTotal = valShar.length;
                                for (var j = 0; j < valShar.length; j++) {
                                    var val = parseFloat(valShar[j].ptPayOutToUnder).toFixed(2);
                                    var val2 = parseFloat((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1)).toFixed(2);
                                    var val3 = parseFloat(valShar[j].ptPayOutToUnder + ((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1))).toFixed(2);
                                    htmlData += "<td class='alignright' style='background-color: #ebebeb; border: 1px #ced4da solid;'>";

                                    var count = valShar[j].ptPayOutToUnder;
                                    var count2 = (valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1);
                                    var count3 = valShar[j].ptPayOutToUnder + ((valShar[j].payComToUnder * -1) + (valShar[j].getPayComFormTop * -1));

                                    if (val < 0 || val.toString() == "-0.00") {
                                        htmlData += "<span class='bottom0 alignright txtRed val_" + j + "' attr-val='" + count + "' style='color: red;'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                    }
                                    else {
                                        htmlData += "<span class='bottom0 alignright val_" + j + "' attr-val='" + count + "'>" + val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                    }
                                    if (val2 < 0 || val2.toString() == "-0.00") {
                                        htmlData += "<span class='bottom0 alignright txtRed val2_" + j + "' attr-val='" + count2 + "' style='color: red;'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                    }
                                    else {
                                        htmlData += "<span class='bottom0 alignright val2_" + j + "' attr-val='" + count2 + "'>" + val2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                    }
                                    if (val3 < 0 || val3.toString() == "-0.00") {
                                        htmlData += "<span class='bottom0 alignright txtRed val3_" + j + "' attr-val='" + count3 + "' style='color: red;'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                    }
                                    else {
                                        htmlData += "<span class='bottom0 alignright val3_" + j + "' attr-val='" + count3 + "'>" + val3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
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
                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'></td>";
                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'></td>";
                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'></td>";
                            htmlData += "<td set-lan='text:Total' style='background-color: #f2e8be; border: 1px #ced4da solid; font-weight: bold; vertical-align: top; text-align: right;'></td>";
                            totalStake = parseFloat(data.data.total.betAmt).toFixed(2);
                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid; font-weight: bold; vertical-align: top; text-align: right;'>" + totalStake.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'></td>";
                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'></td>";

                            var valBefore = parseFloat(data.data.total.beForCredit).toFixed(2);
                            var valWin = parseFloat(data.data.total.winLose).toFixed(2);
                            var valAfter = parseFloat(data.data.total.afterCredit).toFixed(2);

                            htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'>";
                            htmlData += "</td>";

                            var arrTotal = data.data.total.shareHolder;
                            for (var z = 0; z < arrTotal.length; z++) {
                                htmlData += "<td style='background-color: #f2e8be; border: 1px #ced4da solid;'>";
                                var num = parseFloat(arrTotal[z].win_loss).toFixed(2);
                                var num2 = parseFloat(arrTotal[z].comm).toFixed(2);
                                var num3 = parseFloat(arrTotal[z].total).toFixed(2);

                                if (num < 0 || num.toString() == "-0.00") {
                                    htmlData += "<span class='bottom0 alignright txtRed' style='font-weight: bold; color: red;'>" + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                else {
                                    htmlData += "<span class='bottom0 alignright' style='font-weight: bold;'>" + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                if (num2 < 0 || num2.toString() == "-0.00") {
                                    htmlData += "<span class='bottom0 alignright txtRed' style='font-weight: bold; color: red;'>" + num2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                else {
                                    htmlData += "<span class='bottom0 alignright' style='font-weight: bold;'>" + num2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                if (num3 < 0 || num3.toString() == "-0.00") {
                                    htmlData += "<span class='bottom0 alignright txtRed' style='font-weight: bold; color: red;'>" + num3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                else {
                                    htmlData += "<span class='bottom0 alignright' style='font-weight: bold;'>" + num3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br/>";
                                }
                                htmlData += "</td>";
                            }

                            htmlData += "</tr></tfoot></table>";

                            $("#tb2").append(htmlData);

                            if (localStorage.getItem("Position").toLowerCase() == "company" || localStorage.getItem("Position").toLowerCase() == "b2b_sh_holder" || localStorage.getItem("Position").toLowerCase() == "b2c_sh_holder") {
                                for (var d = 0; d < arrPer.length; d++) {
                                    $('#txt0_' + d + '').text(arrPer[d]);
                                }
                            }
                            var txtWidth = (parseInt(dtHead.length) * 100) + 100;
                            var txtCol = txtWidth / 100;
                            $('.theadWin').css('width', txtWidth);
                            $('.theadWin').attr('colspan', txtCol);
                        }
                        else {
                            htmlData += "<table class='table table-border' style='margin-top: 1rem;'><tbody><tr><td style='text-align: center;' set-lan='text:No data.'>No data.</td></tr></tbody></table>";
                            $("#tb2").append(htmlData);
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#tb2").css('display', 'block');
                        $("#tb").css('display', 'none');
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

