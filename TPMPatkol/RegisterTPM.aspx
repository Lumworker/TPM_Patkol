<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterTPM.aspx.cs" Inherits="TPMPatkol.RegisterTPM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        #dtdEffectDateClear, #dtdExpireDateClear {
            display: none;
            position: absolute;
            right: 1.8em;
            top: 0;
            bottom: 0;
            height: 14px;
            margin: auto;
            font-size: 14px;
            cursor: pointer;
            color: #ccc;
        }

        .ui-datepicker {
            z-index: 99999 !important
        }
    </style>

    <div class="page-header">
        <h2>QR Code Register
            <button class="btn btn-warning" id="buttonModalTPMCode" type="button">
                <%--<i class="glyphicon glyphicon-search"></i>--%>
                Scan QRCode
            </button>
        </h2>
        <div class="row" id="DisplayZoneHeading" style="display: none;">
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: left;">
                <h4 id="TPMCodeTextHeading" style="color: blue"></h4>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: right">
                <button class="btn btn-warning" type="button" id="btnSaveReport">Save</button>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label11" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Machine Main"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtMachineMain" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label12" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Machine Group"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtMachineGroup" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label14" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Equipment"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtMachineEquipment" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                </div>
                <!--END Row-->
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label13" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Room No."></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtRoomno" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label15" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Room Name."></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <input type="text" id="txtRoomname" class="form-control" style="min-width: 100%" />
                        </div>
                    </div>
                </div>
                <!--END Row-->
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->

        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 text-mode" style="margin: 10px 0;">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#1" data-toggle="tab">Relate</a></li>
                            <li><a href="#2" data-toggle="tab">Compressor</a></li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="tab-content ">
                            <div class="tab-pane active" id="1">
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <label class="radio-inline">
                                                <input type="radio" name="RadioTypeTPMCode" id="rdttypetpmPatkol" value="0" disabled>Patkol</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="RadioTypeTPMCode" id="rdttypetpmOther" value="1" disabled>Other</label>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Job"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <%--<div class="input-group">--%>
                                            <input type="text" id="txtJobCode" class="form-control" style="min-width: 100%" disabled />
                                            <%--<div class="input-group-btn">
                                                    <button id="buttonModalJobCode" class="btn btn-default" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Lot"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <%--<div class="input-group">--%>
                                            <input type="text" id="txtLotCode" class="form-control" style="min-width: 100%" disabled />
                                            <%--<div class="input-group-btn">
                                                    <button id="buttonModalLotCode" class="btn btn-default" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Serial"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <%--<div class="input-group">--%>
                                            <input type="text" id="txtSerial" class="form-control" style="min-width: 100%" disabled />
                                            <%--<div class="input-group-btn">
                                                    <button id="buttonModalSerial" class="btn btn-default" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Project"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <%--<div class="input-group">--%>
                                            <input type="text" id="txtProject" class="form-control" style="min-width: 100%" disabled />
                                            <%--<div class="input-group-btn">
                                                    <button id="buttonModalProject" class="btn btn-default" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                                <div class="row" <%-- id="ZoneCustomerSite" --%>data-checkcussite="0">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <%--<div class="input-group">--%>
                                            <input type="text" id="txtCustomer" class="form-control" style="min-width: 100%" disabled />
                                            <%--<div class="input-group-btn">
                                                    <button id="buttonModalCustomer" class="btn btn-default" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Site"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <%--<div class="input-group">--%>
                                            <input type="text" id="txtCustomerSite" class="form-control" style="min-width: 100%" disabled />
                                            <%--<div class="input-group-btn">
                                                    <button id="buttonModalCustomerSite" class="btn btn-default" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label10" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <label class="radio-inline">
                                                <input type="radio" id="rdtStatusActive" name="RadioStatusTPMCode" value="Active" disabled>Active</label>
                                            <label class="radio-inline">
                                                <input type="radio" id="rdtStatusInActive" name="RadioStatusTPMCode" value="InActive" disabled>InActive</label>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                                <div class="row">
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Effect Date"></asp:Label>
                                        <div class="col-md-9 col-xs-12 date btn-group" data-provide="datepicker">
                                            <input placeholder="DD/MM/YYYY" onfocus="blur();" id="dtdEffectDate" type="text" class="form-control" autocomplete="off" style="min-width: 100%" disabled />
                                            <%--<i id="dtdEffectDateClear" class="fas fa-times"></i>--%>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <asp:Label ID="Label9" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Expire Date"></asp:Label>
                                        <div class="col-md-9 col-xs-12 date btn-group" data-provide="datepicker">
                                            <input placeholder="DD/MM/YYYY" onfocus="blur();" id="dtdExpireDate" type="text" class="form-control" autocomplete="off" style="min-width: 100%" disabled />
                                            <%--<i id="dtdExpireDateClear" class="fas fa-times"></i>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                            </div>
                            <!--End Tab1-->
                            <div class="tab-pane" id="2">
                                <div class="col-md-12 row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="tableRelateCompressor">
                                            <thead>
                                                <tr>
                                                    <th>Type</th>
                                                    <th>Name</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListRelateCompressor"></tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--END Table-->
                            </div>
                            <!--End Tab2-->
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <%--<div class="panel panel-default" id="DisplayMaintenanceTab" style="display: none">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 text-mode" style="margin: 10px 0;">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#1" data-toggle="tab">Maintenance System</a></li>
                            <li><a href="#2" data-toggle="tab">Machine Detail</a></li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="tab-content ">
                            <div class="tab-pane active" id="1">
                                <div class="row">
                                    <div class="col-md-9 col-lg-9 col-sm-12">
                                        <h4>Maintenance System</h4>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                        <button type="button" class="btn btn-warning" id="btnSaveMaintenanceSystem">Save</button>
                                    </div>
                                </div>

                                <div class="col-md-12 row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="tableCustomerSite">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Name</th>
                                                    <th>Picture</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ListMaintenanceSystem"></tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--END Table-->
                            </div>
                            <div class="tab-pane" id="2">
                                <h4>Machine Detail</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->--%>
    </div>

    <div class="modal fade" id="Modal_RegisterTPMCode" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg" style="width: 100%;">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em; padding-left: 0.5em;">
                        <span id="TPMCodeTextHeading2" style="color: blue; font-weight: bold; font-size: 24px;"></span>
                        <button type="button" class="close" data-dismiss="modal" style="font-size: 2.5em;">&times;</button>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 29em;">
                    <!-- SmartWizard html -->
                    <div id="smartwizard">
                        <ul>
                            <li class="check" data-step="Step1"><a href="#step-1">Mach Register</a></li>
                            <li class="check" data-step="Step2"><a href="#step-2">Compressor</a></li>
                            <li class="check" data-step="Step3"><a href="#step-3">Compressor Set</a></li>
                            <li class="check" data-step="Step4"><a href="#step-4">Room</a></li>
                            <li class="check" data-step="Step5"><a href="#step-5">Machine Detail</a></li>
                        </ul>
                        <div>
                            <div id="step-1" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Machine Info</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label16" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <label class="radio-inline">
                                                            <input type="radio" name="ModalRadioTypeTPMCode" id="ModalrdttypetpmPatkol" value="0">Patkol</label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="ModalRadioTypeTPMCode" id="ModalrdttypetpmOther" value="1">Other</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label37" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type TPM"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <select class="form-control" id="ModalstcTypeTPM" style="min-width: 100%">
                                                            <option value="">===</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div id="ZoneCheckPatOther">
                                                <div class="row">
                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                        <asp:Label ID="Label17" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Job"></asp:Label>
                                                        <div class="col-md-9 col-xs-12">
                                                            <div class="input-group">
                                                                <input type="text" id="ModaltxtJobCode" class="form-control" style="min-width: 100%" />
                                                                <div class="input-group-btn">
                                                                    <button id="buttonModalJobCode" class="btn btn-default" type="button">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--END Row-->
                                                <div class="row">
                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                        <asp:Label ID="Label18" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Lot"></asp:Label>
                                                        <div class="col-md-9 col-xs-12">
                                                            <div class="input-group">
                                                                <input type="text" id="ModaltxtLotCode" class="form-control" style="min-width: 100%" />
                                                                <div class="input-group-btn">
                                                                    <button id="buttonModalLotCode" class="btn btn-default" type="button">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                        <asp:Label ID="Label19" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Serial"></asp:Label>
                                                        <div class="col-md-9 col-xs-12">
                                                            <div class="input-group">
                                                                <input type="text" id="ModaltxtSerial" class="form-control" style="min-width: 100%" />
                                                                <div class="input-group-btn">
                                                                    <button id="buttonModalSerial" class="btn btn-default" type="button">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--END Row-->
                                                <div class="row">
                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                        <asp:Label ID="Label20" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Project"></asp:Label>
                                                        <div class="col-md-9 col-xs-12">
                                                            <div class="input-group">
                                                                <input type="text" id="ModaltxtProject" class="form-control" style="min-width: 100%" />
                                                                <div class="input-group-btn">
                                                                    <button id="buttonModalProject" class="btn btn-default" type="button">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--END Row-->
                                            </div>
                                            <div class="row" id="ZoneCustomerSite" data-checkcussite="0">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label21" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <div class="input-group">
                                                            <input type="text" id="ModaltxtCustomer" class="form-control" style="min-width: 100%" disabled />
                                                            <div class="input-group-btn">
                                                                <button id="buttonModalCustomer" class="btn btn-default" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label22" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Customer Site"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <div class="input-group">
                                                            <input type="text" id="ModaltxtCustomerSite" class="form-control" style="min-width: 100%" disabled data-id="0" data-roomid="0" data-packageid="0" />
                                                            <div class="input-group-btn">
                                                                <button id="buttonModalCustomerSite" class="btn btn-default" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label23" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <label class="radio-inline">
                                                            <input type="radio" id="ModalrdtStatusActive" name="ModalRadioStatusTPMCode" value="Active">Active</label>
                                                        <label class="radio-inline">
                                                            <input type="radio" id="ModalrdtStatusInActive" name="ModalRadioStatusTPMCode" value="InActive">InActive</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label24" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Effect Date"></asp:Label>
                                                    <div class="col-md-9 col-xs-12 date btn-group" data-provide="datepicker">
                                                        <input placeholder="DD/MM/YYYY" onfocus="blur();" id="ModaldtdEffectDate" type="text" class="form-control" autocomplete="off" style="min-width: 100%" />
                                                        <i id="dtdEffectDateClear" class="fas fa-times"></i>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label25" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Expire Date"></asp:Label>
                                                    <div class="col-md-9 col-xs-12 date btn-group" data-provide="datepicker">
                                                        <input placeholder="DD/MM/YYYY" onfocus="blur();" id="ModaldtdExpireDate" type="text" class="form-control" autocomplete="off" style="min-width: 100%" />
                                                        <i id="dtdExpireDateClear" class="fas fa-times"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="step-2" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Compressor</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-md-10 row">
                                                <button type="button" class="btn btn-success" id="btnModalAddCompressor">Add</button>
                                                <div class="table-responsive">
                                                    <table class="table table-hover" id="tableListCompressor">
                                                        <thead>
                                                            <tr>
                                                                <th>Type</th>
                                                                <th>Name</th>
                                                                <th></th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCompressor">
                                                            <%--<tr>
                                                                <td></td>
                                                                <td> <button type="button" class="btn btn-info btn-block btnDetailCompressor" style="min-width: 120px;">Detail</button></td>
                                                            </tr>--%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!--END Table-->
                                        </div>
                                        <!--END Panel-body -->
                                    </div>
                                </div>
                            </div>
                            <div id="step-3" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Compressor Set</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-md-10 row">
                                                <button type="button" class="btn btn-success" id="btnAddCompressorSet" style="margin-bottom: 10px">Add</button>
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableListCheckboxCompressorSet">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>Name</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCheckboxCompressorSet">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!--END Table-->
                                        </div>
                                        <!--END Panel-body -->
                                    </div>
                                </div>
                            </div>
                            <div id="step-4" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Room</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-md-10 row">
                                                <button type="button" class="btn btn-success" id="btnAddRoom" style="margin-bottom: 10px">Add</button>
                                                <div class="table-responsive">
                                                    <table class="table table-hover" id="tableListRoom">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>No.</th>
                                                                <th>Name</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListRoom">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!--END Table-->
                                        </div>
                                        <!--END Panel-body -->
                                    </div>
                                </div>
                            </div>
                            <div id="step-5" class="">
                                <div class="panel-group">
                                    <div class="panel panel-default" style="margin-top: 1em;">
                                        <div class="panel-heading">
                                            <h4>Machine Detail</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label34" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Machine Main"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <div class="input-group">
                                                            <input type="text" id="ModaltxtMachineMain" class="form-control" style="min-width: 100%" data-mainid="0" disabled />
                                                            <div class="input-group-btn">
                                                                <button id="buttonModalMachineMain" class="btn btn-default" type="button" disabled>
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label35" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Machine Group"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <div class="input-group">
                                                            <input type="text" id="ModaltxtMachineGroup" class="form-control" style="min-width: 100%" disabled />
                                                            <div class="input-group-btn">
                                                                <button id="buttonModalMachineGroup" class="btn btn-default" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label36" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Equipment"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <div class="input-group">
                                                            <input type="text" id="ModaltxtMachineEquipment" class="form-control" style="min-width: 100%" disabled />
                                                            <div class="input-group-btn">
                                                                <button id="buttonModalMachineEquipment" class="btn btn-default" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label38" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Equipment Suffix"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <input type="text" id="ModaltxtMachineEquipmentsubfix" class="form-control" style="min-width: 100%" />

                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row" id="DisplayQuestionOther" style="display: none;">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label40" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Question Other"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <input type="text" id="ModaltxtMachineEquipmentQuestionOther" class="form-control" style="min-width: 100%" />

                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row" id="DisplayStartRecord" style="display: none;">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label42" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Record Start"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <input type="number" id="ModaltxtMachineEquipmentRecordStart" class="form-control" style="min-width: 100%" value="0" />

                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row" id="DisplayYellowCriteriaMachineDetail" style="display: none;">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label47" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Yellow Criteria" Style="color: #f0ad4e"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <input type="number" id="ModaltxtYellowCriteriaMachineDetail" class="form-control" style="min-width: 100%" value="0" />

                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                            <div class="row" id="DisplayRedCriteriaMachineDetail" style="display: none;">
                                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                    <asp:Label ID="Label48" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Red Criteria" Style="color: red"></asp:Label>
                                                    <div class="col-md-9 col-xs-12">
                                                        <input type="number" id="ModaltxtRedCriteriaMachineDetail" class="form-control" style="min-width: 100%" value="0" />

                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
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
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                    <td>
                                                                        <input type="checkbox" /></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--END Row-->
                                        </div>
                                        <!--END Panel-body -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="ClickNextStep" class="btn btn-info">Next</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalAddCompressor" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Compressor : <span id="IDCompressor" data-id="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label27" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtTypeCompressor" style="min-width: 100%;">
                                    <option value="CDU">Condensing Unit</option>
                                    <option value="PP">Power Pack</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label26" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtNameCompressor" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddCompressor">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalCompressorDetail" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Compressor : <span id="IDCompressorDetail" data-id="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label28" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Group : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtGroupAddCompressorDetail" style="min-width: 100%;">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label29" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Equipment : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtEquipmentAddCompressorDetail" style="min-width: 100%;">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label39" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Compressor Suffix : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEquipmentAddCompressorsubfixDetail" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayCompressorQuestionOther" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label41" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Question Other : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEquipmentAddCompressorQuestionOtherDetail" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayCompressorStartRecord" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label43" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Record Start"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="txtMachineEquipmentCompressorRecordStart" class="form-control" style="min-width: 100%" value="0" />

                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row" id="DisplayYellowCriteriaCompressorDetail" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label49" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Yellow Criteria" Style="color: #f0ad4e"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="ModaltxtYellowCriteriaCompressorDetail" class="form-control" style="min-width: 100%" value="0" />

                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row" id="DisplayRedCriteriaCompressorDetail" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label50" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Red Criteria" Style="color: red"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="ModaltxtRedCriteriaCompressorDetail" class="form-control" style="min-width: 100%" value="0" />

                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12 text-right">
                            <button type="button" class="btn btn-success" id="btnModalAddCompressorDetail">Add</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-hover" id="tableListCompressorDetail">
                                    <thead>
                                        <tr>
                                            <th>TPM Code</th>
                                            <th>Group</th>
                                            <th>Equipment</th>
                                            <th>Compressor Suffix/Name</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListCompressorDetail">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--END Table-->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalCompressorDetailEdit" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Compressor : <span id="IDCompressorDetailEdit" data-id="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label44" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Compressor Suffix : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEquipmentAddCompressorsubfixDetailEdit" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayCompressorQuestionOtherEdit" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label45" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Question Other : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txtEquipmentAddCompressorQuestionOtherDetailEdit" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayCompressorStartRecordEdit" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label46" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Record Start"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="txtMachineEquipmentCompressorRecordStartEdit" class="form-control" style="min-width: 100%" value="0" />

                            </div>
                        </div>
                    </div>
                    <div class="row" id="DisplayYellowCriteriaCompressorDetailEdit" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label51" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Yellow Criteria" Style="color: #f0ad4e"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="ModaltxtYellowCriteriaCompressorDetailEdit" class="form-control" style="min-width: 100%" value="0" />

                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row" id="DisplayRedCriteriaCompressorDetailEdit" style="display: none;">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label52" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Red Criteria" Style="color: red"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="number" id="ModaltxtRedCriteriaCompressorDetailEdit" class="form-control" style="min-width: 100%" value="0" />

                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="btnModalAddCompressorDetailEdit">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalCompressorDetailWorkingDay" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">TPMCode : <span id="NameCompressorDetail" data-id="0"></span></h4>
                        </div>
                        <%--<div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>--%>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-hover" id="tableCompressorDetailWorkingDay">
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
                                    <tbody id="ListCompressorDetailWorkingDay" style="text-align: center">
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>
                                                <input type="checkbox" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--END Table-->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveCompressorDetailWorkingDay" class="btn btn-warning">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalCompressorSet" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">List Compressor Set</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label30" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Set Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input class="form-control" id="txtNameAddCompressorSet" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label31" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Compressor : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtCompressorAddCompressorSet" class="form-control" style="min-width: 100%" />
                                    <div class="input-group-btn">
                                        <button id="buttonModalSelectCompressor" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12 text-right">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-hover" id="tableListCompressorSet">
                                    <thead>
                                        <tr>
                                            <%--<th>Compressor Set</th>--%>
                                            <th>Compressor</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListCompressorSet" data-packageid="0">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--END Table-->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="btnSaveAddModalCompressorSet">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalRoomAdd" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Add Room <span id="IDRoom" data-id="0"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label33" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Room : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtRoom" class="form-control" style="min-width: 100%" disabled />
                                    <div class="input-group-btn">
                                        <button id="buttonModalSelectRoom" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label31" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Room No. : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input class="form-control" id="txtRoomNo" type="number" step="any" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label32" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Room Name : "></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input class="form-control" id="txtRoomName" style="min-width: 100%;" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="btnAddRoomPackage">Save</button>
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
                                <th>Customer Site Number</th>
                                <th>Customer Site Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyCustomerSite'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAddSiteLink">Add Site</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListTPMCode" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List TPM Code</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="input-group">
                                <input type="text" class="form-control" id="ListTPMCode_myInput" placeholder="Search TPM Code" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                                <div class="input-group-btn">
                                    <a class="btn btn-info" href="https://tpm-patkol.com/TPMQRCodeScanner/?type=patkol">Scan QRCode</a>
                                    <%--<a class="btn btn-info" href="https://tpm-patkol.com/TPMQRCodeScanner_Test/?type=patkol">Scan QRCode</a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListTPMCode" class="table table-bordered table-responsive">
                        <thead id="Thead3" runat="server">
                            <tr>
                                <th>TPM Code</th>
                                <%--<th>Create By</th>--%>
                            </tr>
                        </thead>
                        <tbody id='TBodyTPMCode'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListCompressor" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Compressor</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListCompressor_myInput" placeholder="Search Compressor" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCompressor" class="table table-bordered table-responsive">
                        <thead id="Thead4" runat="server">
                            <tr>
                                <th>Compressor Type</th>
                                <th>Compressor Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyListCompressor'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListRoom" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Room</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListRoom_myInput" placeholder="Search Room" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListRoom" class="table table-bordered table-responsive">
                        <thead id="Thead5" runat="server">
                            <tr>
                                <th>Room Code</th>
                                <th>Room Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyListRoom'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListMachineMain" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Machine Main</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListMachineMain_myInput" placeholder="Search Machine Main" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListMachineMain" class="table table-bordered table-responsive">
                        <thead id="Thead6" runat="server">
                            <tr>
                                <th style="display: none;">Machine Main Code</th>
                                <th>Machine Main Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyListMachineMain'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalListMachineGroup" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Machine Group</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListMachineGroup_myInput" placeholder="Search Machine Group" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListMachineGroup" class="table table-bordered table-responsive">
                        <thead id="Thead7" runat="server">
                            <tr>
                                <th style="display: none;">Machine Group Code</th>
                                <th>Machine Group Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyListMachineGroup'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListMachineEquipment" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Machine Equipment</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListMachineEquipment_myInput" placeholder="Search Machine Equipment" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListMachineEquipment" class="table table-bordered table-responsive">
                        <thead id="Thead8" runat="server">
                            <tr>
                                <th style="display: none;">Machine Equipment Code</th>
                                <th>Machine Equipment Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyListMachineEquipment'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalScanQRCode" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Scan QRCode</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em; text-align: center">
                    <canvas id="mycanvas" style="height: 300px; width: 300px; border: solid 1px #000; padding: 10px"></canvas>
                    <br />
                    <button id="btnScan" class="btn btn-info" type="button">Scan</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="Scripts/qrcode/jsQR.js"></script>
    <script src="Scripts/qrcode/dw-qrscan.js"></script>
    <script>

        $(document).ready(function () {
            $('#ModaldtdEffectDate').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#ModaldtdExpireDate').datepicker({ dateFormat: 'dd/mm/yy' });

            var GetTPMCode = getAllUrlParams("CodeTPM");
            var SetChecker = false;
            var usernameLogin = sessionStorage.getItem("username");
            if (GetTPMCode == null || GetTPMCode == "") {
                window.location.href = "https://tpm-patkol.com/TPMQRCodeScanner/?type=patkol";
                //callTPMCode("");
            } else {
                var data = callCheckTPMCode();
                if (data == 1) {
                    CallSelectMachineMain();
                    CallDataRelate();
                    CallMachineDetail();
                    CallRelateListCompressor($("#ModaltxtCustomerSite").attr("data-id"));
                    calwizard(0);
                } else {
                    alert("TPMCode Error");
                }

            }

            //หากช่อง input มีค่าให้แสดงตัว X เพื่อให้กดลบ
            $('#ModaldtdEffectDate').on('change', function () { if ($("#ModaldtdEffectDate").val() != "") { $("#dtdEffectDateClear").show(); } });
            $('#ModaldtdExpireDate').on('change', function () { if ($("#ModaldtdExpireDate").val() != "") { $("#dtdExpireDateClear").show(); } });
            //ถ้ากดตัว X ล้างค่าภายใน input ทิ้ง
            $("#dtdEffectDateClear").click(function () { $("#ModaldtdEffectDate").val(''); $("#dtdEffectDateClear").hide(); });
            $("#dtdExpireDateClear").click(function () { $("#ModaldtdExpireDate").val(''); $("#dtdExpireDateClear").hide(); });



            $("#ClickNextStep").on('click', function () {
                var step = "";
                $(".check").each(function () { if ($(this).hasClass("active")) { step = $(this).data(); } });
                console.log(step.step);
                if (step.step == "Step1") {
                    var proj_num = $("#ModaltxtProject").val();
                    var job_num = $("#ModaltxtJobCode").val();
                    var lot_num = $("#ModaltxtLotCode").val();
                    var serial_num = $("#ModaltxtSerial").val();
                    var SelectTypeMachineTPM = $("#ModalstcTypeTPM").val();
                    var TypeTPM = $("input[name=ModalRadioTypeTPMCode]").is(":checked") ? parseInt($("input[name=ModalRadioTypeTPMCode]:checked").val()) : 999;
                    var cust_num_siteval = $("#ModaltxtCustomerSite").val();
                    var cust_num_site = $("#ModaltxtCustomerSite").attr("data-id");
                    var Status = $("input[name=ModalRadioStatusTPMCode]:checked").val();
                    var effect_date = $("#ModaldtdEffectDate").val();
                    var expire_date = $("#ModaldtdExpireDate").val();

                    if (/*proj_num != "" && job_num != "" && lot_num != "" && serial_num != "" &&*/SelectTypeMachineTPM != "" && TypeTPM != 999 && cust_num_siteval != "" && Status != "" && effect_date != "" && expire_date != "") {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_Insert") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ TMPCode: GetTPMCode, proj_num: proj_num, job_num: job_num, lot_num: lot_num, serial_num: serial_num, TypeTPM: TypeTPM, CodeTypeTPM: SelectTypeMachineTPM, UpdateBy: usernameLogin }),
                            success: function (response) {
                                var StatusWork = "";
                                if ($("#ZoneCustomerSite").attr("data-checkcussite") == "0") { StatusWork = "Insert"; }
                                else { StatusWork = "Update"; }
                                //alert(GetTPMCode);
                                $.ajax({
                                    type: "POST",
                                    async: false,
                                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_Insert_CustomerSite") %>",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    data: JSON.stringify({ TMPCode: GetTPMCode, cust_num_site: cust_num_site, Status: Status, effect_date: effect_date, expire_date: expire_date, StatusWork: StatusWork }),
                                    success: function (response) {
                                        //alert("Process Complete");
                                        CallDataRelate();
                                        CallListCompressor(cust_num_site);
                                        CallMachineDetail();
                                        //var code = $("#TPMCodeTextHeading").attr("data-machinecode");
                                        var code = SelectTypeMachineTPM;
                                        if (code == "CP") {
                                            $('#smartwizard').smartWizard('next');
                                        } else {
                                            CallListCompressorSet(cust_num_site);
                                            $('#smartwizard').data('smartWizard')._showStep(2);
                                        }

                                    },
                                    error: function () {
                                        alert("Please Input Data Customer");
                                    }
                                });
                            }
                        });
                    }
                    else {
                        alert("Please Input Data");
                    }
                } else if (step.step == "Step2") {
                    //var cust_num_site = $("#ModaltxtCustomerSite").attr("data-id");
                    //CallListCompressorSet(cust_num_site);
                    //$('#smartwizard').smartWizard('next');
                    if (confirm("Save Compressor?")) {
                        CallMachineDetail();

                        $("#Modal_RegisterTPMCode").modal("hide");
                    }
                } else if (step.step == "Step3") {
                    if ($("input[name=rtcompressorset]").is(":checked")) {
                        var row = $("input[name=rtcompressorset]:checked").closest("tr");
                        CallListRoom("", row.attr("data-packageid"));
                        $('#smartwizard').smartWizard('next');
                    } else {
                        alert("Select Compressor set");
                    }
                } else if (step.step == "Step4") {
                    if ($("input[name=rtlistroom]").is(":checked")) {
                        $('#smartwizard').smartWizard('next');
                        $("#ClickNextStep").removeClass("btn-info").addClass("btn-success").text("Save");
                    } else {
                        alert("Select Room");
                    }
                } else if (step.step == "Step5") {
                    if (confirm("Confirm Save")) {
                        var room_id = parseInt($("input[name=rtlistroom]:checked").closest("tr").attr("data-id"));
                        var ModaltxtMachineMain = parseInt($("#ModaltxtMachineMain").attr("data-id"));
                        var ModaltxtMachineGroup = parseInt($("#ModaltxtMachineGroup").attr("data-id"));
                        var ModaltxtMachineEquipment = parseInt($("#ModaltxtMachineEquipment").attr("data-id"));
                        var ModaltxtMachineEquipmentsubfix = $("#ModaltxtMachineEquipmentsubfix").val();
                        var ModaltxtMachineEquipmentQuestionOther = $("#ModaltxtMachineEquipmentQuestionOther").val();
                        var ID = $("#ModaltxtMachineMain").attr("data-mainid") != 0 ? parseInt($("#ModaltxtMachineMain").attr("data-mainid")) : 0;
                        var StatusWork = ID != 0 ? "Update" : "Insert";

                        var ListEquipmentWorkingDay = $("#ListEquipmentWorkingDay > tr:nth-child(1)");
                        var Monday = ListEquipmentWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Tuesday = ListEquipmentWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Wednesday = ListEquipmentWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Thursday = ListEquipmentWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Friday = ListEquipmentWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Saturday = ListEquipmentWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                        var Sunday = ListEquipmentWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked") ? 1 : 0;

                        var RecordStart = parseInt($("#ModaltxtMachineEquipmentRecordStart").val());
                        var Yellow_Criteria = parseFloat($("#ModaltxtYellowCriteriaMachineDetail").val());
                        var Red_Criteria = parseFloat($("#ModaltxtRedCriteriaMachineDetail").val());

                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_WorkingDay") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ TPMCode: GetTPMCode, Monday: Monday, Tuesday: Tuesday, Wednesday: Wednesday, Thursday: Thursday, Friday: Friday, Saturday: Saturday, Sunday: Sunday }),
                            success: function (response) { },
                            error: function () { alert("Error!!"); }
                        });

                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Machine_insert_V3") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: ID, RoomID: room_id, Machine_MainID: ModaltxtMachineMain, Machine_GroupID: ModaltxtMachineGroup, Machine_EquipmentID: ModaltxtMachineEquipment, TPMCode: GetTPMCode, MachineSuffix: ModaltxtMachineEquipmentsubfix, QuestionOther: ModaltxtMachineEquipmentQuestionOther, RecordStart: RecordStart, Yellow_Criteria: Yellow_Criteria, Red_Criteria: Red_Criteria, Status_Work: StatusWork }),
                            success: function (response) { },
                            error: function () { alert("Error!!"); }
                        }).promise().done(function () {
                            CallMachineDetail();
                            $("#Modal_RegisterTPMCode").modal("hide");
                            $("#ClickNextStep").addClass("btn-info").removeClass("btn-success").text("Next");
                        });
                    }
                }
            });


            $("#buttonModalTPMCode").on('click', function () {
                //callTPMCode("");
                window.location.href = "https://tpm-patkol.com/TPMQRCodeScanner/?type=patkol";
            });
            $(document).on('click', '.ClickSelectTPMCode', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text();
                window.location.href = "?CodeTPM=" + td1;
            });
            $("#ListTPMCode_myInput").on('change', function () {
                var value = $(this).val();
                callTPMCode(value);
            });

            $("#btnAddSiteLink").on('click', function () {
                window.open("CustomerSite.aspx?Cus_num=" + $("#ModaltxtCustomer").attr("data-id"), true);
            });

            $("#buttonModalCustomer").on('click', function () {
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

            $("#buttonModalCustomerSite").on('click', function () {
                if ($("#ModaltxtCustomer").val() != "") {
                    $("#TBodyCustomerSite").empty();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCustomerSite") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ cust_num: $("#ModaltxtCustomer").attr("data-id") }),
                        success: OnSuccessGetListCustomerSite
                    });
                    $("#ModalListCustomerSite").modal('show');
                } else {
                    alert("Please Select Customer");
                }
            });

            $(document).on('click', '.ClickSelectCustomer', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(), td2 = row.find("td:nth-child(2)").text();
                $("#ModaltxtCustomer").attr("data-id", td1).val(td2);
                $("#ModaltxtCustomerSite").attr("data-id", "").val("");
            });

            $(document).on('click', '.ClickSelectCustomerSite', function () {
                var row = $(this).closest("tr");
                var td1 = row.find("td:nth-child(1)").text(),
                    td2 = row.find("td:nth-child(2)").text();
                $("#ModaltxtCustomerSite").attr("data-id", td1).val(td2);
            });

            $("#btnSaveReport").on('click', function () {
                calwizard(0);
            });


            $("#btnSaveMaintenanceSystem").on('click', function () {
                $("#ListMaintenanceSystem > tr").each(function () {
                    var check_to_checked = $(this).find("input[type=checkbox]").prop("checked");
                    var check_to_Database = $(this).find("input[type=checkbox]").hasClass("GetDatabase");
                    var Status = "";
                    var List_id = parseInt($(this).attr("data-id"));
                    if (check_to_checked && !check_to_Database) { Status = "Insert"; }
                    else if (!check_to_checked && check_to_Database) { Status = "Delete"; }
                    else { Status = "None"; }
                    //alert(Status);
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_MaintenanceSystem") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ TPMCode: GetTPMCode, List_id: List_id, Status: Status }),
                        success: function (response) { }
                    });
                }).promise().done(function () {
                    alert('Update Complete');
                    window.location.reload();
                });

            });

            $("#btnAddCompressor").on('click', function () {
                var ID = parseInt($("#IDCompressor").attr("data-id"));
                var txtTypeCompressor = $("#txtTypeCompressor").val();
                var txtNameCompressor = $("#txtNameCompressor").val();
                var cust_num_site = $("#ModaltxtCustomerSite").attr("data-id");
                var Status_Work = ID == 0 ? "Insert" : "Update";
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Compressor") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Type: txtTypeCompressor, Name: txtNameCompressor, cust_num_site: cust_num_site, Status_Work: Status_Work }),
                    success: function (response) {
                        CallListCompressor(cust_num_site);
                        $("#ModalAddCompressor").modal("hide");
                    }
                });
            });
            $("#btnModalAddCompressor").on('click', function () {
                $("#btnAddCompressor").addClass("btn-success").removeClass("btn-warning").text("Add");
                $("#IDCompressor").attr("data-id", "0");
                $("#txtNameCompressor").val("");
                $("#txtTypeCompressor").val("");
                $("#ModalAddCompressor").modal("show");
            });
            $(document).on('click', '.btnUpdateCompressor', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var cust_num_site = parseInt(row.attr("data-cust"));
                var txtTypeCompressor = row.find("td:nth-child(1)").text();
                var txtNameCompressor = row.find("td:nth-child(2)").text();
                $("#IDCompressor").attr("data-id", ID);
                $("#btnAddCompressor").removeClass("btn-success").addClass("btn-warning").text("Update");
                $("#txtNameCompressor").val(txtNameCompressor);
                $("#txtTypeCompressor").val(txtTypeCompressor);
                $("#ModalAddCompressor").modal("show");
            });


            $(document).on('click', '.btnDetailCompressor', function () {
                var row = $(this).closest("tr");
                var Code = row.find("td:nth-child(1)").text();
                var ID_Com = row.attr("data-id");
                $("#IDCompressorDetail").attr("data-id", ID_Com).text(Code);
                $("#btnModalAddCompressorDetail").attr("data-id", ID_Com);
                ListSelectOptionGroup(Code);
                ListSelectOptionEquipment("0");
                CallListCompressorDetail(ID_Com);
                $("#ModalCompressorDetail").modal("show");
            });
            $("#txtGroupAddCompressorDetail").on('change', function () {
                ListSelectOptionEquipment($(this).val());
                $("#txtEquipmentAddCompressorDetail").val("");
                $("#DisplayCompressorStartRecord").hide();
                $("#DisplayCompressorQuestionOther").hide();
                $("#DisplayYellowCriteriaCompressorDetail").hide();
                $("#DisplayRedCriteriaCompressorDetail").hide();
            });
            $("#txtEquipmentAddCompressorDetail").on('change', function () {
                var qtype = $(this).find("option:selected").attr("data-qtype");
                var Criteria = $(this).find("option:selected").attr("data-critreia");
                qtype == "TB" ? $("#DisplayCompressorStartRecord").show() : $("#DisplayCompressorStartRecord").hide();
                if (Criteria == "Config") {
                    $("#DisplayYellowCriteriaCompressorDetail").show();
                    $("#DisplayRedCriteriaCompressorDetail").show();
                } else {
                    $("#DisplayYellowCriteriaCompressorDetail").hide();
                    $("#DisplayRedCriteriaCompressorDetail").hide();
                }
                if ($(this).val() != "0") {
                    $("#DisplayCompressorQuestionOther").hide();
                    $("#MainContent_Label39").text("Compressor Suffix :");
                } else {
                    $("#DisplayCompressorQuestionOther").show();
                    $("#MainContent_Label39").text("Compressor Name :");
                }
            });
            $("#btnModalAddCompressorDetail").on('click', function () {
                var ID_Com = $(this).attr("data-id");
                var ID_Group = $("#txtGroupAddCompressorDetail").val();
                var ID_Equipment = $("#txtEquipmentAddCompressorDetail").val();
                var compressor_subfix = $("#txtEquipmentAddCompressorsubfixDetail").val();
                var question_other = $("#txtEquipmentAddCompressorQuestionOtherDetail").val();
                var recordStart = $("#txtMachineEquipmentCompressorRecordStart").val();
                var YellowCriteria = $("#ModaltxtYellowCriteriaCompressorDetail").val();
                var RedCriteria = $("#ModaltxtRedCriteriaCompressorDetail").val();
                var Status_Work = "Insert";
                if (ID_Com != "" && ID_Group != "" && ID_Equipment != null) {
                    //alert(ID_Com + " " + ID_Group + " " + ID_Equipment);
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Compressor_Detail_insert_V3") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: 0, Compressor_ID: parseInt(ID_Com), Group_ID: parseInt(ID_Group), Equipment_ID: parseInt(ID_Equipment), CompressorSuffix: compressor_subfix, QuestionOther: question_other, RecordStart: parseInt(recordStart), Yellow_Criteria: parseFloat(YellowCriteria), Red_Criteria: parseFloat(RedCriteria), Status_Work: Status_Work }),
                        success: function (response) {
                            CallListCompressorDetail(ID_Com);
                        }
                    });
                } else {
                    alert("Please select Group and Equipment");
                }
            });
            $(document).on('click', '.btnEditCompressorDetail', function () {
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var ID_Com = row.attr("data-idcom");
                var equipmentid = row.find("td:nth-child(3)").attr("data-equipmentid");
                var Suffix = row.find("td:nth-child(4)").text();
                var Question = row.find("td:nth-child(5)").text();
                var qtype = row.find("td:nth-child(6)").text();
                var recordstart = row.find("td:nth-child(7)").text();
                var Criteria = row.find("td:nth-child(8)").text();
                var yellowcriteria = row.find("td:nth-child(9)").text();
                var redcriteria = row.find("td:nth-child(10)").text();
                $("#IDCompressorDetailEdit").attr("data-id", ID);
                $("#IDCompressorDetailEdit").attr("data-idcom", ID_Com);
                equipmentid == "0" ? $("#DisplayCompressorQuestionOtherEdit").show() : $("#DisplayCompressorQuestionOtherEdit").hide();
                $("#txtEquipmentAddCompressorsubfixDetailEdit").val(Suffix);
                $("#txtEquipmentAddCompressorQuestionOtherDetailEdit").val(Question);
                qtype == "TB" ? $("#DisplayCompressorStartRecordEdit").show() : $("#DisplayCompressorStartRecordEdit").hide();
                if (Criteria == "Config") {
                    $("#DisplayYellowCriteriaCompressorDetailEdit").show();
                    $("#DisplayRedCriteriaCompressorDetailEdit").show();
                } else {
                    $("#DisplayYellowCriteriaCompressorDetailEdit").hide();
                    $("#DisplayRedCriteriaCompressorDetailEdit").hide();
                }
                $("#txtMachineEquipmentCompressorRecordStartEdit").val(recordstart);
                $("#ModaltxtYellowCriteriaCompressorDetailEdit").val(yellowcriteria);
                $("#ModaltxtRedCriteriaCompressorDetailEdit").val(redcriteria);
                $("#ModalCompressorDetailEdit").modal("show");
            });
            $("#btnModalAddCompressorDetailEdit").on('click', function () {
                var ID = $("#IDCompressorDetailEdit").attr("data-id");
                var ID_Com = $("#IDCompressorDetailEdit").attr("data-idcom");
                var Suffix = $("#txtEquipmentAddCompressorsubfixDetailEdit").val();
                var Question = $("#txtEquipmentAddCompressorQuestionOtherDetailEdit").val();
                var recordStart = $("#txtMachineEquipmentCompressorRecordStartEdit").val();
                var YellowCriteria = $("#ModaltxtYellowCriteriaCompressorDetailEdit").val();
                var RedCriteria = $("#ModaltxtRedCriteriaCompressorDetailEdit").val();
                var Status_Work = "Edit";
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Compressor_Detail_insert_V3") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: parseInt(ID), Compressor_ID: parseInt(ID_Com), Group_ID: 0, Equipment_ID: 0, CompressorSuffix: Suffix, QuestionOther: Question, RecordStart: parseInt(recordStart), Yellow_Criteria: parseFloat(YellowCriteria), Red_Criteria: parseFloat(RedCriteria), Status_Work: Status_Work }),
                    success: function (response) {
                        CallListCompressorDetail(ID_Com);
                        alert("Update Complete");
                        $("#ModalCompressorDetailEdit").modal("hide");
                    }
                });
            });
            $(document).on('click', '.btnDeleteCompressorDetail', function () {
                if (confirm("Delete Compressor Detail?")) {
                    var row = $(this).closest("tr");
                    var ID = parseInt(row.attr("data-id"));
                    var ID_Com = row.attr("data-idcom");
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Compressor_Detail_insert_V3") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Compressor_ID: 0, Group_ID: 0, Equipment_ID: 0, CompressorSuffix: "", QuestionOther: "", RecordStart: 0, Yellow_Criteria: 0, Red_Criteria: 0, Status_Work: "Delete" }),
                        success: function (response) {
                            CallListCompressorDetail(ID_Com);
                        }
                    });
                }
            });
            $(document).on('click', '.btnRegisterCompressorDetailTPMCode', function () {
                var row = $(this).closest("tr");
                var ID = parseInt(row.attr("data-id"));
                var ID_Com = row.attr("data-idcom");
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Compressor_Detail_RegisterTPMCode") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, TPMCode: GetTPMCode }),
                    success: function (response) {
                        alert("Register Complete");
                        CallListCompressorDetail(ID_Com);
                        CallMachineDetail();
                    }
                });
            });
            $(document).on('click', '.btnCompressorDetailTPMCodeWorkingDay', function () {
                var row = $(this).closest("tr");
                var TPMCode = row.find("td:nth-child(1)").text();
                $("#NameCompressorDetail").text(TPMCode);
                CallListCompressorDetailWorkingDay(TPMCode);
                $("#ModalCompressorDetailWorkingDay").modal("show");
            });

            $("#btnSaveCompressorDetailWorkingDay").on('click', function () {
                var TPMCode = $("#NameCompressorDetail").text();
                var ListCompressorDetailWorkingDay = $("#ListCompressorDetailWorkingDay > tr:nth-child(1)");
                var Monday = ListCompressorDetailWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Tuesday = ListCompressorDetailWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Wednesday = ListCompressorDetailWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Thursday = ListCompressorDetailWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Friday = ListCompressorDetailWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Saturday = ListCompressorDetailWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked") ? 1 : 0;
                var Sunday = ListCompressorDetailWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked") ? 1 : 0;

                //console.log({ TPMCode: TPMCode, Monday: Monday, Tuesday: Tuesday, Wednesday: Wednesday, Thursday: Thursday, Friday: Friday, Saturday: Saturday, Sunday: Sunday });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_WorkingDay") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: TPMCode, Monday: Monday, Tuesday: Tuesday, Wednesday: Wednesday, Thursday: Thursday, Friday: Friday, Saturday: Saturday, Sunday: Sunday }),
                    success: function (response) {
                        alert("Update Complete!!");
                        $("#ModalCompressorDetailWorkingDay").modal("hide");
                    },
                    error: function () { alert("Error!!"); }
                });

            });



            $("#btnAddCompressorSet").on('click', function () {
                $("#ModalCompressorSet").modal("show");
                $("#ListCompressorSet").empty();
                var tr = '<tr><td><div class="input-group"><input type="text" id="txtCompressorAddCompressorSet" class="form-control" style="min-width: 100%" disabled/><div class="input-group-btn"><button id="buttonModalSelectCompressor" class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button></div></div></td><td><button type="button" class="btn btn-success  btn-block" id="btnModalAddCompressorSet">Add</button></td></tr>';
                $("#ListCompressorSet").append(tr);
            });
            $(document).on('click', "#btnModalAddCompressorSet", function () {
                var nameset = $("#txtNameAddCompressorSet").val();
                var id_Compressor = $("#txtCompressorAddCompressorSet").attr("data-id");
                var name_Compressor = $("#txtCompressorAddCompressorSet").val();
                if (nameset != "" && name_Compressor != "") {
                    var tr = "<tr class='NotFromDatabase' data-idcomp='" + id_Compressor + "'><td>" + name_Compressor + "</td><td><button type='button' class='btn btn-danger btn-block' id='btnModalDeleteCompressorSet'>Delete</button></td></tr>";
                    $("#ListCompressorSet").append(tr);
                    //$("#txtNameAddCompressorSet").val("");
                    $("#txtCompressorAddCompressorSet").val("").attr("data-id", "0");
                }
            });
            $(document).on('click', "#buttonModalSelectCompressor", function () {
                var cust_num_site = $("#ModaltxtCustomerSite").attr("data-id");
                OnSuccessGetListCompressor(cust_num_site);
                $("#ModalListCompressor").modal("show");
            });
            $(document).on('click', '.ClickSelectCompressor', function () {
                var row = $(this).closest("tr");
                var id_com = row.attr("data-id");
                var code = row.find("td:nth-child(1)").text();
                var name = row.find("td:nth-child(2)").text();
                $("#txtCompressorAddCompressorSet").val(name).attr("data-id", id_com);
            });
            $("#ListCompressor_myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#TBodyListCompressor tr").filter(function () { $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1) });
            });
            $("#btnSaveAddModalCompressorSet").on('click', function () {
                var cust_num_site = $("#ModaltxtCustomerSite").attr("data-id");
                if ($("#ListCompressorSet > tr").length > 0) {
                    $("#ListCompressorSet > tr").each(function () {
                        if ($(this).hasClass("NotFromDatabase")) {
                            var package_id = parseInt($("#ListCompressorSet").attr("data-packageid"));
                            var id_comp = parseInt($(this).attr("data-idcomp"));
                            var comset_name = $("#txtNameAddCompressorSet").val();
                            //alert(id_comp + " " + comset_name + " : Cust_site :" + cust_num_site);
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Compressor_Set_insert") %>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ Package_ID: package_id, Compressor_ID: id_comp, Name: comset_name, Cust_site: cust_num_site, Status_Work: "Insert" }),
                                success: function (response) {
                                    $("#ListCompressorSet").attr("data-packageid", response.d);
                                    CallListCompressorSet(cust_num_site);
                                    $("#ModalCompressorSet").modal("hide");
                                }
                            });
                        }
                    });
                } else {
                    alert("Not have Data");
                }
            });


            $("#btnAddRoom").on('click', function () {
                $("#ModalRoomAdd").modal("show");
                $("#txtRoom").val("").attr("data-id", "");
                $("#txtRoomNo").val("");
                $("#txtRoomName").val("");
            });
            $("#buttonModalSelectRoom").on('click', function () {
                CallListRoomAdd();
                $("#ModalListRoom").modal("show");
            });
            $(document).on('click', '.ClickSelectRoom', function () {
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var code = row.find("td:nth-child(1)").text();
                var name = row.find("td:nth-child(2)").text();
                $("#txtRoom").val(name).attr("data-id", ID);
                $("#ModalListRoom").modal("hide");
            });
            $("#btnAddRoomPackage").on('click', function () {
                var room_no = $("#txtRoomNo").val();
                var room_name = $("#txtRoomName").val();
                var room_mst_id = parseInt($("#txtRoom").attr("data-id"));
                var room_mst_name = $("#txtRoom").val();
                var row_package = $("input[name=rtcompressorset]:checked").closest("tr");
                var package_id = parseInt(row_package.attr("data-packageid"));
                if (room_no != "" && room_name != "" && room_mst_name != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Room_insert") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: 0, PakageID: package_id, RoomID: room_mst_id, RoomNo: room_no, RoomName: room_name, Status_Work: "Insert" }),
                        success: function (response) {
                            CallListRoom("", package_id);
                            $("#ModalRoomAdd").modal("hide");
                        }
                    });
                }
            });

            $("#buttonModalMachineMain").on('click', function () {
                CallListMachineMain();
                $("#ModalListMachineMain").modal("show");
            });
            $("#buttonModalMachineGroup").on('click', function () {
                var main_id = $("#ModaltxtMachineMain").attr("data-id");
                CallListMachineGroup(main_id);
                $("#ModalListMachineGroup").modal("show");
            });
            $("#buttonModalMachineEquipment").on('click', function () {
                var group_id = $("#ModaltxtMachineGroup").attr("data-id");
                CallListMachineEquipment(group_id);
                $("#ModalListMachineEquipment").modal("show");
            });
            $(document).on('click', '.ClickSelectMachineMain', function () {
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var code = row.find("td:nth-child(1)").text();
                var name = row.find("td:nth-child(2)").text();
                $("#ModaltxtMachineMain").val(name).attr("data-id", ID);
                $("#ModaltxtMachineGroup").val("").attr("data-id", "0");
                $("#ModaltxtMachineEquipment").val("").attr("data-id", "0");
                $("#ModalListMachineMain").modal("hide");
            });
            $(document).on('click', '.ClickSelectMachineGroup', function () {
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var code = row.find("td:nth-child(1)").text();
                var name = row.find("td:nth-child(2)").text();
                $("#ModaltxtMachineGroup").val(name).attr("data-id", ID);
                $("#ModaltxtMachineEquipment").val("").attr("data-id", "0");
                $("#DisplayStartRecord").hide();
                $("#DisplayYellowCriteriaMachineDetail").hide();
                $("#DisplayRedCriteriaMachineDetail").hide();
                $("#ModaltxtMachineEquipmentRecordStart").val("0");
                $("#ModaltxtYellowCriteriaMachineDetail").val("0");
                $("#ModaltxtRedCriteriaMachineDetail").val("0");
                $("#ModalListMachineGroup").modal("hide");
            });
            $(document).on('click', '.ClickSelectMachineEquipment', function () {
                var row = $(this).closest("tr");
                var ID = row.attr("data-id");
                var code = row.find("td:nth-child(1)").text();
                var name = row.find("td:nth-child(2)").text();
                var Monday = row.attr("data-monday");
                var Tuesday = row.attr("data-tuesday");
                var Wednesday = row.attr("data-wednesday");
                var Thursday = row.attr("data-thursday");
                var Friday = row.attr("data-friday");
                var Saturday = row.attr("data-saturday");
                var Sunday = row.attr("data-sunday");
                var QType = row.attr("data-qtype");
                var Criteria = row.attr("data-criteria");
                $("#ModaltxtMachineEquipment").val(name).attr("data-id", ID);

                ID != "0" ? $("#MainContent_Label38").text("Equipment Suffix") : $("#MainContent_Label38").text("Equipment Name");
                ID != "0" ? $("#DisplayQuestionOther").hide() : $("#DisplayQuestionOther").show();

                QType == "RD" ? $("#DisplayStartRecord").hide() : $("#DisplayStartRecord").show();
                $("#ModaltxtMachineEquipmentRecordStart").val("0");

                if (Criteria == "Config") {
                    $("#DisplayYellowCriteriaMachineDetail").show();
                    $("#DisplayRedCriteriaMachineDetail").show();
                    $("#ModaltxtYellowCriteriaMachineDetail").val("0");
                    $("#ModaltxtRedCriteriaMachineDetail").val("0");
                } else {
                    $("#DisplayYellowCriteriaMachineDetail").hide();
                    $("#DisplayRedCriteriaMachineDetail").hide();
                }

                var ListEquipmentWorkingDay = $("#ListEquipmentWorkingDay > tr:nth-child(1)");
                Monday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked", false);
                Tuesday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked", false);
                Wednesday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked", false);
                Thursday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked", false);
                Friday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked", false);
                Saturday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked", false);
                Sunday == "True" ? ListEquipmentWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked", false);

                $("#ModalListMachineEquipment").modal("hide");
            });



            function callTPMCode(TPMCode) {
                $("#TBodyTPMCode").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetTPMCode") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: InputTPMCode }),
                    success: OnSuccessGetListTPMCode
                });
                $("#ModalListTPMCode").modal('show');
            }

            function callCheckTPMCode() {
                var data = 0;
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListMachineMember") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: GetTPMCode }),
                    success: function (response) {
                        if (response.d.length > 0) { data = 1; }
                    }
                });
                return data;
            }

            function CallDataRelate() {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetTPMCodeRegister") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: GetTPMCode }),
                    success: function (response) {
                        $("#DisplayZoneHeading").show();
                        $("#TPMCodeTextHeading").text("TPM Code : " + GetTPMCode);
                        $("#TPMCodeTextHeading2").text("TPM Code : " + GetTPMCode);
                        $("#TPMCodeTextHeading").attr("data-machinecode", machineCode);
                        if (response.d.length > 0) {
                            console.log(response.d);

                            var TPMCode = response.d[0][0];
                            var Status = response.d[0][1];
                            var proj_num = response.d[0][2];
                            var job_num = response.d[0][3];
                            var lot_num = response.d[0][4];
                            var serial_num = response.d[0][5];
                            var TypeTPM = response.d[0][6];
                            var cust_num = response.d[0][7];
                            var cust_name = response.d[0][16];
                            var cust_num_site = response.d[0][8];
                            var cust_site_name = response.d[0][17];

                            var effect_date = response.d[0][9];
                            var expire_date = response.d[0][10];


                            //var date = new Date(response.d[0][9]);
                            //var curr_date = ("0" + date.getDate()).slice(-2);
                            //var curr_month = ("0" + (date.getMonth() + 1)).slice(-2);
                            //var curr_year = date.getFullYear();
                            //var effect_date = curr_date + "/" + curr_month + "/" + curr_year;

                            //var date2 = new Date(response.d[0][10]);
                            //var curr_date2 = ("0" + date2.getDate()).slice(-2);
                            //var curr_month2 = ("0" + (date2.getMonth() + 1)).slice(-2);
                            //var curr_year2 = date2.getFullYear();
                            //var expire_date = curr_date2 + "/" + curr_month2 + "/" + curr_year2;

                            var Machine_MainID = response.d[0][11];
                            var Machine_GroupID = response.d[0][12];
                            var Machine_EquipmentID = response.d[0][13];
                            var RoomID = response.d[0][14];
                            var Package_ID = response.d[0][15];
                            var machineCode = response.d[0][18];

                            if (cust_num != "" && cust_num_site != "") {
                                $("#ZoneCustomerSite").attr("data-checkcussite", "1");
                            }

                            $("#ModalstcTypeTPM").val(machineCode);


                            $("#ModaltxtProject").val(proj_num);
                            $("#ModaltxtJobCode").val(job_num);
                            $("#ModaltxtLotCode").val(lot_num);
                            $("#ModaltxtSerial").val(serial_num);

                            $("#txtProject").val(proj_num);
                            $("#txtJobCode").val(job_num);
                            $("#txtLotCode").val(lot_num);
                            $("#txtSerial").val(serial_num);

                            if (TypeTPM == "False") {
                                $("#ModalrdttypetpmPatkol").prop("checked", true);
                                $("#rdttypetpmPatkol").prop("checked", true);
                                $("#ZoneCheckPatOther").show();
                            }
                            else if (TypeTPM == "True") {
                                $("#ModalrdttypetpmOther").prop("checked", true);
                                $("#rdttypetpmOther").prop("checked", true);
                                $("#ZoneCheckPatOther").hide();
                            }

                            if (Status == "InActive") {
                                $("#ModalrdtStatusInActive").prop("checked", true);
                                $("#rdtStatusInActive").prop("checked", true);
                            }
                            else {
                                $("#ModalrdtStatusActive").prop("checked", true);
                                $("#rdtStatusActive").prop("checked", true);
                            }

                            $("#dtdEffectDate").val(effect_date);
                            $("#dtdExpireDate").val(expire_date);
                            $("#txtCustomer").attr("data-id", cust_num).val(cust_name);
                            $("#txtCustomerSite").attr("data-id", cust_num_site).val(cust_site_name);

                            $("#ModaldtdEffectDate").val(effect_date);
                            $("#ModaldtdExpireDate").val(expire_date);
                            $("#ModaltxtCustomer").attr("data-id", cust_num).val(cust_name);
                            $("#ModaltxtCustomerSite").attr("data-id", cust_num_site).attr("data-roomid", RoomID).attr("data-packageid", Package_ID).val(cust_site_name);


                        }

                    }
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCheckList") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: GetTPMCode }),
                    success: OnSuccessListCheckList
                });

                if ($("#txtProject").val() == "" && $("#txtJobCode").val() == "" && $("#txtLotCode").val() == "" && $("#txtSerial").val() == "") {
                    SetChecker = true;
                }

            }

            function CallSelectMachineMain() {
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
                                frament += '<option value="' + Code + '" data-id="' + ID + '" data-text="' + Name + '"> ' + Name + '</option>';
                                $("#ModalstcTypeTPM").append(frament);
                            });
                        }
                    }
                });
            }

            function CallMachineDetail() {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetMachineDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: GetTPMCode }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            if (response.d[0][9] == "") {
                                $("#ModaltxtMachineMain").addClass("FromDataBase");
                            }
                            $("#ModaltxtMachineMain").attr("data-mainid", response.d[0][9]);
                            //$("#ModaltxtMachineMain").attr("data-id", response.d[0][1]).val(response.d[0][6]);
                            $("#ModaltxtMachineMain").attr("data-id", $("#ModalstcTypeTPM option:selected").attr("data-id")).val($("#ModalstcTypeTPM option:selected").attr("data-text"));
                            $("#ModaltxtMachineGroup").attr("data-id", response.d[0][2]).val(response.d[0][7]);
                            $("#txtMachineMain").val(response.d[0][6]);
                            $("#txtMachineGroup").val(response.d[0][7]);
                            $("#txtMachineEquipment").val(response.d[0][8]);
                            $("#txtRoomno").val(response.d[0][10]);
                            $("#txtRoomname").val(response.d[0][11]);

                            var Eq_name = response.d[0][3] != "0" ? response.d[0][8] : "Other";
                            Eq_name == "Other" ? $("#DisplayQuestionOther").show() : $("#DisplayQuestionOther").hide();
                            $("#ModaltxtMachineEquipmentQuestionOther").val(response.d[0][20]);
                            $("#ModaltxtMachineEquipment").attr("data-id", response.d[0][3]).val(Eq_name);
                            $("#ModaltxtMachineEquipmentsubfix").val(response.d[0][12]);
                            response.d[0][3] != "0" ? $("#MainContent_Label38").text("Equipment Suffix") : $("#MainContent_Label38").text("Equipment Name");

                            $("#ModaltxtMachineEquipmentRecordStart").val(response.d[0][21]);

                            $("#ModaltxtYellowCriteriaMachineDetail").val(response.d[0][22]);
                            $("#ModaltxtRedCriteriaMachineDetail").val(response.d[0][23]);

                            CallCheckEqRecordStart(response.d[0][2]);

                            var ListEquipmentWorkingDay = $("#ListEquipmentWorkingDay > tr:nth-child(1)");
                            response.d[0][13] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked", false);
                            response.d[0][14] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked", false);
                            response.d[0][15] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked", false);
                            response.d[0][16] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked", false);
                            response.d[0][17] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked", false);
                            response.d[0][18] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked", false);
                            response.d[0][19] == "True" ? ListEquipmentWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked", true) : ListEquipmentWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked", false);




                        }
                    }
                });
            }


            function CallCheckEqRecordStart(MainGroupID) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipmentRecordStart") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MainGroupID: MainGroupID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Qtype = val[6];
                                var Criteria = val[7];
                                Qtype == "TB" ? $("#DisplayStartRecord").show() : $("#DisplayStartRecord").hide();
                                if (Criteria == "Config") {
                                    $("#DisplayYellowCriteriaMachineDetail").show();
                                    $("#DisplayRedCriteriaMachineDetail").show();
                                } else {
                                    $("#DisplayYellowCriteriaMachineDetail").hide();
                                    $("#DisplayRedCriteriaMachineDetail").hide();
                                }
                            });
                        }
                    }
                });
            }


            function CallRelateListCompressor(cust_num_site) {
                $("#ListRelateCompressor").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCompressor") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num_site: cust_num_site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Type = val[1];
                                var Name = val[2];
                                var cust_num_site = val[3];
                                frament += '<tr data-id="' + ID + '" data-cust="' + cust_num_site + '">';
                                frament += '<td>' + Type + '</td>';
                                frament += '<td>' + Name + '</td>';
                                //frament += '<td><button type="button" class="btn btn-info btn-block btnDetailCompressor">Detail</button></td>';
                                frament += '</tr>';
                                $("#ListRelateCompressor").append(frament);
                            });
                        }
                    }
                });
            }



            function CallListCompressor(cust_num_site) {
                $("#ListCompressor").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCompressor") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num_site: cust_num_site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Type = val[1];
                                var Name = val[2];
                                var cust_num_site = val[3];
                                frament += '<tr data-id="' + ID + '" data-cust="' + cust_num_site + '">';
                                frament += '<td>' + Type + '</td>';
                                frament += '<td>' + Name + '</td>';
                                frament += '<td><button type="button" class="btn btn-info btn-block btnDetailCompressor">Detail</button></td>';
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnUpdateCompressor"><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i></button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCompressor"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td></tr>';
                                frament += '</tr>';
                                $("#ListCompressor").append(frament);
                            });
                        }
                    }
                });
            }


            function ListSelectOptionGroup(Code) {
                $("#txtGroupAddCompressorDetail").empty();
                <%--var MainEqID =CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/GetListMainEquipment") %>", { Code: Code });--%>
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGroupCompressorDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            frament += '<option value="0">===</option>';
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                frament += '<option value="' + ID + '">' + Code + ' ' + Name + '</option>';

                            });
                            $("#txtGroupAddCompressorDetail").append(frament);
                        }
                    }
                });
            }

            function ListSelectOptionEquipment(Code) {
                $("#txtEquipmentAddCompressorDetail").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipment") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MainGroupID: Code }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                var CheckID = val[12];
                                var QuestionType = val[13];
                                var Criteria = val[14];
                                frament += '<option value="' + ID + '" data-critreia="' + Criteria + '" data-qtype="' + QuestionType + '">' + Code + ' ' + Name + '</option>';
                            });
                            frament += '<option value="0" data-qtype="RD">Other</option>';
                            $("#txtEquipmentAddCompressorDetail").append(frament);
                        }
                    }
                });
            }

            function CallListCompressorDetail(ID_Compressor) {
                $("#ListCompressorDetail").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCompressorDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID_Compressor: ID_Compressor, TPMCode: GetTPMCode }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Compressor_ID = val[1];
                                var Group_ID = val[2];
                                var Group_Name = val[3];
                                var Equipment_ID = val[4];
                                var Equipment_Name = Equipment_ID != "0" ? val[5] : "Other";
                                var TPMCode = val[6] != "" ? val[6] : "---";
                                var StatusRegister = val[7];
                                var checkcolor = TPMCode == GetTPMCode ? 'style="color:#f0ad4e;"' : '';
                                var CompressorSuffix = val[8];
                                var Questionother = val[9];
                                var CheckID = val[10];
                                var QuestionType = val[11];
                                var RecordStart = val[12];
                                var Yellow_Criteria = val[13];
                                var Red_Criteria = val[14];
                                var Criteria = val[15];
                                frament += '<tr data-id="' + ID + '" data-idcom="' + Compressor_ID + '" ' + checkcolor + '>';
                                frament += '<td>' + TPMCode + '</td>';
                                frament += '<td data-groupid="' + Group_ID + '">' + Group_Name + '</td>';
                                frament += '<td data-equipmentid="' + Equipment_ID + '">' + Equipment_Name + '</td>';
                                frament += '<td>' + CompressorSuffix + '</td>';
                                frament += '<td style="display:none;">' + Questionother + '</td>';
                                frament += '<td style="display:none;">' + QuestionType + '</td>';
                                frament += '<td style="display:none;">' + RecordStart + '</td>';
                                frament += '<td style="display:none;">' + Criteria + '</td>';
                                frament += '<td style="display:none;">' + Yellow_Criteria + '</td>';
                                frament += '<td style="display:none;">' + Red_Criteria + '</td>';
                                if (val[6] != "") {
                                    frament += '<td><button type="button" class="btn btn-info btn-block btnCompressorDetailTPMCodeWorkingDay">Detail</button></td>';
                                } else if (val[6] == "" && StatusRegister != "1") {
                                    frament += '<td><button type="button" class="btn btn-info btn-block btnRegisterCompressorDetailTPMCode">Register</button></td>';
                                } else {
                                    frament += '<td></td>';
                                }
                                frament += '<td><button type="button" class="btn btn-warning btn-block btnEditCompressorDetail">Edit</button></td>';
                                frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCompressorDetail"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td>';

                                frament += '</tr>';
                                $("#ListCompressorDetail").append(frament);
                            });
                        }
                    }
                });
            }

            function CallListCompressorDetailWorkingDay(TPMCode) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCompressorDetailWorkingDay") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TPMCode: TPMCode }),
                    success: function (response) {
                        var Monday = "", Tuesday = "", Wednesday = "", Thursday = "", Friday = "", Saturday = "", Sunday = "";
                        if (response.d[0][1] == "1") {
                            Monday = response.d[0][2];
                            Tuesday = response.d[0][3];
                            Wednesday = response.d[0][4];
                            Thursday = response.d[0][5];
                            Friday = response.d[0][6];
                            Saturday = response.d[0][7];
                            Sunday = response.d[0][8];
                        }
                        else if (response.d[0].every(val => (val == "" || val == "0" || val == TPMCode))) {
                            Monday = "True";
                            Tuesday = "True";
                            Wednesday = "True";
                            Thursday = "True";
                            Friday = "True";
                            Saturday = "False";
                            Sunday = "False";
                        }
                        else {
                            Monday = response.d[0][9];
                            Tuesday = response.d[0][10];
                            Wednesday = response.d[0][11];
                            Thursday = response.d[0][12];
                            Friday = response.d[0][13];
                            Saturday = response.d[0][14];
                            Sunday = response.d[0][15];
                        }
                        var ListCompressorDetailWorkingDay = $("#ListCompressorDetailWorkingDay > tr:nth-child(1)");
                        Monday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(1)").find("input[type=checkbox]").prop("checked", false);
                        Tuesday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(2)").find("input[type=checkbox]").prop("checked", false);
                        Wednesday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(3)").find("input[type=checkbox]").prop("checked", false);
                        Thursday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(4)").find("input[type=checkbox]").prop("checked", false);
                        Friday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(5)").find("input[type=checkbox]").prop("checked", false);
                        Saturday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(6)").find("input[type=checkbox]").prop("checked", false);
                        Sunday == "True" ? ListCompressorDetailWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked", true) : ListCompressorDetailWorkingDay.find("td:nth-child(7)").find("input[type=checkbox]").prop("checked", false);
                    }
                });
            }

            function CallListCompressorSet(Cust_site) {
                $("#ListCheckboxCompressorSet").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCompressorSet") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Cust_site: Cust_site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var id_package = $("#ModaltxtCustomerSite").attr("data-packageid");
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Name = val[1];
                                var Cust_site = val[2];
                                var checkedpack = val[0] == id_package ? "checked" : "";
                                frament += '<tr data-packageid="' + ID + '" data-idcustsite="' + Cust_site + '">';
                                frament += '<td style="text-align: center;" ><input type="radio" name="rtcompressorset" ' + checkedpack + ' style="-ms-transform: scale(1.5); -webkit-transform: scale(1.5); transform: scale(1.5);"/></td>';
                                frament += '<td>' + Name + '</td>';
                                //frament += '<td><button type="button" class="btn btn-danger btn-block btnDeleteCompressorSet"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button></td></tr>';
                                frament += '</tr>';
                                $("#ListCheckboxCompressorSet").append(frament);
                            });
                        }
                        else {
                            var frament = "";
                            frament += '<tr><td>Not Data</td><td>Not Data</td></tr>';
                            $("#ListCheckboxCompressorSet").append(frament);
                        }
                    }
                });
            }

            function CallListRoom(ID, Packge_id) {
                $("#ListRoom").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListRoom") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Packge_id: Packge_id }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var id_room = $("#ModaltxtCustomerSite").attr("data-roomid");
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var No = val[3];
                                var Name = val[4];
                                var checkedpack = val[0] == id_room ? "checked" : "";
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td style="text-align:center"><input type="radio" name="rtlistroom" ' + checkedpack + ' style="-ms-transform: scale(1.5);-webkit-transform: scale(1.5); transform: scale(1.5);"/></td>';
                                frament += '<td>' + No + '</td>';
                                frament += '<td>' + Name + '</td>';
                                frament += '</tr>';
                                $("#ListRoom").append(frament);
                            });
                        }
                        else {
                            var frament = "";
                            frament += '<tr><td>Not Data</td><td>Not Data</td><td>Not Data</td></tr>';
                            $("#ListRoom").append(frament);
                        }
                    }
                });
            }

            function CallListRoomAdd() {
                $("#TBodyListRoom").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListRoomMaster") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Type: "" }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><a href="javascript:void(0)" class="ClickSelectRoom">' + Code + '</a></td>';
                                frament += '<td><a href="javascript:void(0)" class="ClickSelectRoom">' + Name + '</a></td>';
                                frament += '</tr>';
                                $("#TBodyListRoom").append(frament);
                            });
                        }
                    }
                });
            }

            function CallListMachineMain() {
                $("#TBodyListMachineMain").empty();
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
                                frament += '<td style="display:none;"><a href="javascript:void(0)" class="ClickSelectMachineMain">' + Code + '</a></td>';
                                frament += '<td><a href="javascript:void(0)" class="ClickSelectMachineMain">' + Name + '</a></td>';
                                frament += '</tr>';
                                $("#TBodyListMachineMain").append(frament);
                            });
                        }
                    }
                });
            }

            function CallListMachineGroup(MainEqID) {
                $("#TBodyListMachineGroup").empty();
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
                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td style="display:none;"><a href="javascript:void(0)" class="ClickSelectMachineGroup">' + Code + '</a></td>';
                                frament += '<td><a href="javascript:void(0)" class="ClickSelectMachineGroup">' + Name + '</a></td>';
                                frament += '</tr>';
                                $("#TBodyListMachineGroup").append(frament);
                            });
                        }
                    }
                });
            }

            function CallListMachineEquipment(MainGroupID) {
                $("#TBodyListMachineEquipment").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListEquipment") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MainGroupID: MainGroupID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Code = val[1];
                                var Name = val[2];
                                var Stauts = val[3];
                                var Monday = val[5];
                                var Tuesday = val[6];
                                var Wednesday = val[7];
                                var Thursday = val[8];
                                var Friday = val[9];
                                var Saturday = val[10];
                                var Sunday = val[11];
                                var CheckID = val[12];
                                var QuestionType = val[13];
                                var Criteria = val[14];
                                frament += '<tr data-id="' + ID + '" data-criteria="' + Criteria + '" data-qtype="' + QuestionType + '" data-monday="' + Monday + '" data-tuesday="' + Tuesday + '" data-wednesday="' + Wednesday + '" data-thursday="' + Thursday + '" data-friday="' + Friday + '" data-saturday="' + Saturday + '" data-sunday="' + Sunday + '" >';
                                frament += '<td style="display:none;"><a href="javascript:void(0)" class="ClickSelectMachineEquipment">' + Code + '</a></td>';
                                frament += '<td><a href="javascript:void(0)" class="ClickSelectMachineEquipment">' + Name + '</a></td>';
                                frament += '</tr>';
                            });
                            frament += '<tr data-id="0" data-qtype="RD" data-monday="True" data-tuesday="True" data-wednesday="True" data-thursday="True" data-friday="True" data-saturday="False" data-sunday="False" >';
                            frament += '<td style="display:none;"><a href="javascript:void(0)" class="ClickSelectMachineEquipment"></a></td>';
                            frament += '<td><a href="javascript:void(0)" class="ClickSelectMachineEquipment">Other</a></td>';
                            frament += '</tr>';
                            $("#TBodyListMachineEquipment").append(frament);
                        }
                    }
                });
            }

            function OnSuccessListCheckList(response) {
                var frament = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var ID = val[0];
                        var List_Name = val[1];
                        var Picture = val[2];
                        var CheckListValue = val[3];
                        var check = CheckListValue == 1 ? "checked class='GetDatabase'" : "";

                        frament += '<tr data-id=' + ID + '>';
                        frament += '<td style="text-align: center;"><input type="checkbox" ' + check + '></td>';
                        frament += '<td>' + List_Name + '</td>';
                        frament += '<td>' + Picture + '</td>';
                        frament += '</tr>';
                    });
                } else {
                    frament = '<tr><td>Not Data</td><td>Not Data</td><td>Not Data</td></tr>';
                }
                $("#ListMaintenanceSystem").append(frament);
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

            function OnSuccessGetListCustomerSite(response) {
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

            function OnSuccessGetListTPMCode(response) {
                $("#TBodyTPMCode").empty();
                var frament = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var TMPCode = val[0];
                        var CreateBy = val[6];
                        frament += "<tr><td><a class='ClickSelectTPMCode' href='javascript:void(0)' data-dismiss='modal'>" + TMPCode + "</a></td></tr>";
                        //frament += "<td><a class='ClickSelectTPMCode' href='javascript:void(0)' data-dismiss='modal'>" + CreateBy + "</a></td></tr>";
                    });
                } else {
                    frament += "<tr><td>Not Data</td></tr>";
                }
                $("#TBodyTPMCode").append(frament);
            }

            function OnSuccessGetListCompressor(cust_num_site) {
                $("#TBodyListCompressor").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListCompressor") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ cust_num_site: cust_num_site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var frament = "";
                                var ID = val[0];
                                var Type = val[1];
                                var Name = val[2];
                                var cust_num_site = val[3];
                                frament += '<tr data-id="' + ID + '" data-cust="' + cust_num_site + '">';
                                frament += '<td><a class="ClickSelectCompressor" href="javascript:void(0)" data-dismiss="modal">' + Type + '</a></td>';
                                frament += '<td><a class="ClickSelectCompressor" href="javascript:void(0)" data-dismiss="modal">' + Name + '</a></td>';
                                frament += '</tr>';
                                $("#TBodyListCompressor").append(frament);
                            });
                        }
                    }
                });
            }

            function calwizard(index) {
                $("#Modal_RegisterTPMCode").modal('show');
                var sma = $('#smartwizard').smartWizard({
                    theme: 'arrows',
                    keyNavigation: false,
                    showStepURLhash: false,
                    selected: index,
                    transitionEffect: 'slide',
                    toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
                });
                $('#smartwizard').data('smartWizard')._showStep(index);
            }

        });

    </script>
</asp:Content>
