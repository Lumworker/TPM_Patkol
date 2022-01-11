<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceContact.aspx.cs" Inherits="TPMPatkol.ServiceContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .form-control {
            min-width: 100%;
        }
    </style>
    <div class="page-header">
        <h2>Service Team
            <button class="btn btn-success" type="button" id="btnModalServiceTeam">Add</button></h2>
    </div>

    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-md-12 row">
                    <div class="table-responsive">
                        <table class="table table-hover" id="tableServiceTeamHeader">
                            <thead>
                                <tr>
                                    <th>Team</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="ListServiceTeam">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>

    <div class="modal fade" id="ModalMaintenanceServiceTeam" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Add Team</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Team : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtServiceTeamHeaderMsgName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddServiceTeamHeader">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListDetailServiceTeam" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Detail Team : <span id="spanheaderDetailTeam"></span></h4>
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
                                <th>Username</th>
                                <th>Name</th>
                                <th>Role</th>
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
    <div class="modal fade" id="ModalListEmployee" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Service User</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="EM_myInput" placeholder="Search User" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="EM_Table" class="table table-bordered table-responsive">
                        <thead id="EM_theadtable" runat="server">
                            <tr>
                                <th>Username</th>
                                <th>FullName</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody id='EM_insertRowText'></tbody>
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

            CallListTeam();


            $("#btnModalServiceTeam").on('click', function () {
                $("#txtServiceTeamHeaderMsgName").val('');
                $("#ModalMaintenanceServiceTeam").modal("show");
            });

            $("#btnAddServiceTeamHeader").on('click', function () {
                var name = $("#txtServiceTeamHeaderMsgName").val();
                if (name != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_Team") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: 0, Team_Name: name }),
                        success: function (response) {
                            CallListTeam();
                            alert("Add Complete");
                            $("#ModalMaintenanceServiceTeam").modal("hide");
                        }
                    });
                } else {
                    alert("Not have word in textbox");
                }
            });
            $(document).on('click', '.btnUpdateServiceTeam', function () {
                var row = $(this).closest("tr");
                var id = parseInt(row.attr("data-id"));
                var name = row.find("td:nth-child(1)").find("input").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_Team") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: id, Team_Name: name }),
                    success: function (response) {
                        alert("Edit Complete");
                    }
                });
            });

            $(document).on('click', '.ClickDetailTeam', function () {
                var row = $(this).closest("tr");
                var id = parseInt(row.attr("data-id"));
                var name = row.find("td:nth-child(1)").find("input").val();
                $("#spanheaderDetailTeam").text(name);
                CallListTeamDetail(id);
                $("#ModalListDetailServiceTeam").modal("show");
            });

            $(document).on('click', '#btnModalEmployee', function () {
                CallListServiceUser($("#TBodyChoice").attr("data-idteam"));
                $("#ModalListEmployee").modal('show');
            });

            $(document).on('click', '.ClickSelectServiceUser', function () {
                var row = $(this).closest("tr");
                $("#txtUsername").val(row.find("td:nth-child(1)").text());
                $("#txtFullname").val(row.find("td:nth-child(2)").text());
                $("#txtrole ").val(row.find("td:nth-child(3)").text());
            });

            $(document).on('click', '.btnAddServiceTeamMember', function () {
                var row = $(this).closest("tr");
                var username = $("#txtUsername").val();
                var idteam = parseInt($("#TBodyChoice").attr("data-idteam"));
                if (username != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_Team_Member") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Service_ID: idteam, Username: username, Type: "Insert" }),
                        success: function (response) {
                            $("#txtUsername").val("");
                            $("#txtFullname").val("");
                            $("#txtrole ").val("");
                            CallListTeamDetail(idteam);
                            alert("Add Complete");
                        }
                    });
                }
            });
            $(document).on('click', '.ClickDeleteDetailTeam', function () {
                var row = $(this).closest("tr");
                var username = row.find("td:nth-child(1)").find("input").val();
                var idteam = parseInt($("#TBodyChoice").attr("data-idteam"));
                if (confirm("Are you sure for delete member?")) {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_Team_Member") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Service_ID: idteam, Username: username, Type: "Delete" }),
                        success: function (response) {
                            $("#txtUsername").val("");
                            $("#txtFullname").val("");
                            $("#txtrole").val("");
                            CallListTeamDetail(idteam);
                            alert("Delete Complete");
                        }
                    });
                }
            });


            function CallListServiceUser(Team_id) {
                $("#EM_insertRowText").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_Team_Member_NonUser_Select") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Team_id: Team_id }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var Username = val[0];
                                var FullName = val[1];
                                var Role = val[2];
                                frament += '<tr>';
                                frament += "<td><a class='ClickSelectServiceUser' href='javascript:void(0)' data-dismiss='modal'>" + Username + "</a></td>";
                                frament += "<td><a class='ClickSelectServiceUser' href='javascript:void(0)' data-dismiss='modal'>" + FullName + "</a></td>";
                                frament += "<td><a class='ClickSelectServiceUser' href='javascript:void(0)' data-dismiss='modal'>" + Role + "</a></td>";
                                frament += '</tr>';
                            });
                            $("#EM_insertRowText").append(frament);
                        }
                    }
                });
            }

            function CallListTeam() {
                $("#ListServiceTeam").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetServiceTeam") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Name = val[1];
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><input class="form-control" type="text" value="' + Name + '"/></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateServiceTeam">Save</button></td>';
                                frament += '<td><button type="button" class="btn btn-info btn-block ClickDetailTeam">Detail</button></td></tr>';
                                frament += '</tr>';

                                $("#ListServiceTeam").append(frament);
                            });
                        }
                    }
                });
            }


            function CallListTeamDetail(Team_id) {
                $("#TBodyChoice").empty();
                $("#TBodyChoice").attr("data-idteam", Team_id);
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetServiceTeamMember") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Team_id: Team_id }),
                    success: function (response) {
                        var insertline = '<tr><td><div class="input-group"><input type="text" id="txtUsername" class="form-control" /><div class="input-group-btn">';
                        insertline += '<button class="btn btn-default" id="btnModalEmployee" type="button"><i class="glyphicon glyphicon-search"></i></button>';
                        insertline += '</div></div></td>';
                        insertline += '<td><input type="text" id="txtFullname" class="form-control" disabled /></td>';
                        insertline += '<td><input type="text" id="txtrole" class="form-control" disabled /></td>';
                        insertline += '<td><button type="button" class="btn btn-success btn-block btnAddServiceTeamMember">Add</button></td></tr>';
                        $("#TBodyChoice").append(insertline);
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Team_Name = val[1];
                                var Username = val[2];
                                var FullName = val[3];
                                var Role = val[4];
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><input type="text" class="form-control" value="' + Username + '" disabled /></td>';
                                frament += '<td><input type="text" class="form-control" value="' + FullName + '" disabled /></td>';
                                frament += '<td><input type="text" class="form-control" value="' + Role + '" disabled /></td>';
                                frament += '<td><button type="button" class="btn btn-danger btn-block ClickDeleteDetailTeam">Delete</button></td></tr>';
                                frament += '</tr>';
                            });
                            $("#TBodyChoice").append(frament);
                        }
                    }
                });
            }


        });


    </script>

</asp:Content>
