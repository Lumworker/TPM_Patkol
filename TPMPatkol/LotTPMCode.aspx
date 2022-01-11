<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LotTPMCode.aspx.cs" Inherits="TPMPatkol.LotTPMCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="page-header">
        <h2>QR Code Re-Print
            <button class="btn btn-secondary" id="buttonModalLot" type="button">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </h2>
    </div>


    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Lot :"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" runat="server" id="txtLot" class="form-control" style="min-width: 100%" disabled />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="CreateDate : "></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" runat="server" id="txtLotCreateDate" class="form-control" style="min-width: 100%" disabled />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Start TPM Code"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input class="form-control" runat="server" id="txtTPMStart" type="text" value="" style="min-width: 100%" disabled />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="End TPM Code"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input class="form-control" runat="server" id="txtTPMEnd" type="text" value="" style="min-width: 100%" disabled />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <%--<div id="linkClickFolderQrCode" class="row" style="display: none">
                    <div class="form-group col-md-6 col-sm-12 col-xs-12">
                        <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="File Path"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <span class="form-control" id="ClickLink" style="color: orange"></span>
                        </div>
                    </div>
                </div>--%>
                <!--END Row-->
            </div>
            <!--panel-body-->
        </div>
    </div>





    <div class="modal fade" id="ModalListLot" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Lot
                            </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="Lot_myInput" placeholder="Search Lot" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="EM_Table" class="table table-bordered table-responsive">
                        <thead id="EM_theadtable" runat="server">
                            <tr>
                                <%--<th></th>--%>
                                <th>Lot No.</th>
                                <th>Start TPM Code</th>
                                <th>End TPM Code</th>
                                <th>Create Date</th>
                            </tr>
                        </thead>
                        <tbody id='EM_insertRowText'>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {


            var GetTPMCode = getAllUrlParams("LotID");

            if (GetTPMCode == null || GetTPMCode == "") {
                //window.location.href = "Default.aspx";
                CallLot("", "");
            } else {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetLotID") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: GetTPMCode }),
                    success: function (response) {
                    }
                });
            }

            $("#buttonModalLot").on("click", function () {
                CallLot("", "");
            });

            $(document).on('click', '.ClickLot', function () {

                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text(),
                    td3 = row.find("td:nth-child(3)").text(),
                    td4 = row.find("td:nth-child(4)").text();

                $("#MainContent_txtLot").val(td1);
                $("#MainContent_txtLotCreateDate").val(td4);
                $("#MainContent_txtTPMStart").val(td2);
                $("#MainContent_txtTPMEnd").val(td3);

                //$("#ClickLink").text("TPMPatkolQRCode\\" + td1);
                $("#ClickLink").text(""+td1);
                $("#linkClickFolderQrCode").show();
            });

            $("#ClickLink").on('click', function () {
               //window.location.href = "file://PORTALAPP01/TPMPatkolQRCode/" + $("#MainContent_txtLot").val();
               <%-- $.ajax({
                    type: "POST",
                    async: true,
                    url: "<%= ResolveUrl("LotTPMCode.aspx/ClickLink") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ LotID: $("#MainContent_txtLot").val() })
                });--%>
            });


            $("#Lot_myInput").on('change', function () {
                var value = $(this).val();
                CallLot("", value);
            });

            function CallLot(Lot, SearchText) {
                $("#EM_insertRowText").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetLotTPMCode") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ LotID: Lot, Search: SearchText }),
                    success: OnSuccessListLot
                });
                $("#ModalListLot").modal("show");
            }

            function OnSuccessListLot(response) {
                var frament = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var LotID = val[0];
                        var StartTPMCode = val[1];
                        var EndTPMCode = val[2];
                        var CreateDate = ("" + val[3]).substring(0, 10);

                        frament += "<tr>";
                        frament += "<td><a class='ClickLot' href='javascript:void(0)' data-dismiss='modal'>" + LotID + "</a></td>";
                        frament += "<td><a class='ClickLot' href='javascript:void(0)' data-dismiss='modal'>" + StartTPMCode + "</a></td>";
                        frament += "<td><a class='ClickLot' href='javascript:void(0)' data-dismiss='modal'>" + EndTPMCode + "</a></td>";
                        frament += "<td><a class='ClickLot' href='javascript:void(0)' data-dismiss='modal'>" + CreateDate + "</a></td>";
                        frament += "</tr>";

                    });
                } else {
                    frament += "<tr>";
                    frament += "<td>Not Data</td>";
                    frament += "<td>Not Data</td>";
                    frament += "<td>Not Data</td>";
                    frament += "<td>Not Data</td>";
                    frament += "</tr>";
                }

                $("#EM_insertRowText").append(frament);

            }

        });

    </script>


</asp:Content>
