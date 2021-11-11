<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="member_agent_add_member_credit.aspx.cs" Inherits="Pretty_Gaming.member_agent_add_member_credit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Member Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/member_and_agent_management.aspx" set-lan="text:Members & Agents"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Add Member"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Add Member"></h1>
    <div class="section-group mb-4">
        <h4 set-lan="text:Basic Info"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Username-"></label>
                    <div class="col-8">
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
            <div class="col-1"></div>
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="remark" class="col-4 col-form-label" set-lan="text:Nickname"></label>
                    <div class="col-8">
                        <input type="text" id="nickname" class="form-control" autocomplete="off" onkeypress="clsAlphaTHNoOnly(event)" maxlength="30" />
                        <small class="text-muted form-text" set-lan="text:textTHnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="inputPhone" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                    <div class="col-8">
                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="15" />
                        <small class="text-muted form-text" set-lan="text:numberonly"></small>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-5">
                <h4 set-lan="text:Credit Settings"></h4>
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Currency"></label>
                    <div class="col-8">
                        <input type="text" id="ddl_currency" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="credit" class="col-4 col-form-label" set-lan="html:Credit-"></label>
                    <div class="col-8">
                        <input type="text" id="credit" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                        <small id="creditHelper" class="text-muted form-text"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Bet Limit-"></label>
                    <div class="col-8">
                        <div class="select-outline">
                            <select class="mdb-select" id="ddl_betLimit" multiple>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Our PT-"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_positiontracking">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5">
                <h4 set-lan="text:Commission Setting"></h4>
                <div class="form-group row inputform">
                    <label for="OriBar" class="col-4 col-form-label" set-lan="html:Original Baccarat-"></label><label id="txtOriBar" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_OriBar">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="SupBar" class="col-4 col-form-label" set-lan="html:Super6 Baccarat-"></label><label id="txtSupBar" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_SupBar">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="4Point" class="col-4 col-form-label" set-lan="html:Bacarrat 4 Point-"></label><label id="txt4Point" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_4Point">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="CowCow" class="col-4 col-form-label" set-lan="html:Cow Cow-"></label><label id="txtCowCow" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_CowCow">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="DragonTiger" class="col-4 col-form-label" set-lan="html:Dragon Tiger-"></label><label id="txtDragonTiger" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_DragonTiger">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Roulete" class="col-4 col-form-label" set-lan="html:Roulete-"></label><label id="txtRoulete" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_Roulete">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Sicbo" class="col-4 col-form-label" set-lan="html:Sicbo-"></label><label id="txtSicbo" class="col-2 col-form-label">(-)</label>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_Sicbo">
                                        <option value="0.0">0.0</option>
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.1">1.1</option>
                                        <option value="1.2">1.2</option>
                                        <option value="1.3">1.3</option>
                                        <option value="1.4">1.4</option>
                                        <option value="1.5">1.5</option>
                                        <option value="1.6">1.6</option>
                                        <option value="1.7">1.7</option>
                                        <option value="1.8">1.8</option>
                                        <option value="1.9">1.9</option>
                                        <option value="2.0">2.0</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform" style="display: none;">
                    <label for="Roulete" class="col-4 col-form-label"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center; margin-top: 1rem;">
                <button class="btn btn-yellow font-weight-bold" onclick="AddMember()" type="button" set-lan="text:Add Member"></button>
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
                    <label set-lan="text:Save add new member success"></label>
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

            $("#myModalLoad").modal();

            $('#creditHelper').html('<span set-lan="html:Min"></span>' + ' 0, <span set-lan="html:Max"></span> ' + localStorage.getItem("Balance").toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

            var MainCurrency = localStorage.getItem("Currency");
            $.ajax({
                type: "GET",
                url: apiURL + "/apiRoute/betLimit/list",
                cache: false,
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        var arrData = data.data;
                        var arrDataLength = arrData.length;
                        var htmlBet = "<option value='' disabled selected>Choose Bet Limit</option>";
                        for (var i = 0; i < arrDataLength; i++) {
                            if (arrData[i].currency == MainCurrency) {
                                htmlBet += "<option value=" + arrData[i].limitId + ">" + arrData[i].min + " - " + arrData[i].max + "</option>";
                            }
                        }
                        document.getElementById('ddl_betLimit').innerHTML = htmlBet;
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

            var PT = parseInt(localStorage.getItem("PositionTracking"));
            var htmlPT = "<option value='' disabled selected>Choose Position Tracking</option>";
            for (var i = 0; i <= PT; i++) {
                htmlPT += "<option value=" + i + ">" + i + "%</option>";
            }
            document.getElementById('ddl_positiontracking').innerHTML = htmlPT;
            $("#ddl_positiontracking option:last").attr("selected", "selected");

            $("#ddl_currency").val(localStorage.getItem("Currency"));

            var Com = localStorage.getItem("Commission");
            var objCom = JSON.parse(Com);
            if (objCom.normalBaccarat == 0) {
                objCom.normalBaccarat = "0.0";
            }
            if (objCom.super6Baccarat == 0) {
                objCom.super6Baccarat = "0.0";
            }
            if (objCom.cowCowBaccarat == 0) {
                objCom.cowCowBaccarat = "0.0";
            }
            if (objCom.dragonTiger == 0) {
                objCom.dragonTiger = "0.0";
            }
            if (objCom.roulette == 0) {
                objCom.roulette = "0.0";
            }
            if (objCom.sicBo == 0) {
                objCom.sicBo = "0.0";
            }
            if (objCom.fourPointBaccarat == 0) {
                objCom.fourPointBaccarat = "0.0";
            }
            $("select#ddl_OriBar").find("option:contains('" + objCom.normalBaccarat + "')").attr("selected", true);
            $("select#ddl_SupBar").find("option:contains('" + objCom.super6Baccarat + "')").attr("selected", true);
            $("select#ddl_CowCow").find("option:contains('" + objCom.cowCowBaccarat + "')").attr("selected", true);
            $("select#ddl_DragonTiger").find("option:contains('" + objCom.dragonTiger + "')").attr("selected", true);
            $("select#ddl_Roulete").find("option:contains('" + objCom.roulette + "')").attr("selected", true);
            $("select#ddl_Sicbo").find("option:contains('" + objCom.sicBo + "')").attr("selected", true);
            $("select#ddl_4Point").find("option:contains('" + objCom.fourPointBaccarat + "')").attr("selected", true);

            $("#txtOriBar").text("(" + objCom.normalBaccarat + ")");
            $("#txtSupBar").text("(" + objCom.super6Baccarat + ")");
            $("#txtCowCow").text("(" + objCom.cowCowBaccarat + ")");
            $("#txtDragonTiger").text("(" + objCom.dragonTiger + ")");
            $("#txtRoulete").text("(" + objCom.roulette + ")");
            $("#txtSicbo").text("(" + objCom.sicBo + ")");
            $("#txt4Point").text("(" + objCom.fourPointBaccarat + ")");

            SetLan(localStorage.getItem("Language"));
        });

        function AddMember() {
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
            else if ($('#credit').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Credit' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#ddl_betLimit').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Bet Limit' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                var dataCom = new Object();
                dataCom.normalBaccarat = parseFloat($('#ddl_OriBar').val());
                dataCom.super6Baccarat = parseFloat($('#ddl_SupBar').val());
                dataCom.cowCowBaccarat = parseFloat($('#ddl_CowCow').val());
                dataCom.dragonTiger = parseFloat($('#ddl_DragonTiger').val());
                dataCom.roulette = parseFloat($('#ddl_Roulete').val());
                dataCom.sicBo = parseFloat($('#ddl_Sicbo').val());
                dataCom.fourPointBaccarat = parseFloat($('#ddl_4Point').val());

                var dataAdd = new Object();
                var arrCur = localStorage.getItem("Currency").split(', ');
                dataAdd.currency = arrCur;
                dataAdd.commission = dataCom;
                dataAdd.username = $('#username').val();
                dataAdd.password = $('#password').val();
                dataAdd.nickname = $('#nickname').val();
                dataAdd.balance = parseFloat($("#credit").val().replace(/,/g, ""));
                dataAdd.tel = $('#phonenumber').val();
                dataAdd.positionTracking = parseInt($('#ddl_positiontracking').val());
                var res = $('#ddl_betLimit').val().map(function (v) {
                    return parseInt(v, 10);
                });
                var arrBet = JSON.stringify(res);
                dataAdd.betLimit = arrBet;
                $.ajax({
                    url: apiURL + "/apiRoute/member/createMemberNoneApi",
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
                                window.location.href = "/Menu_MemberManagement/member_and_agent_management.aspx";
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
                        else if (data.code == 801) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:Insufficient balance.");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else if (data.code == 11000) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:E11000 duplicate key error collection");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else if (data.code == 994) {
                            document.getElementById("lbAlert").setAttribute("set-lan", "text:invalid bet limit parameter please input bet limit more than 1 but not more than 6 value.");
                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                        else {
                            document.getElementById('lbAlert').innerHTML = data.msg;;
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

