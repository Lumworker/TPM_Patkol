<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MonitorTransaction.aspx.cs" Inherits="TPMPatkol.MonitorTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="hidden">
        <asp:TextBox runat="server" ID="snsyear" />
        <asp:TextBox runat="server" ID="snsmonth" />
        <asp:TextBox runat="server" ID="snsmonthtxt" />
        </div>
    <style>
        .textgreen {
            color: #28a745;
        }

        .textorange {
            color: #fd7e14;
        }

        .textred {
            color: #dc3545;
        }
    </style>

    <div class="page-header" style="margin: 10px 0 10px;">
    </div>
    <div class="row">
        <div class="col-md-12 text-mode" style="margin: 10px 0;">
            <ul class="nav nav-tabs">
                <li ><a href="#1" data-toggle="tab">Summary</a></li>
                <li><a href="#2" data-toggle="tab">Detail</a></li>
                <li class="active"><a href="#3" data-toggle="tab">Monitering</a></li>
            </ul>
        </div>
        <div class="col-md-12">
            <div class="tab-content ">
                <div class="tab-pane" id="1">
                    <div class="page-header" style="margin: 10px 0 10px; text-align: right">
                        <button class="btn btn-warning" type="button" id="btnReportDaily" style="display: none;">รายงานประจำวัน</button>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4>ข้อมูลช่วงเวลาการตรวจเช็ค</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="">
                                                    <thead>
                                                        <tr>
                                                            <th>ชื่อลูกค้า</th>
                                                            <th>สาขา</th>
                                                            <th style="text-align: center" class="textgreen">ปกติ</th>
                                                            <th style="text-align: center" class="textorange">ล่าช้า</th>
                                                            <th style="text-align: center" class="textred">ไม่รายงาน</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ListTimeChecked">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4>สถานะการตรวจเช็ค</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="">
                                                    <thead>
                                                        <tr>
                                                            <th>ชื่อลูกค้า</th>
                                                            <th>สาขา</th>
                                                            <th style="text-align: center" class="textgreen">เขียว</th>
                                                            <th style="text-align: center" class="textorange">เหลือง</th>
                                                            <th style="text-align: center" class="textred">แดง</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ListChecked">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Tab1-->
                <div class="tab-pane" id="2">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Search"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtSearchDetailCheck" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-hover" id="">
                                    <thead>
                                        <tr>
                                            <th>ชื่อลูกค้า</th>
                                            <th>สาขา</th>
                                            <th>วันที่ตรวจสอบ</th>
                                            <th>ข้อมูลช่วงเวลาการตรวจเช็ค</th>
                                            <th style="text-align: center" class="textgreen">เขียว</th>
                                            <th style="text-align: center" class="textorange">เหลือง</th>
                                            <th style="text-align: center" class="textred">แดง</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListCheckDetail">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane active" id="3">
                    <div class="panel panel-default" style="margin-top: 1em;">
                        <div class="panel-body">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Month"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <select class="form-control"  id='stcMonth' style="min-width: 100%">
                                                <option value=''>--Select Month--</option>
                                                <option selected value='1'>Janaury</option>
                                                <option value='2'>February</option>
                                                <option value='3'>March</option>
                                                <option value='4'>April</option>
                                                <option value='5'>May</option>
                                                <option value='6'>June</option>
                                                <option value='7'>July</option>
                                                <option value='8'>August</option>
                                                <option value='9'>September</option>
                                                <option value='10'>October</option>
                                                <option value='11'>November</option>
                                                <option value='12'>December</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Year"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <select class="form-control" id="stcYear" style="min-width: 100%"></select>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                            </div>
                            <div class="col-md-2">
                                <div class="row">
                                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                        <div class="col-md-12 col-xs-12">
                                            <button type="button" id="btnSearchReportMoniter" class="btn btn-info btn-block">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--panel-body-->
                    </div>
                     <h3 id="txtMonth" style="text-align: center;"></h3>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                 <p id="txtTBSearchReportMoniter">รายชื่อลูกค้าใช้บริการ TPM</p>
                                </div>
                                <div class="col-md-6">
                                     <button type="button" id="btnModalExportData" style="float:right; margin-bottom:1rem;"  class="btn btn-warning">Export</button>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered" id="TBSearchReportMoniter">
                                    <thead id="theaderSearchReportMoniter">
                                      <%--  <tr>
                                            <th>ลำดับ</th>
                                            <th>Store</th>
                                            <th>สถาณะ</th>
                                            <th>1</th>
                                            <th>2</th>
                                            <th>3</th>
                                            <th>4</th>
                                            <th>5</th>
                                            <th>6</th>
                                            <th>7</th>
                                            <th>8</th>
                                            <th>9</th>
                                            <th>10</th>
                                            <th>11</th>
                                            <th>12</th>
                                            <th>13</th>
                                            <th>14</th>
                                            <th>15</th>
                                            <th>16</th>
                                            <th>17</th>
                                            <th>18</th>
                                            <th>19</th>
                                            <th>20</th>
                                            <th>21</th>
                                            <th>22</th>
                                            <th>23</th>
                                            <th>24</th>
                                            <th>25</th>
                                            <th>26</th>
                                            <th>27</th>
                                            <th>28</th>
                                            <th>29</th>
                                            <th>30</th>
                                        </tr>
                                        <tr>
                                        <td>1</td>
                                        <td>ไผ่ทอง</td>
                                        <td>ใช้งานได้</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        <td>✔</td>
                                        </tr>--%>
                                    </thead>
                                    <tbody id="tbodySearchReportMoniter">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalExportData" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group" style="float: left;">
                            <h4>Export Data</h4>
                        </div>
                        <div class="form-group" style="float: right;">
                            <h4>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></h4>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" style="margin-top:5px">
                            <div class="col-md-6">
                                <%--<button class="btn btn-warning" type="button" id="btnExportExcelMonitering">ExportExcel</button>--%>
                                <asp:Button runat="server" class="btn btn-block btn-success" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="Excel" OnClientClick="btnExportExcelMonitering()" OnClick="exportTableC_Click" />
                            </div>
                            <div class="col-md-6">
                                <%--<button class="btn btn-warning" type="button" id="btnExportExcelMonitering">ExportExcel</button>--%>
                                <asp:Button runat="server" class="btn btn-block btn-danger" Style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" Text="PDF" OnClientClick="btnExportExcelMonitering()" OnClick="exportPDF_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            
            hidetableMonitering();
            callListCheck();
            getYear();

            $("#txtSearchDetailCheck").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#ListCheckDetail tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $("#btnSearchReportMoniter").on('click', function () {
                var stcMonth = $("#stcMonth").val();
                var stcYear = $("#stcYear").val();
                var month = $("#stcMonth option:selected" ).text();
                if (stcMonth != null && stcYear != null) {
                    $('#TBSearchReportMoniter').show();
                    $('#txtTBSearchReportMoniter').show();
                    $('#btnModalExportData').show();
                    $("#txtMonth").text(month);

                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Monitoring_Report") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ stcMonth: stcMonth, stcYear: stcYear }),
                        success: function (response) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var header = response.d[0];
                                var items = response.d[1];
                                var fragment = '';
                                var fragmentheader = '';
                                if (response.d.length > 0) {
                                    var checkindex = 0;
                                    fragment += '<tr>';
                                    $.each(header, function (index, val) {
                                        fragment += '<th>' + val[0] + '</th>';
                                    });
                                    fragment += '</tr>';
                                    $.each(items, function (index, val) {
                                        fragment += '<tr>';
                                        for (var i = 0; i < val.length; i++) {
                                            var value = '';
                                            if (val[i] == '/') {
                                                val[i] = '✔';
                                                fragment += '<td>' + val[i] + '</td>';
                                            }
                                            else if (val[i] == 'วันหยุด') {
                                                fragment += '<td bgcolor="#d9534f"></td>';
                                            }
                                            else {
                                                fragment += '<td>' + val[i] + '</td>';
                                            }
                                           
                                        }
                                        fragment += '</tr>';
                                    });
                                    $("#tbodySearchReportMoniter").empty();
                                    $("#tbodySearchReportMoniter").append(fragment);
                                }
                                else {
                                    alert("No Data.");
                                }
                            });
                            $("#ListChecked").append(frament);
                        }
                    });
                }
                else {
                    alert('กรุณาเลือก เดือน/ปี ให้ครบถ้วน');
                }
            });


            $("#btnModalExportData").on('click', function () {
                  $("#ModalExportData").modal("show");
            });

           
            function callListCheck() {
                $("#ListTimeChecked").empty();
                $("#ListChecked").empty();
                $("#ListCheckDetail").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetReportMonitorTimeChecked") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        var frament = "";
                        $.each(response.d, function (index, val) {
                            var cust_name = val[0];
                            var cust_site = val[1];
                            var cust_site_name = val[2];
                            var QtyNormal = val[3] != "" ? val[3] : 0;
                            var QtyDelay = val[4] != "" ? val[4] : 0;
                            var QtyNotReport = val[5] != "" ? val[5] : 0;

                            frament += '<tr>';
                            frament += '<td>' + cust_name + '</td>';
                            frament += '<td>' + cust_site_name + '</td>';
                            frament += '<td style="text-align:center" class="textgreen">' + QtyNormal + '</td>';
                            frament += '<td style="text-align:center" class="textorange">' + QtyDelay + '</td>';
                            frament += '<td style="text-align:center" class="textred">' + QtyNotReport + '</td>';
                            frament += '</tr>';
                        });
                        $("#ListTimeChecked").append(frament);
                    }
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetReportMonitorChecked") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        var frament = "";
                        $.each(response.d, function (index, val) {
                            var cust_name = val[0];
                            var cust_site = val[1];
                            var cust_site_name = val[2];
                            var Green = val[3];
                            var Yellow = val[4];
                            var Red = val[5];

                            frament += '<tr>';
                            frament += '<td>' + cust_name + '</td>';
                            frament += '<td>' + cust_site_name + '</td>';
                            frament += '<td style="text-align:center" class="textgreen">' + Green + '</td>';
                            frament += '<td style="text-align:center" class="textorange">' + Yellow + '</td>';
                            frament += '<td style="text-align:center" class="textred">' + Red + '</td>';
                            frament += '</tr>';
                        });
                        $("#ListChecked").append(frament);
                    }
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetReportMonitorTransactionDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        var frament = "";
                        $.each(response.d, function (index, val) {
                            var cust_name = val[0];
                            var cust_site_name = val[1];
                            var CheckDate = val[2];
                            var CheckingStatus = val[3];
                            var Green = val[4];
                            var Yellow = val[5];
                            var Red = val[6];

                            frament += '<tr>';
                            frament += '<td>' + cust_name + '</td>';
                            frament += '<td>' + cust_site_name + '</td>';
                            frament += '<td>' + CheckDate + '</td>';
                            frament += '<td>' + CheckingStatus + '</td>';
                            frament += '<td style="text-align:center" class="textgreen">' + Green + '</td>';
                            frament += '<td style="text-align:center" class="textorange">' + Yellow + '</td>';
                            frament += '<td style="text-align:center" class="textred">' + Red + '</td>';
                            frament += '</tr>';
                        });
                        $("#ListCheckDetail").append(frament);
                    }
                });
            }

            function getYear() {
                for (var i = 17; i < 51; i++) {
                    var frament = "";
                    frament += '<option value="20' + i + '">20' + i + '</option>';
                    $("#stcYear").append(frament);
                }
                var GetDate = new Date();
                $("#stcYear").val(GetDate.getFullYear());
            }
            function hidetableMonitering() {
                $('#TBSearchReportMoniter').hide();
                $('#txtTBSearchReportMoniter').hide();
                $('#btnModalExportData').hide();
            }

        });
        function btnExportExcelMonitering() {
            var month = $("#stcMonth").val();
            var monthtxt = $("#stcMonth option:selected" ).text();
                $("#MainContent_snsmonth").val(month);
                $("#MainContent_snsmonthtxt").val(monthtxt);
                $("#MainContent_snsyear").val($("#stcYear").val());
            }
    </script>

</asp:Content>
