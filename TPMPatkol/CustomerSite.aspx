<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerSite.aspx.cs" Inherits="TPMPatkol.CustomerSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .form-control {
            min-width: 100%;
        }

        .img-preview {
            /*margin: auto;*/
            max-width: 100%;
            height: 200px;
        }
    </style>

    <div class="page-header">
        <h2>Customer
            <button class="btn btn-secondary" id="buttonModalCustomer" type="button">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </h2>
    </div>
    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-xs-12" style="text-align: right">
                            <button class="btn btn-warning" id="btnSaveCustomer" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Logo"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <a href="javascript:void(0)" id="CustomerLogo">
                                <img class="thumbnail img-preview" src="images/iconDoc.gif" alt="IMAGE">
                            </a>
                            <input type="file" id="txtCustomerLogo" class="form-control" style="min-width: 100%; display: none" />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Num"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtCustomerNumber" class="form-control" style="min-width: 100%" disabled />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Name"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtCustomerName" class="form-control" style="min-width: 100%" disabled />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Address"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtCustomerAddress" class="form-control" style="min-width: 100%" disabled />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Tel"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtCustomertel" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Mobile"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtCustomerMobile" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer FAX"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtCustomerFax" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                </div>
                <!--END Row-->
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
        <div class="panel panel-default" id="DisplayCustomerTab" style="display: none">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 text-mode" style="margin: 10px 0;">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#1" data-toggle="tab">Customer Site</a></li>
                            <li><a href="#2" data-toggle="tab">Customer Member</a></li>
                            <li><a href="#3" data-toggle="tab">Schedule</a></li>
                            <li><a href="#4" data-toggle="tab">Working Day</a></li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="tab-content ">
                            <div class="tab-pane active" id="1">
                                <h4>Customer Site</h4>
                                <div class="col-md-12 row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="tableCustomerSite">
                                            <thead>
                                                <tr>
                                                    <th>Site Name</th>
                                                    <th>Site Address</th>
                                                    <th>Site Tel</th>
                                                    <th>Site Mobile</th>
                                                    <th>Site Fax</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListCustomerSite">
                                                <tr id="LineAddCustomerSite">
                                                    <td>
                                                        <input type="text" id="txtSiteName" class="form-control" placeholder="Customer Site Name" /></td>
                                                    <td>
                                                        <input type="text" id="txtSiteAddress" class="form-control" placeholder="Customer Site Address" /></td>
                                                    <td>
                                                        <input type="text" id="txtSiteTel" class="form-control" placeholder="Customer Site Tel" /></td>
                                                    <td>
                                                        <input type="text" id="txtSiteMobile" class="form-control" placeholder="Customer Site Mobile" /></td>
                                                    <td>
                                                        <input type="text" id="txtSiteFax" class="form-control" placeholder="Customer Site Fax" /></td>
                                                    <td>
                                                        <button type="button" id="btnAddCustomerSite" class="btn btn-success btn-block">Add</button></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--END Table-->
                            </div>
                            <div class="tab-pane" id="2">
                                <h4>Customer Member</h4>
                                <div class="col-md-12 row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="tableCustomerMember">
                                            <thead>
                                                <tr>
                                                    <th>User</th>
                                                    <th style="display: none;">Customer</th>
                                                    <th>Customer Site</th>
                                                    <%--<th>Room</th>--%>
                                                    <th>Status</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListCustomerMember">
                                                <tr id="LineCustomerMember">
                                                    <td>
                                                        <div class="input-group">
                                                            <input type="text" id="txtUserMember" class="form-control" />
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default" id="btnModalEmployee" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="display: none;">
                                                        <input type="text" id="txtCustomerMember" class="form-control" disabled />
                                                    </td>
                                                    <td>
                                                        <div class="input-group">
                                                            <input type="text" id="txtCustomerSiteMember" class="form-control" />
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default" id="btnModalCustomerSiteMember" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <%--<td>
                                                        <div class="input-group">
                                                            <input type="text" id="txtMachineMember" class="form-control" />
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default" id="btnModalMachineMember" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>--%>
                                                    <td>
                                                        <select id="txtStatusMember" class="form-control">
                                                            <option>Active</option>
                                                            <option>InActive</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <button type="button" id="btnAddCustomerMember" class="btn btn-success btn-block">Add</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--END Table-->
                            </div>
                            <div class="tab-pane" id="3">
                                <h4>Schedule</h4>
                                <div class="col-md-12 row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="tableSchedule">
                                            <thead>
                                                <tr>
                                                    <th>Site Name</th>
                                                    <th>Schedule</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListSchedule">
                                                <tr>
                                                    <td>
                                                        <div class="input-group">
                                                            <input type="text" id="txtScheduleCustomerSite" class="form-control" />
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default" id="btnModalCustomerSiteSchedule" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <select id="txtSchedule" class="form-control">
                                                            <option>00:00</option>
                                                            <option>00:30</option>
                                                            <option>01:00</option>
                                                            <option>01:30</option>
                                                            <option>02:00</option>
                                                            <option>02:30</option>
                                                            <option>03:00</option>
                                                            <option>03:30</option>
                                                            <option>04:00</option>
                                                            <option>04:30</option>
                                                            <option>05:00</option>
                                                            <option>05:30</option>
                                                            <option>06:00</option>
                                                            <option>06:30</option>
                                                            <option>07:00</option>
                                                            <option>07:30</option>
                                                            <option>08:00</option>
                                                            <option>08:30</option>
                                                            <option>09:00</option>
                                                            <option>09:30</option>
                                                            <option>10:00</option>
                                                            <option>10:30</option>
                                                            <option>11:00</option>
                                                            <option>11:30</option>
                                                            <option>12:00</option>
                                                            <option>12:30</option>
                                                            <option>13:00</option>
                                                            <option>13:30</option>
                                                            <option>14:00</option>
                                                            <option>14:30</option>
                                                            <option>15:00</option>
                                                            <option>15:30</option>
                                                            <option>16:00</option>
                                                            <option>16:30</option>
                                                            <option>17:00</option>
                                                            <option>17:30</option>
                                                            <option>18:00</option>
                                                            <option>18:30</option>
                                                            <option>19:00</option>
                                                            <option>19:30</option>
                                                            <option>20:00</option>
                                                            <option>20:30</option>
                                                            <option>21:00</option>
                                                            <option>21:30</option>
                                                            <option>22:00</option>
                                                            <option>22:30</option>
                                                            <option>23:00</option>
                                                            <option>23:30</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <button type="button" id="btnAddSchedule" class="btn btn-success btn-block">Add</button></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--END Table-->
                            </div>
                            <div class="tab-pane" id="4">
                                <h4>Working Day</h4>
                                <div class="col-md-12 row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="tableWorkingDay">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">Site Name</th>
                                                    <th style="text-align: center">Monday</th>
                                                    <th style="text-align: center">Tuesday</th>
                                                    <th style="text-align: center">Wednesday</th>
                                                    <th style="text-align: center">Thursday</th>
                                                    <th style="text-align: center">Friday</th>
                                                    <th style="text-align: center">Saturday</th>
                                                    <th style="text-align: center">Sunday</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListWorkingDay">
                                                <%--<tr style="text-align: center">
                                                    <td>???</td>
                                                    <td>
                                                        <input id="ckbMonday" type="checkbox" /></td>
                                                    <td>
                                                        <input id="ckbTuesday" type="checkbox" /></td>
                                                    <td>
                                                        <input id="ckbWednesday" type="checkbox" /></td>
                                                    <td>
                                                        <input id="ckbThursday" type="checkbox" /></td>
                                                    <td>
                                                        <input id="ckbFriday" type="checkbox" /></td>
                                                    <td>
                                                        <input id="ckbSaturday" type="checkbox" /></td>
                                                    <td>
                                                        <input id="ckbSunday" type="checkbox" /></td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--END Table-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>

    <div class="modal fade" id="ModalListCustomer" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Customer</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListCustomer_myInput" placeholder="Search Customer" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCustomer" class="table table-bordered table-responsive">
                        <thead id="Thead1" runat="server">
                            <tr>
                                <th>Customer No.</th>
                                <th>Customer Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyCustomer'></tbody>
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
                            <h4 class="modal-title">List Employee</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="EM_myInput" placeholder="Search Employee" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="EM_Table" class="table table-bordered table-responsive">
                        <thead id="EM_theadtable" runat="server">
                            <tr>
                                <th>Emp User</th>
                                <th>Emp Name</th>
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

    <div class="modal fade" id="ModalListCustomerSite" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Customer Site</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListCustomerSite_myInput" placeholder="Search Customer Site" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCustomerSite" class="table table-bordered table-responsive">
                        <thead id="Thead2" runat="server">
                            <tr>
                                <%--<th>Customer Site Number</th>--%>
                                <th>Customer Site Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyCustomerSite'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListMachineMember" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Machine Member</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListMachineMember_myInput" placeholder="Search Machine Member" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListMachineMember" class="table table-bordered table-responsive">
                        <thead id="Thead3" runat="server">
                            <tr>
                                <th>Machine Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyMachineMember'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                            <h4 class="modal-title">List Site Register TPM</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        <div class="col-md-12">
                            <h5>จำนวนที่ลงทะเบียน : <span id="CountReTPM"></span></h5>

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

            var GetCust_num = getAllUrlParams("Cus_num");
            if (GetCust_num == null || GetCust_num == "") {
                //window.location.href = "Default.aspx";
                CallListCustomer();
            } else {
                GetCustomer(GetCust_num);

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomerSite") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: GetCust_num }),
                    success: function (response) {
                        if (response.d.length) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var cust_num_site = val[0];
                                var cust_num = val[1];
                                var cust_site_name = val[2];
                                var cust_address = val[3];
                                var cust_tel = val[4];
                                var cust_mobile = val[5];
                                var cust_fax = val[6];
                                frament += '<tr data-id="' + cust_num_site + '"><td><input type="text" class="form-control txtSiteName" value="' + cust_site_name + '"/></td>';
                                frament += '<td><input type="text" class="form-control txtSiteAddress" value="' + cust_address + '"/></td>';
                                frament += '<td><input type="text" class="form-control txtSiteTel" value="' + cust_tel + '"/></td>';
                                frament += '<td><input type="text" class="form-control txtSiteMobile" value="' + cust_mobile + '"/></td>';
                                frament += '<td><input type="text" class="form-control txtSiteFax" value="' + cust_fax + '"/></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateCustomerSite">Save</button></td>';
                                //frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCustomerSite">Delete</button></td></tr>';
                                frament += '<td><button type="button" class="btn btn-info btn-block btnDetailCustomerSite">Detail</button></td></tr>';

                                var workingday = "";
                                var Monday = val[7] == "True" ? "checked class='GetDatabase'" : "";
                                var Tuesday = val[8] == "True" ? "checked class='GetDatabase'" : "";
                                var Wednesday = val[9] == "True" ? "checked class='GetDatabase'" : "";
                                var Thursday = val[10] == "True" ? "checked class='GetDatabase'" : "";
                                var Friday = val[11] == "True" ? "checked class='GetDatabase'" : "";
                                var Saturday = val[12] == "True" ? "checked class='GetDatabase'" : "";
                                var Sunday = val[13] == "True" ? "checked class='GetDatabase'" : "";
                                workingday = '<tr style="text-align: center" data-id="' + cust_num_site + '">';
                                workingday += '<td>' + cust_site_name + '</td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Monday + ' /></td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Tuesday + ' /></td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Wednesday + ' /></td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Thursday + ' /></td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Friday + ' /></td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Saturday + ' /></td>';
                                workingday += '<td><input class="ckworking" type="checkbox" ' + Sunday + ' /></td>';
                                workingday += '<td><button type="button" class="btn btn-warning btn-block btnUpdateWorkingDay">Save</button></td></tr>';


                                $("#ListWorkingDay").append(workingday);
                            });
                            $("#ListCustomerSite").append(frament);
                        }
                    }
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomerMember") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: GetCust_num }),
                    success: function (response) {
                        if (response.d.length) {
                            var frament = "";
                            var text = "";
                            var ID = "";
                            $.each(response.d, function (index, val) {
                                ID = val[0];
                                var Users = val[1];
                                var Customer = val[2];
                                var Customer_Site = val[3];
                                var Machine = val[4];
                                text = val[5];
                                var sitename = val[6];
                                frament = '<tr data-id="' + ID + '"><td><input type="text" class="form-control " value="' + Users + '" disabled /></td>';
                                frament += '<td style="display:none;"><input type="text" class="form-control" value="' + Customer + '" disabled/></td>';
                                frament += '<td><input type="text" class="form-control" data-idsite="' + Customer_Site + '" value="' + sitename + '" disabled/></td>';
                                //frament += '<td><input type="text" class="form-control" value="' + Machine + '" disabled /></td>';
                                frament += '<td><select id="txtStatusMember' + ID + '" class="form-control"><option>Active</option><option>InActive</option> </select></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateCustomerMember">Save</button></td>';
                                //frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCustomerMember">Delete</button></td>';

                                frament += '</tr>';

                                $("#ListCustomerMember").append(frament);
                                $("#txtStatusMember" + ID).val(text);
                            });
                        }
                    }
                });

                CallCustomerSiteSchedule(GetCust_num);
            }




            $("#CustomerLogo").on('click', function () { $("#txtCustomerLogo").click(); });
            $("#txtCustomerLogo").change(function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#CustomerLogo .img-preview').attr('src', e.target.result);
                        $("#txtCustomerLogo").addClass("ImagesAddUpdate");
                        $("#txtCustomerLogo").removeClass("ImagesNotUpdate");
                    };
                    reader.readAsDataURL(this.files[0]);

                }
            });


            $("#btnSaveCustomer").on('click', function () {
                var customer_num = $("#txtCustomerNumber").val();
                var customer_name = $("#txtCustomerName").val();
                var customer_adress = $("#txtCustomerAddress").val();
                var customer_tel = $("#txtCustomertel").val();
                var customer_moile = $("#txtCustomerMobile").val();
                var customer_fax = $("#txtCustomerFax").val();

                var imgPath = "https://tpm-patkol.com/TPMPatkolQRCode/CustomerLogo/" + customer_num + ".png";
                var path = $('#CustomerLogo .img-preview').attr("src") != "" ? $('#CustomerLogo .img-preview').attr("src") : "";
                var img = $("#txtCustomerLogo").hasClass("ImagesAddUpdate") ? imgPath : path;

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: customer_num/*, cust_name: customer_name*/, cust_address: customer_adress, cust_tel: customer_tel, cust_mobile: customer_moile, cust_fax: customer_fax, cust_logo: img }),
                    success: function (response) {

                        insertFile($("#txtCustomerLogo")[0].files[0], customer_num, "CustomerLogo");
                        GetCustomer(GetCust_num);
                        alert("Update Complete");
                        //window.location.href = "CustomerSite.aspx?Cus_num=" + customer_num;
                    }
                });
            });

            $("#btnAddCustomerSite").on('click', function () {
                var cust_num = $("#txtCustomerNumber").val();
                var txtSiteName = $("#txtSiteName").val();
                var txtSiteAddress = $("#txtSiteAddress").val();
                var txtSiteTel = $("#txtSiteTel").val();
                var txtSiteMobile = $("#txtSiteMobile").val();
                var txtSiteFax = $("#txtSiteFax").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Stie") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num_site: 0, cust_num: cust_num, cust_site_name: txtSiteName, cust_address: txtSiteAddress, cust_tel: txtSiteTel, cust_mobile: txtSiteMobile, cust_fax: txtSiteFax, cust_latitude: "", cust_longitude: "", Status: "Add" }),
                    success: function (response) {
                        var id_site = response.d;
                        var frament = '<tr data-id="' + id_site + '"><td><input type="text" class="form-control txtSiteName" value="' + txtSiteName + '"/></td>';
                        frament += '<td><input type="text" class="form-control txtSiteAddress" value="' + txtSiteAddress + '"/></td>';
                        frament += '<td><input type="text" class="form-control txtSiteTel" value="' + txtSiteTel + '"/></td>';
                        frament += '<td><input type="text" class="form-control txtSiteMobile" value="' + txtSiteMobile + '"/></td>';
                        frament += '<td><input type="text" class="form-control txtSiteFax" value="' + txtSiteFax + '"/></td>';
                        frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateCustomerSite">Save</button></td>';
                        //frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCustomerSite">Delete</button></td></tr>';
                        frament += '<td><button type="button" class="btn btn-info btn-block btnDetailCustomerSite">Detail</button></td></tr>';

                        $("#tableCustomerSite").append(frament);
                        $("#txtCustomerNumber").val("");
                        $("#txtSiteName").val("");
                        $("#txtSiteAddress").val("");
                        $("#txtSiteTel").val("");
                        $("#txtSiteMobile").val("");
                        $("#txtSiteFax").val("");
                    },
                    error: function (ex) { alert("Error"); }
                });
            });
            $(document).on('click', '.btnUpdateCustomerSite', function () {
                var row = $(this).closest("tr");
                var Site_ID = row.data("id");
                var cust_num = $("#txtCustomerNumber").val();
                var td1 = row.find("td:nth-child(1)").find("input").val(),
                    td2 = row.find("td:nth-child(2)").find("input").val(),
                    td3 = row.find("td:nth-child(3)").find("input").val(),
                    td4 = row.find("td:nth-child(4)").find("input").val(),
                    td5 = row.find("td:nth-child(5)").find("input").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Stie") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num_site: Site_ID, cust_num: cust_num, cust_site_name: td1, cust_address: td2, cust_tel: td3, cust_mobile: td4, cust_fax: td5, cust_latitude: "", cust_longitude: "", Status: "Update" }),
                    success: function (response) {
                        alert("Update Complete");
                    },
                    error: function (ex) { alert("Error"); }
                });

            });

            $(document).on('click', '.btnDetailCustomerSite', function () {
                var custsite = $(this).closest("tr").attr("data-id");
                CallDisplayRegisterTPM(custsite);
                $("#ModalListDisplayTPMRegister").modal("show");

            });

            $(document).on('click', '.btnDeleteCustomerSite', function () {
                if (confirm("Confirm Delete Customer Site??")) {
                    var row = $(this).closest("tr");
                    var Site_ID = row.data("id");
                    var cust_num = $("#txtCustomerNumber").val();
                    var td1 = row.find("td:nth-child(1)").find("input").val(),
                        td2 = row.find("td:nth-child(2)").find("input").val(),
                        td3 = row.find("td:nth-child(3)").find("input").val(),
                        td4 = row.find("td:nth-child(4)").find("input").val(),
                        td5 = row.find("td:nth-child(5)").find("input").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Stie") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ cust_num_site: Site_ID, cust_num: cust_num, cust_site_name: td1, cust_address: td2, cust_tel: td3, cust_mobile: td4, cust_fax: td5, cust_latitude: "", cust_longitude: "", Status: "Delete" }),
                        success: function (response) {
                            alert("Delete Complete");
                            row.remove();
                        },
                        error: function (ex) { alert("Error"); }
                    });
                }
            });

            $("#buttonModalCustomer").on('click', function () {
                CallListCustomer();
            });
            $("#ListCustomer_myInput").on('change', function () {
                var value = $(this).val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomer") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: "", search: value }),
                    success: OnSuccessListCustomer
                });
            });
            $(document).on('click', '.ClickSelectCustomer', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text();
                window.location.href = "CustomerSite.aspx?Cus_num=" + td1;
            });

            $(document).on('change', '.ckworking', function () { $(this).addClass("IsChanging"); });
            $(document).on('click', '.btnUpdateWorkingDay', function () {
                var row = $(this).closest("tr");
                var Site_ID = row.data("id");
                var cust_num = $("#txtCustomerNumber").val();
                var Monday = row.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Tuesday = row.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Wednesday = row.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Thursday = row.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Friday = row.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Saturday = row.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Sunday = row.find("td:nth-child(8)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                //console.log(cust_num + " : " + Site_ID + " : " + Monday + " : " + Tuesday + " : " + Wednesday + " : " + Thursday + " : " + Friday + " : " + Saturday + " : " + Sunday);
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Stie_WorkingDay") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num_site: Site_ID, Monday: Monday, Tuesday: Tuesday, Wednesday: Wednesday, Thursday: Thursday, Friday: Friday, Saturday: Saturday, Sunday: Sunday }),
                    success: function (response) {
                        alert("Update Complete");
                    },
                    error: function (ex) { alert("Error"); }
                });

            });


            $("#btnAddSchedule").on('click', function () {
                var cust_site = parseInt($("#txtScheduleCustomerSite").attr("data-idsite"));
                var cust_site_name = $("#txtScheduleCustomerSite").val();
                var Schedule = $("#txtSchedule").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Schedule") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: 0, cust_num_site: cust_site, Schedule: Schedule, Type: "Insert" }),
                    success: function (response) {

                        var frament = '';
                        frament += '<tr data-idschedule="' + response.d + '" data-custsite="' + cust_site + '">';
                        frament += "<td>" + cust_site_name + "</td>";
                        frament += '<td><select class="form-control"><option>00:00</option><option>00:30</option><option>01:00</option><option>01:30</option><option>02:00</option><option>02:30</option><option>03:00</option><option>03:30</option><option>04:00</option><option>04:30</option><option>05:00</option><option>05:30</option><option>06:00</option><option>06:30</option><option>07:00</option><option>07:30</option><option>08:00</option><option>08:30</option><option>09:00</option><option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option><option>12:30</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option><option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option><option>18:00</option><option>18:30</option><option>19:00</option><option>19:30</option><option>20:00</option><option>20:30</option><option>21:00</option><option>21:30</option><option>22:00</option><option>22:30</option><option>23:00</option><option>23:30</option></select></td>';
                        frament += '<td><button type="button" class="btn btn-warning btn-block clickUpdateSchedule">Save</button></td>';
                        frament += '<td><button type="button" class="btn btn-danger btn-block clickDeleteSchedule">Delete</button></td>';
                        frament += '</tr>';
                        var element = $(frament);
                        element.find("td:nth-child(2)").find("select").val(Schedule);
                        frament = element;
                        $("#ListSchedule").append(frament);

                        $("#txtScheduleCustomerSite").attr("data-idsite", "").val("");
                        $("#txtSchedule").val("00:00");
                    }
                });
            });
            $(document).on('click', '.clickUpdateSchedule', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-idschedule"));
                var cust_site = parseInt(row.attr("data-custsite"));
                var Schedule = row.find("td:nth-child(2)").find("select").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Schedule") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, cust_num_site: cust_site, Schedule: Schedule, Type: "Edit" }),
                    success: function (response) {
                        alert("Update Complete");
                    }
                });
            });
            $(document).on('click', '.clickDeleteSchedule', function () {
                if (confirm("ยืนยันที่จะลบ?")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-idschedule"));
                    var cust_site = parseInt(row.attr("data-custsite"));
                    var Schedule = row.find("td:nth-child(2)").find("select").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Schedule") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, cust_num_site: cust_site, Schedule: Schedule, Type: "Delete" }),
                        success: function (response) {
                            row.remove();
                            alert("Delete Complete");
                        }
                    });
                }
            });


            $("#btnAddCustomerMember").on('click', function () {
                var txtUserMember = $("#txtUserMember").val();
                var txtCustomerMember = $("#txtCustomerMember").val();
                var txtCustomerSiteMember = $("#txtCustomerSiteMember").attr("data-idsite");
                var namecussite = $("#txtCustomerSiteMember").val();
                //var txtMachineMember = $("#txtMachineMember").val();
                var txtStatusMember = $("#txtStatusMember").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Member") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: 0, Users: txtUserMember, Customer: txtCustomerMember, Customer_Site: txtCustomerSiteMember, Status: txtStatusMember, Status_Work: "Add" }),
                    success: function (response) {
                        var id_member = response.d;
                        var frament = '<tr data-id="' + id_member + '"><td><input type="text" class="form-control" value="' + txtUserMember + '" disabled/></td>';
                        frament += '<td style="display:none;"><input type="text" class="form-control" value="' + txtCustomerMember + '" disabled/></td>';
                        frament += '<td><input type="text" class="form-control" data-idsite="' + txtCustomerSiteMember + '" value="' + namecussite + '" disabled/></td>';
                        //frament += '<td><input type="text" class="form-control" value="' + txtMachineMember + '" disabled/></td>';

                        frament += '<td><select class="form-control" id="txtStatusMember' + id_member + '"> ';
                        frament += '<option>Active</option> ';
                        frament += '<option>InActive</option> ';
                        frament += '</select></td>';

                        frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateCustomerMember">Save</button></td>';
                        //frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCustomerMember">Delete</button></td>';
                        frament += '</tr>';

                        $("#ListCustomerMember").append(frament);
                        $("#txtUserMember").val("");
                        $("#txtCustomerMember").val("");
                        $("#txtCustomerSiteMember").val("").attr("data-idsite", "");
                        $("#txtMachineMember").val("");
                        $("#txtStatusMember" + id_member).val(txtStatusMember);
                    },
                    error: function (ex) { alert("Error"); }
                });
            });
            $(document).on('click', '.btnUpdateCustomerMember', function () {
                var row = $(this).closest("tr");
                var Member_ID = row.data("id");
                var td1 = row.find("td:nth-child(1)").find("input").val(),
                    td2 = row.find("td:nth-child(2)").find("input").val(),
                    td3 = row.find("td:nth-child(3)").find("input").attr("data-idsite"),
                    //td4 = row.find("td:nth-child(4)").find("input").val(),
                    td5 = row.find("td:nth-child(4)").find("select").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Member") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: Member_ID, Users: td1, Customer: td2, Customer_Site: td3, Status: td5, Status_Work: "Update" }),
                    success: function (response) {
                        alert("Update Complete");
                    },
                    error: function (ex) { alert("Error"); }
                });
            });

            $(document).on('click', '.btnDeleteCustomerMember', function () {
                if (confirm("Confirm Delete Customer Member??")) {
                    var row = $(this).closest("tr");
                    var Member_ID = row.data("id");
                    var td1 = row.find("td:nth-child(1)").find("input").val(),
                        td2 = row.find("td:nth-child(2)").find("input").val(),
                        td3 = row.find("td:nth-child(3)").find("input").attr("data-idsite"),
                        //td4 = row.find("td:nth-child(4)").find("input").val(),
                        td5 = row.find("td:nth-child(4)").find("select").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Customer_Member") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: Member_ID, Users: td1, Customer: td2, Customer_Site: td3, Status: td5, Status_Work: "Delete" }),
                        success: function (response) {
                            alert("Delete Complete");
                            row.remove();
                        },
                        error: function (ex) { alert("Error"); }
                    });
                }
            });

            $("#btnModalCustomerSiteMember").on('click', function () {
                if ($("#txtUserMember").val() != "") {
                    GetListCustomerSite("Member");
                }
            });

            $("#btnModalCustomerSiteSchedule").on('click', function () {
                GetListCustomerSite("Schedule");
            });

            $("#btnModalMachineMember").on('click', function () {
                $("#TBodyMachineMember").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListMachineMember") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: "" }),
                    success: OnSuccessGetListMachineMember
                });
                $("#ModalListMachineMember").modal('show');
            });

            $("#btnModalEmployee").on('click', function () {
                $("#EM_insertRowText").empty();
                var customer = $("#txtCustomerMember").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetUserTPMPatkol") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Customer_Code: customer }),
                    success: OnSuccessListGetUserTPMPatkol
                });
                $("#ModalListEmployee").modal('show');
            });
            $(document).on('click', '.ClickSelectEmployee', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text(),
                    td3 = row.find("td:nth-child(3)").text();
                $("#txtUserMember").val(td1);
                //if (td3 == "Owner") {
                //    $("#txtCustomerSiteMember").attr("disabled", "disabled").val("");
                //    $("#txtMachineMember").attr("disabled", "disabled").val("");
                //} else if (td3 == "Manager") {
                //    //txtCustomerSiteMember
                //    $("#txtMachineMember").attr("disabled", "disabled").val("");
                //} else if (td3 == "Contact") {
                //    $("#txtCustomerSiteMember").removeAttr("disabled").val("");
                //    $("#txtMachineMember").removeAttr("disabled").val("");
                //} else if (td3 == "Admin") {
                //    $("#txtCustomerSiteMember").removeAttr("disabled").val("");
                //    $("#txtMachineMember").removeAttr("disabled").val("");
                //} else {
                $("#txtCustomerSiteMember").attr("disabled", "disabled").val("");
                //$("#txtMachineMember").attr("disabled", "disabled").val("");
                //$("#btnAddCustomerMember").attr("disabled", "disabled");
                //}
            });
            $(document).on('click', '.ClickSelectCustomerSiteMember', function () {
                var row = $(this).closest("tr");
                var td1 = row.attr("data-id"),
                    td2 = row.find("td:nth-child(1)").text();
                $("#txtCustomerSiteMember").attr("data-idsite", td1);
                $("#txtCustomerSiteMember").val(td2);
            });

            $(document).on('click', '.ClickSelectCustomerSiteSchedule', function () {
                var row = $(this).closest("tr");
                var td1 = row.attr("data-id"),
                    td2 = row.find("td:nth-child(1)").text();
                $("#txtScheduleCustomerSite").attr("data-idsite", td1);
                $("#txtScheduleCustomerSite").val(td2);
            });

            $(document).on('click', '.ClickSelectMachineMember', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text();
                $("#txtMachineMember").val(td1);
            });

            function GetCustomer(GetCust_num) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomer") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: GetCust_num, search: "" }),
                    success: function (response) {
                        if (response.d.length) {
                            $("#txtCustomerNumber").val(response.d[0][0]);
                            $("#txtCustomerMember").val(response.d[0][0]);
                            $("#txtCustomerName").val(response.d[0][1]);
                            $("#txtCustomerAddress").val(response.d[0][2]);
                            $("#txtCustomertel").val(response.d[0][3]);
                            $("#txtCustomerMobile").val(response.d[0][4]);
                            $("#txtCustomerFax").val(response.d[0][5]);
                            $('#CustomerLogo .img-preview').attr('src', response.d[0][6]);
                            $("#DisplayCustomerTab").show();
                        }
                    }
                });
            }

            function CallListCustomer() {
                $("#TBodyCustomer").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomer") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: "", search: "" }),
                    success: OnSuccessListCustomer
                });
                $("#ModalListCustomer").modal("show");
            }

            function OnSuccessListGetUserTPMPatkol(response) {
                var frament = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var emp_num = val[0], emp_name = val[1] + " " + val[2], emp_profile = val[3];
                        frament += "<tr><td><a class='ClickSelectEmployee' href='javascript:void(0)' data-dismiss='modal'>" + emp_num + "</a></td>";
                        frament += "<td><a class='ClickSelectEmployee' href='javascript:void(0)' data-dismiss='modal'>" + emp_name + "</a></td>";
                        frament += "<td style='display:none;'><a class='ClickSelectEmployee' href='javascript:void(0)' data-dismiss='modal'>" + emp_profile + "</a></td></tr>";
                    });
                } else {
                    frament += "<tr><td>Not Data</td><td>Not Data</td></tr>";
                }
                $("#EM_insertRowText").append(frament);
            }

            function OnSuccessListCustomer(response) {
                $("#TBodyCustomer").empty();
                var frament = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var cus_num = val[0], cus_name = val[1];
                        frament += "<tr><td><a class='ClickSelectCustomer' href='javascript:void(0)' data-dismiss='modal'>" + cus_num + "</a></td>";
                        frament += "<td><a class='ClickSelectCustomer' href='javascript:void(0)' data-dismiss='modal'>" + cus_name + "</a></td></tr>";
                    });
                } else {
                    frament += "<tr><td>Not Data</td><td>Not Data</td></tr>";
                }
                $("#TBodyCustomer").append(frament);
            }

            function GetListCustomerSite(type) {
                $("#TBodyCustomerSite").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomerSite") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: $("#txtCustomerNumber").val() }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var cust_site_num = val[0], cust_site_name = val[2];
                                frament += "<tr data-id='" + cust_site_num + "'>";
                                //frament += "<td><a class='ClickSelectCustomerSite' href='javascript:void(0)' data-dismiss='modal'>" + cust_site_num + "</a></td>";
                                frament += "<td><a class='ClickSelectCustomerSite" + type + "' href='javascript:void(0)' data-dismiss='modal'>" + cust_site_name + "</a></td></tr>";
                            });
                        } else {
                            frament += "<tr><td>Not Data</td></tr>";
                        }
                        $("#TBodyCustomerSite").append(frament);
                    }
                });
                $("#ModalListCustomerSite").modal('show');
            }

            function OnSuccessGetListMachineMember(response) {
                $("#TBodyMachineMember").empty();
                var frament = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var TMPCode = val[0];
                        frament += "<tr><td><a class='ClickSelectMachineMember' href='javascript:void(0)' data-dismiss='modal'>" + TMPCode + "</a></td></tr>";
                    });
                } else {
                    frament += "<tr><td>Not Data</td></tr>";
                }
                $("#TBodyMachineMember").append(frament);
            }

            function CallDisplayRegisterTPM(cust_site) {
                $("#TBodyDisplayTPMRegister").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListRegisterTPM") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_site: cust_site }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $("#CountReTPM").text(response.d.length);
                            $.each(response.d, function (index, val) {
                                var Machine_EquipmentName = val[0];
                                var TPMCode = val[1];
                                frament += '<tr>';
                                frament += "<td>" + Machine_EquipmentName + "</td>";
                                frament += "<td>" + TPMCode + "</td>";
                                frament += '</tr>';
                            });
                        } else {
                            frament += "<tr><td>Not Data</td><td>Not Data</td></tr>";
                        }
                        $("#TBodyDisplayTPMRegister").append(frament);
                    }
                });

            }


            function CallCustomerSiteSchedule(cust_num) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListSchedule") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: cust_num }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var cust_num_site = val[1];
                                var cust_site_name = val[2];
                                var Schedule = val[3];
                                var cust_num = val[4];
                                frament += '<tr data-idschedule="' + ID + '" data-custsite="' + cust_num_site + '">';
                                frament += "<td>" + cust_site_name + "</td>";
                                frament += '<td><select class="form-control"><option>00:00</option><option>00:30</option><option>01:00</option><option>01:30</option><option>02:00</option><option>02:30</option><option>03:00</option><option>03:30</option><option>04:00</option><option>04:30</option><option>05:00</option><option>05:30</option><option>06:00</option><option>06:30</option><option>07:00</option><option>07:30</option><option>08:00</option><option>08:30</option><option>09:00</option><option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option><option>12:30</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option><option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option><option>18:00</option><option>18:30</option><option>19:00</option><option>19:30</option><option>20:00</option><option>20:30</option><option>21:00</option><option>21:30</option><option>22:00</option><option>22:30</option><option>23:00</option><option>23:30</option></select></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block clickUpdateSchedule">Save</button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btn-block clickDeleteSchedule">Delete</button></td>';
                                frament += '</tr>';
                                var element = $(frament);
                                element.find("td:nth-child(2)").find("select").val(Schedule);
                                frament = element;
                                $("#ListSchedule").append(frament);
                            });
                        }
                    }
                });

            }

        });

    </script>

</asp:Content>
