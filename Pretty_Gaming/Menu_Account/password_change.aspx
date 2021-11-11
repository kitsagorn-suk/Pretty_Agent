<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="password_change.aspx.cs" Inherits="Pretty_Gaming.password_change" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#" set-lan="text:Account"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Password"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Change Password"></h1>
    <div class="section-group mb-4 col-6">
        <div class="form-row">
            <div class="form-group col-12">
                <div class="form-group row">
                    <label for="username" class="col-3 col-form-label" set-lan="text:Username"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="username" disabled="disabled" autocomplete="off">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="oldpassword" class="col-3 col-form-label" set-lan="html:Old Password"></label> 
                    <div class="col-9">
                        <input type="text" class="form-control" id="oldpassword" autocomplete="off" maxlength="24">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="newpassword" class="col-3 col-form-label" set-lan="html:New Password"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="newpassword" autocomplete="off" maxlength="24">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="confirmpassword" class="col-3 col-form-label" set-lan="html:Confirm Password"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="confirmpassword" autocomplete="off" maxlength="24">
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center;">
                <button class="btn btn-yellow font-weight-bold" onclick="savePassword()" type="button" set-lan="text:Save New Password"></button>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalAlertSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" style="z-index: 9999;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Success"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label set-lan="text:Change new password success"></label>
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
        var token = "";
        $(document).ready(function () {
            $("#menuAccount , #menuAccount > a").addClass("active");
            $("#menuAccount > div").css("display", "block");

            $("#myModalLoad").modal();
            token = localStorage.getItem("Token");
            $.ajax({
                url: apiURL + '/apiRoute/member/profile',
                type: 'POST',
                headers: {
                    "Authorization": token,
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        $('#username').val(data.username);
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

        function savePassword() {
            $("#myModalLoad").modal();
            if ($('#oldpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Old Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#newpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'New Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#confirmpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Confirm Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#newpassword').val() != $('#confirmpassword').val()) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:New password doesn't match confirm password");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#oldpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Old Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                var dataAdd = new Object();
                dataAdd.oldPassword = $('#oldpassword').val();
                dataAdd.newPassword = $('#confirmpassword').val();
                $.ajax({
                    url: apiURL + '/apiRoute/member/changeMyPassword',
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
                                window.location.href = "/Menu_Account/password_change.aspx";
                            }, 1500);
                        }
                        else if (data.code == 998) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:The old password you have entered is incorrect.");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else if (data.code == 997) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Invalid input format 'password' field. (The password must have at least 8 characters.)");
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
    </script>
</asp:Content>
