<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sub_accounts_add.aspx.cs" Inherits="Pretty_Gaming.Menu_MemberManagement.sub_accounts_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Member Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/sub_accounts.aspx" set-lan="text:Sub Accounts"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Add Sub Account"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Add Sub Account"></h1>
    <div class="section-group mb-4">
        <h4 set-lan="text:Basic Info"></h4>
        <div class="form-row">
            <div class="form-group col-6">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Username-"></label>
                    <label for="username" class="col-3 col-form-label" id="mainUser"></label>
                    <div class="col-5">
                         <input type="text" id="username" class="form-control" autocomplete="off" onkeypress="clsAlphaNoOnly(event)" maxlength="30" />
                         <small class="text-muted form-text" set-lan="text:textnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Password-"></label>
                    <div class="col-8">
                         <input type="text" id="password" class="form-control" autocomplete="off" maxlength="24" />
                         <%--<small class="text-muted form-text" set-lan="text:textnumberonly"></small>--%>
                    </div>
                </div>
            </div>
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Nickname"></label>
                    <div class="col-8">
                        <input type="text" id="nickname" class="form-control" autocomplete="off" onkeypress="clsAlphaTHNoOnly(event)" maxlength="30" />
                         <small class="text-muted form-text" set-lan="text:textTHnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                    <div class="col-8">
                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="15" />
                        <small class="text-muted form-text" set-lan="text:numberonly"></small>
                    </div>
                </div>
            </div>
        </div>
        <h4 set-lan="text:Permissions"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group">
                     <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Account"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="AccountRadio_off" name="AccountRadio" value="OFF">
                                <label class="form-check-label red-text" for="AccountRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked class="form-check-input" id="AccountRadio_view" name="AccountRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="AccountRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="AccountRadio_edit" name="AccountRadio" value="EDIT">
                                <label class="form-check-label green-text" for="AccountRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Member Management"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MemberManagementRadio_off" name="MemberManagementRadio" value="OFF">
                                <label class="form-check-label red-text" for="MemberManagementRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked class="form-check-input" id="MemberManagementRadio_view" name="MemberManagementRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="MemberManagementRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MemberManagementRadio_edit" name="MemberManagementRadio" value="EDIT">
                                <label class="form-check-label green-text" for="MemberManagementRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Stock Management"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="StockManagementRadio_off" name="StockManagementRadio" value="OFF">
                                <label class="form-check-label red-text" for="StockManagementRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked class="form-check-input" id="StockManagementRadio_view" name="StockManagementRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="StockManagementRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="StockManagementRadio_edit" name="StockManagementRadio" value="EDIT">
                                <label class="form-check-label green-text" for="StockManagementRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Report"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="ReportRadio_off" name="ReportRadio" value="OFF">
                                <label class="form-check-label red-text" for="ReportRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked class="form-check-input" id="ReportRadio_view" name="ReportRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="ReportRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="ReportRadio_edit" name="ReportRadio" value="EDIT">
                                <label class="form-check-label green-text" for="ReportRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Payment"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="PaymentRadio_off" name="PaymentRadio" value="OFF">
                                <label class="form-check-label red-text" for="PaymentRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked class="form-check-input" id="PaymentRadio_view" name="PaymentRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="PaymentRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="PaymentRadio_edit" name="PaymentRadio" value="EDIT">
                                <label class="form-check-label green-text" for="PaymentRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center; margin-top: 1rem;">
                <button class="btn btn-yellow font-weight-bold" onclick="AddSubAccount()" type="button" set-lan="text:Add Sub Account"></button>
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
                    <label set-lan="text:Save add new sub account success"></label>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            $("#mainUser").text(localStorage.getItem("Username") + "@");
        });

        function ShowModal() {
            $('#modalAlert').modal('show');
        }

        function AddSubAccount() {
            $("#myModalLoad").modal();
            if ($('#username').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#password').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                var dataAdd = new Object();
                dataAdd.username = $('#username').val();
                dataAdd.password = $('#password').val();
                if ($('#nickname').val() == "") {
                    dataAdd.nickname = null;
                }
                else {
                    dataAdd.nickname = $('#nickname').val();
                }

                if ($('#phonenumber').val() == "") {
                    dataAdd.tel = null;
                }
                else {
                    dataAdd.tel = $('#phonenumber').val();
                }
                dataAdd.active = true;
                dataAdd.access_account = $("input[name='AccountRadio']:checked").val();
                dataAdd.access_member = $("input[name='MemberManagementRadio']:checked").val();
                dataAdd.access_stock = $("input[name='StockManagementRadio']:checked").val();
                dataAdd.access_report = $("input[name='ReportRadio']:checked").val();
                dataAdd.access_payment = $("input[name='PaymentRadio']:checked").val();
                $.ajax({
                    url: apiURL + "/apiRoute/member/createSup",
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlertSuccess').modal();
                            setTimeout(function () {
                                window.location.href = "/Menu_MemberManagement/sub_accounts.aspx";
                            }, 1500);
                        }
                        else if (data.code == 997 && data.error_filed == "password") {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Invalid input format 'password' field. (The password must have at least 8 characters.)");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else if (data.code == 997 && data.error_filed == "username") {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Invalid input format 'username' field. (The username must have at least 8 characters.)");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else if (data.code == 11000 || data.code == 998) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:E11000 duplicate key error collection");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else {
                            document.getElementById('lbAlert').innerHTML = data.msg;
                            SetLan(localStorage.getItem("Language"));
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
    </script>
</asp:Content>
