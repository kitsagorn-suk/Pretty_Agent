<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Pretty_Gaming.Menu_Account.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .accordionn {
            background-color: #e9ecef;
            border-radius: 3px;
            border: 1px #c6c6c6 solid;
            color: #444;
            cursor: pointer;
            width: 100%;
            text-align: left;
            outline: none;
            font-size: 1rem;
            transition: 0.4s;
            padding: .375rem .75rem;
            line-height: 1.5;
        }

            .accordionn.active, .accordionn:hover {
                background-color: #e9ecef;
                border-radius: 3px;
                border: 1px #c6c6c6 solid;
            }

            .accordionn:after {
                content: '\002B';
                color: #777;
                font-weight: bold;
                float: right;
                margin-left: 5px;
            }

            .accordionn.active:after {
                content: "\2212";
            }

        .panel {
            /*background-color: #f8f9fa;*/
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            padding: 0px;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Account"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Profile"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Profile"></h1>
    <div class="section-group mb-4">
        <div class="form-row">
            <div class="form-group col-5">
                <h4 set-lan="text:Basic Info"></h4>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Username"></label>
                    <div class="col-8">
                        <input type="text" id="username" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                    <div class="col-8">
                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <h4 set-lan="text:Credit"></h4>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Currency"></label>
                    <div class="col-8">
                        <textarea id="currency" class="form-control" autocomplete="off" rows="2" readonly></textarea>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Credit"></label>
                    <div class="col-8">
                        <input type="text" id="credit" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:PT"></label>
                    <div class="col-8">
                        <input type="text" id="pt" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform positionType" style="display: none;">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Position type"></label>
                    <div class="col-8">
                        <input type="text" id="Positiontype" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform betType" style="display: none;">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Bet Type"></label>
                    <div class="col-8">
                        <input type="text" id="Bettype" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5">
                <h4 set-lan="text:Commission"></h4>
                <div class="form-group row inputform">
                    <label for="OriBar" class="col-4 col-form-label" set-lan="text:Original Baccarat"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <input type="text" id="Original" class="form-control" autocomplete="off" disabled="disabled" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="SupBar" class="col-4 col-form-label" set-lan="text:Super6 Baccarat"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <input type="text" id="Super6" class="form-control" autocomplete="off" disabled="disabled" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="4Point" class="col-4 col-form-label" set-lan="text:Bacarrat 4 Point"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <input type="text" id="Bacarrat4" class="form-control" autocomplete="off" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="CowCow" class="col-4 col-form-label" set-lan="text:Cow Cow"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <input type="text" id="CowCow" class="form-control" autocomplete="off" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="DragonTiger" class="col-4 col-form-label" set-lan="text:Dragon Tiger"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <input type="text" id="Dragon" class="form-control" autocomplete="off" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Roulete" class="col-4 col-form-label" set-lan="text:Roulete"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <input type="text" id="Roulete" class="form-control" autocomplete="off" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Sicbo" class="col-4 col-form-label" set-lan="text:Sicbo"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <input type="text" id="Sicbo" class="form-control" autocomplete="off" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row" id="zoneAPI" style="display: none;">
            <div class="form-group col-5">
                <h4 set-lan="text:API"></h4>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Key"></label>
                    <div class="col-7">
                        <textarea id="key" class="form-control" autocomplete="off" rows="2" readonly></textarea>
                    </div>
                    <div class="col-1" style="padding-top: 13px;">
                        <span toggle="#password" class="toggle-password field-icon" onclick="viewKey()"><i class="far fa-eye" style="margin: auto; padding: 4px; background-color: #ececec; border-radius: 12px;"></i></span>
                    </div>
                </div>
                <div class="form-group row inputform callback">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Callback url servlet"></label>
                    <div class="col-8">
                        <input type="text" id="web" class="form-control" autocomplete="off" />
                        <small class="text-muted form-text" set-lan="text:Example https//www.yourcallback.com/service"></small>
                    </div>
                </div>
                <%--<div class="form-group row inputform callback">
                        <label for="username" class="col-4 col-form-label" set-lan="text:Callback Dealer Tips"></label>
                        <div class="col-8">
                            <input type="text" id="webDealer" class="form-control" autocomplete="off" />
                            <small class="text-muted form-text" set-lan="text:Example https//www.yourcallback.com/service"></small>
                        </div>
                    </div>--%>
                <div class="zoneAddIP">
                    <div class="zonedivIP">
                        <div class="form-group row inputform">
                            <label for="username" class="col-4 col-form-label" set-lan="text:IP"></label>
                            <div class="col-7">
                                <input type="text" class="form-control codeip" autocomplete="off" onkeydown="keyDownNotSpace(event)" />
                            </div>
                            <div class="col-1" style="color: red; font-size: 1.5rem; padding-left: 0px;">
                                <a class='removeIP'><i class='fa fa-minus-circle' aria-hidden='true'></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row inputform" style="margin-top: -15px;">
                        <label for="username" class="col-4 col-form-label"></label>
                        <div class="col-7"><small class="text-muted form-text" set-lan="text:Example 192.168.0.1"></small></div>
                    </div>
                    <button class="btn btn-yellow font-weight-bold" onclick="gotoURL();" type="button" style="float: right;" set-lan="text:Click to API Document"></button>
                    <button class="btn btn-yellow font-weight-bold addIP zonenone" onclick="" type="button" style="float: right; margin-right: 5px;" set-lan="text:Add IP"></button>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5" id="settingBacZone">
                <h4 set-lan="text:Setting Baccarat"></h4>
                <div class="form-group row inputform">
                    <label for="OriBar" class="col-4 col-form-label" set-lan="text:Original Baccarat"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_OriBar">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="SupBar" class="col-4 col-form-label" set-lan="text:Super6 Baccarat"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_SupBar">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="4Point" class="col-4 col-form-label" set-lan="text:Bacarrat 4 Point"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_4Point">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="CowCow" class="col-4 col-form-label" set-lan="text:Cow Cow"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_CowCow">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="DragonTiger" class="col-4 col-form-label" set-lan="text:Dragon Tiger"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_DragonTiger">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Roulete" class="col-4 col-form-label" set-lan="text:Roulete"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_Roulete">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Sicbo" class="col-4 col-form-label" set-lan="text:Sicbo"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_Sicbo">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="Sicbo" class="col-4 col-form-label" set-lan="text:Thai Fan Tan"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_FanTan">
                                        <option value="true" set-lan="text:Open"></option>
                                        <option value="false" set-lan="text:Close"></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center;">
                <button class="btn btn-yellow font-weight-bold zonenone" onclick="btnEdit()" type="button" style="display: none;" id="btnSaveProfile" set-lan="text:Save Profile"></button>
            </div>
        </div>
        <div class="form-row" style="margin-top: 2rem;">
            <div class="form-group col-12">
                <h4 set-lan="text:History login date & IP"></h4>
                <table class="table table-border" id="tbData">
                    <thead class="rgba-green-slight">
                        <tr>
                            <th set-lan="text:Date"></th>
                            <th set-lan="text:IP address"></th>
                        </tr>
                    </thead>
                    <tbody id="tbodyLogin">
                    </tbody>
                    <tfoot class="rgba-yellow-slight">
                        <tr class="total">
                            <td></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    <!-- Modal -->
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
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Success">Success</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label set-lan="text:Save profile success"></label>
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
                    <div class="form-group mr-2 mb-3" style="display: flex; text-align: center; align-items: center; justify-content: center;">
                        <div class="md-form md-outline">
                            <input type="password" class="form-control col-12" autocomplete="off" id="password" maxlength="24" />
                            <span toggle="#password" class="toggle-password field-icon"><i class="far fa-eye"></i></span>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-yellow font-weight-bold" onclick="viewKey();" set-lan="text:OK"></button>
                        <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        var checkPass = false;
        var key = "";
        var position = "";
        $(document).ready(function () {
            $("#menuAccount , #menuAccount > a").addClass("active");
            $("#menuAccount > div").css("display", "block");

            $("#myModalLoad").modal();

            $('.addIP').click(function (e) {
                var matched = $(".zonedivIP .inputform");
                matched = matched.length;

                e.preventDefault();
                var html = "";
                html += "<div class='form-group row inputform'>";
                if (matched > 0) {
                    html += "<label for='username' class='col-4 col-form-label'></label>";
                }
                else {
                    html += "<label for='username' class='col-4 col-form-label' set-lan='text:IP'></label>";
                }
                html += "<div class='col-7 reClass'>";
                html += "<input type='text' class='form-control codeip' autocomplete='off' onkeydown='keyDownNotSpace(event)' />";
                html += "</div>";
                html += "<div class='col-1' style='color: red; font-size: 1.5rem; padding-left: 0px;'>";
                html += "<a class='removeIP'><i class='fa fa-minus-circle' aria-hidden='true'></i></a>";
                html += "</div>";
                html += "</div>";
                $('.zonedivIP').append(html);

                SetLan(localStorage.getItem("Language"));
            });

            $('.zoneAddIP').on("click", ".removeIP", function (e) {
                e.preventDefault();
                $(this).parent('div').parent('div').remove();
            })

            $.ajax({
                url: apiURL + '/apiRoute/member/profile',
                type: 'POST',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        position = data.position.toLowerCase();
                        if (data.position.toLowerCase() == "agent_api") {
                            $('#btnSaveProfile').css('display', 'initial');
                            $('#zoneAPI, .positionType, .betType').css('display', 'flex');
                            $('#Positiontype').val("API");
                            if (data.betType == "API_TRANSFER") {
                                $('#Bettype').val("Transfer");
                                $(".callback").css("display", "none");
                            }
                            else if (data.betType == "API_SEAMLESS") {
                                $('#Bettype').val("Seamless");
                            }

                            if (data.allowType) {
                                $("#ddl_OriBar option[value='" + data.allowType.normalBaccarat.toString() + "']").attr("selected", "selected");
                                $("#ddl_SupBar option[value='" + data.allowType.super6Baccarat.toString() + "']").attr("selected", "selected");
                                $("#ddl_4Point option[value='" + data.allowType.fourPointBaccarat.toString() + "']").attr("selected", "selected");
                                $("#ddl_CowCow option[value='" + data.allowType.cowCowBaccarat.toString() + "']").attr("selected", "selected");
                                $("#ddl_DragonTiger option[value='" + data.allowType.dragonTiger.toString() + "']").attr("selected", "selected");
                                $("#ddl_Roulete option[value='" + data.allowType.roulette.toString() + "']").attr("selected", "selected");
                                $("#ddl_Sicbo option[value='" + data.allowType.sicBo.toString() + "']").attr("selected", "selected");
                                $("#ddl_FanTan option[value='" + data.allowType.thaiFanTan.toString() + "']").attr("selected", "selected");

                                $("#ddl_FanTan").val(data.allowType.thaiFanTan.toString());
                            }
                            else {
                                $('#settingBacZone').css('display', 'none');
                            }
                        }

                        if (data.position.toLowerCase() == "agent_none_api") {
                            $('.positionType').css('display', 'flex');
                            $('#Positiontype').val("Master Agent");
                        }

                        if (checkPass) {
                            $('#key').val(data.apiKey);
                        }
                        else {
                            $('#key').val('*****************************');
                        }

                        key = data.apiKey;

                        $('#username').val(data.username);
                        $('#phonenumber').val(data.tel);
                        $('#credit').val(data.balance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $('#currency').val(data.currency.toString());
                        $('#pt').val(data.positionTracking + "%");
                        $('#web').val(data.webHookEvents);
                        //$('#webDealer').val(data.webHookEventsDealer);

                        if (data.commission.normalBaccarat == 0) {
                            data.commission.normalBaccarat = "0.0";
                        }
                        if (data.commission.super6Baccarat == 0) {
                            data.commission.super6Baccarat = "0.0";
                        }
                        if (data.commission.cowCowBaccarat == 0) {
                            data.commission.cowCowBaccarat = "0.0";
                        }
                        if (data.commission.dragonTiger == 0) {
                            data.commission.dragonTiger = "0.0";
                        }
                        if (data.commission.roulette == 0) {
                            data.commission.roulette = "0.0";
                        }
                        if (data.commission.sicBo == 0) {
                            data.commission.sicBo = "0.0";
                        }
                        if (data.commission.fourPointBaccarat == 0) {
                            data.commission.fourPointBaccarat = "0.0";
                        }

                        $('#Original').val(parseFloat(data.commission.normalBaccarat).toFixed(1));
                        $('#Super6').val(parseFloat(data.commission.super6Baccarat).toFixed(1));
                        $('#Bacarrat4').val(parseFloat(data.commission.fourPointBaccarat).toFixed(1));
                        $('#CowCow').val(parseFloat(data.commission.cowCowBaccarat).toFixed(1));
                        $('#Dragon').val(parseFloat(data.commission.dragonTiger).toFixed(1));
                        $('#Roulete').val(parseFloat(data.commission.roulette).toFixed(1));
                        $('#Sicbo').val(parseFloat(data.commission.sicBo).toFixed(1));

                        var arrip = data.ip;
                        var html = "";
                        if (arrip.length > 0) {
                            $('.zonedivIP').html("");
                            for (var i = 0; i < arrip.length; i++) {
                                html += "<div class='form-group row inputform'>";
                                if (i > 0) {
                                    html += "<label for='username' class='col-4 col-form-label'></label>";
                                }
                                else {
                                    html += "<label for='username' class='col-4 col-form-label' set-lan='text:IP'></label>";
                                }
                                html += "<div class='col-7 reClass'>";
                                html += "<input type='text' class='form-control codeip' autocomplete='off' value='" + arrip[i] + "' onkeydown='keyDownNotSpace(event)' />";
                                html += "</div>";
                                html += "<div class='col-1' style='color: red; font-size: 1.5rem; padding-left: 0px;'>";
                                html += "<a class='removeIP zonenone'><i class='fa fa-minus-circle' aria-hidden='true'></i></a>";
                                html += "</div>";
                                html += "</div>";
                            }
                            $('.zonedivIP').append(html);
                        }

                        if (data.loginHistories != null) {
                            var htmlLogin = "";
                            var arrData = data.loginHistories;
                            for (var i = 0; i < arrData.length; i++) {
                                htmlLogin += "<tr>";

                                var dataLogin = arrData[i].date;
                                var dateLog = new Date(dataLogin);
                                var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                htmlLogin += "<td>" + txtDate + "</td>";

                                if (arrData[i].ip != null) {
                                    htmlLogin += "<td>" + arrData[i].ip + "</td>";
                                }
                                else {
                                    htmlLogin += "<td>-</td>";
                                }

                                htmlLogin += "</tr>";
                            }
                            $("#tbodyLogin").append(htmlLogin);
                        }
                        else {
                            $("#tbodyLogin").append("<tr><td colspan='2'>No data.</td></tr>");
                        }

                        if (localStorage.getItem("isSupport") == "true") {
                            $('.zonenone').css('display', 'none');
                            $('#web , .codeip').attr('disabled', true);
                            $('.reClass').removeClass('col-7');
                            $('.reClass').addClass('col-8');
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

        function modalPassword() {
            $("#password").val("");
            $("#modalPassword").modal();
        }

        function viewKey() {
            if (!checkPass) {
                checkPass = true
                $('#key').val(key);
            }
            else {
                checkPass = false
                $('#key').val('*****************************');
            }
        }

        function keyDownNotSpace(e) {
            var e = window.event || e;
            var key = e.keyCode;
            //space pressed
            if (key == 32) { //space
                e.preventDefault();
            }
        }

        function gotoURL() {
            window.open('https://service-api.prettygaming.asia/index', '_blank');
        }

        function actionZone(e) {
            e.classList.toggle("active");
            var panel = e.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
                panel.style.padding = "0px";
            } else {
                panel.style.maxHeight = (panel.scrollHeight + 10) + "px";
                panel.style.padding = "5px";
            }
        }

        function btnEdit() {
            $("#myModalLoad").modal();

            var arrIP = [];
            var els = document.getElementsByClassName("codeip");
            for (var i = 0; i < els.length; i++) {
                var val = els[i].value;
                arrIP.push(val);
            }

            var dataEdit = new Object();
            dataEdit.ip = arrIP;
            dataEdit.webHookEvents = $('#web').val();
            if (position.toLowerCase() == "agent_api") {
                var cowCowBaccarat = ($('#ddl_CowCow').val().toLowerCase() === 'true');
                var dragonTiger = ($('#ddl_DragonTiger').val().toLowerCase() === 'true');
                var fourPointBaccarat = ($('#ddl_4Point').val().toLowerCase() === 'true');
                var normalBaccarat = ($('#ddl_OriBar').val().toLowerCase() === 'true');
                var roulette = ($('#ddl_Roulete').val().toLowerCase() === 'true');
                var sicBo = ($('#ddl_Sicbo').val().toLowerCase() === 'true');
                var super6Baccarat = ($('#ddl_SupBar').val().toLowerCase() === 'true');
                var thaiFanTan = ($('#ddl_FanTan').val().toLowerCase() === 'true');

                dataEdit.allowType = {
                    cowCowBaccarat: cowCowBaccarat,
                    dragonTiger: dragonTiger,
                    fourPointBaccarat: fourPointBaccarat,
                    normalBaccarat: normalBaccarat,
                    roulette: roulette,
                    sicBo: sicBo,
                    super6Baccarat: super6Baccarat,
                    thaiFanTan: thaiFanTan
                };
            }
            $.ajax({
                url: apiURL + "/apiRoute/member/setIpAndWebHookEvent",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataEdit),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                        $('#modalAlertSuccess').modal();
                        setTimeout(function () {
                            window.location.href = "/Menu_Account/profile.aspx";
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
