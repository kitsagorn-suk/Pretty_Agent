<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="announcements.aspx.cs" Inherits="Pretty_Gaming.Menu_Settings.announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Announcements"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Message"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Message"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;">
            <a class="btn btn-primary" onclick="addAnnouncement();" style="color: #2F80ED !important;" set-lan="html:Add Message_"></a>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Description_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchDescription">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search"></button>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 1em; margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 5%;" set-lan="text:No"></th>
                    <th style="width: 30%; text-align: left; padding-left: 5px;" set-lan="text:Description"></th>
                    <th style="width: 10%;" set-lan="text:Create date"></th>
                    <th style="width: 10%;" set-lan="text:Modify date"></th>
                    <th style="width: 10%; text-align: left; padding-left: 5px;" set-lan="text:Update by"></th>
                    <th style="width: 5%;" class="zonenone" set-lan="text:Edit"></th>
                    <th style="width: 5%;" class="zonenone" set-lan="text:Delete"></th>
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
                    <td class="zonenone"></td>
                    <td class="zonenone"></td>
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
                    <label id="lbAlertAction"></label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalAddAnnouncement" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Add Message"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" set-lan="html:Description-"></label>
                        <div class="col-9">
                            <textarea id="description" rows="4" cols="50" class="form-control" autocomplete="off"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="SaveAnnouncement()" type="button" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalEditAnnouncement" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Edit Message"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" set-lan="html:Description-"></label>
                        <div class="col-9">
                            <textarea id="descriptionEdit" rows="4" cols="50" class="form-control" autocomplete="off"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="EditAnnouncement()" type="button" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalDeleteAnnouncement" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    <button class="btn btn-yellow font-weight-bold" onclick="DeleteAnnouncement()" type="button" set-lan="text:OK"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menuAnnouncement , #menuAnnouncement > a").addClass("active");
            $("#menuAnnouncement > div").css("display", "block");

            $("#myModalLoad").modal();

            $("#tbData > tbody").html("");

            var htmlData = "";
            var no = 1;
            $.ajax({
                url: apiURL + '/apiRoute/agentAmnRouter/list',
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
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + no + "</td>";
                                htmlData += "<td style='word-break: break-all;'>" + obj.msg + "</td>";

                                if (obj.createdDate != null) {
                                    var dateLog = new Date(obj.createdDate);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                    htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                }

                                if (obj.updateDate != null) {
                                    var dateLog = new Date(obj.updateDate);
                                    var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                    htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                }

                                if (obj.updateBy != null) {
                                    htmlData += "<td><p class='overflowlg ellipsis' title='" + obj.updateBy + "'>" + obj.updateBy + "</p></td>";
                                }
                                else {
                                    htmlData += "<td>-</td>";
                                }

                                htmlData += "<td class='aligncenter' class='zonenone'><a class='link' attr-id='" + obj._id + "' attr-des='" + obj.msg + "' onclick='viewEdit(this);'><i class='fas fa-pencil-alt'></i></a></td>";
                                htmlData += "<td class='aligncenter' class='zonenone'><a class='link' onclick='viewDelete(\"" + obj._id + "\");'><i class='fas fa-trash'></i></a></td>";
                                htmlData += "</tr>";
                                no++;
                            }

                            $("#tbData > tbody").append(htmlData);
                            $("#myModalLoad").modal('hide');
                        }
                        else {
                            $("#tbData > tbody").append("<tr><td colspan='7' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            $("#myModalLoad").modal('hide');
                            SetLan(localStorage.getItem("Language"));
                        }

                        console.log(data.length);
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

        function addAnnouncement() {
            $('#modalAddAnnouncement').modal();
        }

        function SaveAnnouncement() {
            $("#myModalLoad").modal();
            if ($('#description').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Description' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                var dataAdd = new Object();
                dataAdd.msg = $('#description').val();
                $.ajax({
                    url: apiURL + '/apiRoute/agentAmnRouter',
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            $('#modalAddAnnouncement').modal('hide');

                            document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Add new message success");
                            SetLan(localStorage.getItem("Language"));

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
        }

        var id_Edit = "";
        function viewEdit(ele) {
            id_Edit = ele.getAttribute("attr-id");
            $('#descriptionEdit').val(ele.getAttribute("attr-des"));
            $('#modalEditAnnouncement').modal();
        }

        function EditAnnouncement() {
            $("#myModalLoad").modal();
            if ($('#descriptionEdit').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Description' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                var dataAdd = new Object();
                dataAdd._id = id_Edit;
                dataAdd.msg = $('#descriptionEdit').val();
                $.ajax({
                    url: apiURL + '/apiRoute/agentAmnRouter',
                    type: 'PUT',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            $('#modalEditAnnouncement').modal('hide');

                            document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Edit message succes");
                            SetLan(localStorage.getItem("Language"));

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
        }

        var id_Delete = "";
        function viewDelete(idItem) {
            id_Delete = idItem;
            $('#modalDeleteAnnouncement').modal();
        }

        function DeleteAnnouncement() {
            $("#myModalLoad").modal();

            var dataAdd = new Object();
            dataAdd._id = id_Delete;
            $.ajax({
                url: apiURL + '/apiRoute/agentAmnRouter/delete',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        $('#modalDeleteAnnouncement').modal('hide');

                        document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Delete message success");
                        SetLan(localStorage.getItem("Language"));

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
    </script>
</asp:Content>
