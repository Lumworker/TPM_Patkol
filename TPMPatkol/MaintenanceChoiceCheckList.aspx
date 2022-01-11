<%@ Page Title="CheckList Master" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintenanceChoiceCheckList.aspx.cs" Inherits="TPMPatkol.MaintenanceChoiceCheckList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-control {
            min-width: 100%;
        }
    </style>
    <div class="page-header">

        <div class="row">
            <div class=" col-md-12">
                <div class="form-group" style="float: left;">
                    <h2>Set Up Check List <button class="btn btn-success" type="button" id="btnModalCheckList">Add</button></h2>
                </div>
                <div class="form-group" style="float: right;">
                    <%--<h2><a href="TPMHelp.aspx" target="_blank"><i class="far fa-question-circle"></i></a></h2>--%>
                </div>
            </div>
        </div>
        <div class="row" id="DisplayZoneHeading">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;"></div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <%--<button class="btn btn-success" type="button" id="btnSaveReport">Add</button>--%>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel panel-default" id="DisplayMaintenanceTab">
            <div class="panel-body">
                <div class="col-md-12 row">
                    <div class="table-responsive">
                        <table class="table table-hover" id="tableCustomerSite">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Picture</th>
                                    <th>Choice</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="ListMaintenanceSystem"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>

    <div class="modal fade" id="ModalListChoice" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Choice</h4>
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
                                <th>Number</th>
                                <th>Name</th>
                                <th>Priority</th>
                                <th>Report Status</th>
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


    <div class="modal fade" id="ModalMaintenanceCheckList" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Add Check List</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtCheckListName" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Picture : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="file" class="form-control" id="txtCheckListPicture" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtCheckListStatus">
                                    <option>Active</option>
                                    <option>InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Question Type : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtCheckListQuestionType">
                                    <option>RD</option>
                                    <option>TB</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayCriteria" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Criteria : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <label class="radio-inline">
                                    <input type="radio" name="RtCriteria" value="Std" checked>Standard</label>
                                <label class="radio-inline">
                                    <input type="radio" name="RtCriteria" value="Config">Config</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayResetRecord" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label9" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Reset : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <label class="radio-inline">
                                    <input type="radio" name="RtReset" value="1" checked>None</label>
                                <label class="radio-inline">
                                    <input type="radio" name="RtReset" value="0">After MA</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayYellowCriteria" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Yellow Criteria : " Style="color: #f0ad4e"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" class="form-control" id="txtCheckListYellowCriteria" value="0" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayRedCriteria" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Red Criteria : " Style="color: red"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" class="form-control" id="txtCheckListRedCriteria" value="0" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Allow Entry Yellow/Red : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="CheckedAllowEntry" style="-ms-transform: scale(1.5); -webkit-transform: scale(1.5); transform: scale(1.5);"></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddCheckList">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script>

        $(document).ready(function () {

            var username = sessionStorage.getItem("username");

            ListCheckList();

            $("#txtCheckListQuestionType").on('change', function () {

                if ($(this).val() == "TB") {
                    $("#DisplayCriteria").show();
                    $("#DisplayYellowCriteria").show();
                    $("#DisplayRedCriteria").show();
                    $("#DisplayResetRecord").show();
                } else {
                    $("#DisplayCriteria").hide();
                    $("#DisplayYellowCriteria").hide();
                    $("#DisplayRedCriteria").hide();
                    $("#DisplayResetRecord").hide();
                }

            });

            $("#btnModalCheckList").on('click', function () {
                $("#ModalMaintenanceCheckList").modal("show");
                $("#txtCheckListName").val("").attr("data-id", "");
                $("#txtCheckListPicture").val("");
                $("#txtCheckListStatus").val("Active");
                $("#txtCheckListQuestionType").val("RD");
                $("#DisplayCriteria").hide();
                $("#DisplayResetRecord").hide();
                $("#DisplayYellowCriteria").hide();
                $("#DisplayRedCriteria").hide();
                $("#txtCheckListYellowCriteria").val("0");
                $("#txtCheckListRedCriteria").val("0");
                $("input[name=CheckedAllowEntry]").prop("checked", false);
                $("input[name=RtCriteria][value=Std]").prop("checked", true);
                $("input[name=RtReset][value=1]:checked").prop("checked", true);
                $("#btnAddCheckList").removeClass("btn-warning").addClass("btn-success").text("Add");
            });
            $(document).on('click', '.ClickSaveMaster', function () {
                $("#ModalMaintenanceCheckList").modal("show");
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var txtCheckListName = row.find("td:nth-child(2)").text();
                var txtCheckListStatus = row.attr("data-status");
                var txtCheckListQuestionType = row.attr("data-qt");
                var Criteria = row.find("td:nth-child(4)").text();
                var AllowEntry = row.find("td:nth-child(7)").text();
                var ResetRecord = row.find("td:nth-child(8)").text();
                $("#txtCheckListName").val(txtCheckListName).attr("data-id", ID);
                //$("#txtCheckListPicture").val("");
                $("#txtCheckListStatus").val(txtCheckListStatus);
                $("#txtCheckListQuestionType").val(txtCheckListQuestionType);

                if (txtCheckListQuestionType == "TB") {
                    $("#DisplayCriteria").show();
                    $("#DisplayResetRecord").show();
                    if (Criteria == "Std") {
                        $("input[name=RtCriteria][value=Std]").prop("checked", true);
                        $("#DisplayYellowCriteria").show();
                        $("#DisplayRedCriteria").show();
                    }
                    else if (Criteria == "Config") {
                        $("input[name=RtCriteria][value=Config]").prop("checked", true);
                        $("#DisplayYellowCriteria").hide();
                        $("#DisplayRedCriteria").hide();
                    }
                }
                else {
                    $("#DisplayResetRecord").hide();
                    $("#DisplayCriteria").hide();
                    $("#DisplayYellowCriteria").hide();
                    $("#DisplayRedCriteria").hide();
                }

                $("#txtCheckListYellowCriteria").val(row.find("td:nth-child(5)").text());
                $("#txtCheckListRedCriteria").val(row.find("td:nth-child(6)").text());

                AllowEntry == "True" ? $("input[name=CheckedAllowEntry]").prop("checked", true) : $("input[name=CheckedAllowEntry]").prop("checked", false);
                ResetRecord == "True" ? $("input[name=RtReset][value=1]").prop("checked", true) : ResetRecord == "" ? $("input[name=RtReset]").prop("checked", false) : $("input[name=RtReset][value=0]").prop("checked", true);

                $("#btnAddCheckList").removeClass("btn-success").addClass("btn-warning").text("Save");
            });

            $("input[name=RtCriteria]").on('change', function () {
                var checked = $("input[name=RtCriteria]:checked").val();
                if (checked != "Std") {
                    $("#DisplayYellowCriteria").hide();
                    $("#DisplayRedCriteria").hide();
                    $("#txtCheckListYellowCriteria").val("0");
                    $("#txtCheckListRedCriteria").val("0");
                } else {
                    $("#DisplayYellowCriteria").show();
                    $("#DisplayRedCriteria").show();
                }
            });

            $("#btnAddCheckList").on('click', function () {
                var ID = $("#txtCheckListName").attr("data-id") != "" ? parseInt($("#txtCheckListName").attr("data-id")) : 0;
                var txtCheckListName = $("#txtCheckListName").val();
                var Picture = "https://tpm-patkol.com/TPMPatkolQRCode/IMGChecklist/";
                var txtCheckListStatus = $("#txtCheckListStatus").val();
                var txtCheckListQuestionType = $("#txtCheckListQuestionType").val();
                var Status_Work = $("#btnAddCheckList").text() == "Add" ? "Insert" : "Update";

                var Yellow_Criteria = $("#txtCheckListYellowCriteria").val();
                var Red_Criteria = $("#txtCheckListRedCriteria").val();
                var Criteria = $("input[name=RtCriteria]:checked").val();

                var AllowEntry = $("input[name=CheckedAllowEntry]").prop("checked") ? 1 : 0;

                var ResetRecord = parseInt($("input[name=RtReset]:checked").val());

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Maintenance_CheckList_V2") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, List_Name: txtCheckListName, Picture: Picture, Status: txtCheckListStatus, QuestionType: txtCheckListQuestionType, Yellow_Criteria: Yellow_Criteria, Red_Criteria: Red_Criteria, Criteria: Criteria, AllowEntry: AllowEntry, ResetRecord: ResetRecord, Status_Work: Status_Work }),
                    success: function (response) {
                        if (Status_Work == "Update") { alert("Update Complete"); } else { alert("Insert Complete"); }
                        var ID = response.d;
                        insertFile($("#txtCheckListPicture")[0].files[0], ID, "IMGChecklist");
                        ListCheckList();
                        $("#ModalMaintenanceCheckList").modal("hide");
                    }
                });
            });



            $(document).on('click', '.ClickSeeDetailChoice', function () {
                var row = $(this).closest("tr");
                var IDList = row.attr("data-id");
                ListDetailCheckList(IDList);
                $("#ModalListChoice").modal("show");
            });


            $(document).on('click', "#ClickAddChoice", function () {
                var row = $(this).closest("tr");
                var List_ID = parseInt($("#TBodyChoice").attr("data-idlist"));
                var List_No = parseInt(row.find("td:nth-child(1)").find("input").val());
                var List_Name = row.find("td:nth-child(2)").find("input").val();
                var Priority = parseInt(row.find("td:nth-child(3)").find("select").val());
                var Report_Status = parseInt(row.find("td:nth-child(4)").find("select").val());
                ChoiceCheckList(0, List_ID, List_No, List_Name, Priority, Report_Status, "Insert");
            });

            $(document).on('click', '.ClickUpdateChoice', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-idchoice"));
                var List_ID = parseInt($("#TBodyChoice").attr("data-idlist"));
                var List_No = parseInt(row.find("td:nth-child(1)").find("input").val());
                var List_Name = row.find("td:nth-child(2)").find("input").val();
                var Priority = parseInt(row.find("td:nth-child(3)").find("select").val());
                var Report_Status = parseInt(row.find("td:nth-child(4)").find("select").val());
                ChoiceCheckList(ID, List_ID, List_No, List_Name, Priority, Report_Status, "Update");
            });

            function ChoiceCheckList(ID, List_ID, List_No, List_Name, Priority, Report_Status, Status_Work) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Sub_CheckList_Maintenance") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, List_ID: List_ID, List_No: List_No, List_Name: List_Name, Priority: Priority, Report_Status: Report_Status, CreateBy: username, Status_Work: Status_Work }),
                    success: function (response) {
                        if (Status_Work == "Insert") { alert("Add Complete"); }
                        else { alert("Update Complete"); }
                        ListDetailCheckList(List_ID);
                    }
                });
            }



            function ListCheckList() {
                $("#ListMaintenanceSystem").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListMaintenanceCheckListMst") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            var Time = new Date().getHours() + "" + new Date().getMinutes() + "" + new Date().getMilliseconds();
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var List_Name = val[1];
                                var Picture = val[2];
                                var Status = val[3];
                                var QuestionType = val[4];
                                var Yellow_Criteria = val[5];
                                var Red_Criteria = val[6];
                                var Criteria = val[7];
                                var AllowEntry = val[8];
                                var ResetRecord = val[9];
                                frament += "<tr data-id='" + ID + "' data-status='" + Status + "' data-qt='" + QuestionType + "'>";
                                frament += "<td>" + (index + 1) + "</td>";
                                frament += "<td>" + List_Name + "</td>";
                                frament += "<td><img src='" + Picture + "?time=" + Time + "' alt='IMG' style='width:100px'></td>";
                                frament += "<td style='display:none;'>" + Criteria + "</td>";
                                frament += "<td style='display:none;'>" + Yellow_Criteria + "</td>";
                                frament += "<td style='display:none;'>" + Red_Criteria + "</td>";
                                frament += "<td style='display:none;'>" + AllowEntry + "</td>";
                                frament += "<td style='display:none;'>" + ResetRecord + "</td>";
                                frament += "<td><button type='button' class='btn btn-info btn-block ClickSeeDetailChoice'>Detail</button></td>";
                                frament += '<td><button type="button" class="btn btn-warning ClickSaveMaster"><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                                frament += "</tr>";
                            });
                            $("#ListMaintenanceSystem").append(frament);
                        }
                    }
                });
            }

            function ListDetailCheckList(IDList) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListSubCheckListMaintenance") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: IDList }),
                    success: function (response) {
                        $("#TBodyChoice").empty();
                        var frament = '<tr><td><input type="text" class="form-control" /></td><td><input type="text" class="form-control" /></td><td><select class="form-control" id=""><option value="1">Normal</option><option value="2">Risk</option><option value="3">Emergency</option></select></td><td><select class="form-control"><option value=""></option><option value="1">Normal</option><option value="0">Abnormal</option></select></td><td><button type="button" id="ClickAddChoice" class="btn btn-success btn-block">Add</button></td></tr>';
                        $("#TBodyChoice").append(frament).attr("data-idlist", IDList);
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var framents = "";
                                var ID = val[0];
                                var IDChoice = val[3];
                                var List_Name = val[5];
                                var List_No = val[4];
                                var Priority = val[6];
                                var Report_Status = val[7] != "" ? val[7] == "True" ? "1" : 0 : "";
                                framents += "<tr data-idchoice='" + IDChoice + "'>";
                                framents += "<td><input type='text' class='form-control' value='" + List_No + "'/></td>";
                                framents += "<td><input type='text' class='form-control' value='" + List_Name + "'/></td>";
                                framents += "<td><select class='form-control' id='stPriority" + IDChoice + "'><option value='1'>Normal</option><option value='2'>Risk</option><option value='3'>Emergency</option></select></td>";
                                framents += "<td><select class='form-control' id='stReportStatus" + IDChoice + "'><option value=''></option><option value='1'>Normal</option><option value='0'>Abnormal</option></select></td>";
                                framents += "<td><button type='button' class='btn btn-warning btn-block ClickUpdateChoice'>Save</button></td>";
                                framents += "</tr>";
                                $("#TBodyChoice").append(framents);
                                $("#stPriority" + IDChoice).val(Priority);
                                $("#stReportStatus" + IDChoice).val(Report_Status);
                            });
                        }

                    }
                });
            }


        });


    </script>

</asp:Content>
