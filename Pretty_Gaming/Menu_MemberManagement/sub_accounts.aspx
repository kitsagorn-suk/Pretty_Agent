<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sub_accounts.aspx.cs" Inherits="Pretty_Gaming.Menu_MemberManagement.sub_accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .overflowlogin {
            width: 12em;
            margin: 0px !important;
            white-space: nowrap;
            overflow: hidden;
            font-size: 0.8rem;
        }

        .overflows {
            width: 7em;
            margin: 0px !important;
            white-space: nowrap;
            overflow: hidden;
            font-size: 0.8rem;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Member Management"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Sub Accounts"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-7">
            <h1 set-lan="text:Sub Accounts"></h1>
        </div>
        <%--<div class="col-md-5" style="text-align: right;">
            <a href="/Menu_MemberManagement/sub_accounts_add.aspx" id="btnAddSub" class="btn btn-primary" set-lan="html:Add Sub Account_"></a>
        </div>--%>
    </div>
    <%-- <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row col-md-4">
            <label for="email" class="col-4 col-form-label alignright" set-lan="text:Login name_"></label>
            <div class="col-8">
                <input type="text" class="form-control" id="searchLoginname">
            </div>
        </div>
        <div class="form-group row col-md-1">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search"></button>
        </div>
    </div>--%>
    <%-- <div id="navMenu" style="margin-top: 1rem; color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-left: 10px !important; padding-right: 10px !important;">
    </div>--%>
    <div class="table-wrapper" style="margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 3%;" set-lan="text:No"></th>
                    <th style="width: 2%; text-align: left; padding-left: 5px;" set-lan="text:Login name"></th>
                    <th style="width: 2%; text-align: left; padding-left: 5px;" set-lan="text:Nickname"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Phone"></th>
                    <th style="width: 4%;" class="EDIT" set-lan="text:Edit"></th>
                    <th style="width: 4%;" class="EDIT" set-lan="text:Password"></th>
                    <th style="width: 6%;" set-lan="text:Lock"></th>
                    <th style="width: 5%;" set-lan="text:Account"></th>
                    <th style="width: 5%;" set-lan="text:Member"></th>
                    <th style="width: 5%;" set-lan="text:Stock"></th>
                    <th style="width: 5%;" set-lan="text:Report"></th>
                    <th style="width: 5%;" set-lan="text:Payment"></th>
                    <th style="width: 9%;" set-lan="text:Last login date"></th>
                    <th style="width: 2%; text-align: left; padding-left: 5px;" set-lan="text:Last login IP"></th>
                    <th style="width: 2%;" class="EDIT" set-lan="text:Delete"></th>
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
                    <td></td>
                    <td></td>
                    <td></td>
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
    <!-- Modal -->
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
                    <label set-lan="text:Edit sub account success"></label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Password"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="html:New Password"></label>
                        <input type="text" class="form-control col-8" autocomplete="off" id="password" maxlength="24" />
                        <label class="col-4 col-form-label alignright"></label>
                        <%--<small class="col-8 text-muted form-text" set-lan="text:textnumberonly"></small>--%>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveNewPass();" set-lan="text:Save"></button>
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
    <div class="modal fade" id="modalDeleteSub" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Delete Message"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label set-lan="text:Confirm delete this item ?"></label>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="DeleteSub()" type="button" set-lan="text:OK"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            $("#myModalLoad").modal();

            $("#tbData > tbody").html("");

            $.ajax({
                url: apiURL + '/apiRoute/member/supList',
                type: 'POST',
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": localStorage.getItem("Token")
                },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        var arr = data.data;
                        var dataTotal = arr.sort(rankingSorter("active"));
                        var no = 1;
                        var htmlData = "";
                        for (var i = 0; i < dataTotal.length; i++) {
                            if (dataTotal[i].active == false) {
                                htmlData += "<tr style='background-color: #e9ecef;'>";
                            }
                            else {
                                htmlData += "<tr>";
                            }

                            htmlData += "<td class='aligncenter'>" + no + "</td>";
                            htmlData += "<td><p class='overflowlogin ellipsis' title='" + dataTotal[i].username + "'>" + dataTotal[i].username + "</p></td>";

                            if (dataTotal[i].nickname == null || dataTotal[i].nickname == "") {
                                dataTotal[i].nickname = "";
                            }

                            if (dataTotal[i].tel == null || dataTotal[i].tel == "") {
                                dataTotal[i].tel = "";
                            }

                            if (dataTotal[i].nickname == "") {
                                htmlData += "<td class='colNickname'></td>";
                            }
                            else {
                                htmlData += "<td class='colNickname'><p class='overflows ellipsis' title='" + dataTotal[i].nickname + "'>" + dataTotal[i].nickname + "</p></td>";
                            }

                            if (dataTotal[i].tel == "") {
                                htmlData += "<td class='colTel'></td>";
                            }
                            else {
                                htmlData += "<td class='colTel'>" + dataTotal[i].tel + "</td>";
                            }

                            htmlData += "<td class='aligncenter colEdit'><a class='link' attr-row='" + no + "' attr-id='" + dataTotal[i]._id + "' attr-nickname='" + dataTotal[i].nickname + "' attr-tel='" + dataTotal[i].tel + "' attr-active='" + dataTotal[i].active + "' attr-account='" + dataTotal[i].access_account + "' attr-member='" + dataTotal[i].access_member + "' attr-stock='" + dataTotal[i].access_stock + "' attr-report='" + dataTotal[i].access_report + "' attr-payment='" + dataTotal[i].access_payment + "' onclick='showEdit(this);'><i class='fas fa-pencil-alt'></i></a></td>";
                            htmlData += "<td class='aligncenter colEditPass'><a class='link' attr-id='" + dataTotal[i]._id + "' onclick='showEditPass(this);'><i class='fas fa-pencil-alt'></i></a></td>";

                            if (dataTotal[i].active == true) {
                                htmlData += "<td class='aligncenter colActive'><label set-lan='text:Unlock'></label></td>";
                            }
                            else if (dataTotal[i].active == false) {
                                htmlData += "<td class='aligncenter colActive'><label set-lan='text:Lock'></label></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter colActive'><label set-lan='text:Unlock'></label></td>";
                            }

                            htmlData += "<td class='aligncenter colAccount'><label set-lan='text:" + dataTotal[i].access_account + "'></label></td>";
                            htmlData += "<td class='aligncenter colMember'><label set-lan='text:" + dataTotal[i].access_member + "'></label></td>";
                            htmlData += "<td class='aligncenter colStock'><label set-lan='text:" + dataTotal[i].access_stock + "'></label></td>";
                            htmlData += "<td class='aligncenter colReport'><label set-lan='text:" + dataTotal[i].access_report + "'></label></td>";
                            htmlData += "<td class='aligncenter colPayment'><label set-lan='text:" + dataTotal[i].access_payment + "'></label></td>";

                            if (dataTotal[i].lastLogin != null) {
                                var dataLogin = dataTotal[i].lastLogin.date;
                                var dateLog = new Date(dataLogin);
                                var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                htmlData += "<td class='aligncenter'>" + txtDate + "</td>";

                                if (dataTotal[i].lastLogin.ip != null) {
                                    htmlData += "<td><p class='overflow ellipsis' title='" + dataTotal[i].lastLogin.ip + "'>" + dataTotal[i].lastLogin.ip + "</p></td>";
                                }
                                else {
                                    htmlData += "<td>-</td>";
                                }
                            }
                            else {
                                htmlData += "<td class='aligncenter'>-</td>";
                                htmlData += "<td>-</td>";
                            }

                            htmlData += "<td class='aligncenter'><a class='link' onclick='viewDelete(\"" + dataTotal[i]._id + "\");'><i class='fas fa-trash'></i></a></td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        if (dataTotal.length == 0) {
                            $("#tbData > tbody").append("<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                        }
                        else {
                            $("#tbData > tbody").append(htmlData);
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
        });

        var id_Delete = "";
        function viewDelete(idItem) {
            id_Delete = idItem;
            $('#modalDeleteSub').modal();
        }

        var idEditPass = "";
        function showEditPass(ele) {
            idEditPass = ele.getAttribute("attr-id");
            $('#password').val("");
            $('#modalPassword').modal();
        }

        function saveNewPass() {
            $("#myModalLoad").modal();

            if ($('#password').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'New Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                var dataAdd = new Object();
                dataAdd.password = $('#password').val();
                dataAdd._id = idEditPass;
                $.ajax({
                    url: apiURL + "/apiRoute/member/updatePasswordSup",
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Change new password success");
                            SetLan(localStorage.getItem("Language"));
                            $('#modalPassword').modal('hide');
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal();
                            setTimeout(function () {
                                location.reload();
                            }, 1500);
                        }
                        else if (data.code == 997 && data.error_filed == "password") {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Invalid input format 'password' field. (The password must have at least 8 characters.)");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else {
                            document.getElementById('lbAlert').innerHTML = data.msg;
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        } $('#modalAlert').modal('show');
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

        function showEdit(ele) {
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colNickname").html("<div><input type='text' style='width: 120px;' name='txtNickname_" + ele.getAttribute("attr-row") + "' value='" + ele.getAttribute("attr-nickname") + "' onkeypress='clsAlphaTHNoOnly(event)' maxlength='30'></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colTel").html("<div><input type='text' style='width: 120px;' name='txtTel_" + ele.getAttribute("attr-row") + "' value='" + ele.getAttribute("attr-tel") + "' maxlength='15' onkeypress='return isNumberKey(event)'></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colActive").html("<div><input type='radio' name='active_" + ele.getAttribute("attr-row") + "' value='true' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Unlock'></label></div><div><input type='radio' name='active_" + ele.getAttribute("attr-row") + "' value='false' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Lock'></label></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colActive").removeClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colAccount").html("<div><input type='radio' name='account_" + ele.getAttribute("attr-row") + "' value='OFF' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Off'></label></div><div><input type='radio' name='account_" + ele.getAttribute("attr-row") + "' value='VIEW' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:View'></label></div><div><input type='radio' name='account_" + ele.getAttribute("attr-row") + "' value='EDIT' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Edit'></label></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colAccount").removeClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colMember").html("<div><input type='radio' name='member_" + ele.getAttribute("attr-row") + "' value='OFF' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Off'></label></div><div><input type='radio' name='member_" + ele.getAttribute("attr-row") + "' value='VIEW' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:View'></label></div><div><input type='radio' name='member_" + ele.getAttribute("attr-row") + "' value='EDIT' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Edit'></label></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colMember").removeClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colStock").html("<div><input type='radio' name='stock_" + ele.getAttribute("attr-row") + "' value='OFF' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Off'></label></div><div><input type='radio' name='stock_" + ele.getAttribute("attr-row") + "' value='VIEW' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:View'></label></div><div><input type='radio' name='stock_" + ele.getAttribute("attr-row") + "' value='EDIT' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Edit'></label></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colStock").removeClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colReport").html("<div><input type='radio' name='report_" + ele.getAttribute("attr-row") + "' value='OFF' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Off'></label></div><div><input type='radio' name='report_" + ele.getAttribute("attr-row") + "' value='VIEW' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:View'></label></div><div><input type='radio' name='report_" + ele.getAttribute("attr-row") + "' value='EDIT' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Edit'></label></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colReport").removeClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colPayment").html("<div><input type='radio' name='payment_" + ele.getAttribute("attr-row") + "' value='OFF' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Off'></label></div><div><input type='radio' name='payment_" + ele.getAttribute("attr-row") + "' value='VIEW' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:View'></label></div><div><input type='radio' name='payment_" + ele.getAttribute("attr-row") + "' value='EDIT' style='opacity: initial !important; pointer-events: initial !important;'><label class='txtRadio' set-lan='text:Edit'></label></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colPayment").removeClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colEdit").html("<div><a class='link' style='font-size: 1.1rem;' onclick='saveEdit(\"" + ele.getAttribute("attr-id") + "\",\"" + ele.getAttribute("attr-row") + "\");'><i class='far fa-save'></i></a></div><div style='margin-top: 5px;'><a class='link' style='font-size: 1.1rem; margin-top: .2rem;' onclick='cancelEdit(\"" + ele.getAttribute("attr-active") + "\",\"" + ele.getAttribute("attr-row") + "\",\"" + ele.getAttribute("attr-id") + "\",\"" + ele.getAttribute("attr-nickname") + "\",\"" + ele.getAttribute("attr-tel") + "\",\"" + ele.getAttribute("attr-account") + "\",\"" + ele.getAttribute("attr-member") + "\",\"" + ele.getAttribute("attr-stock") + "\",\"" + ele.getAttribute("attr-report") + "\",\"" + ele.getAttribute("attr-payment") + "\");'><i class='far fa-times-circle'></i></a></div>");
            $("#tbData > tbody > tr:nth-child(" + ele.getAttribute("attr-row") + ") > td.colEditPass").html("<div><a class='link' attr-id='" + ele.getAttribute("attr-id") + "' onclick='showEditPass(this);'><i class='fas fa-pencil-alt'></i></a></div>");
            $("input[name='account_" + ele.getAttribute("attr-row") + "'][value='" + ele.getAttribute("attr-account") + "']").prop('checked', true);
            $("input[name='member_" + ele.getAttribute("attr-row") + "'][value='" + ele.getAttribute("attr-member") + "']").prop('checked', true);
            $("input[name='stock_" + ele.getAttribute("attr-row") + "'][value='" + ele.getAttribute("attr-stock") + "']").prop('checked', true);
            $("input[name='report_" + ele.getAttribute("attr-row") + "'][value='" + ele.getAttribute("attr-report") + "']").prop('checked', true);
            $("input[name='payment_" + ele.getAttribute("attr-row") + "'][value='" + ele.getAttribute("attr-payment") + "']").prop('checked', true);
            $("input[name='active_" + ele.getAttribute("attr-row") + "'][value='" + ele.getAttribute("attr-active") + "']").prop('checked', true);

            SetLan(localStorage.getItem("Language"));
        }

        function cancelEdit(active, row, _id, nickname, tel, account, member, stock, report, payment) {
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colNickname").text(nickname);
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colTel").text(tel);
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colEdit").html("<a class='link' attr-row='" + row + "' attr-id='" + _id + "' attr-nickname='" + nickname + "' attr-active='" + active + "' attr-tel='" + tel + "' attr-account='" + account + "' attr-member='" + member + "' attr-stock='" + stock + "' attr-report='" + report + "' attr-payment='" + payment + "' onclick='showEdit(this);'><i class='fas fa-pencil-alt'></i></a>");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colEditPass").html("<a class='link' attr-id='" + _id + "' onclick='showEditPass(this);'><i class='fas fa-pencil-alt'></i></a>");

            if (active == "true") {
                $("#tbData > tbody > tr:nth-child(" + row + ") > td.colActive").html("<label set-lan='text:Unlock'></label>");
            }
            else if (active == "false") {
                $("#tbData > tbody > tr:nth-child(" + row + ") > td.colActive").html("<label set-lan='text:Lock'></label>");
            }

            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colAccount").html("<label set-lan='text:" + account + "'></label>");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colMember").html("<label set-lan='text:" + member + "'></label>");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colStock").html("<label set-lan='text:" + stock + "'></label>");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colReport").html("<label set-lan='text:" + report + "'></label>");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colPayment").html("<label set-lan='text:" + payment + "'></label>");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colActive").addClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colAccount").addClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colMember").addClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colStock").addClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colReport").addClass("aligncenter");
            $("#tbData > tbody > tr:nth-child(" + row + ") > td.colPayment").addClass("aligncenter");

            SetLan(localStorage.getItem("Language"));
        }

        function DeleteSub() {
            $("#myModalLoad").modal();

            var dataAdd = new Object();
            dataAdd._id = id_Delete;
            $.ajax({
                url: apiURL + '/apiRoute/member/deleteSup',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:Delete sub account success");
                        SetLan(localStorage.getItem("Language"));
                        $('#modalDeleteSub').modal('hide');
                        $("#myModalLoad").modal('hide');
                        $('#modalAlert').modal();
                        setTimeout(function () {
                            location.reload();
                        }, 1500);
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

        function saveEdit(idUser, noRow) {
            $("#myModalLoad").modal();

            var nickname = $("input[name='txtNickname_" + noRow + "']").val();
            var tel = $("input[name='txtTel_" + noRow + "']").val();
            var account = $("input[name='account_" + noRow + "']:checked").val();
            var member = $("input[name='member_" + noRow + "']:checked").val();
            var stock = $("input[name='stock_" + noRow + "']:checked").val();
            var report = $("input[name='report_" + noRow + "']:checked").val();
            var payment = $("input[name='payment_" + noRow + "']:checked").val();
            var active = $("input[name='active_" + noRow + "']:checked").val();

            var dataAdd = new Object();
            dataAdd.nickname = nickname;
            dataAdd.tel = tel;
            if (active == "true") {
                dataAdd.active = true;
            }
            else if (active == "false") {
                dataAdd.active = false;
            }
            dataAdd.access_account = account;
            dataAdd.access_member = member;
            dataAdd.access_stock = stock;
            dataAdd.access_report = report;
            dataAdd.access_payment = payment;
            dataAdd._id = idUser;
            $.ajax({
                url: apiURL + '/apiRoute/member/updateSup',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        $("#myModalLoad").modal('hide');
                        $('#modalAlertSuccess').modal();

                        setTimeout(function () {
                            location.reload();
                        }, 1500);
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

        function rankingSorter(firstKey, secondKey) {
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
                        return 0;
                    }
                }
            }
        }
    </script>
</asp:Content>
