<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfigLineMsg.aspx.cs" Inherits="TPMPatkol.ConfigLineMsg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .form-control {
            min-width: 100%;
        }
    </style>
    <div class="page-header">
        <h2>Line Config
            <button class="btn btn-success" type="button" id="btnModalLineConfig">Add</button></h2>
    </div>

    <div class="panel-group">
        <div class="panel panel-default" id="DisplayMaintenanceTab">
            <div class="panel-body">
                <div class="col-md-12 row">
                    <div class="table-responsive">
                        <table class="table table-hover" id="tableLineConfigHeader">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="ListLineConfig"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>

    <div class="modal fade" id="ModalListDetailLineConfig" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Detail Line Config</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListChoice" class="table table-bordered table-responsive">
                        <thead id="Thead3">
                            <tr>
                                <th>Seq</th>
                                <th>Msg</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBodyChoice'>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalMaintenanceLineConfig" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Add Check List</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtLineConfigHeaderMsgName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddLineConfigHeader">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            CallLineConfigHeader();
            $("#btnModalLineConfig").on('click', function () {
                $("#txtLineConfigHeaderMsgName").val("");
                $("#ModalMaintenanceLineConfig").modal("show");
            });
            $("#btnAddLineConfigHeader").on('click', function () {
                var Msg_Name = $("#txtLineConfigHeaderMsgName").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_LineConfig_Header") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: 0, Msg_Name: Msg_Name }),
                    success: function (response) {
                        CallLineConfigHeader();
                        alert("Add Complete");
                        $("#ModalMaintenanceLineConfig").modal("hide");
                    }
                });
            });
            $(document).on('click', '.btnUpdateLineConfigHeader', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var Msg_Name = row.find("td:nth-child(1)").find("input").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_LineConfig_Header") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Msg_Name: Msg_Name }),
                    success: function (response) {
                        alert("Update Complete");
                    }
                });

            });



            $(document).on('click', '.btnDetailLineConfigHeader', function () {
                var row = $(this).closest("tr");
                var Header_ID = parseInt(row.attr("data-id"));
                $("#ModalListDetailLineConfig").modal("show");
                $("#TBodyChoice").attr("data-idheader", Header_ID);
                CallLineConfigDetail(Header_ID);
            });

            $(document).on('click', '#btnAddLineConfigDetail', function () {
                var row = $(this).closest("tr");
                var Seq = row.find("td:nth-child(1)").find("select").val();
                var Msg = row.find("td:nth-child(2)").find("input").val();
                var Header_ID = $("#TBodyChoice").attr("data-idheader");
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_LineConfig") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: 0, Seq: Seq, msg_type: "text", Msg: Msg, Header_ID: Header_ID }),
                    success: function (response) {
                        alert("Add Complete");
                        CallLineConfigDetail(Header_ID);
                    }
                });

            });
            $(document).on('click', '.btnUpdateLineConfigDetail', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-idline"));
                var Seq = row.find("td:nth-child(1)").find("select").val();
                var Msg = row.find("td:nth-child(2)").find("input").val();
                var Header_ID = $("#TBodyChoice").attr("data-idheader");
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_LineConfig") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Seq: Seq, msg_type: "text", Msg: Msg, Header_ID: Header_ID }),
                    success: function (response) {
                        alert("Update Complete");
                    }
                });
            });
            $(document).on('click', '.btnDeleteLineConfigDetail', function () {
                if (confirm("Are you sure for Delete?")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-idline"));
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_LineConfig") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Seq: 999, msg_type: "", Msg: "", Header_ID: 0 }),
                        success: function (response) {
                            alert("Delete Complete");
                            row.remove();
                        }
                    });
                }
            });





            function CallLineConfigHeader() {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetLineConfigHeader") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $("#ListLineConfig").empty();
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Msg_Name = val[1];
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><input class="form-control" type="text" value="' + Msg_Name + '"/></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateLineConfigHeader">Save</button></td>';
                                frament += '<td><button type="button" class="btn btn-info btn-block btnDetailLineConfigHeader">Detail</button></td>';
                                frament += '</tr>';
                                $("#ListLineConfig").append(frament);
                            });
                        }
                    }
                });
            }


            function CallLineConfigDetail(Header_ID) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetLineConfigDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Header_ID: Header_ID }),
                    success: function (response) {
                        $("#TBodyChoice").empty();
                        var LineAdd = '<tr><td><select class="form-control"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select></td>';
                        LineAdd += '<td><input type="text" class="form-control"></td>';
                        LineAdd += '<td><button type="button" class="btn btn-success btn-block" id="btnAddLineConfigDetail">Add</button></td></tr>';
                        $("#TBodyChoice").append(LineAdd);
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Seq = val[1];
                                var msg_type = val[2];
                                var Msg = val[3];
                                var Header_ID = val[4];
                                frament += '<tr data-idline="' + ID + '">';
                                frament += '<td><select class="form-control"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select></td>';
                                frament += '<td><input type="text" class="form-control" value="' + Msg + '"></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateLineConfigDetail">Save</button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteLineConfigDetail">Delete</button></td>';
                                frament += '</tr>';
                                var element = $(frament);
                                element.find("td:nth-child(1)").find("select").val(Seq);
                                frament = element;
                                $("#TBodyChoice").append(frament);
                            });
                        }
                    }
                });
            }



        });


    </script>

</asp:Content>
