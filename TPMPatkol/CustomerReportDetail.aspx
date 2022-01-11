<%@ Page Title="Customer Report Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerReportDetail.aspx.cs" Inherits="TPMPatkol.CustomerReportDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="overflow: hidden; width: 0; height: 0;">
        <asp:TextBox runat="server" ID="snscustomer" />
        <asp:TextBox runat="server" ID="snscustsite" />
        <asp:TextBox runat="server" ID="snsid" />
        <asp:TextBox runat="server" ID="snsyear" />
        <asp:TextBox runat="server" ID="snsmonth" />
    </div>
    <div class="page-header">
        <div class="row">
            <div class=" col-md-12">
                <div class="form-group" style="float: left;">
                    <h4><a href="./CustomerReport.aspx">Customer Report</a> >> <span id="ReportDetail"></span></h4>
                </div>
                <div class="form-group" style="float: right;">
                    <h2></h2>
                </div>
            </div>
        </div>
    </div>



    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-9">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtCustomer" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Site"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtCustomerSite" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Report Name"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtReportName" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtType" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-6 col-xs-6" style="text-align: Left">
                                <button type="button" id="btnEditReportCustomer" class="btn btn-warning btn-block" style="min-width: 100px">Edit</button>
                            </div>
                            <div class="col-md-6 col-xs-6" style="text-align: Left">
                                <button type="button" id="btnCloneReportCustomer" class="btn btn-success btn-block" style="min-width: 100px">Clone</button>
                            </div>
                        </div>
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-12 col-xs-12" style="text-align: Left">
                                <button type="button" id="btnModalExportReportCustomer" class="btn btn-info btn-block" style="min-width: 205px">Export</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row" style="text-align: right">
                    <div class="col-md-12">
                        <button type="button" id="btnModalAddReportDetail" class="btn btn-success">Add</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableCustomerReportDetail">
                                <thead>
                                    <tr>
                                        <th>Level</th>
                                        <th>CheckList</th>
                                        <th>Header</th>
                                        <th>Type</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListCustomerReportDetail">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>

    <div class="modal fade" id="ModalSaveCustomerReportDetail" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group" style="float: left;">
                            <h4 id="HeaderCustDetail" data-id="0">Customer Report Detail</h4>
                        </div>
                        <div class="form-group" style="float: right;">
                            <h4>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></h4>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Level : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="ModaltxtLevel" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Check List : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="ModaltxtCheckList" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonModalCheckList" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Header : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="ModaltxtHeader" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Report Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select id="ModaltxtTypeDetail" class="form-control" style="min-width: 100%" onkeypress="detect_enter_keyboard(event)">
                                    <option value="Value">Value</option>
                                    <option value="Status">Status</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveCustomerReportDetail">Save </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalAddCustomerReport" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group" style="float: left;">
                            <h4>Customer Report</h4>
                        </div>
                        <div class="form-group" style="float: right;">
                            <h4>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></h4>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label11" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <label class="radio-inline">
                                    <input type="radio" name="RtTypeReport" value="Horizontal" checked>แนวนอน</label>
                                <label class="radio-inline">
                                    <input type="radio" name="RtTypeReport" value="Vertical">แนวตั้ง</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label12" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Report Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="ModaltxtCustomerReportName" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveCustomerReport">Save </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalListCheckList" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List CheckList</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListCheckList_myInput" placeholder="Search CheckList" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCustomer" class="table table-bordered table-responsive">
                        <thead id="Thead1" runat="server">
                            <tr>
                                <th style="display: none">CheckList ID</th>
                                <th>CheckList Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyCheckList'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalExportCustomerReport" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Export Customer Report</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em;">
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <div class="row">
                                        <%--<div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <asp:Label ID="Label9" class="col-md-12 col-xs-12" runat="server" Font-Bold="True" Text="Customer Report"></asp:Label>
                                            <div class="col-md-12 col-xs-12">
                                                <div class="input-group">
                                                    <input type="text" id="txtCustomerReport" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                                    <div class="input-group-btn">
                                                        <button id="buttonSearchCustomerReport" class="btn btn-default" type="button">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <asp:Label ID="Label10" class="col-md-12 col-xs-12" runat="server" Font-Bold="True" Text="Month"></asp:Label>
                                            <div class="col-md-12 col-xs-12">
                                                <select id="txtMonth" class="form-control" style="min-width: 100%" onkeypress="detect_enter_keyboard(event)">
                                                    <option value="1">01</option>
                                                    <option value="2">02</option>
                                                    <option value="3">03</option>
                                                    <option value="4">04</option>
                                                    <option value="5">05</option>
                                                    <option value="6">06</option>
                                                    <option value="7">07</option>
                                                    <option value="8">08</option>
                                                    <option value="9">09</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <asp:Label ID="Label13" class="col-md-12 col-xs-12" runat="server" Font-Bold="True" Text="Year"></asp:Label>
                                            <div class="col-md-12 col-xs-12">
                                                <select id="txtYear" class="form-control" style="min-width: 100%" onkeypress="detect_enter_keyboard(event)">
                                                    <%--<option>1</option>--%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END Row-->
                                </div>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-12 col-xs-12">
                                                <button type="button" id="btnShowDisplayExportReportCustomer" class="btn btn-info btn-block">Export</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--panel-body-->
                        </div>
                        <!--panel-default-->
                        <div class="panel panel-default" style="margin-top: 1em; display: none;" id="displayexport">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group col-md-6">
                                            <%--<button type="button" class="btn btn-block btn-success" style="height: 150px; font-size: 24px; font-weight: bold;">Excel</button>--%>
                                            <asp:Button runat="server" class="btn btn-block btn-success" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="Excel" OnClick="exportTableC_Click" UseSubmitBehavior="false" />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <%--<button type="button" class="btn btn-block btn-warning" style="height: 150px; font-size: 24px; font-weight: bold;">PDF</button>--%>
                                            <asp:Button runat="server" class="btn btn-block btn-warning" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="PDF" OnClick="exportPDF_Click" UseSubmitBehavior="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--panel-body-->
                        </div>
                        <!--panel-default-->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script>

        $(document).ready(function () {
            var username = sessionStorage.getItem("username");
            var ID_Report = getAllUrlParams("id");
            CallCustomerReport(ID_Report, "", "");
            CallCustomerReportDetail(ID_Report);

            //Edit Customer Report
            $("#btnEditReportCustomer").on('click', function () {
                $("input[name=RtTypeReport][value=" + $("#txtType").val() + "]").prop("checked", true);
                $("#ModaltxtCustomerReportName").val($("#txtReportName").val());
                $("#ModalAddCustomerReport").modal("show");
            });
            $("#btnSaveCustomerReport").on('click', function () {
                var type_report = $("input[name=RtTypeReport]:checked").val();
                var report_name = $("#ModaltxtCustomerReportName").val();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Customer_Report") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID_Report), cust_site: 0, TypeReport: type_report, ReportName: report_name, Username: username }),
                    success: function (response) {
                        CallCustomerReport(ID_Report, "", "");
                        alert("Update Complete");
                        $("#ModalAddCustomerReport").modal("hide");
                    }
                });
            });
            /////////////////////
            ////////////////////
            ///////////////////
            //////////////////
            /////////////////


            //Add Detail
            $("#btnModalAddReportDetail").on('click', function () {
                $("#HeaderCustDetail").attr("data-id", 0);
                $("#ModaltxtLevel").val("");
                $("#ModaltxtCheckList").attr("data-id", 0).val("");
                $("#ModaltxtHeader").val("");
                $("#ModaltxtTypeDetail").val("");
                $("#ModalSaveCustomerReportDetail").modal("show");
            });
            $("#btnSaveCustomerReportDetail").on('click', function () {
                var ID = $("#HeaderCustDetail").attr("data-id");
                var ListLevel = $("#ModaltxtLevel").val();
                var CheckList_ID = $("#ModaltxtCheckList").attr("data-id");
                var HeaderName = $("#ModaltxtHeader").val();
                var TypeDetail = $("#ModaltxtTypeDetail").val();
                var Status = ID != "0" ? "Update" : "Insert";
                //console.log(0, ID_Report, ListLevel, CheckList_ID, HeaderName, TypeDetail, username);
                SP_Customer_Report_Detail(ID, ID_Report, ListLevel, CheckList_ID, HeaderName, TypeDetail, username, Status);
            });

            //Edit Detail
            $(document).on('click', '.clickSelectEditDetail', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)"),
                    td2 = row.find("td:nth-child(2)"),
                    td3 = row.find("td:nth-child(3)"),
                    td4 = row.find("td:nth-child(4)");
                $("#HeaderCustDetail").attr("data-id", row.attr("data-id"));
                $("#ModaltxtLevel").val(td1.text());
                $("#ModaltxtCheckList").attr("data-id", td2.attr("data-listid")).val(td2.text());
                $("#ModaltxtHeader").val(td3.text());
                $("#ModaltxtTypeDetail").val(td4.text());
                $("#ModalSaveCustomerReportDetail").modal("show");
            });

            $(document).on('click', '.clickSelectDeleteDetail', function () {
                if (confirm("Sure?")) {
                    var row = $(this).closest("tr");
                    SP_Customer_Report_Detail(row.attr("data-id"), ID_Report, 0, 0, "", "", username, "Delete");
                }
            });





            $("#ListCheckList_myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#TBodyCheckList tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $("#buttonModalCheckList").on("click", function () {
                CallCheckList(ID_Report);
                $("#ModalListCheckList").modal("show");
            });
            $(document).on('click', '.ClickSelectCheckList', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text();
                $("#ModaltxtCheckList").attr("data-id", td1).val(td2);
                $("#ModaltxtHeader").val(td2);
            });



            ///////////////////////////////
            ///// Export Excel / PDF /////

            $("#txtMonth , #txtYear").on('change', function () {
                $("#displayexport").hide();
            });

            $("#btnModalExportReportCustomer").on('click', function () {
                $("#txtYear").empty();
                $("#displayexport").hide();
                var getDate = new Date();
                var getYear = getDate.getFullYear();
                var option = 2018;
                for (var i = 0; i <= (getYear - 2018); i++) {
                    $("#txtYear").append("<option>" + option + "</option>");
                    option++;
                }

                var month = ((getDate.getMonth() + 1) - 1) <= 0 ? 1 : ((getDate.getMonth() + 1) - 1);

                $("#txtMonth").val(month);
                $("#txtYear").val(getYear);
                $("#ModalExportCustomerReport").modal("show");
            });

            $("#btnShowDisplayExportReportCustomer").on('click', function () {
                $("#MainContent_snscustomer").val($("#txtCustomer").val());
                $("#MainContent_snscustsite").val($("#txtCustomerSite").attr("data-idsite"));
                $("#MainContent_snsid").val($("#ReportDetail").attr("data-id"));
                $("#MainContent_snsmonth").val($("#txtMonth").val());
                $("#MainContent_snsyear").val($("#txtYear").val());
                $("#displayexport").show();

            });




            function SP_Customer_Report_Detail(ID, Cust_Report_ID, ListLevel, CheckList_ID, HeaderName, TypeDetail, Username, Status) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Customer_Report_Detail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID), Cust_Report_ID: parseInt(Cust_Report_ID), ListLevel: parseInt(ListLevel), CheckList_ID: parseInt(CheckList_ID), HeaderName: HeaderName, TypeDetail: TypeDetail, Username: Username, Status: Status }),
                    success: function (response) {
                        CallCustomerReportDetail(ID_Report);
                        alert("Update Complete");
                        $("#ModalSaveCustomerReportDetail").modal("hide");
                    }
                });
            }


            function CallCustomerReportDetail(ID) {
                $("#ListCustomerReportDetail").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetCustomerReportDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0],
                                    ListLevel = val[1],
                                    CheckList_ID = val[2],
                                    List_Name = val[3],
                                    HeaderName = val[4],
                                    Type = val[5],
                                    Report_ID = val[6];
                                frament += "<tr data-id='" + ID + "'>";
                                frament += "<td>" + ListLevel + "</td>";
                                frament += "<td data-listid='" + CheckList_ID + "'>" + List_Name + "</td>";
                                frament += "<td>" + HeaderName + "</td>";
                                frament += "<td>" + Type + "</td>";
                                frament += "<td><button type='button' class='btn btn-warning btn-block clickSelectEditDetail'>Edit</button></td>";
                                frament += "<td><button type='button' class='btn btn-danger btn-block clickSelectDeleteDetail'>Delete</button></td>";
                                frament += "</tr>";
                            });
                        } else {
                            frament += "<tr><td>Not Data</td></tr>";
                        }
                        $("#ListCustomerReportDetail").append(frament);
                    }
                });
            }

            function CallCheckList(Report_ID) {
                $("#TBodyCheckList").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCheckListForCustomerReport") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Report_ID: Report_ID }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0],
                                    List_Name = val[1];
                                frament += "<tr><td style='display:none;'><a class='ClickSelectCheckList' href='javascript:void(0)' data-dismiss='modal'>" + ID + "</a></td>";
                                frament += "<td><a class='ClickSelectCheckList' href='javascript:void(0)' data-dismiss='modal'>" + List_Name + "</a></td></tr>";
                            });
                        } else {
                            frament += "<tr><td>Not Data</td></tr>";
                        }
                        $("#TBodyCheckList").append(frament);
                    }
                });
            }


            function CallCustomerReport(id, cust_num, cust_site) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetCustomerReport") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: id, cust_num: cust_num, cust_site: cust_site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var cust_num = val[1];
                                var cust_name = val[2];
                                var cust_site = val[3];
                                var cust_site_name = val[4];
                                var TypeReport = val[5];
                                var ReportName = val[6];

                                $("#ReportDetail").attr("data-id", ID).text(ReportName);
                                $("#txtCustomer").val(cust_name);
                                $("#txtCustomerSite").attr("data-idsite", cust_site).val(cust_site_name);
                                $("#txtReportName").val(ReportName);
                                $("#txtType").val(TypeReport);
                            });
                        }
                    }
                });
            }
        });

    </script>

</asp:Content>
