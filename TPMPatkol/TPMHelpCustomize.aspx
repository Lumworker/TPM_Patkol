<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TPMHelpCustomize.aspx.cs" Inherits="TPMPatkol.TPMHelpCustomize" %>

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

        <div class="row">
            <div class=" col-md-12">
                <div class="form-group" style="float: left;">
                    <h2><span id="TitlePage">Help Configuration</span></h2>
                </div>
                <div class="form-group" style="float: right;">
                    <%--<h2><a href="TPMHelp.aspx" target="_blank"><i class="far fa-question-circle"></i></a></h2>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="row-eq-height">
            <div class="col-md-6 col-xs-12" id="Type">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group" style="float: left;">
                                    <h4><strong>Main Type</strong></h4>
                                </div>
                                <div class="form-group" style="float: right;">
                                    <button class="btn btn-success" type="button" id="btnModalType">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableType">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListType">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xs-12" id="MainGuide" style="display: none;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group" style="float: left;">
                                    <h4 id="headmainguide"><strong>Main Guide</strong></h4>
                                </div>
                                <div class="form-group" style="float: right;">
                                    <button class="btn btn-success" type="button" id="btnModalMainGuide">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableMainGuide">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListMainGuide">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-eq-height">
            <div class="col-md-12 col-xs-12" id="MainStep" style="display: none;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group" style="float: left;">
                                    <h4 id="headstep"><strong>Step</strong></h4>
                                </div>
                                <div class="form-group" style="float: right;">
                                    <button class="btn btn-success" type="button" id="btnModalStep">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tableStep">
                                        <thead>
                                            <tr>
                                                <th>Step No.</th>
                                                <th>Step Name</th>
                                                <th>Detail</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="ListStep">
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
    <div class="modal fade" id="ModalListDetailStep" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="headstepdetail">List Detail Step
                                <button class="btn btn-success" type="button" id="btnModalStepDetail">Add</button></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListChoice" class="table table-bordered table-responsive">
                        <thead id="Thead3" runat="server">
                            <tr>
                                <th>No.</th>
                                <th>IMG</th>
                                <th>Desc</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBodyDetailStep'>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalType" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Config Type : <span id="IDType" data-typeid="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name Type : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtNameType" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveType">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalMainGuide" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Config Guide : <span id="IDMainGuide" data-mainid="0" data-typeid="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Guide Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtNameMainGuide" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveMainGuide">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalStep" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Config Step : <span id="IDStep" data-mainid="0" data-stepid="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Step No. : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" class="form-control" id="txtNoStep" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Step Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtNameStep" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveStep">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalStepDetail" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Config Step Detail : <span id="IDStepDetail" data-stepdetailid="0" data-stepid="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="List No. : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" class="form-control" id="txtNoStepDetail" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="IMG : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="file" class="form-control" id="txtIMGPath" accept="image/x-png,image/jpeg" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Description : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtDescriptionStep" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveStepDetail">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {

            CallListType();


            $(document).on('click', '.clickType', function () {
                var row = $(this).closest("tr");
                var IDType = row.attr("data-typeid");
                $("#ListType").find("tr").find("td").find("a").removeClass("SelectLine");
                row.find("td").find("a").addClass("SelectLine");
                CallListGuide(IDType);
                $("#headmainguide").attr("data-typeid", IDType);
                $("#MainGuide").show();
                $("#MainStep").hide();
            });
            $("#btnModalType").on('click', function () {
                $("#IDType").attr("data-typeid", 0);
                $("#txtNameType").val("");
                $("#ModalType").modal("show");
            });
            $(document).on('click', '.clickEditModalType', function () {
                var row = $(this).closest("tr");
                var name = row.find("td:nth-child(1)").text();
                $("#IDType").attr("data-typeid", row.attr("data-typeid"));
                $("#txtNameType").val(name);
                $("#ModalType").modal("show");
            });
            $("#btnSaveType").on('click', function () {
                var typeid = $("#IDType").attr("data-typeid");
                var NameType = $("#txtNameType").val();
                //alert(typeid + " : " + NameType);
                if (NameType != "") {
                    SaveType(typeid, NameType);
                } else {
                    alert("Input Name to textbox, Please");
                }
            });




            $(document).on('click', '.clickMainGuide', function () {
                var row = $(this).closest("tr");
                var IDMain = row.attr("data-mainid");
                $("#ListMainGuide").find("tr").find("td").find("a").removeClass("SelectLine");
                row.find("td").find("a").addClass("SelectLine");
                CallListStep(IDMain);
                $("#headstep").attr("data-mainid", IDMain);
                $("#MainStep").show();
            });
            $("#btnModalMainGuide").on('click', function () {
                $("#IDMainGuide").attr("data-typeid", $("#headmainguide").attr("data-typeid")).attr("data-mainid", 0);
                $("#txtNameMainGuide").val("");
                $("#ModalMainGuide").modal("show");
            });
            $(document).on('click', '.clickEditModalMainGuide', function () {
                var row = $(this).closest("tr");
                var name = row.find("td:nth-child(1)").text();
                $("#IDMainGuide").attr("data-typeid", row.attr("data-typeid")).attr("data-mainid", row.attr("data-mainid"));
                $("#txtNameMainGuide").val(name);
                $("#ModalMainGuide").modal("show");
            });
            $("#btnSaveMainGuide").on('click', function () {
                var typeid = $("#IDMainGuide").attr("data-typeid");
                var mainid = $("#IDMainGuide").attr("data-mainid");
                var NameMainGuide = $("#txtNameMainGuide").val();
                if (NameMainGuide != "") {
                    SaveMainGuide(mainid, NameMainGuide, typeid);
                } else {
                    alert("Input Name to textbox, Please");
                }
            });



            $("#btnModalStep").on('click', function () {
                $("#IDStep").attr("data-mainid", $("#headstep").attr("data-mainid")).attr("data-stepid", 0);
                $("#txtNameStep").val("");
                $("#txtNoStep").val("0");
                $("#ModalStep").modal("show");
            });
            $(document).on('click', '.clickEditModalStep', function () {
                var row = $(this).closest("tr");
                var no = row.find("td:nth-child(1)").text();
                var name = row.find("td:nth-child(2)").text();
                $("#IDStep").attr("data-mainid", row.attr("data-mainid")).attr("data-stepid", row.attr("data-stepid"));
                $("#txtNoStep").val(no);
                $("#txtNameStep").val(name);
                $("#ModalStep").modal("show");
            });
            $("#btnSaveStep").on('click', function () {
                var stepid = $("#IDStep").attr("data-stepid");
                var mainid = $("#IDStep").attr("data-mainid");
                var StepNo = $("#txtNoStep").val();
                var NameStep = $("#txtNameStep").val();
                if (NameStep != "") {
                    SaveStep(stepid, mainid, StepNo, NameStep);
                } else {
                    alert("Input Name to textbox, Please");
                }
            });


            $(document).on('click', '.clickModalDetailStep', function () {
                var row = $(this).closest("tr");
                var IDStep = row.attr("data-stepid");
                $("#headstepdetail").attr("data-stepid", IDStep);
                CallListStepDetail(IDStep);
                $("#ModalListDetailStep").modal("show");
            });

            $("#btnModalStepDetail").on('click', function () {
                var IDStep = $("#headstepdetail").attr("data-stepid");
                $("#IDStepDetail").attr("data-stepid", IDStep).attr("data-stepdetailid", 0);
                $("#txtDescriptionStep").val("");
                $("#txtNoStepDetail").val("0");
                $("#ModalStepDetail").modal("show");
            });

            $(document).on('click', '.clickEditModalStepDetail', function () {
                var row = $(this).closest("tr");
                var no = row.find("td:nth-child(1)").text();
                var Path = row.find("td:nth-child(2)").text();
                var desc = row.find("td:nth-child(3)").text();
                $("#IDStepDetail").attr("data-stepdetailid", row.attr("data-stepdetailid")).attr("data-stepid", row.attr("data-stepid"));
                $("#txtNoStepDetail").val(no);
                $("#txtDescriptionStep").val(desc);
                $("#txtIMGPath").addClass("OnEdit");
                $("#ModalStepDetail").modal("show");
            });

            $("#btnSaveStepDetail").on('click', function () {
                var stepid = $("#IDStepDetail").attr("data-stepid");
                var stepdetailid = $("#IDStepDetail").attr("data-stepdetailid");
                var ListNo = $("#txtNoStepDetail").val();
                var Description = $("#txtDescriptionStep").val();

                var IMG_Path = "", checkimg = true;
                if (!$("#txtIMGPath").hasClass("OnEdit")) { checkimg = document.getElementById("txtIMGPath").files.length == 0 ? true : false; }
                else { checkimg = false; }
                IMG_Path = checkimg ? "" : ("https://tpm-patkol.com/TPMPatkolQRCode/HelpTool/" + stepid);

                if (IMG_Path != "") {
                    SaveStepDetail(stepdetailid, stepid, ListNo, IMG_Path, Description);
                } else {
                    alert("Input Name to textbox, Please");
                }

            });


            function SaveType(ID, Name) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_HelpTool_Customize_Type") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID), Name: Name, Type_Location: "TPMPatkol" }),
                    success: function (response) {
                        CallListType();
                        alert("Process Complete!!");
                        $("#ModalType").modal("hide");
                    }
                });
            }

            function SaveMainGuide(ID, Name_Guide, Location_ID) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_HelpTool_Customize_Main_Guide") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID), Name_Guide: Name_Guide, Location_ID: parseInt(Location_ID) }),
                    success: function (response) {
                        CallListGuide(Location_ID);
                        alert("Process Complete!!");
                        $("#ModalMainGuide").modal("hide");
                    }
                });
            }

            function SaveStep(ID, Main_ID, StepNo, StepName) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_HelpTool_Customize_Step") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID), Main_ID: parseInt(Main_ID), StepNo: parseInt(StepNo), StepName: StepName }),
                    success: function (response) {
                        CallListStep(Main_ID);
                        alert("Process Complete!!");
                        $("#ModalStep").modal("hide");
                    }
                });
            }


            function SaveStepDetail(ID, Step_ID, ListNo, IMG_Path, Description) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_HelpTool_Customize_Step_Detail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID), Step_ID: parseInt(Step_ID), ListNo: parseInt(ListNo), IMG_Path: IMG_Path, Description: Description }),
                    success: function (response) {
                        var folder = "HelpTool/" + Step_ID;
                        insertFile($("#txtIMGPath")[0].files[0], response.d, folder);
                        CallListStepDetail(Step_ID);
                        alert("Process Complete!!");
                        $("#ModalStepDetail").modal("hide");
                    }
                });
            }

            function CallListType() {
                $("#ListType").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGuideLocation") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Name = val[1];
                                var Type_Location = val[2];
                                frament += '<tr data-typeid="' + ID + '">';
                                frament += '<td class="col-md-8"><a href="javascript:void(0)" class="clickType">' + Name + '</a></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickEditModalType btn btn-warning btn-block">Edit</button></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickDeleteModalType btn btn-danger btn-block">Delete</button></td>';
                                frament += '</tr>';
                            });
                        } else {
                            frament += "<tr><td>Not Data</td><td></td><td></td></tr>";
                        }
                        $("#ListType").append(frament);
                    }
                });
            }

            function CallListGuide(IDType) {
                $("#ListMainGuide").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGuideMain") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ IDType: IDType, Keyword: "" }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Name_Guide = val[1];
                                var Location_ID = val[2];
                                frament += '<tr data-mainid="' + ID + '" data-typeid="' + Location_ID + '">';
                                frament += '<td class="col-md-8"><a href="javascript:void(0)" class="clickMainGuide">' + Name_Guide + '</a></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickEditModalMainGuide btn btn-warning btn-block">Edit</button></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickDeleteModalMainGuide btn btn-danger btn-block">Delete</button></td>';
                                frament += '</tr>';
                            });
                        } else {
                            frament += "<tr><td>Not Data</td><td></td><td></td></tr>";
                        }
                        $("#ListMainGuide").append(frament);
                    }
                });
            }


            function CallListStep(IDMain) {
                $("#ListStep").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGuideStep") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ IDMain: IDMain }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Main_ID = val[1];
                                var StepNo = val[2];
                                var StepName = val[3];

                                frament += '<tr data-stepid="' + ID + '" data-mainid="' + Main_ID + '">';
                                frament += '<td class="col-md-1">' + StepNo + '</td>';
                                frament += '<td class="col-md-5">' + StepName + '</td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickModalDetailStep btn btn-info btn-block">Img</button></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickEditModalStep btn btn-warning btn-block">Edit</button></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickDeleteModalStep btn btn-danger btn-block">Delete</button></td>';
                                frament += '</tr>';
                            });
                        } else {
                            frament += "<tr><td>Not Data</td><td>Not Data</td><td>Not Data</td></tr>";
                        }
                        $("#ListStep").append(frament);
                    }
                });
            }


            function CallListStepDetail(IDStep) {
                $("#TBodyDetailStep").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGuideStepDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ IDStep: IDStep }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Step_ID = val[1];
                                var ListNo = val[2];
                                var IMG_Path = val[3] + "/" + ID + ".png";
                                var Description = val[4];

                                frament += '<tr data-stepdetailid="' + ID + '" data-stepid="' + Step_ID + '">';
                                frament += '<td class="col-md-1">' + ListNo + '</td>';
                                frament += '<td><img src="' + IMG_Path + '" style="max-height: 100%; max-width: 100%" /></td>';
                                frament += '<td class="col-md-3">' + Description + '</td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickEditModalStepDetail btn btn-warning btn-block">Edit</button></td>';
                                frament += '<td class="col-md-2"><button type="button" class="clickDeleteModalStepDetail btn btn-danger btn-block">Delete</button></td>';
                                frament += '</tr>';
                            });
                        } else {
                            frament += "<tr><td>Not Data</td><td>Not Data</td><td>Not Data</td></tr>";
                        }
                        $("#TBodyDetailStep").append(frament);
                    }
                });
            }

        });

    </script>

</asp:Content>
