<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomMaster.aspx.cs" Inherits="TPMPatkol.RoomMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .form-control {
            min-width: 100%;
        }
    </style>

    <div class="page-header">
        <h2>Room Master</h2>
    </div>
    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableRoomMaster">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Name</th>
                                        <th>Status</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListRoomMaster">
                                    <tr id="LineAddRoomMaster">
                                        <td>
                                            <input type="text" id="txtRoomMasterCode" class="form-control" placeholder="Room Master Code" /></td>
                                        <td>
                                            <input type="text" id="txtRoomMasterName" class="form-control" placeholder="Room Master Name" /></td>
                                        <td>
                                            <select class="form-control" id="txtRoomMasterStatus">
                                                <option>Active</option>
                                                <option>InActive</option>
                                            </select></td>
                                        <td>
                                            <button type="button" id="btnAddRoomMaster" class="btn btn-success btn-block">Add</button></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--END Table-->
                </div>
            </div>
        </div>
    </div>


    <script>

        $(document).ready(function () {

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListRoomMaster") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Type: "" }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var frament = "";
                            var ID = val[0];
                            var Code = val[1];
                            var Name = val[2];
                            var Stauts = val[3];
                            frament += '<tr data-id="' + ID + '">';
                            frament += '<td><input class="form-control" type="text" value="' + Code + '"/></td>';
                            frament += '<td><input class="form-control" type="text" value="' + Name + '"/></td>';
                            frament += '<td><select class="form-control" id="stroomlv' + ID + '"><option>Active</option><option>InActive</option><select></td>';
                            frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateRoomMaster">Save</button></td>';
                            frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteRoomMaster">Delete</button></td></tr>';
                            frament += '</tr>';
                            $("#ListRoomMaster").append(frament);
                            $("#stroomlv" + ID).val(Stauts);
                        });
                    }
                }
            });

            $("#btnAddRoomMaster").on('click', function () {
                var txtRoomMasterCode = $("#txtRoomMasterCode").val();
                var txtRoomMasterName = $("#txtRoomMasterName").val();
                var txtRoomMasterStatus = $("#txtRoomMasterStatus").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Room_Master") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: 0, Code: txtRoomMasterCode, Name: txtRoomMasterName, Status: txtRoomMasterStatus, Status_Work: "Insert" }),
                    success: function (response) {
                        var frament = "";
                        var ID = response.d;
                        frament += '<tr data-id="' + ID + '">';
                        frament += '<td><input class="form-control" type="text" value="' + txtRoomMasterCode + '"/></td>';
                        frament += '<td><input class="form-control" type="text" value="' + txtRoomMasterName + '"/></td>';
                        frament += '<td><select class="form-control" id="stroomlv' + ID + '"><option>Active</option><option>InActive</option><select></td>';
                        frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateRoomMaster">Save</button></td>';
                        frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteRoomMaster">Delete</button></td></tr>';
                        frament += '</tr>';
                        $("#ListRoomMaster").append(frament);
                        $("#stroomlv" + ID).val(txtRoomMasterStatus);
                    }
                });
            });


            $(document).on('click', '.btnUpdateRoomMaster', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtRoomMasterCode = row.find("td:nth-child(1)").find("input").val();
                var txtRoomMasterName = row.find("td:nth-child(2)").find("input").val();
                var txtRoomMasterStatus = row.find("td:nth-child(3)").find("select").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Room_Master") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Code: txtRoomMasterCode, Name: txtRoomMasterName, Status: txtRoomMasterStatus, Status_Work: "Update" }),
                    success: function (response) {
                        alert("Update Complete");
                    }
                });
            });

            $(document).on('click', '.btnDeleteRoomMaster', function () {
                if (confirm("Confirm Delete Romm??")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-id"));
                    var txtRoomMasterCode = row.find("td:nth-child(1)").find("input").val();
                    var txtRoomMasterName = row.find("td:nth-child(2)").find("input").val();
                    var txtRoomMasterStatus = row.find("td:nth-child(3)").find("select").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Room_Master") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Code: txtRoomMasterCode, Name: txtRoomMasterName, Status: txtRoomMasterStatus, Status_Work: "Delete" }),
                        success: function (response) {
                            row.remove();
                            alert("Delete Complete");
                        }
                    });
                }
            });


        });

    </script>

</asp:Content>
