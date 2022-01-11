<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateUser.aspx.cs" Inherits="TPMPatkol.GenerateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        .form-control {
            min-width: 100%;
        }
    </style>

    <div class="page-header">
        <h2>Service User</h2>
    </div>
    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableServiceUser">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Name</th>
                                        <th>Lastname</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th></th>
                                        <%--<th></th>--%>
                                    </tr>
                                </thead>
                                <tbody id="ListServiceUser">
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

            callListServiceUser();

            $(document).on('click', "#btnAddServiceUser", function () {
                var txtServiceUserCode = $("#txtServiceUserCode").val();
                var txtServiceUserName = $("#txtServiceUserName").val();
                var txtServiceUserLastName = $("#txtServiceUserLastName").val();
                var txtServiceUserRole = $("#txtServiceUserRole").val();
                var txtServiceUserStatus = $("#txtServiceUserStatus").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_User") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Username: txtServiceUserCode, Name: txtServiceUserName, Lastname: txtServiceUserLastName, Role: txtServiceUserRole, Status: txtServiceUserStatus, Type: "Insert" }),
                    success: function (response) {
                        $("#txtServiceUserCode").val("");
                        $("#txtServiceUserName").val("");
                        $("#txtServiceUserLastName").val("");
                        $("#txtServiceUserRole").val("");
                        $("#txtServiceUserStatus").val("");
                        callListServiceUser();
                        alert("Add Complete");
                    }
                });
            });


            $(document).on('click', '.btnUpdateServiceUser', function () {
                var row = $(this).closest("tr");
                var txtServiceUserCode = row.find("td:nth-child(1)").find("input").val();
                var txtServiceUserName = row.find("td:nth-child(2)").find("input").val();
                var txtServiceUserLastName = row.find("td:nth-child(3)").find("input").val();
                var txtServiceUserRole = row.find("td:nth-child(4)").find("select").val();
                var txtServiceUserStatus = row.find("td:nth-child(5)").find("select").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Service_User") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Username: txtServiceUserCode, Name: txtServiceUserName, Lastname: txtServiceUserLastName, Role: txtServiceUserRole, Status: txtServiceUserStatus, Type: "Edit" }),
                    success: function (response) {
                        alert("Edit Complete");
                    }
                });
            });


            function callListServiceUser() {
                $("#ListServiceUser").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetServiceUser") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Type: "" }),
                    success: function (response) {
                        var insertline = '<tr>';
                        insertline += '<td><input type="text" id="txtServiceUserCode" class="form-control" placeholder="Username" /></td>';
                        insertline += '<td><input type="text" id="txtServiceUserName" class="form-control" placeholder="Name" /></td>';
                        insertline += '<td><input type="text" id="txtServiceUserLastName" class="form-control" placeholder="LastName" /></td>';
                        insertline += '<td><select class="form-control" id="txtServiceUserRole"><option></option><option>Admin</option><option>User</option></select></td>';
                        insertline += '<td><select class="form-control" id="txtServiceUserStatus"><option></option><option>Active</option><option>InActive</option></select></td>';
                        insertline += '<td><button type="button" id="btnAddServiceUser" class="btn btn-success btn-block">Add</button></td>';
                        insertline += '</tr>';
                        $("#ListServiceUser").append(insertline);
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var username = val[0];
                                var name = val[1];
                                var lastnme = val[2];
                                var role = val[3];
                                var Status = val[4];
                                frament += '<tr>';
                                frament += '<td><input class="form-control" type="text" value="' + username + '" disabled/></td>';
                                frament += '<td><input class="form-control" type="text" value="' + name + '"/></td>';
                                frament += '<td><input class="form-control" type="text" value="' + lastnme + '"/></td>';
                                frament += '<td><select class="form-control"><option>Admin</option><option>User</option><select></td>';
                                frament += '<td><select class="form-control"><option>Active</option><option>InActive</option><select></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateServiceUser">Save</button></td>';
                                //frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteServiceUser">Delete</button></td></tr>';
                                frament += '</tr>';
                                var element = $(frament);
                                element.find("td:nth-child(4)").find("select").val(role);
                                element.find("td:nth-child(5)").find("select").val(Status);
                                frament = element;
                                $("#ListServiceUser").append(frament);
                            });
                        }
                    }
                });
            }

        });

    </script>

</asp:Content>
