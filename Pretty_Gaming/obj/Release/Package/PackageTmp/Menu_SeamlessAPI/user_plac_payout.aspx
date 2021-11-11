<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="user_plac_payout.aspx.cs" Inherits="Pretty_Gaming.Menu_SeamlessAPI.user_plac_payout" %>

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
            <li class="breadcrumb-item"><a href="" set-lan="text:Seamless API"></a></li>
            <li class="breadcrumb-item active" set-lan="text:User Place Payout"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:User Place Payout"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Ticket ID_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchTicketID">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search"></button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="wrapper" style="float: right;">
                <section>
                    <div class="data-container"></div>
                    <div id="pagination-demo2"></div>
                </section>
            </div>
        </div>
    </div>
        <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px; table-layout: fixed; width: 100%;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 10%;" set-lan="text:No"></th>
                    <th style="width: 10%; text-align: left; padding-left: 5px;" set-lan="text:Ticket ID"></th>
                    <th style="width: 10%; text-align: left; padding-left: 5px;" set-lan="text:Bet Status"></th>
                    <th style="width: 10%; text-align: left; padding-left: 5px;" set-lan="text:Seamless Status"></th>
                    <th style="width: 60%; text-align: left; padding-left: 5px;" set-lan="text:Request List"></th>
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
                </tr>
            </tfoot>
        </table>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menuSeamlessAPI , #menuSeamlessAPI > a").addClass("active");
            $("#menuSeamlessAPI > div").css("display", "block");

            GetData(1, 20);
        });

        var NumPage;
        var TotalData;
        function GetData(page, limit) {
            $("#myModalLoad").modal();

            NumPage = page;
            if (NumPage == null) {
                NumPage = 1;
            }

            var dataAdd = new Object();
            dataAdd.limit = limit;
            dataAdd.page = NumPage;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/seamlessApi/userPlaceBetPayout",
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
                        NumPage = data.page;
                        TotalData = data.totalDocs;
                        GetNumPage(NumPage, limit);
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

        function GetNumPage(NumPage, limit) {
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
                            GetTable(NumPage, limit);
                        }
                    });
                })('demo2');
            });
        }

        function GetTable(Num, limit) {
            var htmlData = "";
            $("#tbData > tbody").html("");
            var dataAdd = new Object();
            dataAdd.page = Num;
            dataAdd.limit = limit;
            $.ajax({
                url: apiURL + "/apiRoute/reportRouter/seamlessApi/userPlaceBetPayout",
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
                        var dataTotal = data.docs;
                        var no = 1;
                        var total = 0;
                        if (dataTotal.length > 0) {
                            for (var i = 0; i < dataTotal.length; i++) {
                                var obj = dataTotal[i];
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + (((Num - 1) * 20) + no) + "</td>";
                                htmlData += "<td>" + obj.ticketId + "</td>";
                                htmlData += "<td>" + obj.status + "</td>";
                                htmlData += "<td>" + obj.seamlessStatus + "</td>";
                                htmlData += "<td><button type='button' class='btnData btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='showDetail(\"" + i + "\", this);' style='line-height: 0rem !important;'>View</button>";

                                htmlData += "<div style='display: none;' class='rowData " + i + "'>";
                                htmlData += "<table class='table table-border' style='table-layout: fixed; width: 100%; margin-top: .5rem;'>";
                                htmlData += "<thead class='rgba-green-slight'>";
                                htmlData += "<tr>";
                                htmlData += "<th style='width: 20%;' set-lan='text:Date'></th>";
                                htmlData += "<th style='width: 80%; text-align: left; padding-left: 5px;' set-lan='text:Logs'></th>";
                                htmlData += "</tr>";
                                htmlData += "</thead>";
                                htmlData += "<tbody>";
                                var requestData = obj.requestList;
                                for (var x = 0; x < requestData.length; x++) {
                                    htmlData += "<tr>";
                                    htmlData += "<td style='text-align: center;'>";
                                    var dateLog = new Date(requestData[x].date);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                    htmlData += txtDate;
                                    htmlData += "</td>";
                                    //var txtObj = JSON.parse(requestData[x].logs);
                                    //var total = JSON.stringify(txtObj, undefined, 4);
                                    htmlData += "<td><textarea rows='4' cols='75'>" + requestData[x].logs + "</textarea></td>";
                                    htmlData += "</tr>";
                                }

                                htmlData += "</tbody>";
                                htmlData += "</table>";
                                htmlData += "</div>";
                                htmlData += "</td>";
                                htmlData += "</tr>";
                                no++;
                            }

                            $("#tbData > tbody").append(htmlData);
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }
                        else {
                            htmlData += "<tr>";
                            htmlData += "<td colspan='5' class='aligncenter' set-lan='text:No data.'></td>";
                            htmlData += "</tr>";

                            $("#tbData > tbody").append(htmlData);
                            SetLan(localStorage.getItem("Language"));
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

        var el;
        function showDetail(ele, element) {
            $(".rowData").css("display", "none");
            $(".btnData").text("View");

            if (ele == el) {
                $("." + ele + "").css("display", "none");
                el = "";
                $(element).text("View");
            }
            else {
                $("." + ele + "").css("display", "block");
                el = ele;
                $(element).text("Close");
            }
        }
    </script>
</asp:Content>