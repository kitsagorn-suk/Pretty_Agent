<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Pretty_Gaming.Menu_Dashboard.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="margin-bottom: 1rem;">
                <div class="carousel-inner" id="bannerAnnounce">
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card mb-4">
                <div class="card-header" set-lan="text:Balance info"></div>
                <div class="card-body">
                    <div class="card-sub-info">
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Today Turn Over"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtTodayTurnOver"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Today Valid Turn Over"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtTodayValidAmount"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Today Member Win Lose"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtTodayMemberWinLose"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Today Agent Win Lose"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtTodayWinLose"></span></div>
                        </div>
                    </div>
                    <div class="card-sub-info" style="margin-top: 1rem;">
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Yesterday Turn Over"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtYesterdayTurnOver"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Yesterday Valid Turn Over"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtYesterdayValidAmount"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Yesterday Member Win Lose"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtYesterdayMemberWinLose"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><span class="card-sub-title" set-lan="text:Yesterday Agent Win Lose"></span></div>
                            <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtYesterdayWinLose"></span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header" set-lan="text:Outstanding"></div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-6"><span class="card-sub-title" set-lan="text:Total Outstanding Bets"></span></div>
                        <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtTotalOutstandingBets"></span></div>
                    </div>
                    <div class="row">
                        <div class="col-6"><span class="card-sub-title" set-lan="text:Total Outstanding Balance"></span></div>
                        <div class="col-6"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtTotalOutstandingBalance"></span></div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header" set-lan="text:Your Downline"></div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-3"><span class="card-sub-title" set-lan="text:Members"></span></div>
                        <div class="col-3"><span class="card-sub-title" set-lan="text:Agents"></span></div>
                    </div>
                    <div class="row">
                        <div class="col-3"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtDownlineMembers"></span></div>
                        <div class="col-3"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtDownlineAgents"></span></div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header" set-lan="text:New Members"></div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-3"><span class="card-sub-title" set-lan="text:Today"></span></div>
                        <div class="col-3"><span class="card-sub-title" set-lan="text:Last Week"></span></div>
                        <div class="col-4"><span class="card-sub-title" set-lan="text:Last Month"></span></div>
                    </div>
                    <div class="row">
                        <div class="col-3"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtNewMembersToday"></span></div>
                        <div class="col-3"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtNewMembersLastWeek"></span></div>
                        <div class="col-3"><i class="fa fa-spinner fa-spin"></i><span class="card-sub-value" id="txtNewMembersLastMonth"></span></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="mb-4">
                <div class="chart">
                    <div class="chart-body">
                        <div style="border-radius: 0.3rem; min-width: 300px; height: 300px; text-align: center; background-color: #fff;" class="zoneG1"><i class="fa fa-spinner fa-spin" style="font-size: 2rem; margin-top: 8rem;"></i></div>
                        <div id="container" style="border-radius: 0.3rem; min-width: 300px; height: 300px; display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="mb-4">
                <div class="chart">
                    <div class="chart-body">
                        <div style="border-radius: 0.3rem; min-width: 300px; height: 300px; text-align: center; background-color: #fff;" class="zoneG1"><i class="fa fa-spinner fa-spin" style="font-size: 2rem; margin-top: 8rem;"></i></div>
                        <div id="container2" style="border-radius: 0.3rem; min-width: 300px; height: 300px; display: none;"></div>
                    </div>
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
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/highcharts.js"></script>
    <script src="../js/series-label.js"></script>
    <script src="../js/exporting.js"></script>
    <script src="../js/export-data.js"></script>
    <script src="../js/accessibility.js"></script>
    <script>
        var myIndex = 0;
        $(document).ready(function () {
            $("#menuDashboard , #menuDashboard > a").addClass("active");
            $("#menuDashboard > div").css("display", "block");
            $(".card-sub-value").css("display", "none");

            var htmlBanner = "";
            $.ajax({
                url: apiURL + '/apiRoute/agentBannerRouter/list',
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (response) {
                    if (response.code == 0 || response.code == null) {
                        var data = response.data;
                        if (data.length > 0) {
                            for (var i = 0; i < data.length; i++) {
                                var obj = data[i];
                                if (i == 0) {
                                    htmlBanner += '<div class="carousel-item active"><img class="d-block w-100" src="' + obj.banner + '" alt="' + obj.msg + '" style="border-radius: .375rem;" /></div>';
                                }
                                else {
                                    htmlBanner += '<div class="carousel-item"><img class="d-block w-100" src="' + obj.banner + '" alt="' + obj.msg + '" style="border-radius: .375rem;" /></div>';
                                }
                            }

                            $("#bannerAnnounce").append(htmlBanner);
                        }
                        else {
                            $("#bannerAnnounce").append('<div class="carousel-item active"><img class="d-block w-100" src="../img/noImage.jpg" style="border-radius: .375rem;" /></div>');
                        }
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
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

            getGraph();
        });

        function matcher(regexp) {
            return function (obj) {
                var found = false;
                Object.keys(obj).forEach(function (key) {
                    if (!found) {
                        if ((typeof obj[key] == 'string') && regexp.exec(obj[key])) {
                            found = true;
                        }
                    }
                });
                return found;
            };
        }

        function getGraph() {
            $.ajax({
                url: apiURL + '/apiRoute/dashBoardRouter/balanceInfo2',
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        if (data.basicInfo != null) {
                            var txt1 = parseFloat(data.basicInfo.t.turnOver).toFixed(2);
                            var txt2 = parseFloat(data.basicInfo.t.validAmt).toFixed(2);
                            var txt3 = parseFloat(data.basicInfo.t.memberWinLose).toFixed(2);
                            var txt4 = parseFloat(data.basicInfo.t.winLose).toFixed(2);

                            var txt_1 = parseFloat(data.basicInfo.y.turnOver).toFixed(2);
                            var txt_2 = parseFloat(data.basicInfo.y.validAmt).toFixed(2);
                            var txt_3 = parseFloat(data.basicInfo.y.memberWinLose).toFixed(2);
                            var txt_4 = parseFloat(data.basicInfo.y.winLose).toFixed(2);

                            $('#txtTodayTurnOver').text(txt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTodayValidAmount').text(txt2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTodayMemberWinLose').text(txt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTodayWinLose').text(txt4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $('#txtYesterdayTurnOver').text(txt_1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtYesterdayValidAmount').text(txt_2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtYesterdayMemberWinLose').text(txt_3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtYesterdayWinLose').text(txt_4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.basicInfo.t.turnOver < 0) {
                                $('#txtTodayTurnOver').addClass('txtRed');
                            }
                            if (data.basicInfo.t.validAmt < 0) {
                                $('#txtTodayValidAmount').addClass('txtRed');
                            }
                            if (data.basicInfo.t.memberWinLose < 0) {
                                $('#txtTodayMemberWinLose').addClass('txtRed');
                            }
                            if (data.basicInfo.t.winLose < 0) {
                                $('#txtTodayWinLose').addClass('txtRed');
                            }
                            if (data.basicInfo.y.turnOver < 0) {
                                $('#txtYesterdayTurnOver').addClass('txtRed');
                            }
                            if (data.basicInfo.y.validAmt < 0) {
                                $('#txtYesterdayValidAmount').addClass('txtRed');
                            }
                            if (data.basicInfo.y.memberWinLose < 0) {
                                $('#txtYesterdayMemberWinLose').addClass('txtRed');
                            }
                            if (data.basicInfo.y.winLose < 0) {
                                $('#txtYesterdayWinLose').addClass('txtRed');
                            }
                        }

                        if (data.outStand != null) {
                            var txt1 = parseFloat(data.outStand.bets).toFixed(2);
                            var txt2 = parseFloat(data.outStand.balance).toFixed(2);

                            $('#txtTotalOutstandingBets').text(txt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTotalOutstandingBalance').text(txt2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.outStand.bets < 0) {
                                $('#txtTotalOutstandingBets').addClass('txtRed');
                            }
                            if (data.outStand.balance < 0) {
                                $('#txtTotalOutstandingBalance').addClass('txtRed');
                            }
                        }

                        if (data.downLine != null) {
                            $('#txtDownlineMembers').text(data.downLine.member.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtDownlineAgents').text(data.downLine.agent.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.downLine.member < 0) {
                                $('#txtDownlineMembers').addClass('txtRed');
                            }
                            if (data.downLine.agent < 0) {
                                $('#txtDownlineAgents').addClass('txtRed');
                            }
                        }

                        if (data.newMember != null) {
                            $('#txtNewMembersToday').text(data.newMember.today.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtNewMembersLastWeek').text(data.newMember.lastWeek.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtNewMembersLastMonth').text(data.newMember.lastMonth.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.newMember.today < 0) {
                                $('#txtNewMembersToday').addClass('txtRed');
                            }
                            if (data.newMember.lastWeek < 0) {
                                $('#txtNewMembersLastWeek').addClass('txtRed');
                            }
                            if (data.newMember.lastMonth < 0) {
                                $('#txtNewMembersLastMonth').addClass('txtRed');
                            }
                        }

                        $(".fa-spin").css("display", "none");
                        $(".card-sub-value").css("display", "block");
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
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

            var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var monthNamesTH = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
            var monthNamesCH = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

            var date = new Date();
            var txtMonth = "";

            if (localStorage.getItem("Language") == "English") {
                txtMonth = "in " + monthNames[date.getMonth()];
            }
            else if (localStorage.getItem("Language") == "Thai") {
                txtMonth = "เดือน " + monthNamesTH[date.getMonth()];
            }
            else if (localStorage.getItem("Language") == "Chinese") {
                txtMonth = "在 " + monthNamesCH[date.getMonth()];
            }

            var txtYear = date.getFullYear();
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
            var daysOfMonth = [];

            var jsData = {};
            var arr = []
            jsData.arr = arr;

            var jsData2 = {};
            var arr2 = []
            jsData2.arr2 = arr2;

            for (var d = firstDay; d <= lastDay; d.setDate(d.getDate() + 1)) {
                var data = {
                    "_id": d.getDate(),
                    "winLose": 0,
                    "validAmt": 0,
                    "count": 0
                }
                jsData.arr.push(data);

                var data2 = {
                    "_id": d.getDate(),
                    "count": 0
                }
                jsData2.arr2.push(data2);

                daysOfMonth.push(d.getDate());
            }

            var arr1 = [];
            var arr2 = [];
            var arr3 = [];
            var arr_1 = [];
            $.ajax({
                url: apiURL + '/apiRoute/dashBoardRouter/balanceInfo/grap2',
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        var headGraph = "";
                        var headGraph2 = "";
                        var date = "";
                        var title = "";
                        var txt1 = "";
                        var txt2 = "";
                        var txt3 = "";
                        var txt4 = "";

                        if (localStorage.getItem("Language") == "English") {
                            headGraph = "Balance info";
                            title = "Value: {point.y:,.0f}";
                            txt1 = "Win Lose";
                            txt2 = "Valid Turn Over";
                            txt3 = "Ticket";
                            headGraph2 = "New Members";
                            txt4 = "Member";
                        }
                        else if (localStorage.getItem("Language") == "Thai") {
                            headGraph = "ข้อมูลยอดคงเหลือ";
                            title = "มูลค่า: {point.y:,.0f}";
                            txt1 = "แพ้ชนะ";
                            txt2 = "ยอดเล่นจริง";
                            txt3 = "ตั๋ว";
                            headGraph2 = "สมาชิกใหม่";
                            txt4 = "สมาชิก";
                        }
                        else if (localStorage.getItem("Language") == "Chinese") {
                            headGraph = "余额信息";
                            title = "Value: {point.y:,.0f}";
                            txt1 = "赢输";
                            txt2 = "下注金额";
                            txt3 = "下注单";
                            headGraph2 = "新会员";
                            txt4 = "会员";
                        }

                        var obj = data.turn;
                        for (var i = 0; i < jsData.arr.length; i++) {
                            for (var x = 0; x < obj.length; x++) {
                                var objTxt = obj[x];
                                if (jsData.arr[i]._id == objTxt._id) {
                                    jsData.arr[i].winLose = objTxt.winLose;
                                    jsData.arr[i].validAmt = objTxt.validAmt;
                                    jsData.arr[i].count = objTxt.count;
                                }
                            }

                            arr1.push(jsData.arr[i].winLose);
                            arr2.push(jsData.arr[i].validAmt);
                            arr3.push(jsData.arr[i].count);
                        }

                        var obj2 = data.member;
                        for (var j = 0; j < jsData2.arr2.length; j++) {
                            for (var y = 0; y < obj2.length; y++) {
                                var objTxt2 = obj2[y];
                                if (jsData2.arr2[j]._id == objTxt2._id) {
                                    jsData2.arr2[j].count = objTxt2.count;
                                }
                            }

                            arr_1.push(jsData2.arr2[j].count);
                        }

                        Highcharts.setOptions({
                            lang: {
                                thousandsSep: ','
                            }
                        });

                        Highcharts.chart('container', {
                            title: {
                                text: headGraph
                            },
                            exporting: {
                                enabled: false
                            },
                            subtitle: {
                                text: txtMonth + "," + txtYear
                            },
                            yAxis: {
                                title: {
                                    enabled: false
                                }
                            },
                            credits: {
                                enabled: false
                            },
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'top'
                            },
                            plotOptions: {
                                series: {
                                    pointStart: 1
                                }
                            },
                            tooltip: {
                                headerFormat: '',
                                pointFormat: title
                            },
                            series: [{
                                name: txt1,
                                data: arr1,
                                color: '#CFA137'
                            }, {
                                name: txt2,
                                data: arr2,
                                color: '#5fa76f'
                            }, {
                                name: txt3,
                                data: arr3,
                                color: '#d14c58'
                            }]
                        });

                        Highcharts.chart('container2', {
                            title: {
                                text: headGraph2
                            },
                            exporting: {
                                enabled: false
                            },
                            subtitle: {
                                text: txtMonth + "," + txtYear
                            },
                            yAxis: {
                                title: {
                                    enabled: false
                                }
                            },
                            credits: {
                                enabled: false
                            },
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'top'
                            },
                            plotOptions: {
                                series: {
                                    pointStart: 1
                                }
                            },
                            tooltip: {
                                headerFormat: '',
                                pointFormat: title
                            },
                            series: [{
                                name: txt4,
                                data: arr_1,
                                color: '#CFA137'
                            }]
                        });

                        $(".zoneG1 , .zoneG2").css("display", "none");
                        $("#container , #container2").css("display", "block");
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
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
