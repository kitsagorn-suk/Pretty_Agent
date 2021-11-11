<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agent_edit.aspx.cs" Inherits="Pretty_Gaming.Menu_MemberManagement.agent_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Member Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/member_and_agent_management.aspx" set-lan="text:Members & Agents"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Edit Agent"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Edit Agent"></h1>
    <div class="section-group mb-4">
        <div class="row">
            <div class="col-md-9">
                <h4 set-lan="text:Basic Info"></h4>
                <div class="form-row">
                    <div class="form-group col-6">
                        <div class="form-group row inputform">
                            <label for="username" class="col-4 col-form-label" set-lan="text:Username"></label>
                            <div class="col-8">
                                <input type="text" id="username" class="form-control" autocomplete="off" disabled="disabled" />
                            </div>
                        </div>
                        <div class="form-group row inputform fieldPassword">
                            <label for="username" class="col-4 col-form-label" set-lan="text:Password"></label>
                            <div class="col-8">
                                <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editPass();" set-lan="text:Edit Password"></button>
                                <%--<input type="text" id="password" placeholder="Enter Password" class="form-control" autocomplete="off" />--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-6">
                        <div class="form-group row inputform">
                            <label for="username" class="col-4 col-form-label" set-lan="text:Nickname"></label>
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-8">
                                        <input type="text" id="nickname" class="form-control" autocomplete="off" onkeypress="clsAlphaTHNoOnly(event)" maxlength="30" />
                                        <small class="text-muted form-text" set-lan="text:textTHnumberonly"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row inputform">
                            <label for="username" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-8">
                                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="15" />
                                        <small class="text-muted form-text" set-lan="text:numberonly"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-6">
                        <h4 set-lan="text:Status"></h4>
                        <div class="form-group row inputform">
                            <label for="pt" class="col-4 col-form-label" set-lan="text:Suspend"></label>
                            <div class="col-4">
                                <input type="text" id="suspend" class="form-control" autocomplete="off" disabled="disabled" />
                            </div>
                            <div class="col-4">
                                <button type="button" class="btn btn-yellow font-weight-bold" onclick="editStatus();" set-lan="text:Edit Status"></button>
                            </div>
                        </div>
                        <div class="form-group row inputform">
                            <label for="pt" class="col-4 col-form-label" set-lan="text:Lock"></label>
                            <div class="col-4">
                                <input type="text" id="lock" class="form-control" autocomplete="off" disabled="disabled" />
                            </div>
                        </div>
                        <h4 set-lan="text:Credit Settings"></h4>
                        <div class="form-group row inputform">
                            <label for="pt" class="col-4 col-form-label" set-lan="html:Currency"></label>
                            <div class="col-8">
                                <input type="text" id="ddl_currency" class="form-control" autocomplete="off" disabled="disabled" />
                                <%--<div class="select-outline">
                            <select class="mdb-select" id="ddl_currency">
                            </select>
                        </div>--%>
                            </div>
                        </div>
                        <div class="form-group row inputform">
                            <label for="credit" class="col-4 col-form-label" set-lan="text:Credit"></label>
                            <div class="col-8">
                                <input type="text" id="credit" class="form-control" autocomplete="off" disabled="disabled" />
                                <%--<small id="creditHelper" class="text-muted form-text"></small>--%>
                            </div>
                        </div>
                        <div class="form-group row inputform align-items-center">
                            <label for="payment-type" class="col-4 col-form-label" set-lan="text:Position type"></label>
                            <div class="col-8">
                                <input type="text" id="position-type" class="form-control" autocomplete="off" disabled="disabled" />
                                <%--<div class="row">
                            <div class="col-12 zoneDisabled">
                                <div class="btn-group btn-group-green d-flex" id="position-type" data-toggle="buttons">
                                    <label class="btn btn-white border border-success z-depth-0 form-check-label btn-sm Position2" onclick="chkPositionType('AGENT_API')">
                                        <input class="form-check-input" type="radio" name="positiontype" id="Position2" autocomplete="off">
                                        API
                                    </label>
                                    <label class="btn btn-white border border-success z-depth-0 form-check-label btn-sm Position1" onclick="chkPositionType('AGENT_NONE_API')">
                                        <input class="form-check-input" type="radio" name="positiontype" id="Position1" autocomplete="off">
                                        Master Agent
                                    </label>
                                </div>
                            </div>
                        </div>--%>
                            </div>
                        </div>
                        <div class="form-group row inputform align-items-center bettypezone">
                            <label for="payment-type" class="col-4 col-form-label" set-lan="text:Bet Type"></label>
                            <div class="col-8">
                                <input type="text" id="bet-type" class="form-control" autocomplete="off" disabled="disabled" />
                                <%-- <div class="row">
                            <div class="col-12 zoneDisabled">
                                <div class="btn-group btn-group-green d-flex" id="bet-type" data-toggle="buttons">
                                    <label class="btn btn-white border border-success z-depth-0 form-check-label btn-sm active Bet2" onclick="chkBetType('API_SEAMLESS')">
                                        <input class="form-check-input" type="radio" name="bettype" id="Bet2" autocomplete="off">
                                        Seamless
                                    </label>
                                    <label class="btn btn-white border border-success z-depth-0 form-check-label btn-sm Bet1" onclick="chkBetType('API_TRANSFER')">
                                        <input class="form-check-input" type="radio" name="bettype" id="Bet1" autocomplete="off">
                                        Transfer
                                    </label>
                                </div>
                            </div>
                        </div>--%>
                            </div>
                        </div>
                        <div class="form-group row inputform">
                            <label for="pt" class="col-4 col-form-label" set-lan="html:Our PT-"></label>
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="select-outline">
                                            <select class="mdb-select" id="ddl_positiontracking" onchange="changePT('our')">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row inputform">
                            <label for="pt" class="col-4 col-form-label" set-lan="html:Given PT-"></label>
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="select-outline">
                                            <select class="mdb-select" id="ddl_givenPT" onchange="changePT('given')">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-6">
                        <h4 set-lan="text:Commission Setting"></h4>
                        <div class="form-group row inputform">
                            <label for="OriBar" class="col-4 col-form-label" set-lan="html:Original Baccarat-"></label><label id="txtOriBar" class="col-2 col-form-label">(-)</label>
                            <div class="col-3">
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
                            <div class="col-3">
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
                            <div class="col-3">
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
                            <div class="col-3">
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
                            <div class="col-3">
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
                            <div class="col-3">
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
                            <div class="col-3">
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
                    <div class="col-12" style="text-align: center;">
                        <button class="btn btn-yellow font-weight-bold btnEdit" onclick="EditAgent()" type="button" set-lan="text:Save"></button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <h4 set-lan="text:History Edit"></h4>
                <table class="table table-border" id="tbData">
                    <thead class="rgba-green-slight">
                        <tr>
                            <th set-lan="text:Date" width="45%"></th>
                            <th set-lan="text:Edit by" width="55%" style="text-align: left; padding-left: 5px;"></th>
                        </tr>
                    </thead>
                    <tbody>
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
    <div class="modal fade" id="modalStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Status</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Suspend-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkSuspend" onclick="chgSuspend(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtSuspend"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Lock-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkLock" onclick="chgLock(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtLock"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveEditStatus();" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
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
                    <label id="lbAlertSuccess"></label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalHistory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="max-width: 1000px;">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <div class="section-group mb-4">
                        <h4 set-lan="text:Basic Info" style="text-align: left;"></h4>
                        <div class="form-row">
                            <div class="form-group col-6">
                                <div class="form-group row inputform">
                                    <label for="username" class="col-4 col-form-label" set-lan="text:Username" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="usernameView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-6">
                                <div class="form-group row inputform">
                                    <label for="username" class="col-4 col-form-label" set-lan="text:Nickname" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="nicknameView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="username" class="col-4 col-form-label" set-lan="text:Phone number" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="phonenumberView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-6">
                                <h4 set-lan="text:Status" style="text-align: left;"></h4>
                                <div class="form-group row inputform">
                                    <label for="pt" class="col-4 col-form-label" set-lan="text:Suspend" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="suspendView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="pt" class="col-4 col-form-label" set-lan="text:Lock" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="lockView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <h4 set-lan="text:Credit Settings" style="text-align: left;"></h4>
                                <div class="form-group row inputform">
                                    <label for="pt" class="col-4 col-form-label" set-lan="html:Currency" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="currencyView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="credit" class="col-4 col-form-label" set-lan="text:Credit" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="creditView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform align-items-center">
                                    <label for="payment-type" class="col-4 col-form-label" set-lan="text:Position type" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="typeView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform align-items-center bettypezoneview">
                                    <label for="payment-type" class="col-4 col-form-label" set-lan="text:Bet Type" style="text-align: left;"></label>
                                    <div class="col-8">
                                        <input type="text" id="bettypeView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="pt" class="col-4 col-form-label" set-lan="html:Given PT" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="GivenPTView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-6">
                                <h4 set-lan="text:Commission Setting" style="text-align: left;"></h4>
                                <div class="form-group row inputform">
                                    <label for="OriBar" class="col-4 col-form-label" set-lan="html:Original Baccarat" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="OriginalBaccaratView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="SupBar" class="col-4 col-form-label" set-lan="html:Super6 Baccarat" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="Super6BaccaratView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="4Point" class="col-4 col-form-label" set-lan="html:Bacarrat 4 Point" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="Bacarrat4PointView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="CowCow" class="col-4 col-form-label" set-lan="html:Cow Cow" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="CowCowView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="DragonTiger" class="col-4 col-form-label" set-lan="html:Dragon Tiger" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="DragonTigerView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="Roulete" class="col-4 col-form-label" set-lan="html:Roulete" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="RouleteView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group row inputform">
                                    <label for="Sicbo" class="col-4 col-form-label" set-lan="html:Sicbo" style="text-align: left;"></label>
                                    <div class="col-4">
                                        <input type="text" id="SicboView" class="form-control" autocomplete="off" disabled="disabled" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
        var chkStatusSus = "";
        var chkStatusLock = "";
        var valPositionType = "AGENT_API";
        var bettype = "API_SEAMLESS";
        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            $("#myModalLoad").modal();

            var _id = getUrlParameter('itemid');
            $.ajax({
                url: apiURL + '/apiRoute/member/viewUnderProfile/' + _id,
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == null || data.code == 0) {
                        $('#username').val(data.username);
                        $('#nickname').val(data.nickname);
                        $('#phonenumber').val(data.tel);
                        var val = parseFloat(data.balance);
                        $('#credit').val(val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                        var PT = parseInt(localStorage.getItem("PositionTracking"));
                        var htmlPT = "<option value='' disabled selected>Choose Position Tracking</option>";
                        for (var i = 0; i <= PT; i++) {
                            htmlPT += "<option value=" + i + ">" + i + "%</option>";
                        }
                        document.getElementById('ddl_positiontracking').innerHTML = htmlPT;
                        document.getElementById('ddl_givenPT').innerHTML = htmlPT;

                        var givenPT = data.positionTracking;
                        var totalOur = parseInt(PT) - parseInt(givenPT);
                        $("#ddl_positiontracking option[value='" + totalOur + "']").attr("selected", "selected");
                        $("#ddl_givenPT option[value='" + givenPT + "']").attr("selected", "selected");

                        $('#ddl_currency').val(data.currency);

                        if (data.logs.length > 0) {
                            $("#tbData > tbody").html("");
                            var htmlHis = "";
                            var countHis = data.logs;
                            for (var h = 0; h < countHis.length; h++) {
                                htmlHis += "<tr>";
                                var dateLog = new Date(countHis[h].editDate);
                                var txtDate = ("0" + dateLog.getDate()).slice(-2) + "-" + ("0" + (dateLog.getMonth() + 1)).slice(-2) + "-" + ("0" + dateLog.getFullYear()).slice(-2) + " " + ("0" + dateLog.getHours()).slice(-2) + ":" + ("0" + dateLog.getMinutes()).slice(-2) + ":" + ("0" + dateLog.getSeconds()).slice(-2);
                                htmlHis += "<td class='aligncenter'><a attr-user='" + countHis[h].username + "' attr-nick='" + countHis[h].nickname + "' attr-tel='" + countHis[h].tel + "' attr-sus='" + countHis[h].isSuspend + "' attr-lock='" + countHis[h].isLocked + "' attr-cur='" + countHis[h].currency + "' attr-credit='" + countHis[h].balance.$numberDecimal + "' attr-type='" + countHis[h].position + "' attr-bettype='" + countHis[h].betType + "' attr-pt='" + countHis[h].positionTracking + "' attr-bac='" + parseFloat(countHis[h].commission.normalBaccarat).toFixed(1) + "' attr-cow='" + parseFloat(countHis[h].commission.cowCowBaccarat).toFixed(1) + "' attr-dra='" + parseFloat(countHis[h].commission.dragonTiger).toFixed(1) + "' attr-four='" + parseFloat(countHis[h].commission.fourPointBaccarat).toFixed(1) + "' attr-rou='" + parseFloat(countHis[h].commission.roulette).toFixed(1) + "' attr-sic='" + parseFloat(countHis[h].commission.sicBo).toFixed(1) + "' attr-sup='" + parseFloat(countHis[h].commission.super6Baccarat).toFixed(1) + "' onclick='GetHistoryItem(this);' style='color: #CFA137; font-weight: bold;'>" + txtDate + "</a></td>";
                                htmlHis += "<td>";
                                htmlHis += "<p class='overflow ellipsis' title='test'>" + countHis[h].editBy + "</p>";
                                htmlHis += "</td>";
                                htmlHis += "</tr>";
                            }

                            $("#tbData > tbody").append(htmlHis);
                        }
                        else {
                            $("#tbData > tbody").html("");
                            var htmlHis = "<tr><td colspan='2' class='aligncenter' set-lan='text:No data.'></td></tr>";
                            $("#tbData > tbody").append(htmlHis);
                        }

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
                        $("select#ddl_OriBar").find("option:contains('" + parseFloat(data.commission.normalBaccarat).toFixed(1) + "')").attr("selected", true);
                        $("select#ddl_SupBar").find("option:contains('" + parseFloat(data.commission.super6Baccarat).toFixed(1) + "')").attr("selected", true);
                        $("select#ddl_CowCow").find("option:contains('" + parseFloat(data.commission.cowCowBaccarat).toFixed(1) + "')").attr("selected", true);
                        $("select#ddl_DragonTiger").find("option:contains('" + parseFloat(data.commission.dragonTiger).toFixed(1) + "')").attr("selected", true);
                        $("select#ddl_Roulete").find("option:contains('" + parseFloat(data.commission.roulette).toFixed(1) + "')").attr("selected", true);
                        $("select#ddl_Sicbo").find("option:contains('" + parseFloat(data.commission.sicBo).toFixed(1) + "')").attr("selected", true);
                        $("select#ddl_4Point").find("option:contains('" + parseFloat(data.commission.fourPointBaccarat).toFixed(1) + "')").attr("selected", true);

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
                        $("#txtOriBar").text("(" + objCom.normalBaccarat + ")");
                        $("#txtSupBar").text("(" + objCom.super6Baccarat + ")");
                        $("#txtCowCow").text("(" + objCom.cowCowBaccarat + ")");
                        $("#txtDragonTiger").text("(" + objCom.dragonTiger + ")");
                        $("#txtRoulete").text("(" + objCom.roulette + ")");
                        $("#txtSicbo").text("(" + objCom.sicBo + ")");
                        $("#txt4Point").text("(" + objCom.fourPointBaccarat + ")");

                        if (data.position.toLowerCase() == "agent_none_api") {
                            $('#position-type').val("Master Agent");

                            valPositionType = "AGENT_NONE_API";
                            bettype = "CASH_LINE";
                            $('.bettypezone').css('display', 'none');
                        }
                        else if (data.position.toLowerCase() == "agent_api") {
                            $('#position-type').val("API");

                            if (data.betType == "API_SEAMLESS") {
                                $('#bet-type').val("Seamless");
                            }
                            else if (data.betType == "API_TRANSFER") {
                                $('#bet-type').val("Transfer");
                            }

                            valPositionType = "AGENT_API";
                            bettype = data.betType;
                            $('.bettypezone').css('display', 'flex');
                        }

                        if (data.isSuspend == false) {
                            data.isSuspend = "No";
                        }
                        else {
                            data.isSuspend = "Yes";
                        }

                        if (data.isLocked == false) {
                            data.isLocked = "Unlock";
                        }
                        else {
                            data.isLocked = "Lock";
                        }

                        if (data.isSuspend == "Yes") {
                            document.getElementById("chkSuspend").checked = true;
                        }

                        if (data.isLocked == "Lock") {
                            document.getElementById("chkLock").checked = true;
                        }

                        chkStatusSus = data.isSuspend;
                        chkStatusLock = data.isLocked;

                        document.getElementById("suspend").setAttribute("set-lan", "value:" + data.isSuspend + "Sus");
                        document.getElementById("lock").setAttribute("set-lan", "value:" + data.isLocked + "");
                        document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + data.isSuspend + "Sus");
                        document.getElementById("txtLock").setAttribute("set-lan", "text:" + data.isLocked + "");

                        SetLan(localStorage.getItem("Language"));

                        if (localStorage.getItem("Position").toLowerCase() == "agent_api") {
                            $('.fieldPassword, .btnEdit').remove();
                            $('#ddl_positiontracking, #ddl_givenPT, #nickname, #phonenumber, #ddl_OriBar, #ddl_SupBar, #ddl_CowCow, #ddl_DragonTiger, #ddl_Roulete, #ddl_Sicbo, #ddl_4Point').addClass("zoneDisabled");
                        }

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

        function chgSuspend(ele) {
            if (ele.checked) {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:YesSus");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:NoSus");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function chgLock(ele) {
            if (ele.checked) {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Lock");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Unlock");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function editPass() {
            $('#modalPassword').modal('show');
        }

        function editStatus() {
            if (chkStatusSus == "Yes") {
                document.getElementById("chkSuspend").checked = true;
            }
            else {
                document.getElementById("chkSuspend").checked = false;
            }

            if (chkStatusLock == "Lock") {
                document.getElementById("chkLock").checked = true;
            }
            else {
                document.getElementById("chkLock").checked = false;
            }

            document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + chkStatusSus + "Sus");
            document.getElementById("txtLock").setAttribute("set-lan", "text:" + chkStatusLock + "");
            SetLan(localStorage.getItem("Language"));

            $('#modalStatus').modal('show');
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
                dataAdd.newPassword = $('#password').val();
                dataAdd.memberId = getUrlParameter('itemid');
                $.ajax({
                    url: apiURL + "/apiRoute/member/changeUnderPassword",
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(dataAdd),
                    contentType: 'application/json; charset=utf-8',
                    beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                    success: function (data) {
                        if (data.code == 0 || data.code == null) {
                            document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Change new password success");
                            SetLan(localStorage.getItem("Language"));
                            $('#modalPassword').modal('hide');
                            $("#myModalLoad").modal('hide');
                            $('#modalAlertSuccess').modal();
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

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statussuspend = false;
            var statuslock = false;

            if (document.getElementById('chkSuspend').checked) {
                statussuspend = true;
            } else {
                statussuspend = false;
            }

            if (document.getElementById('chkLock').checked) {
                statuslock = true;
            } else {
                statuslock = false;
            }

            var dataAdd = new Object();
            dataAdd.isSuspend = statussuspend;
            dataAdd.isLocked = statuslock;
            dataAdd.memberId = getUrlParameter('itemid');
            $.ajax({
                url: apiURL + '/apiRoute/member/setLockAndSuspended',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status suspend, lock success");
                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                        $('#modalStatus').modal('hide');
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

        function changePT(type) {
            if (type == "our") {
                var txt = parseInt($("select#ddl_positiontracking").val());
                var pt = parseInt(localStorage.getItem("PositionTracking"));
                var total = 0;
                if (txt >= pt) {
                    total = txt - pt;
                }
                else if (txt <= pt) {
                    total = pt - txt;
                }
                $('#ddl_givenPT option').removeAttr('selected');
                $("#ddl_givenPT option[value='" + total + "']").attr("selected", "selected");
            }

            if (type == "given") {
                var txt = parseInt($("select#ddl_givenPT").val());
                var pt = parseInt(localStorage.getItem("PositionTracking"));
                var total = 0;
                if (txt >= pt) {
                    total = txt - pt;
                }
                else if (txt <= pt) {
                    total = pt - txt;
                }
                $('#ddl_positiontracking option').removeAttr('selected');
                $("#ddl_positiontracking option[value='" + total + "']").attr("selected", "selected");
            }
        }

        function chkPositionType(val) {
            valPositionType = val;

            if (val == "AGENT_API") {
                $('.bettypezone').css('display', 'flex');
                bettype = "API_TRANSFER";
            }
            else {
                $('.bettypezone').css('display', 'none');
                bettype = "CASH_LINE";
            }
        }

        function chkBetType(val) {
            bettype = val;
        }

        function EditAgent() {
            $("#myModalLoad").modal();

            var dataCom = new Object();
            dataCom.normalBaccarat = parseFloat($('#ddl_OriBar').val());
            dataCom.super6Baccarat = parseFloat($('#ddl_SupBar').val());
            dataCom.cowCowBaccarat = parseFloat($('#ddl_CowCow').val());
            dataCom.dragonTiger = parseFloat($('#ddl_DragonTiger').val());
            dataCom.roulette = parseFloat($('#ddl_Roulete').val());
            dataCom.sicBo = parseFloat($('#ddl_Sicbo').val());
            dataCom.fourPointBaccarat = parseFloat($('#ddl_4Point').val());

            var dataAdd = new Object();
            dataAdd.commission = dataCom;
            dataAdd.nickname = $('#nickname').val();
            var cur = $('#ddl_currency').val();
            dataAdd.currency = cur.split(',');
            dataAdd.positionTracking = parseInt($('#ddl_givenPT').val());
            dataAdd.position = valPositionType;
            dataAdd.betType = bettype;
            if (valPositionType == "AGENT_API") {
                dataAdd.apiKey = createGuid();
            }
            dataAdd.tel = $('#phonenumber').val();
            dataAdd.memberId = getUrlParameter('itemid');
            $.ajax({
                url: apiURL + "/apiRoute/member/editUnderProfiler",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataAdd),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit agent success");
                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                        $('#modalAlertSuccess').modal();
                        setTimeout(function () {
                            window.location.href = "/Menu_MemberManagement/member_and_agent_management.aspx";
                        }, 1500);
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

        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };

        function createGuid() {
            function s4() {
                return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
            }
            return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
        }

        function GetHistoryItem(els) {
            $("#usernameView").val(els.getAttribute('attr-user'));
            $("#nicknameView").val(els.getAttribute('attr-nick'));
            $("#phonenumberView").val(els.getAttribute('attr-tel'));

            if (els.getAttribute('attr-sus') == "false") {
                $("#suspendView").val("No");
            }
            else {
                $("#suspendView").val("Yes");
            }

            if (els.getAttribute('attr-lock') == "false") {
                $("#lockView").val("Unlock");
            }
            else {
                $("#lockView").val("Lock");
            }

            $("#currencyView").val(els.getAttribute('attr-cur'));
            var val = parseFloat(els.getAttribute('attr-credit'));
            $("#creditView").val(val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

            if (els.getAttribute('attr-type') == "AGENT_NONE_API") {
                $("#typeView").val("Master Agent");
                $('.bettypezoneview').css('display', 'none');
            }
            else if (els.getAttribute('attr-type') == "AGENT_API") {
                $("#typeView").val("API");

                if (els.getAttribute('attr-bettype') == "API_SEAMLESS") {
                    $('#bettypeView').val("Seamless");
                }
                else if (els.getAttribute('attr-bettype') == "API_TRANSFER") {
                    $('#bettypeView').val("Transfer");
                }
                $('.bettypezoneview').css('display', 'flex');
            }

            $("#GivenPTView").val(els.getAttribute('attr-pt') + "%");
            $("#OriginalBaccaratView").val(els.getAttribute('attr-bac'));
            $("#CowCowView").val(els.getAttribute('attr-cow'));
            $("#DragonTigerView").val(els.getAttribute('attr-dra'));
            $("#Bacarrat4PointView").val(els.getAttribute('attr-four'));
            $("#RouleteView").val(els.getAttribute('attr-rou'));
            $("#SicboView").val(els.getAttribute('attr-sic'));
            $("#Super6BaccaratView").val(els.getAttribute('attr-sup'));
            $("#modalHistory").modal();
        }
    </script>
</asp:Content>

