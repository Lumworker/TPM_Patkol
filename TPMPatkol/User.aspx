<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TPMPatkol.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        .form-control {
            min-width: 100%;
        }
    </style>

    <div class="page-header">
        <h2>List User
            <button class="btn btn-success" id="buttonModalDetailUser" type="button">
                Add
            </button>
        </h2>
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
                                        <th>Role</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListUser">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--END Table-->
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalDetailUser" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Detail User</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Username"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtUsername" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Password"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtPassword" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="FullName"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Email"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEmail" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="LineToken"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtLineToken" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Gendor"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtGendor">
                                    <option>ชาย</option>
                                    <option>หญิง</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Role"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtTypeRole">
                                    <option value=""></option>
                                    <option>Owner</option>
                                    <option>Manager</option>
                                    <option>Worker</option>
                                    <option>Admin</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddDetailUser">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script>

        $(document).ready(function () {

            callListUser("", "List");

            $("#buttonModalDetailUser").on('click', function () {
                $("#txtUsername").val("").attr("data-id", 0).prop("disabled", false);
                $("#txtPassword").val("");
                $("#txtName").val("");
                $("#txtEmail").val("");
                $("#txtLineToken").val("");
                $("#txtGendor").val("");
                $("#txtTypeRole").val("");
                $("#btnAddDetailUser").text("Add").removeClass("btn-warning").addClass("btn-success").attr("data-typeclick", "insert");
                $("#ModalDetailUser").modal("show");
            });

            $(document).on('click', '.buttonModalDetailUser', function () {
                callListUser($(this).attr("data-id"), "Detail");
            });


            $(document).on('click', "#btnAddDetailUser", function () {
                var Status = $("#btnAddDetailUser").attr("data-typeclick");
                var ID = Status == "insert" ? 0 : parseInt($("#txtUsername").attr("data-id"));
                var username = $("#txtUsername").val();
                var password = $("#txtPassword").val();
                var name = $("#txtName").val();
                var email = $("#txtEmail").val();
                var Gendor = $("#txtGendor").val();
                var typrole = $("#txtTypeRole").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_User") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Username: username, Password: password, Name: name, Email: email, Gendor: Gendor, Type: typrole }),
                    success: function (response) {
                        callListUser("", "List");
                        if (Status == "insert") { alert("Add Complete"); }
                        else { alert("Update Complete"); }
                        $("#ModalDetailUser").modal("hide");
                    }
                });
            });




            function callListUser(ID, Type) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListUser") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID }),
                    success: function (response) {
                        if (Type == "List") {
                            $("#ListUser").empty();
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var IDUser = val[0];
                                var Username = val[1];
                                var Name = val[3];
                                var TypeRole = val[7];
                                frament += '<tr>';
                                frament += '<td>' + Username + '</td>';
                                frament += '<td>' + Name + '</td>';
                                frament += '<td>' + TypeRole + '</td>';
                                frament += '<td><button type="button" class="btn btn-block btn-info buttonModalDetailUser" data-id="' + IDUser + '">Detail</button></td>';
                                frament += '</tr>';
                            });
                            $("#ListUser").append(frament);
                        } else if (Type == "Detail") {
                            var IDUser = response.d[0][0];
                            var Username = response.d[0][1];
                            var Password = response.d[0][2];
                            var Name = response.d[0][3];
                            var Email = response.d[0][4];
                            var LineID = response.d[0][5];
                            var Gendor = response.d[0][6];
                            var TypeRole = response.d[0][7];
                            var RoleEmp = response.d[0][8];

                            $("#txtUsername").val(Username).attr("data-id", IDUser).prop("disabled", true);
                            $("#txtPassword").val(Password);
                            $("#txtName").val(Name);
                            $("#txtEmail").val(Email);
                            $("#txtLineToken").val(LineID);
                            $("#txtGendor").val(Gendor);
                            $("#txtTypeRole").val(TypeRole);

                            $("#btnAddDetailUser").text("Save").addClass("btn-warning").removeClass("btn-success").attr("data-typeclick", "Edit");
                            $("#ModalDetailUser").modal("show");
                        }
                    }
                });
            }

        });

    </script>
</asp:Content>
