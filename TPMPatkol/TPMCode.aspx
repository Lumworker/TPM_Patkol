<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TPMCode.aspx.cs" Inherits="TPMPatkol.TPMCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>List TPMCode</h2>
    </div>
    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-6 col-sm-12 col-xs-12">
                        <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Search"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" class="form-control" id="txtSearch" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableServiceUser">
                                <thead>
                                    <tr>
                                        <th>Customer Number</th>
                                        <th>Customer Name</th>
                                        <th>จำนวน TPMCode</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListTPMCode">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--END Table-->
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListDisplayTPMRegister" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="headerTPMDetail"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListDisplayTPMRegister" class="table table-bordered table-responsive">
                        <thead id="Thead4" runat="server">
                            <tr>
                                <th>Name</th>
                                <th>TPM Code</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyDisplayTPMRegister'></tbody>
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

            callListTPMCode();

            $("#txtSearch").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#ListTPMCode tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $(document).on('click', '.buttonModalDetailUser', function () {
                callDetailTPMCode($(this).attr("data-id"));
                $("#ModalListDisplayTPMRegister").modal("show");
            });

            function callListTPMCode() {
                $("#ListTPMCode").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListMonitorTPMCode") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        var frament = "";
                        $.each(response.d, function (index, val) {
                            var cust_num = val[0];
                            var cust_num_site = val[1];
                            var cust_name = val[2];
                            var countTPM = val[3];
                            frament += '<tr>';
                            frament += '<td>' + cust_num + '</td>';
                            frament += '<td>' + cust_name + '</td>';
                            frament += '<td>' + countTPM + '</td>';
                            frament += '<td><button type="button" class="btn btn-block btn-info buttonModalDetailUser" data-id="' + cust_num_site + '">Detail</button></td>';
                            frament += '</tr>';
                        });
                        $("#ListTPMCode").append(frament);
                    }
                });
            }

            function callDetailTPMCode(cust_site) {
                $("#TBodyDisplayTPMRegister").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetDetailMonitorTPMCode") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_site: cust_site }),
                    success: function (response) {
                        var frament = "";
                        $("#headerTPMDetail").text(response.d[0][0] + " : " + response.d[0][4]);
                        $.each(response.d, function (index, val) {
                            var Machine_EquipmentName = val[3];
                            var TPMCode = val[2];
                            frament += '<tr>';
                            frament += '<td><a href="RegisterTPM.aspx?CodeTPM=' + TPMCode + '" target="_blank">' + Machine_EquipmentName + '</a></td>';
                            frament += '<td><a href="RegisterTPM.aspx?CodeTPM=' + TPMCode + '" target="_blank">' + TPMCode + '</a></td>';
                            frament += '</tr>';
                        });
                        $("#TBodyDisplayTPMRegister").append(frament);
                    }
                });
            }

        });

    </script>
</asp:Content>
