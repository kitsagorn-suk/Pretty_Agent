<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="recalculate.aspx.cs" Inherits="Pretty_Gaming.Menu_SeamlessAPI.recalculate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Seamless API"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Recalculate"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Recalculate"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row col-md-4">
            <label for="email" class="col-4 col-form-label alignright" set-lan="text:Ticket ID_"></label>
            <div class="col-8">
                <input type="text" class="form-control" id="searchTicketID">
            </div>
        </div>
        <div class="form-group row col-md-1">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search"></button>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 10%;" set-lan="text:No"></th>
                    <th style="width: 10%;" set-lan="text:Ticket ID"></th>
                    <th style="width: 60%; text-align: left; padding-left: 5px;" set-lan="text:Request / Response"></th>
                    <th style="width: 10%;" set-lan="text:Retry"></th>
                </tr>
            </thead>
            <tbody>
                 <tr>
                    <td class="aligncenter">1</td>
                    <td class="aligncenter">100001</td>
                    <td></td>
                    <td class="aligncenter"><button type="button" class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect" style="line-height: 0rem !important;" set-lan="text:Retry"></button></td>
                </tr>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menuSeamlessAPI , #menuSeamlessAPI > a").addClass("active");
            $("#menuSeamlessAPI > div").css("display", "block");
        });
    </script>
</asp:Content>
