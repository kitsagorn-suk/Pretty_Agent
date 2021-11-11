<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rate.aspx.cs" Inherits="Pretty_Gaming.Menu_Rate.Rate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/star-rating-svg.css">
    <style>
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
            left: 148px;
            z-index: 9;
        }
    </style>
    <%--<div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Rate"></h1>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-12">
                <div class="card-header" set-lan="text:Rate" style="font-weight: bold;"></div>
                <div class="card-body">
                    <div class="form-group row col-md-12" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label" set-lan="text:Network Connection"></label>
                        <label for="email" class="col-1 col-form-label" id="txtRate1"></label>
                        <div class="col-6">
                            <div class="my-rating-1"></div>
                        </div>
                    </div>
                    <div class="form-group row col-md-12" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label" set-lan="text:Video Quality"></label>
                        <label for="email" class="col-1 col-form-label" id="txtRate2"></label>
                        <div class="col-6">
                            <div class="my-rating-2"></div>
                        </div>
                    </div>
                    <div class="form-group row col-md-12" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label" set-lan="text:Our Girls"></label>
                        <label for="email" class="col-1 col-form-label" id="txtRate3"></label>
                        <div class="col-6">
                            <div class="my-rating-3"></div>
                        </div>
                    </div>
                    <div class="form-group row col-md-12" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label" set-lan="text:Graphic Design"></label>
                        <label for="email" class="col-1 col-form-label" id="txtRate4"></label>
                        <div class="col-6">
                            <div class="my-rating-4"></div>
                        </div>
                    </div>
                    <div class="form-group row col-md-12" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label" set-lan="text:Customer Service"></label>
                        <label for="email" class="col-1 col-form-label" id="txtRate5"></label>
                        <div class="col-6">
                            <div class="my-rating-5"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="margin-top: 1rem; margin-bottom: 1rem;">
            <div class="card mb-12">
                <div class="card-header" set-lan="text:Comment" style="font-weight: bold;"></div>
                <div class="card-body">
                    <div class="row">
                        <div class="btn-toolbar section-group col-7" role="toolbar">
                            <div class="form-group row">
                                <label for="email" class="col-form-label" set-lan="text:Start date_"></label>
                                <div style="padding-left: 1rem;" class="input-wrapper">
                                    <i class="far fa-calendar iconCalendar"></i>
                                    <input type="date" data-date="" id="startdate" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 155px;" />
                                </div>
                            </div>
                            <div class="form-group row" style="padding-left: 2.5rem;">
                                <label for="email" class="col-form-label" set-lan="text:To date_"></label>
                                <div style="padding-left: 1rem;" class="input-wrapper">
                                    <i class="far fa-calendar iconCalendar"></i>
                                    <input type="date" data-date="" id="todate" class="testDate form-control" data-date-format="DD-MM-YYYY" style="width: 155px;" />
                                </div>
                            </div>
                            <div class="form-group row" style="padding-left: 2rem;">
                                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="GetData('','')"></button>
                            </div>
                        </div>
                        <div class="col-8">
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
                        <div class="col-4">
                            <div id="wrapper" style="float: right;">
                                <section>
                                    <div class="data-container"></div>
                                    <div id="pagination-demo2"></div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <table class="table table-border" id="tbData">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th style="width: 10%;" set-lan="text:No"></th>
                                <th style="width: 20%; text-align: left; padding-left: 5px;" set-lan="text:Login name"></th>
                                <th style="width: 50%; text-align: left; padding-left: 5px;" set-lan="text:Comment"></th>
                                <th style="width: 20%;" set-lan="text:Date"></th>
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
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="modalAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" style="z-index: 9999;">
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script src="../js/moment.min.js"></script>
    <script>
        var typeTime = "Day";
        $(document).ready(function () {
            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSet);
            $("#todate").val(dateSet);
            var start = dateSet;
            var end = dateSet;

            $("input[type=date]").on("change", function () {
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                )
            }).trigger("change")

            $("#myModalLoad").modal();
            $("#tbData > tbody").html("");

            GetData(start, end);

            $.ajax({
                url: apiURL + '/apiRoute/rate/allRate',
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (response) {
                    if (response.code == 0 || response.code == null) {
                        var dataRate = response.data.rate;
                        for (var i = 0; i < dataRate.length; i++) {
                            var objRate = dataRate[i];
                            $(".my-rating-1").starRating({
                                totalStars: 5,
                                starShape: 'rounded',
                                starSize: 30,
                                emptyColor: '#e9ecef',
                                activeColor: '#ffd94d',
                                useGradient: false,
                                readOnly: true,
                                initialRating: objRate.network.toFixed(1)
                            });

                            $(".my-rating-2").starRating({
                                totalStars: 5,
                                starShape: 'rounded',
                                starSize: 30,
                                emptyColor: '#e9ecef',
                                activeColor: '#ffd94d',
                                useGradient: false,
                                readOnly: true,
                                initialRating: objRate.video.toFixed(1)
                            });

                            $(".my-rating-3").starRating({
                                totalStars: 5,
                                starShape: 'rounded',
                                starSize: 30,
                                emptyColor: '#e9ecef',
                                activeColor: '#ffd94d',
                                useGradient: false,
                                readOnly: true,
                                initialRating: objRate.ourGirl.toFixed(1)
                            });

                            $(".my-rating-4").starRating({
                                totalStars: 5,
                                starShape: 'rounded',
                                starSize: 30,
                                emptyColor: '#e9ecef',
                                activeColor: '#ffd94d',
                                useGradient: false,
                                readOnly: true,
                                initialRating: objRate.graphic.toFixed(1)
                            });

                            $(".my-rating-5").starRating({
                                totalStars: 5,
                                starShape: 'rounded',
                                starSize: 30,
                                emptyColor: '#e9ecef',
                                activeColor: '#ffd94d',
                                useGradient: false,
                                readOnly: true,
                                initialRating: objRate.customerService.toFixed(1)
                            });

                            $('#txtRate1').text(objRate.network.toFixed(1));
                            $('#txtRate2').text(objRate.video.toFixed(1));
                            $('#txtRate3').text(objRate.ourGirl.toFixed(1));
                            $('#txtRate4').text(objRate.graphic.toFixed(1));
                            $('#txtRate5').text(objRate.customerService.toFixed(1));
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
        });

        function btnTime(type) {
            var start = "";
            var end = "";
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

            GetData(start, end);
        }

        function btnTimePN(type) {
            var startVal = new Date($('#startdate').val());
            var toVal = new Date($('#todate').val());
            var start = "";
            var end = "";

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

            GetData(start, end);
        }

        var NumPage;
        var TotalData;
        function GetData(start, end) {
            $("#myModalLoad").modal();

            if (NumPage == null) {
                NumPage = 1;
            }

            var dataAdd = new Object();
            if (start == "") {
                start = $("#startdate").val();
            }

            if (end == "") {
                end = $("#todate").val();
            }

            dataAdd.startDate = start;
            dataAdd.endDate = end;
            dataAdd.page = NumPage;
            dataAdd.limit = 100;
            $.ajax({
                url: apiURL + '/apiRoute/rate/comment',
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
                        GetNumPage(NumPage, start, end);
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

        function GetNumPage(NumPage, start, end) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: NumPage,
                        pageSize: 100,
                        dataSource: apiURL + '/apiRoute/betLimit/list/' + NumPage + '/100',
                        locator: 'docs',
                        callback: function (response, pagination) {
                            NumPage = container.pagination('getSelectedPageNum');
                            GetTable(NumPage, start, end);
                        }
                    });
                })('demo2');
            });
        }

        function GetTable(Num, start, end) {
            var htmlData = "";
            $("#tbData > tbody").html("");
            var dataAdd = new Object();
            dataAdd.startDate = start;
            dataAdd.endDate = end;
            dataAdd.page = Num;
            dataAdd.limit = 100;
            $.ajax({
                url: apiURL + '/apiRoute/rate/comment',
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
                        var data = res.data.docs;
                        if (data.length > 0) {
                            var no = 1;
                            for (var i = 0; i < data.length; i++) {
                                var obj = data[i];
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + no + "</td>";
                                htmlData += "<td><p class='overflowlg ellipsis' title='" + obj.uuid.username + "' style='width: 17em !important;'>" + obj.uuid.username + "</p></td>";
                                htmlData += "<td>" + obj.comment + "</td>";

                                if (obj.createDate != null) {
                                    var dateLog = new Date(obj.createDate);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + dateLog.getFullYear();
                                    htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                }

                                htmlData += "</tr>";
                                no++;
                            }

                            $("#tbData > tbody").append(htmlData);
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }
                        else {
                            $("#tbData > tbody").append("<tr><td colspan='4' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }

                        $("#myModalLoad").modal("hide");
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
