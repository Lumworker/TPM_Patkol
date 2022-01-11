<%@ Page Title="Customer Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerReport.aspx.cs" Inherits="TPMPatkol.CustomerReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <div class="row">
            <div class=" col-md-12">
                <div class="form-group" style="float: left;">
                    <h2>Customer Report</h2>
                </div>
                <div class="form-group" style="float: right;">
                    <h2>
                        <button type="button" class="btn btn-info" id="buttonModalNewReport">New</button></h2>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-10">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtCustomer" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearchCustomer" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Site"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtCustomerSite" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonSearchCustomerSite" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-12 col-xs-12">
                                <button type="button" id="btnSearchReportCustomer" class="btn btn-warning btn-block">Search</button>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableCustomerReport">
                                <thead>
                                    <tr>
                                        <th>Customer</th>
                                        <th>Site</th>
                                        <th>Type Report</th>
                                        <th>Report Name</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>
                                <tbody id="ListCustomerReport">
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

    <div class="modal fade" id="ModalAddCustomerReport" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group" style="float: left;">
                            <h4>New Customer Report</h4>
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
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="ModaltxtCustomer" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonModalCustomer" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Site : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="ModaltxtCustomerSite" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonModalCustomerSite" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type : "></asp:Label>
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
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Report Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="ModaltxtCustomerReportName" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnNewCustomerReport">Save </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
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
                    <%--<div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListCustomerSite_myInput" placeholder="Search Customer Site" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>--%>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCustomerSite" class="table table-bordered table-responsive">
                        <thead id="Thead2" runat="server">
                            <tr>
                                <th>Customer Site Number</th>
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


    <script>

        $(document).ready(function () {

            var username = sessionStorage.getItem("username");


            $("#buttonModalNewReport").on('click', function () {
                $("#ModaltxtCustomer").val("");
                $("#ModaltxtCustomerSite").val("");
                //$("input[name=RtTypeReport]:checked").val();
                $("#ModaltxtCustomerReportName").val("");
                $("#ModalAddCustomerReport").modal("show");
            });



            $("#btnNewCustomerReport").on('click', function () {
                var cust_num = $("#ModaltxtCustomer").attr("data-id");//.val()
                var cust_site = parseInt($("#ModaltxtCustomerSite").attr("data-id"));//.val()
                var type_report = $("input[name=RtTypeReport]:checked").val();
                var report_name = $("#ModaltxtCustomerReportName").val();

                //alert(cust_num + " : " + cust_site + " : " + type_report + " : " + report_name);

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Customer_Report") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: 0, cust_site: cust_site, TypeReport: type_report, ReportName: report_name, Username: username }),
                    success: function (response) {
                        alert("Add Complete : " + response.d);
                        $("#ModalAddCustomerReport").modal("hide");
                        window.open("./CustomerReportDetail.aspx?id="+response.d);
                    }
                });

            });


            $("#btnSearchReportCustomer").on('click', function () {
                var cust = $("#txtCustomer").attr("data-id");
                var site = $("#txtCustomerSite").attr("data-id");

                if ($("#txtCustomer").val() != "") {
                    //alert(cust + " : " + site);
                    CallListCustomerReport(cust, site);
                } else {
                    alert("กรุณาเลือกลูกค้า");
                }

            });



            $("#buttonSearchCustomer").on('click', function () {
                $("#ListCustomer_myInput").val("");
                CallCustomer("", "", "List");
                $("#ModalListCustomer").modal("show");
            });
            $("#buttonSearchCustomerSite").on('click', function () {
                if ($("#txtCustomer").val() != "") {
                    CallCustomerSite($("#txtCustomer").attr("data-id"), "List");
                    $("#ModalListCustomerSite").modal("show");
                } else {
                    alert("กรุณาเลือกลูกค้า");
                }
            });



            $("#buttonModalCustomer").on('click', function () {
                $("#ListCustomer_myInput").val("");
                CallCustomer("", "", "New");
                $("#ModalListCustomer").modal("show");
            });
            $("#ListCustomer_myInput").on('change', function () {
                var value = $(this).val();
                var type = $("#TBodyCustomer").attr("data-type");
                CallCustomer("", value, type);
            });


            $("#buttonModalCustomerSite").on('click', function () {
                if ($("#ModaltxtCustomer").val() != "") {
                    CallCustomerSite($("#ModaltxtCustomer").attr("data-id"), "New");
                    $("#ModalListCustomerSite").modal("show");
                } else {
                    alert("กรุณาเลือกลูกค้า");
                }
            });




            $(document).on('click', '.ClickSelectCustomer', function () {
                var row = $(this).closest("tr");
                var type = $("#TBodyCustomer").attr("data-type");
                var td1 = row.find("td:nth-child(1)").text(), td2 = row.find("td:nth-child(2)").text();
                if (type == "New") {
                    $("#ModaltxtCustomer").attr("data-id", td1).val(td2);
                    $("#ModaltxtCustomerSite").attr("data-id", "").val("");
                } else if (type == "List") {
                    $("#txtCustomer").attr("data-id", td1).val(td2);
                    $("#txtCustomerSite").attr("data-id", "").val("");
                }
            });
            $(document).on('click', '.ClickSelectCustomerSite', function () {
                var row = $(this).closest("tr");
                var type = $("#TBodyCustomerSite").attr("data-type");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text();
                if (type == "New") {
                    $("#ModaltxtCustomerSite").attr("data-id", td1).val(td2);
                } else if (type == "List") {
                    $("#txtCustomerSite").attr("data-id", td1).val(td2);
                }
            });



            function CallListCustomerReport(cust_num, cust_site) {
                $("#ListCustomerReport").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetCustomerReport") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: "", cust_num: cust_num, cust_site: cust_site }),
                    success: function (response) {
                        $("#TBodyCustomer").empty();
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var cust_num = val[1];
                                var cust_name = val[2];
                                var cust_site = val[3];
                                var cust_site_name = val[4];
                                var TypeReport = val[5];
                                var ReportName = val[6];
                                frament += "<tr>";
                                frament += "<td>" + cust_name + "</td>";
                                frament += "<td>" + cust_site_name + "</td>";
                                frament += "<td>" + TypeReport + "</td>";
                                frament += "<td>" + ReportName + "</td>";
                                frament += "<td><a href='./CustomerReportDetail.aspx?id=" + ID + "' class='btn btn-info btn-block' target='_blank' >Detail</a></td>";
                                frament += "</tr>";
                            });
                        } else {
                            frament += "<tr><td>Not Data</td><td>Not Data</td></tr>";
                        }
                        $("#ListCustomerReport").append(frament);
                    }
                });
            }

            function CallCustomer(cust_num, search, type) {
                $("#TBodyCustomer").empty();
                $("#TBodyCustomer").attr("data-type", type);
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomer") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: cust_num, search: search }),
                    success: function (response) {
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
                });
            }


            function CallCustomerSite(Cust_num, type) {
                $("#TBodyCustomerSite").empty();
                $("#TBodyCustomerSite").attr("data-type", type);
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomerSite") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num: Cust_num }),
                    success: function (response) {
                        $("#TBodyCustomerSite").empty();
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var cust_site_num = val[0], cust_site_name = val[2];
                                frament += "<tr><td><a class='ClickSelectCustomerSite' href='javascript:void(0)' data-dismiss='modal'>" + cust_site_num + "</a></td>";
                                frament += "<td><a class='ClickSelectCustomerSite' href='javascript:void(0)' data-dismiss='modal'>" + cust_site_name + "</a></td></tr>";
                            });
                        } else {
                            frament += "<tr><td>Not Data</td></tr>";
                        }
                        $("#TBodyCustomerSite").append(frament);
                    }
                });
            }


        });

    </script>

</asp:Content>
