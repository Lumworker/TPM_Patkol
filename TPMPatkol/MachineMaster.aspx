<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MachineMaster.aspx.cs" Inherits="TPMPatkol.MachineMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-control {
            min-width: 100%;
        }

        .row-eq-height {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
        }

        @media only screen and (max-width: 990px) {
            .row-eq-height {
                display: -webkit-box;
                display: grid;
            }
        }

        .SelectLine, .SelectLine:focus {
            color: #f0ad4e;
            font-weight: bold;
        }
    </style>
    <div class="page-header">
        <h2>Machine Master</h2>
    </div>
    <div class="row">
        <div class="row-eq-height">
            <div class="col-md-6 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h4>
                                    <strong>Main Equipment</strong>
                                </h4>
                            </div>
                            <div class="col-md-3 text-right">
                                <button type="button" class="btn btn-success" id="btnClickModalAddMainEquipment">Add</button>
                            </div>
                        </div>

                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableMainEquipment">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListMainEquipment"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--END row-->
                    </div>
                </div>
            </div>
            <!--End col 7-->
            <div class="col-md-6 col-xs-12" id="BlockGroup" style="display: none">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h4>
                                    <strong>Group : <span id="lblTextHeaderGroup"></span></strong>
                                </h4>
                            </div>
                            <div class="col-md-3 text-right">
                                <button type="button" class="btn btn-success" id="btnClickModalAddGroup">Add</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableGroup">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListGroup"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--END row-->
                    </div>
                </div>
            </div>
            <!--End col 8-->
        </div>
        <!--row-eq-height-->
        <div class="row-eq-height">
            <div class="col-md-6 col-xs-12" id="BlockEquipment" style="display: none;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h4>
                                    <strong>Equipment <span id="lblTextHeaderEquipment"></span></strong>
                                </h4>
                            </div>
                            <div class="col-md-3 text-right">
                                <button type="button" class="btn btn-success" id="btnClickModalAddEquipment">Add</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableEquipment">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListEquipment"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--END row-->
                    </div>
                </div>
            </div>
            <!--End col 7-->
            <div class="col-md-6 col-xs-12" id="BlockCheckList" style="display: none;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h4>
                                    <strong>Detail <span id="lblTextHeaderCheckList"></span></strong>
                                </h4>
                            </div>
                            <div class="col-md-3 text-right">
                                <button type="button" class="btn btn-warning" id="btnClickModalAddCheckList">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12 text-mode" style="margin: 10px 0;">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#1" data-toggle="tab">CheckList</a></li>
                                    <li><a href="#2" data-toggle="tab">Reason</a></li>
                                    <li><a href="#3" data-toggle="tab">Working Day</a></li>
                                </ul>
                            </div>
                            <div class="col-md-12">
                                <div class="tab-content ">
                                    <div class="tab-pane active" id="1">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table table-hover" id="tableCheckList">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>Name</th>
                                                                <th>Picture</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCheckList"></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!--END row-->
                                    </div>
                                    <div class="tab-pane" id="2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table table-hover" id="tableReason">
                                                        <thead>
                                                            <tr>
                                                                <th>Seq</th>
                                                                <th>Reason</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListReason">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!--END row-->
                                    </div>
                                    <div class="tab-pane" id="3">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table table-hover" id="tableEquipmentWorkingDay">
                                                        <thead>
                                                            <tr>
                                                                <th style="text-align: center">Monday</th>
                                                                <th style="text-align: center">Tuesday</th>
                                                                <th style="text-align: center">Wednesday</th>
                                                                <th style="text-align: center">Thursday</th>
                                                                <th style="text-align: center">Friday</th>
                                                                <th style="text-align: center">Saturday</th>
                                                                <th style="text-align: center">Sunday</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListEquipmentWorkingDay" style="text-align: center">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!--END row-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End col 8-->
        </div>
        <!--row-eq-height-->
    </div>
    <!--row-->



    <div class="modal fade" id="ModalListMainEquipment" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Main Equipment : <span id="IDMainEquipment"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label32" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Code : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtMainEquipmentCode" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtMainEquipmentName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtMainEquipmentStatus">
                                    <option>Active</option>
                                    <option>InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddMainEquipment">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListGroup" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Group : <span id="IDGroup"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Code : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtGroupCode" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtGroupName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtGroupStatus">
                                    <option>Active</option>
                                    <option>InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddGroup">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalListEquipment" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Equipment : <span id="IDEquipment"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Code : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEquipmentCode" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEquipmentName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtEquipmentStatus">
                                    <option>Active</option>
                                    <option>InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddEquipment">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {

            ListMainEquipment();


            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            //////////////////  กด Save Check List  ////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////

            $(document).on('change', '#ListReason input[type="text"],#ListReason Select , #ListEquipmentWorkingDay input[type="checkbox"]', function () { $(this).addClass("ISChanger") });
            $(document).on('click', "#btnClickAddReason", function () {
                var seq = $(this).closest("tr").find("td:nth-child(1)").find("select").val();
                var reason = $(this).closest("tr").find("td:nth-child(2)").find("input[type=text]").val();
                if (seq != "" && reason != "") {
                    var frament = '<tr data-status="SubList">';
                    frament += '<td><select class="form-control ISChanger"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>';
                    frament += '<td><input type="text" class="form-control ISChanger" value="' + reason + '" /></td>';
                    frament += '<td><select class="form-control ISChanger"><option>Active</option><option>InActive</option></select></td>';
                    frament += '</tr>';
                    var element = $(frament);
                    element.find("td:nth-child(1)").find("select").val(seq);
                    frament = element;
                    $(this).closest("tr").find("td:nth-child(1)").find("select").val("");
                    $(this).closest("tr").find("td:nth-child(2)").find("input[type=text]").val("");
                    $("#ListReason").append(frament);
                }
            });
            $("#btnClickModalAddCheckList").on('click', function () {
                var Machine_EquipID = parseInt($("#lblTextHeaderCheckList").attr("data-idequipment"));
                $("#ListCheckList > tr").each(function () {
                    var check_to_checked = $(this).find("input[type=checkbox]").prop("checked");
                    var check_to_Database = $(this).find("input[type=checkbox]").hasClass("GetDatabase");
                    var Status = "";
                    var CheckID = parseInt($(this).attr("data-id"));
                    var idcheckbox = $(this).find("input[type=checkbox]").attr("data-idcheckbox") ? parseInt($(this).find("input[type=checkbox]").attr("data-idcheckbox")) : 0;

                    if (check_to_checked && !check_to_Database) { Status = "Insert"; }
                    else if (!check_to_checked && check_to_Database) { Status = "Delete"; }
                    else { Status = "None"; }
                    //alert(Status);
                    if (Status != "None") {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Equip_Checklist") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: idcheckbox, Machine_EquipID: Machine_EquipID, CheckID: CheckID, Status: Status }),
                            success: function (response) { }
                        });
                    }
                });
                $("#ListReason > tr").each(function () {
                    if ($(this).attr("data-status") == "SubList") {
                        var check_to_checked = $(this).find("input").hasClass("ISChanger") || $(this).find("select").hasClass("ISChanger") ? true : false;
                        var check_to_Database = $(this).find("input").hasClass("GetDatabase") || $(this).find("select").hasClass("GetDatabase") ? true : false;
                        var Status = "";
                        var idreason = $(this).attr("data-id") ? parseInt($(this).attr("data-id")) : 0;
                        var Seq = $(this).find("td:nth-child(1)").find("select").val();
                        var Reason = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                        var StatusReason = $(this).find("td:nth-child(3)").find("select").val();
                        if (check_to_checked && !check_to_Database) { Status = "Insert"; }
                        else if (check_to_checked && check_to_Database) { Status = "Edit"; }
                        else { Status = "None"; }

                        if (Status != "None") {
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Equip_Reason") %>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ ID: idreason, Equipment_ID: Machine_EquipID, Reason: Reason, Seq: Seq, StatusReason: StatusReason, Status: Status }),
                                success: function (response) {
                                }
                            });
                            $(this).find("td:nth-child(1)").find("select").removeClass("ISChanger").addClass("GetDatabase");
                            $(this).find("td:nth-child(2)").find("input[type=text]").removeClass("ISChanger").addClass("GetDatabase");
                            $(this).find("td:nth-child(3)").find("select").removeClass("ISChanger").addClass("GetDatabase");
                        }
                    }
                });

                $("#ListEquipmentWorkingDay > tr").each(function () {

                    var check_to_checked = $(this).find("input").hasClass("ISChanger") ? true : false;
                    if (check_to_checked) {
                        var Monday = $(this).find("td:nth-child(1)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Tuesday = $(this).find("td:nth-child(2)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Wednesday = $(this).find("td:nth-child(3)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Thursday = $(this).find("td:nth-child(4)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Friday = $(this).find("td:nth-child(5)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Saturday = $(this).find("td:nth-child(6)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Sunday = $(this).find("td:nth-child(7)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        //console.log(Machine_EquipID + " : " + Monday + " : " + Tuesday + " : " + Wednesday + " : " + Thursday + " : " + Friday + " : " + Saturday + " : " + Sunday);

                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Equip_WorkingDay") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ Equipment_ID: Machine_EquipID, Monday: Monday, Tuesday: Tuesday, Wednesday: Wednesday, Thursday: Thursday, Friday: Friday, Saturday: Saturday, Sunday: Sunday }),
                            success: function (response) {
                            }
                        });
                    }

                }).promise().done(function () {

                    ListCheckList(Machine_EquipID);
                    ListReason(Machine_EquipID);
                    ListEquipmentWorkingDay(Machine_EquipID);
                    
                    alert('Update Complete');
                });

            });


            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            //////////////////  กด Add กับปุ่ม Delete  ////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////


            $("#btnAddMainEquipment").on('click', function () {
                var txtMainEquipmentCode = $("#txtMainEquipmentCode").val();
                var txtMainEquipmentName = $("#txtMainEquipmentName").val();
                var txtMainEquipmentStatus = $("#txtMainEquipmentStatus").val();
                var ID = $("#IDMainEquipment").text() != "" ? parseInt($("#IDMainEquipment").text()) : 0;
                var Status_Work = $("#btnAddMainEquipment").text() == "Add" ? "Insert" : "Update";
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Main_Equipment") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Code: txtMainEquipmentCode, Name: txtMainEquipmentName, Status: txtMainEquipmentStatus, Status_Work: Status_Work }),
                    success: function (response) {
                        if (Status_Work == "Update") { alert("Update Complete"); }
                        ListMainEquipment();
                        $("#ModalListMainEquipment").modal("hide");
                    }
                });
            });
            $(document).on('click', '.btnDeleteMainEquipment', function () {
                if (confirm("Confirm Delete Main Equipment??")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-id"));
                    var txtMainEquipmentCode = row.find("td:nth-child(1)").text();
                    var txtMainEquipmentName = row.find("td:nth-child(2)").text();
                    var txtMainEquipmentStatus = row.find("td:nth-child(3)").text();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Main_Equipment") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Code: txtMainEquipmentCode, Name: txtMainEquipmentName, Status: txtMainEquipmentStatus, Status_Work: "Delete" }),
                        success: function (response) {
                            row.remove();
                            alert("Delete Complete");
                        }
                    });
                }
            });


            $("#btnAddGroup").on('click', function () {
                var txtGroupCode = $("#txtGroupCode").val();
                var txtGroupName = $("#txtGroupName").val();
                var txtGroupStatus = $("#txtGroupStatus").val();
                var ID = $("#IDGroup").text() != "" ? parseInt($("#IDGroup").text()) : 0;
                var Status_Work = $("#btnAddGroup").text() == "Add" ? "Insert" : "Update";
                var Machine_MainID = parseInt($("#lblTextHeaderGroup").attr("data-idmainequipmentname"));
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Group") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Machine_MainID: Machine_MainID, Code: txtGroupCode, Name: txtGroupName, Status: txtGroupStatus, Status_Work: Status_Work }),
                    success: function (response) {
                        if (Status_Work == "Update") { alert("Update Complete"); }
                        ListGroup(Machine_MainID);
                        $("#ModalListGroup").modal("hide");
                    }
                });
            });
            $(document).on('click', '.btnDeleteGroup', function () {
                if (confirm("Confirm Delete Group??")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-id"));
                    var txtGroupCode = row.find("td:nth-child(1)").text();
                    var txtGroupName = row.find("td:nth-child(2)").text();
                    var txtGroupStatus = row.find("td:nth-child(3)").text();
                    var Machine_MainID = $("#lblTextHeaderGroup").attr("data-idmainequipmentname");
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Group") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Machine_MainID: Machine_MainID, Code: txtGroupCode, Name: txtGroupName, Status: txtGroupStatus, Status_Work: "Delete" }),
                        success: function (response) {
                            row.remove();
                            alert("Delete Complete");
                        }
                    });
                }
            });


            $("#btnAddEquipment").on('click', function () {
                var txtEquipmentCode = $("#txtEquipmentCode").val();
                var txtEquipmentName = $("#txtEquipmentName").val();
                var txtEquipmentStatus = $("#txtEquipmentStatus").val();
                var ID = $("#IDEquipment").text() != "" ? parseInt($("#IDEquipment").text()) : 0;
                var Status_Work = $("#btnAddEquipment").text() == "Add" ? "Insert" : "Update";
                var Machine_GroupID = parseInt($("#lblTextHeaderEquipment").attr("data-idgroup"));
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Equipment") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Machine_GroupID: Machine_GroupID, Code: txtEquipmentCode, Name: txtEquipmentName, Status: txtEquipmentStatus, Status_Work: Status_Work }),
                    success: function (response) {
                        if (Status_Work == "Update") { alert("Update Complete"); }
                        GetListEquipment(Machine_GroupID);
                        $("#ModalListEquipment").modal("hide");
                    }
                });
            });
            $(document).on('click', '.btnDeleteEquipment', function () {
                if (confirm("Confirm Delete Group??")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-id"));
                    var txtEquipmentCode = row.find("td:nth-child(1)").text();
                    var txtEquipmentName = row.find("td:nth-child(2)").text();
                    var txtEquipmentStatus = row.find("td:nth-child(3)").text();
                    var Machine_GroupID = parseInt($("#lblTextHeaderEquipment").attr("data-idgroup"));
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_Equipment") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Machine_GroupID: Machine_GroupID, Code: txtEquipmentCode, Name: txtEquipmentName, Status: txtEquipmentStatus, Status_Work: "Delete" }),
                        success: function (response) {
                            row.remove();
                            alert("Delete Complete");
                        }
                    });
                }
            });



            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            //////////////////  กดเรียก Modal สำหรับ Add //////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////


            $("#btnClickModalAddMainEquipment").on('click', function () {
                $("#txtMainEquipmentCode").val("");
                $("#txtMainEquipmentName").val("");
                $("#txtMainEquipmentStatus").val("");
                $("#IDMainEquipment").text("");
                $("#btnAddMainEquipment").removeClass("btn-warning").addClass("btn-success").text("Add");
                $("#ModalListMainEquipment").modal("show");
            });
            $(document).on('click', '.btnUpdateMainEquipment', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtMainEquipmentCode = row.find("td:nth-child(1)").text();
                var txtMainEquipmentName = row.find("td:nth-child(2)").text();
                var txtMainEquipmentStatus = row.find("td:nth-child(3)").text();
                $("#txtMainEquipmentCode").val(txtMainEquipmentCode);
                $("#txtMainEquipmentName").val(txtMainEquipmentName);
                $("#txtMainEquipmentStatus").val(txtMainEquipmentStatus);
                $("#IDMainEquipment").text(ID);
                $("#btnAddMainEquipment").removeClass("btn-success").addClass("btn-warning").text("Update");
                $("#ModalListMainEquipment").modal("show");
            });


            $("#btnClickModalAddGroup").on('click', function () {
                $("#txtGroupCode").val("");
                $("#txtGroupName").val("");
                $("#txtGroupStatus").val("");
                $("#IDGroup").text("");
                $("#btnAddGroup").removeClass("btn-warning").addClass("btn-success").text("Add");
                $("#ModalListGroup").modal("show");
            });
            $(document).on('click', '.btnUpdateGroup', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtGroupCode = row.find("td:nth-child(1)").text();
                var txtGroupName = row.find("td:nth-child(2)").text();
                var txtGroupStatus = row.find("td:nth-child(3)").text();
                $("#txtGroupCode").val(txtGroupCode);
                $("#txtGroupName").val(txtGroupName);
                $("#txtGroupStatus").val(txtGroupStatus);
                $("#IDGroup").text(ID);
                $("#btnAddGroup").removeClass("btn-success").addClass("btn-warning").text("Update");
                $("#ModalListGroup").modal("show");
            });


            $("#btnClickModalAddEquipment").on('click', function () {
                $("#txtEquipmentCode").val("");
                $("#txtEquipmentName").val("");
                $("#txtEquipmentStatus").val("");
                $("#IDEquipment").text("");
                $("#btnAddEquipment").removeClass("btn-warning").addClass("btn-success").text("Add");
                $("#ModalListEquipment").modal("show");
            });
            $(document).on('click', '.btnUpdateEquipment', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtGroupCode = row.find("td:nth-child(1)").text();
                var txtGroupName = row.find("td:nth-child(2)").text();
                var txtGroupStatus = row.find("td:nth-child(3)").text();
                $("#txtEquipmentCode").val(txtGroupCode);
                $("#txtEquipmentName").val(txtGroupName);
                $("#txtEquipmentStatus").val(txtGroupStatus);
                $("#IDEquipment").text(ID);
                $("#btnAddEquipment").removeClass("btn-success").addClass("btn-warning").text("Update");
                $("#ModalListEquipment").modal("show");
            });

            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            //////////////////  กดเรียกข้อมูลลำดับขั้นตอน   ////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////

            $(document).on('click', '.ClickMainEquipmentSelectGroup', function () {
                $("#ListMainEquipment").find("tr").find("td").find("a").removeClass("SelectLine");
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtMainEquipmentCode = row.find("td:nth-child(1)").text();
                var txtMainEquipmentName = row.find("td:nth-child(2)").text();
                var txtMainEquipmentStatus = row.find("td:nth-child(3)").text();
                $("#lblTextHeaderGroup").text(txtMainEquipmentCode + " " + txtMainEquipmentName).attr("data-idmainequipmentname", ID);
                $("#ListGroup").empty();
                $("#ListEquipment").empty();
                $("#ListCheckList").empty();
                $("#BlockGroup").show();
                $("#BlockEquipment").hide();
                $("#BlockCheckList").hide();
                row.find("td").find("a").addClass("SelectLine");
                ListGroup(ID);
            });

            $(document).on('click', '.ClickGroupSelectEquipment', function () {
                $("#ListGroup").find("tr").find("td").find("a").removeClass("SelectLine");
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtMainGroupCode = row.find("td:nth-child(1)").text();
                var txtMainGroupName = row.find("td:nth-child(2)").text();
                var txtMainGroupStatus = row.find("td:nth-child(3)").text();
                $("#lblTextHeaderEquipment").text(txtMainGroupCode + " " + txtMainGroupName).attr("data-idgroup", ID);
                $("#ListEquipment").empty();
                $("#ListCheckList").empty();
                $("#BlockGroup").show();
                $("#BlockEquipment").show();
                $("#BlockCheckList").hide();
                row.find("td").find("a").addClass("SelectLine");
                GetListEquipment(ID);
            });

            $(document).on('click', '.ClickEquipmentSelectCheckList', function () {
                $("#ListEquipment").find("tr").find("td").find("a").removeClass("SelectLine");
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var txtMainEquipmentCode = row.find("td:nth-child(1)").text();
                var txtMainEquipmentName = row.find("td:nth-child(2)").text();
                var txtMainEquipmentStatus = row.find("td:nth-child(3)").text();
                $("#lblTextHeaderCheckList").text(txtMainEquipmentCode + " " + txtMainEquipmentName).attr("data-idequipment", ID);
                $("#ListCheckList").empty();
                $("#BlockGroup").show();
                $("#BlockEquipment").show();
                $("#BlockCheckList").show();
                row.find("td").find("a").addClass("SelectLine");
                ListCheckList(ID);
                ListReason(ID);
                ListEquipmentWorkingDay(ID);
            });

            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            //////////////////  Function เรียกข้อมูล   ////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////

            function ListMainEquipment() {
                $("#ListMainEquipment").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListMainEquipment") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Code: "" }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><a class="ClickMainEquipmentSelectGroup" href="javascript:void(0)">' + Code + '</a></td>';
                                frament += '<td><a class="ClickMainEquipmentSelectGroup" href="javascript:void(0)">' + Name + '</a></td>';
                                frament += '<td><a class="ClickMainEquipmentSelectGroup" href="javascript:void(0)">' + Stauts + '</a></td>';
                                frament += '<td><button type="button" class="btn btn-warning btnUpdateMainEquipment"><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btnDeleteMainEquipment"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td></tr>';
                                frament += '</tr>';
                                $("#ListMainEquipment").append(frament);
                            });
                        }
                    }
                });
            }

            function ListGroup(MainEqID) {
                $("#ListGroup").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGroup") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MainEqID: MainEqID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                var MainID = val[4];

                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><a class="ClickGroupSelectEquipment" href="javascript:void(0)">' + Code + '</a></td>';
                                frament += '<td><a class="ClickGroupSelectEquipment" href="javascript:void(0)">' + Name + '</a></td>';
                                frament += '<td><a class="ClickGroupSelectEquipment" href="javascript:void(0)">' + Stauts + '</a></td>';
                                frament += '<td><button type="button" class="btn btn-warning btnUpdateGroup"><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btnDeleteGroup"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td></tr>';
                                frament += '</tr>';
                                $("#ListGroup").append(frament);
                            });
                        }
                    }
                });
            }



            function GetListEquipment(MainGroupID) {
                $("#ListEquipment").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipment") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MainGroupID: MainGroupID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                var MainID = val[4];

                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><a class="ClickEquipmentSelectCheckList" href="javascript:void(0)">' + Code + '</a></td>';
                                frament += '<td><a class="ClickEquipmentSelectCheckList" href="javascript:void(0)">' + Name + '</a></td>';
                                frament += '<td><a class="ClickEquipmentSelectCheckList" href="javascript:void(0)">' + Stauts + '</a></td>';
                                frament += '<td><button type="button" class="btn btn-warning btnUpdateEquipment"><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btnDeleteEquipment"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td></tr>';
                                frament += '</tr>';
                                $("#ListEquipment").append(frament);
                            });
                        }
                    }
                });
            }


            function ListCheckList(EquipmentID) {
                $("#ListCheckList").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipmentCheckList") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EquipmentID: EquipmentID }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var List_Name = val[1];
                                var Picture = val[2];
                                var CheckListValue = val[5];
                                var check = CheckListValue == 1 ? "checked class='GetDatabase'" : "";
                                var IDCheckBox = val[6];
                                frament += '<tr data-id=' + ID + '>';
                                frament += '<td style="text-align: center;"><input type="checkbox" data-idcheckbox="' + IDCheckBox + '" ' + check + '></td>';
                                frament += '<td>' + List_Name + '</td>';
                                frament += '<td><img src="' + Picture + '" style="heigth:80px;width:80px;"></td>';
                                frament += '</tr>';
                            });
                        } else {
                            frament = '<tr><td>Not Data</td><td>Not Data</td><td>Not Data</td></tr>';
                        }
                        $("#ListCheckList").append(frament);
                    }
                });
            }

            function ListReason(EquipmentID) {
                $("#ListReason").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipmentReason") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EquipmentID: EquipmentID }),
                    success: function (response) {
                        var frament = '<tr data-status="MainAdd"><td><select class="form-control"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td><td><input type="text" class="form-control" /></td><td><button type="button" id="btnClickAddReason" class="btn btn-success btn-block">Add</button></td></tr>';
                        var tag = $(frament);
                        tag.find("td:nth-child(1)").find("select").val("");
                        frament = tag;
                        $("#ListReason").append(frament);
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var line = '';
                                var ID = val[0];
                                var Equipment_ID = val[1];
                                var Reason = val[2];
                                var Seq = val[3];
                                var Status = val[4];
                                line = '<tr data-status="SubList" data-id="' + ID + '">';
                                line += '<td><select class="form-control GetDatabase"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>';
                                line += '<td><input type="text" class="form-control GetDatabase" value="' + Reason + '" /></td>';
                                line += '<td><select class="form-control GetDatabase"><option>Active</option><option>InActive</option></select></td>';
                                line += '</tr>';
                                var element = $(line);
                                element.find("td:nth-child(1)").find("select").val(Seq);
                                element.find("td:nth-child(3)").find("select").val(Status);
                                line = element;
                                $("#ListReason").append(line);
                            });
                        }

                    }
                });
            }

            function ListEquipmentWorkingDay(EquipmentID) {
                $("#ListEquipmentWorkingDay").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipmentWorkingDay") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EquipmentID: EquipmentID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Monday = val[1] == "True" ? "checked class='GetDatabase'" : "";
                                var Tuesday = val[2] == "True" ? "checked class='GetDatabase'" : "";
                                var Wednesday = val[3] == "True" ? "checked class='GetDatabase'" : "";
                                var Thursday = val[4] == "True" ? "checked class='GetDatabase'" : "";
                                var Friday = val[5] == "True" ? "checked class='GetDatabase'" : "";
                                var Saturday = val[6] == "True" ? "checked class='GetDatabase'" : "";
                                var Sunday = val[7] == "True" ? "checked class='GetDatabase'" : "";

                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><input type="checkbox" ' + Monday + ' /></td>';
                                frament += '<td><input type="checkbox" ' + Tuesday + ' /></td>';
                                frament += '<td><input type="checkbox" ' + Wednesday + ' /></td>';
                                frament += '<td><input type="checkbox" ' + Thursday + ' /></td>';
                                frament += '<td><input type="checkbox" ' + Friday + ' /></td>';
                                frament += '<td><input type="checkbox" ' + Saturday + ' /></td>';
                                frament += '<td><input type="checkbox" ' + Sunday + ' /></td></tr>';

                                $("#ListEquipmentWorkingDay").append(frament);
                            });
                        }
                    }
                });
            }


        });



    </script>

</asp:Content>
