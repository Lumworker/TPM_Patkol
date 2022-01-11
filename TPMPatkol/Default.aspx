<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPMPatkol._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .green {
            /*background-color: rgba(40, 167, 69,1);*/
            border: 7px solid rgba(40, 167, 69,1);
            /*color: rgba(40, 167, 69,1);*/
        }

        .red {
            /*background-color: rgba(220, 53, 69,1);*/
            border: 7px solid rgba(220, 53, 69,1);
            /*color: rgba(220, 53, 69,1);*/
        }

        .orange {
            /*background-color: rgba(253, 126, 20,1);*/
            border: 7px solid rgba(253, 126, 20,1);
            /*color: rgba(253, 126, 20,1);*/
        }

        .gray {
            /*background-color: rgba(204, 204, 204,1);*/
            border: 7px solid rgba(204, 204, 204,1);
            /*color: rgba(204, 204, 204,1);*/
        }

        .blue {
            /*background-color: rgba(0, 123, 255,1);*/
            border: 7px solid rgba(0, 123, 255,1);
            /*color: rgba(0, 123, 255,1);*/
        }

        .yellow {
            /*background-color: rgba(255, 193, 7,1);*/
            border: 7px solid rgba(255, 193, 7,1);
            /*color: rgba(255, 193, 7,1);*/
        }

        .Shape {
            position: relative;
            display: inline-block;
            text-decoration: none;
            width: 80px;
            height: 80px;
            /*border: 0 solid rgba(0, 0, 0, 0);*/
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: 0.2s ease;
            -moz-transition: 0.2s ease;
            -o-transition: 0.2s ease;
            transition: 0.2s ease;
            color: #000;
            font-weight: bold;
            font-size: 30px;
            border-radius: 50px;
        }

            .Shape:hover {
                color: #000;
            }

            .Shape p {
                margin: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                margin-right: -50%;
                transform: translate(-50%, -50%);
                text-align: center;
            }

        .boxcolor:hover, .boxcolor:focus {
            color: #000;
            text-decoration: none;
        }

        .boxcolorgreen {
            background-color: rgba(40, 167, 69,0.4);
        }

        .boxcolorred {
            background-color: rgba(220, 53, 69,0.4);
        }

        .boxcoloryellow {
            background-color: rgba(255, 193, 7,0.4);
        }

        .boxcolororange {
            background-color: rgba(253, 126, 20,0.4);
        }

        .preview-images-zone p, .preview-images-zone a p {
            margin: 10px 0 10px;
        }

        .dragBox {
            width: 100%;
            max-width: 100%;
            height: 100%;
            margin: 0 auto;
            position: relative;
            text-align: center;
            font-weight: bold;
            line-height: 55px;
            color: #999;
            border: 2px dashed #ccc;
            display: inline-block;
            transition: transform 0.3s;
        }

            .dragBox:hover, .dragBox:focus {
                text-decoration: none;
            }

        .preview-images-zone {
            width: 100%;
            padding: 5px 5px 0px 5px;
            display: block;
            margin-bottom: 1em;
        }

        .preview-image {
            width: 100%;
            border: 1px solid #d8d5d5;
            margin-bottom: 2px;
        }

        .image-zone {
            text-align: center;
            border-right: 1px solid #d8d5d5;
        }

            .image-zone a img {
                height: 100px;
                max-width: 100%;
            }

        .image-cancel {
            text-align: center;
            height: 100%;
            border-left: 1px solid #d8d5d5;
            font-size: 18px;
            color: grey;
            text-shadow: White 0.1em 0.1em 0.2em;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }

        .hideFilebox {
            width: 0;
            height: 0;
            overflow: hidden;
        }

        .img-preview {
            max-width: 100%;
            max-height: 250px;
        }

        .btn-gray {
            color: #fff;
            background-color: #000;
            border-color: #000;
        }

        .text-gray {
            color: #000;
        }
    </style>

    <div class="page-header" style="margin: 10px 0 10px;">
    </div>
    <div class="row">
        <div class="col-md-12 text-mode" style="margin: 10px 0;">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#1" data-toggle="tab">Monitoring</a></li>
                <li><a href="#2" data-toggle="tab">Assignment</a></li>
            </ul>
        </div>
        <div class="col-md-12">
            <div class="tab-content ">
                <div class="tab-pane active" id="1">
                    <div class="page-header" style="margin: 10px 0 10px; text-align: right">
                        <button class="btn btn-warning" type="button" id="btnReportDaily" style="display: none;">รายงานประจำวัน</button>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4>รอโทรหาลูกค้า</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-md-4" style="text-align: center">
                                            <h5 style="font-weight: 500">ฉุกเฉิน</h5>
                                            <a href="javascript:void(0)" class="Shape red clickAlarmTask" id="lblAlarmEmergency">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 col-md-4" style="text-align: center">
                                            <h5 style="font-weight: 500">เสี่ยง</h5>
                                            <a href="javascript:void(0)" class="Shape yellow clickAlarmTask" id="lblAlarmLisk">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 col-md-4" style="text-align: center">
                                            <h5 style="font-weight: 500">ล่าช้า</h5>
                                            <a href="javascript:void(0)" class="Shape gray clickAlarmTask" id="lblAlarmLate">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4>กำลังดำเนินการแก้ไข</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3 col-md-3 " style="text-align: center">
                                            <h5 style="font-weight: 500">ฉุกเฉิน</h5>
                                            <a href="javascript:void(0)" class="Shape red clickIssueTask" id="lblIssueEmergency">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3" style="text-align: center">
                                            <h5 style="font-weight: 500">เสี่ยง</h5>
                                            <a href="javascript:void(0)" class="Shape yellow clickIssueTask" id="lblIssueLisk">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3" style="text-align: center">
                                            <h5 style="font-weight: 500">ล่าช้า</h5>
                                            <a href="javascript:void(0)" class="Shape gray clickIssueTask" id="lblIssueLate">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3" style="text-align: center">
                                            <h5 style="font-weight: 500">รอตรวจสอบ</h5>
                                            <a href="javascript:void(0)" class="Shape blue clickIssueTaskcheck" id="lblIssueCheck">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4>รออนุมัติให้แก้ไข</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-md-4" style="text-align: center">
                                            <h5 style="font-weight: 500">งานซ่อมภายใน 1 วัน</h5>
                                            <a href="javascript:void(0)" class="Shape red clickHoldedTask" id="lblHoldOverDue">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 col-md-4" style="text-align: center">
                                            <h5 style="font-weight: 500">งานซ่อมภายใน 7 วัน</h5>
                                            <a href="javascript:void(0)" class="Shape yellow clickHoldedTask" id="lblHoldNearToDue">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 col-md-4" style="text-align: center">
                                            <h5 style="font-weight: 500">งานซ่อมภายใน 15 วัน</h5>
                                            <a href="javascript:void(0)" class="Shape green clickHoldedTask" id="lblHoldOnPlan">
                                                <p><span>999</span></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4>รายงานวันนี้</h4>
                                </div>
                                <div class="panel-body">
                                    <%--<div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-6" style="text-align: center">
                                            <a href="javascript:void(0)" class="Shape yellow" id="lblCompYellow142132">
                                                <p><span>4</span></p>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 " style="text-align: center">
                                            <a href="javascript:void(0)" class="Shape green" id="lblCompGreen431212">
                                                <p><span>3</span></p>
                                            </a>
                                        </div>
                                    </div>--%>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <h4 id="txtToDayOverDue" style="color: rgba(255, 193, 7,1); font-weight: bold">Delay : 999</h4>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <h4 id="txtToDay" style="color: rgba(40, 167, 69,1); font-weight: bold;">Reported : 999</h4>
                                        </div>
                                    </div>
                                    <!--END Row-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Tab1-->
                <div class="tab-pane" id="2">

                    <div class="row">
                        <div class="col-md-12 text-mode" style="margin: 10px 0;">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#MonitoringAssign" data-toggle="tab">My Task</a></li>
                                <li><a href="#Assign" data-toggle="tab">Awaiting OnSite</a></li>
                            </ul>
                        </div>
                        <div class="col-md-12">
                            <div class="tab-content ">
                                <div class="tab-pane active" id="MonitoringAssign">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="">
                                                    <thead>
                                                        <tr>
                                                            <th>ชื่องานซ่อม</th>
                                                            <th>ชื่อลูกค้า</th>
                                                            <th>สถานที่ตั้งโรงงาน</th>
                                                            <th>ทีมช่าง</th>
                                                            <th>วันที่เข้าซ่อม</th>
                                                            <th>เวลาเข้าซ่อม	</th>
                                                            <th>สถานะ</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ListAssignMyTask">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END row-->
                                </div>
                                <div class="tab-pane" id="Assign">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-success" id="btnClickNewAwaitingAssign" style="width: 100px">New</button>
                                                <button type="button" class="btn btn-warning" id="btnClickProcessAwaitingAssign" style="float: right; width: 100px">Process</button>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>ชื่องานซ่อม</th>
                                                            <th>ชื่อลูกค้า</th>
                                                            <th>สถานที่ตั้งโรงงาน</th>
                                                            <th>ทีมช่าง</th>
                                                            <th>วันที่เข้าซ่อม</th>
                                                            <th>เวลาเข้าซ่อม</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ListAwaitAssign">
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
    </div>

    <div class="modal fade" id="ModalCheckin" role="dialog" data-backdrop="static" data-keyboard="false" style="z-index: 9999;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="max-width: 100%">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-9">
                            <h4 class="modal-title" style="padding-top: 0.4em; color: red"></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3" style="text-align: right;">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label16" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Location :"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <span id="txtCustomerCheckin" class="form-control" style="min-width: 100%"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label14" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Latitude :"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <span id="txtLatitudeCheckin" class="form-control" style="min-width: 100%"></span>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label15" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Longitude :"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <span id="txtLongitudeCheckin" class="form-control" style="min-width: 100%"></span>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                    <h5 style="padding-top: 0.4em; padding-bottom: 0.4em; color: red;">***กรุณาตรวจสอบก่อนกดปุ่ม Check-in</h5>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <a href="javascript:void(0)" id="SaveCheckin" class="box" style="background-color: #5cb85c; color: #fff;">Check-in <i class="fa fa-map-marker" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalAlarmList" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">รายการรอติดต่อลูกค้า</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em;">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อลูกค้า :"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <div class="input-group">
                                                <input type="text" id="txtCusotmerAlarmList" class="form-control" style="min-width: 100%" />
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" id="btnModalCusotmerAlarmList" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                            </div>
                        </div>
                        <div id="DisplayZoneAlarmList" style="display: none;">
                            <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #990000">
                                <div class="panel-heading" style="background-color: #990000">
                                    <h4 style="color: white">ฉุกเฉิน</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="tableAlarmRedZone">
                                                    <tbody id="ListAlarmRedZone">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END row-->
                                </div>
                            </div>
                            <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #EEC900">
                                <div class="panel-heading" style="background-color: #EEC900">
                                    <h4 style="color: white">เสี่ยง</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="tableAlarmYellowZone">
                                                    <tbody id="ListAlarmYellowZone">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--END row-->
                                </div>
                            </div>
                            <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #8d8988">
                                <div class="panel-heading" style="background-color: #8d8988">
                                    <h4 style="color: white;">ล่าช้า</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="tableAlarmGrayZone">
                                                    <tbody id="ListAlarmGreyZone">
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveAlarmList">Process</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="ModalIssueList" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">กำลังดำเนินการแก้ไข</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em;">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="Label11" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อลูกค้า :"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <div class="input-group">
                                                <%--<input type="text" id="txtCusotmer" class="form-control" style="min-width: 100%" />--%>
                                                <span id="txtCusotmerIssueList" class="form-control" style="min-width: 100%"></span>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" id="btnModalCusotmerIssueList" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #990000">
                            <div class="panel-heading" style="background-color: #990000">
                                <h4 style="color: white">ฉุกเฉิน</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableIssueRedZone">
                                                <tbody id="ListIssueRedZone">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!--END row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #EEC900">
                            <div class="panel-heading" style="background-color: #EEC900">
                                <h4 style="color: white">เสี่ยง</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableIssueYellowZone">
                                                <tbody id="ListIssueYellowZone">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!--END row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #8d8988">
                            <div class="panel-heading" style="background-color: #8d8988">
                                <h4 style="color: white;">ล่าช้า</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableIssueGrayZone">
                                                <tbody id="ListIssueGreyZone">
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalReportList" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">รอตรวจสอบ</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em;">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อลูกค้า :"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <div class="input-group">
                                                <%--<input type="text" id="txtCusotmer" class="form-control" style="min-width: 100%" />--%>
                                                <span id="txtCusotmerReportList" class="form-control" style="min-width: 100%"></span>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" id="btnModalCusotmerReportList" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid rgba(0, 123, 255,1)">
                            <div class="panel-heading" style="background-color: rgba(0, 123, 255,1)">
                                <h4 style="color: white">รอตรวจสอบ</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableReportBlueZone">
                                                <tbody id="ListReportBlueZone">
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalHoldedList" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">รออนุมัติให้แก้ไข</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em;">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อลูกค้า :"></asp:Label>
                                        <div class="col-md-9 col-xs-12">
                                            <div class="input-group">
                                                <input type="text" id="txtCusotmerHolded" class="form-control" style="min-width: 100%" />
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" id="btnModalCusotmerHolded" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--END Row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #990000">
                            <div class="panel-heading" style="background-color: #990000">
                                <h4 style="color: white">งานซ่อมภายใน 1 วัน</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableHoldedRedZone">
                                                <tbody id="ListHoldRedZone">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!--END row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid #EEC900">
                            <div class="panel-heading" style="background-color: #EEC900">
                                <h4 style="color: white">งานซ่อมภายใน 7 วัน</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableHoldedYellowZone">
                                                <tbody id="ListHoldYellowZone">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!--END row-->
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin-top: 1em; border: 1px solid rgba(40, 167, 69,1)">
                            <div class="panel-heading" style="background-color: rgba(40, 167, 69,1)">
                                <h4 style="color: white">งานซ่อมภายใน 15 วัน</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tableHoldGreenZone">
                                                <tbody id="ListHoldGreenZone">
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalIssueListDetail" role="dialog" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title"><span id="HeaderIssueDetail"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ผู้ดำเนินการซ่อม"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtActing" style="min-width: 100%">
                                    <option value="Patkol">พัฒน์กล</option>
                                    <option value="Customer">ลูกค้า</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="สถานะปัจจุบัน"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" class="form-control" id="txttextStatus" style="min-width: 100%" disabled />
                                <input type="text" class="form-control" id="txtStatus" style="min-width: 100%; display: none" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ผลการซ่อม"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="radio">
                                    <label>
                                        <input type="radio" id="rdFix" name="rdIssueListDetail" value="Fix">ซ่อมเรียบร้อย</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" id="rdHold" name="rdIssueListDetail" value="Hold">ซ่อมภายหลัง กำหนดการวันที่</label>
                                    <div class="date btn-group" data-provide="datepicker">
                                        <input placeholder="DD/MM/YYYY" onfocus="blur();" id="dtdateIssueList" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label9" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="สาเหตุการซ่อมภายหลัง"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control" id="txtIssueHoldReason" style="min-width: 100%;">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label10" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รายละเอียด"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <textarea class="form-control" id="txtIssueDetail" style="min-width: 100%; resize: none;"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label class="col-md-3 col-xs-12" ID="Label35" runat="server" Font-Bold="True" Text="File-upload"></asp:Label>

                            <div class="col-md-9 col-xs-12">
                                <a id="dragBox" class="dragBox" href="javascript:void(0)">
                                    <div id="s1">
                                        <i class="fa fa-folder-open"></i>/ <i class="fa fa-camera"></i>Attach File image here
                                    </div>
                                    <div id="s2" style="display: none">
                                        <img class="thumbnail img-preview" src="" alt="IMAGE">
                                    </div>
                                </a>
                                <div class="hideFilebox" id="setinput">
                                    <input type="file" id="uploadFile" name="uploadFile" style="display: none">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveIssueListDetail">Save</button>
                    <button type="button" class="btn btn-warning" id="btnReportIssueListDetail">Report</button>
                    <button type="button" class="btn btn-danger" id="btnRejectIssueListDetail" style="display: none;">Reject</button>
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
                    <table id="TableListCustomerSite" class="table table-bordered table-responsive">
                        <thead id="Thead1" runat="server">
                            <tr>
                                <th>Customer Name</th>
                                <th>TPM Qty</th>
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

    <div class="modal fade" id="ModalAwaitingAssign" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-9">
                            <h4 class="modal-title">Awaiting OnSite</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่องานซ่อม"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtAppName" class="form-control" style="min-width: 100%" />

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อลูกค้า"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtCustomer" class="form-control" style="min-width: 100%" disabled />
                                    <div class="input-group-btn">
                                        <button id="btnClickModalCustomerIssueList" class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label12" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="สถานที่ตั้งโรงงาน"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtCustomerSite" class="form-control" style="min-width: 100%" disabled />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label13" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ทีมช่าง"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="input-group">
                                    <input type="text" id="txtAssignTeam" class="form-control" style="min-width: 100%" disabled />
                                    <div class="input-group-btn">
                                        <button id="btnModalTeam" class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label17" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="วันที่เข้าซ่อม"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <div class="date btn-group" data-provide="datepicker" style="min-width: 100%">
                                    <input id="txtPlanDateStart" placeholder="DD/MM/YYYY" onfocus="blur();" type="text" class="form-control datepickerinAssignAwaiting" autocomplete="off" style="min-width: 100%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="Label18" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="เวลาเข้าซ่อม"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select id="txtSchedule" class="form-control" style="min-width: 100%">
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
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSaveAwaitingAssign">New</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListServiceTeam" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Team</h4>
                            <span id="TextinAppno" style="display: none;"></span>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <input type="text" class="form-control" id="ListTeam_myInput" placeholder="Search Customer" autocomplete="off" onkeypress="detect_enter_keyboard(event)" style="max-width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListTeam" class="table table-bordered table-responsive">
                        <thead id="Thead2" runat="server">
                            <tr>
                                <th>Team Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyServiceTeam'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalListCustomerIssueList" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">List Team</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: scroll; max-height: 28em;">
                    <table id="TableListCustomerIssueList" class="table table-bordered table-responsive">
                        <thead id="Thead3" runat="server">
                            <tr>
                                <th>ชื่อลูกค้า</th>
                                <th>สถานที่ตั้งโรงงาน</th>
                            </tr>
                        </thead>
                        <tbody id='TBodyCustomerIssueList'></tbody>
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
            var usernameGetLogin = sessionStorage.getItem("username");

            $('#dtdateIssueList').datepicker({
                dateFormat: 'dd/mm/yy',
                changeYear: true
            });

            $(document).on('click', '.datepickerinAssignAwaiting', function () {
                $(this).datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeYear: true
                }).focus();
            });

            CallMonitoringTask();
            CallIssueHoldReason();
            CallAssignAwaitingAssign();
            CallAssignMyTask();
            $("#IMGUpload").modal("hide");

            $(document).on('change', 'input[name=rdIssueListDetail]:checked', function () {
                if ($(this).val() == "Fix") {
                    $("#dtdateIssueList").val("");
                }
            });

            $("#dragBox").on('click', function () {
                $("#uploadFile").click();
            });
            $("#uploadFile").on('change', function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#s2 .img-preview').attr('src', e.target.result);
                        $("#uploadFile").addClass("ImagesAddUpdate");
                        $("#uploadFile").removeClass("ImagesNotUpdate");
                    };
                    reader.readAsDataURL(this.files[0]);
                    $("#s1").hide();
                    $("#s2").show();
                }
            });

            $("#btnSaveAlarmList").on('click', function () {
                if ($('#ListAlarmRedZone tr').length > 0) {
                    $("#ListAlarmRedZone > tr").each(function () {
                        var check = $(this).find("input[type=radio]").is(":checked");
                        if (check) {
                            var id_issuelist = parseInt($(this).closest("tr").attr("data-idissue"));
                            var TPMCode = $(this).closest("tr").attr('data-tpmcode');
                            var Acting = $(this).find("input[type=radio]:checked").val();
                            var IssueType = $(this).closest("tr").attr('data-issuetype');
                            //alert(id_issuelist + " : " + IssueType);
                            SP_IssueList_Update(id_issuelist, usernameGetLogin, TPMCode, Acting, "Inprocess", "", "", "", "", "", IssueType);
                        }
                    });
                }
                if ($('#ListAlarmYellowZone tr').length > 0) {
                    $("#ListAlarmYellowZone > tr").each(function () {
                        var check = $(this).find("input[type=radio]").is(":checked");
                        if (check) {
                            var id_issuelist = parseInt($(this).closest("tr").attr("data-idissue"));
                            var TPMCode = $(this).closest("tr").attr('data-tpmcode');
                            var Acting = $(this).find("input[type=radio]:checked").val();
                            var IssueType = $(this).closest("tr").attr('data-issuetype');
                            //alert(id_issuelist + " : " + IssueType);
                            SP_IssueList_Update(id_issuelist, usernameGetLogin, TPMCode, Acting, "Inprocess", "", "", "", "", "", IssueType);
                        }
                    });
                }
                if ($('#ListAlarmGreyZone tr').length > 0) {
                    $("#ListAlarmGreyZone > tr").each(function () {
                        var check = $(this).find("input[type=radio]").is(":checked");
                        if (check) {
                            var id_issuelist = parseInt($(this).closest("tr").attr("data-idissue"));
                            var TPMCode = $(this).closest("tr").attr('data-tpmcode');
                            var Acting = $(this).find("input[type=radio]:checked").val();
                            var IssueType = $(this).closest("tr").attr('data-issuetype');
                            //alert(id_issuelist + " : " + IssueType);
                            SP_IssueList_Update(id_issuelist, usernameGetLogin, TPMCode, Acting, "Inprocess", "", "", "", "", "", IssueType);
                        }
                    });
                }
                CallMonitoringTask();
                $("#IMGUpload").modal("hide");
                $("#ModalAlarmList").modal("hide");
            });


            $(".clickAlarmTask").on('click', function () {
                $("#ListAlarmRedZone").empty();
                $("#ListAlarmYellowZone").empty();
                $("#ListAlarmGreyZone").empty();
                $("#DisplayZoneAlarmList").hide();
                $("#txtCusotmerAlarmList").val("");
                $("#ModalAlarmList").modal("show");
            });

            $(".clickIssueTask").on('click', function () {
                $("#ListIssueRedZone").empty();
                $("#ListIssueYellowZone").empty();
                $("#ListIssueGreyZone").empty();
                $("#txtCusotmerIssueList").text("");
                $("#ModalIssueList").modal("show");
            });

            $(".clickHoldedTask").on('click', function () {
                $("#ListHoldRedZone").empty();
                $("#ListHoldYellowZone").empty();
                $("#ListHoldGreenZone").empty();
                $("#txtCusotmerHolded").val("");
                $("#ModalHoldedList").modal("show");
            });

            $(".clickIssueTaskcheck").on('click', function () {
                $("#ListReportBlueZone").empty();
                $("#txtCusotmerReportList").text("");
                $("#ModalReportList").modal("show");
            });



            $("#btnModalCusotmerAlarmList").on('click', function () {
                CallCustomerSiteList("Alarm");
                $("#DisplayZoneAlarmList").show();
                $("#ModalListCustomer").modal("show");
            });
            $("#btnModalCusotmerIssueList").on('click', function () {
                CallCustomerSiteList("Issue");
                $("#ModalListCustomer").modal("show");
            });
            $("#btnModalCusotmerReportList").on('click', function () {
                CallCustomerSiteList("Report");
                $("#ModalListCustomer").modal("show");
            });
            $("#btnModalCusotmerHolded").on('click', function () {
                CallCustomerSiteList("Hold");
                $("#ModalListCustomer").modal("show");
            });

            $(document).on('click', '.ClickSelectCustomerAlarm', function () {
                $("#IMGUpload").modal("show");
                var cust_site = $(this).closest("tr").attr("data-cussite");
                $("#txtCusotmerAlarmList").val($(this).closest("tr").find("td:nth-child(1)").text());
                CallMonitoringDetail("Alarm", cust_site);
                $("#IMGUpload").modal("hide");
            });
            $(document).on('click', '.ClickSelectCustomerIssue', function () {
                $("#IMGUpload").modal("show");
                var cust_site = $(this).closest("tr").attr("data-cussite");
                $("#txtCusotmerIssueList").text($(this).closest("tr").find("td:nth-child(1)").text());
                CallMonitoringDetail("Issue", cust_site);
                $("#IMGUpload").modal("hide");
            });
            $(document).on('click', '.ClickSelectCustomerReport', function () {
                $("#IMGUpload").modal("show");
                $("#txtCusotmerReportList").text($(this).closest("tr").find("td:nth-child(1)").text());
                var cust_site = $(this).closest("tr").attr("data-cussite");
                CallMonitoringDetail("Report", cust_site);
                $("#IMGUpload").modal("hide");
            });
            $(document).on('click', '.ClickSelectCustomerHold', function () {
                $("#IMGUpload").modal("show");
                var cust_site = $(this).closest("tr").attr("data-cussite");
                $("#txtCusotmerHolded").val($(this).closest("tr").find("td:nth-child(1)").text());
                CallMonitoringDetail("Hold", cust_site);
                $("#IMGUpload").modal("hide");
            });


            $(document).on('click', '.clickModalIssueDetail', function () {
                var idissuelist = $(this).closest("tr").attr("data-idissue");
                var TPMCode = $(this).closest("tr").attr("data-tpmcode");
                var custsite = $(this).closest("tr").attr("data-custsite");
                var IssueType = $(this).closest("tr").attr('data-issuetype');
                $("#HeaderIssueDetail").text(TPMCode).attr("data-typeclick", "Issue").attr("data-custsite", custsite).attr("data-issuetype", IssueType);
                CallIssueListDetail("'Inprocess','Reject'", TPMCode, idissuelist, IssueType);
                $("#btnReportIssueListDetail").text("Report");
                $("#btnRejectIssueListDetail").hide();
                $("#ModalIssueListDetail").modal("show");
            });
            $(document).on('click', '.clickModalReportDetail', function () {
                var idissuelist = $(this).closest("tr").attr("data-idissue");
                var TPMCode = $(this).closest("tr").attr("data-tpmcode");
                var custsite = $(this).closest("tr").attr("data-custsite");
                var IssueType = $(this).closest("tr").attr('data-issuetype');
                $("#HeaderIssueDetail").text(TPMCode).attr("data-typeclick", "Report").attr("data-custsite", custsite).attr("data-issuetype", IssueType);
                CallIssueListDetail("'Report'", TPMCode, idissuelist, IssueType);
                $("#btnReportIssueListDetail").text("Approve");
                $("#btnRejectIssueListDetail").show();
                $("#ModalIssueListDetail").modal("show");
            });
            $(document).on('click', '.clickModalHoldDetail', function () {
                var idissuelist = $(this).closest("tr").attr("data-idissue");
                var TPMCode = $(this).closest("tr").attr("data-tpmcode");
                var custsite = $(this).closest("tr").attr("data-custsite");
                var IssueType = $(this).closest("tr").attr('data-issuetype');
                $("#HeaderIssueDetail").text(TPMCode).attr("data-typeclick", "Hold").attr("data-custsite", custsite).attr("data-issuetype", IssueType);
                CallIssueListDetail("'Hold'", TPMCode, idissuelist, IssueType);
                $("#btnReportIssueListDetail").text("Report");
                $("#btnRejectIssueListDetail").hide();
                $("#ModalIssueListDetail").modal("show");
            });


            $("#btnSaveIssueListDetail").on('click', function () {
                ClickBTNButtonDetail(usernameGetLogin, "", $("#HeaderIssueDetail").attr("data-typeclick"));
            });
            $("#btnReportIssueListDetail").on('click', function () {
                var StatusDetail = "";
                if ($("#HeaderIssueDetail").attr("data-typeclick") == "Issue") {
                    StatusDetail = $("#rdHold").is(':checked') ? "Hold" : "Report";
                } else if ($("#HeaderIssueDetail").attr("data-typeclick") == "Hold") {
                    StatusDetail = $("#rdHold").is(':checked') ? "Hold" : "Report";
                } else if ($("#HeaderIssueDetail").attr("data-typeclick") == "Report") {
                    StatusDetail = "Complete";
                } else {
                    StatusDetail = "";
                }
                ClickBTNButtonDetail(usernameGetLogin, StatusDetail, $("#HeaderIssueDetail").attr("data-typeclick"));
            });
            $("#btnRejectIssueListDetail").on('click', function () {
                ClickBTNButtonDetail(usernameGetLogin, "Reject", $("#HeaderIssueDetail").attr("data-typeclick"));
            });


            $("#btnClickNewAwaitingAssign").on('click', function () {
                $("#txtAppName").val("").attr("data-appno", "0");
                $("#txtCustomer").val("").attr("data-custnum", "0");
                $("#txtCustomerSite").val("").attr("data-custsitenum", "0");
                $("#txtAssignTeam").val("").attr("data-idteam", "0");
                $("#txtPlanDateStart").val("");
                $("#txtSchedule").val("");
                $("#btnSaveAwaitingAssign").text("Add").addClass("btn-success").removeClass("btn-warning");
                $("#ModalAwaitingAssign").modal("show");
            });
            $(document).on('click', '.ClickEditAwatingAssign', function () {
                var appNo = $(this).closest("tr").attr("data-appno");
                var custsitenum = $(this).closest("tr").attr("data-custsite");
                var teamid = $(this).closest("tr").attr("data-teamid");
                $("#txtAppName").val($(this).closest("tr").find("td:nth-child(2)").text()).attr("data-appno", appNo);
                $("#txtCustomer").val($(this).closest("tr").find("td:nth-child(3)").text());
                $("#txtCustomerSite").val($(this).closest("tr").find("td:nth-child(4)").text()).attr("data-custsitenum", custsitenum);
                $("#txtAssignTeam").val($(this).closest("tr").find("td:nth-child(5)").text()).attr("data-idteam", teamid);
                $("#txtPlanDateStart").val($(this).closest("tr").find("td:nth-child(6)").text());
                $("#txtSchedule").val($(this).closest("tr").find("td:nth-child(7)").text());
                $("#btnSaveAwaitingAssign").text("Save").removeClass("btn-success").addClass("btn-warning");
                $("#ModalAwaitingAssign").modal("show");
            });
            $('#btnModalTeam').on('click', function () {
                GetServiceTeam();
            });
            $(document).on('click', '.ClickSelectorTeam', function () {
                var teamid = $(this).closest("tr").attr("data-id");
                var teamname = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtAssignTeam").val(teamname).attr("data-idteam", teamid);
            });

            $('#btnClickModalCustomerIssueList').on('click', function () {
                GetCustomerIssueList();
            });
            $(document).on('click', '.ClickSelectorCustomerIssue', function () {
                var custnum = $(this).closest("tr").attr("data-custnum");
                var custsitenum = $(this).closest("tr").attr("data-custsitenum");
                var cust_name = $(this).closest("tr").find("td:nth-child(1)").text();
                var custsite_name = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#txtCustomer").val(cust_name).attr("data-custnum", custnum);
                $("#txtCustomerSite").val(custsite_name).attr("data-custsitenum", custsitenum);
            });

            $("#btnSaveAwaitingAssign").on('click', function () {
                var AppName = $("#txtAppName").val();
                var appNo = $("#txtAppName").attr("data-appno") ? $("#txtAppName").attr("data-appno") : 0;
                var cust_site = $("#txtCustomerSite").attr("data-custsitenum");
                var team_ID = $("#txtAssignTeam").attr("data-idteam");
                var working_date = $("#txtPlanDateStart").val();
                var plan_starttime = $("#txtSchedule").val();
                //console.log(data);
                if (AppName != "" && working_date != "" && $("#txtCustomer").val() != "") {
                    SP_Appointment_Assign_New(appNo, cust_site, team_ID, working_date, plan_starttime, "00:00", usernameGetLogin, AppName);
                }
            });


            $("#btnClickProcessAwaitingAssign").on('click', function () {
                if ($("#ListAwaitAssign").find(".checkboxAwaiting:checked").length > 0) {
                    $("#ListAwaitAssign > tr").each(function () {
                        var check_to_checked = $(this).find("input[type=checkbox]").prop("checked");
                        var appNo = $(this).closest("tr").attr("data-appno");
                        var custsitenum = $(this).closest("tr").attr("data-custsite");
                        var teamid = $(this).closest("tr").attr("data-teamid");

                        var txtAppName = $(this).closest("tr").find("td:nth-child(2)").text();
                        var txtCustomer = $(this).closest("tr").find("td:nth-child(3)").text();
                        var txtCustomerSite = $(this).closest("tr").find("td:nth-child(4)").text();
                        var txtAssignTeam = $(this).closest("tr").find("td:nth-child(5)").text();
                        var txtPlanDateStart = $(this).closest("tr").find("td:nth-child(6)").text();
                        var txtSchedule = $(this).closest("tr").find("td:nth-child(7)").text();

                        if (check_to_checked) {
                            //alert(appNo + " : " + custsitenum + " : " + txtCustomer + " : " + txtSchedule);
                            SP_Appointment_Assign_Process(appNo, custsitenum, txtCustomer, txtSchedule, usernameGetLogin, txtAppName);
                        }
                    }).promise().done(function () {
                        $("#IMGUpload").modal("show");
                        CallAssignAwaitingAssign();
                        CallAssignMyTask();
                        alert("Assign Complete");
                        $("#IMGUpload").modal("hide");
                    });
                } else {
                    alert("ไม่มีงานซ่อมที่เลือก");
                }
            });

            $(document).on('click', '.btnClickAssignCheckIn', function () {
                if ($(this).closest("tr").find("td:nth-child(7)").attr("data-checkin") == "Assigned") {
                    var LocationName = $(this).closest("tr").find("td:nth-child(1)").text() + " : " + $(this).closest("tr").find("td:nth-child(2)").text();
                    $("#txtCustomerCheckin").text(LocationName).attr("data-appno", $(this).closest("tr").attr("data-appno")).attr("data-custsite", $(this).closest("tr").attr("data-custsite"));
                    getLocation(function (position) {
                        var currentLatitude = position.coords.latitude;
                        var currentLongitude = position.coords.longitude;
                        $("#txtLatitudeCheckin").text(currentLatitude);
                        $("#txtLongitudeCheckin").text(currentLongitude);
                    });
                    $("#ModalCheckin").modal("show");
                } else {
                    alert("On Site!!");
                }
            })

            $("#SaveCheckin").on('click', function () {
                var AppNo = $("#txtCustomerCheckin").attr("data-appno");
                var latitude = $("#txtLatitudeCheckin").text();
                var longitude = $("#txtLongitudeCheckin").text();
                var custSite = $("#txtCustomerCheckin").attr("data-custsite");
                SP_Appointment_CheckIn(AppNo, latitude, longitude, usernameGetLogin, custSite);
                //alert(AppNo + " : " + latitude + " : " + longitude);

            });



            $("#btnReportDaily").on('click', function () {
                $("#IMGUpload").modal("show");
                var Dairy = CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/GetCheckDairyReport") %>", {});
                pushmsgOwner(Dairy);
                $("#IMGUpload").modal("hide");
            });


            function ClickBTNButtonDetail(username, Status, TypeList) {
                var id_issuelist = parseInt($("#txtActing").attr("data-idissuelist"));
                var TPMcode = $("#HeaderIssueDetail").attr("data-tpmcode");
                var Acting = $("#txtActing").val();
                var FixStatus = $("#rdFix").is(':checked') ? "Fix" : $("#rdHold").is(':checked') ? "Hold" : "";
                var dueDate = $("#dtdateIssueList").val() != "" ? $("#dtdateIssueList").val() : "";
                var HoldReason = $("#txtIssueHoldReason").val() != "" ? $("#txtIssueHoldReason").val() : "";
                var Detail = $("#txtIssueDetail").val() != "" ? $("#txtIssueDetail").val() : "";
                var NameEngineer = $("#txtActing").attr("data-nameengi");
                var eqname = $("#txtActing").attr("data-eqname");
                //var fileupload = $("#uploadFile").val();
                var checkdateinhold = (FixStatus == "Hold" && dueDate == "") ? "False" : "True";
                var TPMcode = $("#HeaderIssueDetail").attr("data-tpmcode");
                var name_file = TPMcode + "_" + id_issuelist;
                var imgPath = "https://tpm-patkol.com/TPMPatkolQRCode/AttachIssueList/" + id_issuelist + "/" + name_file + ".png";
                var path = $("#s2 .img-preview").attr("src") != "" ? $("#s2 .img-preview").attr("src") : "";
                var img = $("#uploadFile").hasClass("ImagesAddUpdate") ? imgPath : path;
                var IssueType = $("#HeaderIssueDetail").attr("data-issuetype");
                if (FixStatus != "" && checkdateinhold == "True") {
                    //$("#IMGUpload").modal("show");
                    var data = { ID: id_issuelist, Username: username, TPMCode: TPMcode, Acting: Acting, Status: Status, DueDate: dueDate, Detail: Detail, Picture: img, HoldReason: HoldReason, FixStatus: FixStatus, IssueType: IssueType };
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_IssueList_UpdateV3") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(data),
                        success: function (response) {
                            insertFile($("#uploadFile")[0].files[0], name_file, "AttachIssueList\\" + id_issuelist);
                            var Custsite_insuccess = $("#HeaderIssueDetail").attr("data-custsite");
                            if (Status == "Complete") {
                                var userpush = CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/GetUserPushLine") %>", { custsite: Custsite_insuccess });
                                var text = [];
                                if (Acting == "Customer") {
                                    text.push("(E)10002D ซ่อมเสร็จแล้ว(n) (n)ขณะนี้ ช่าง" + NameEngineer + " ได้ทำการแก้ไข " + eqname + " แล้วครับ(n)สาเหตุเกิดจาก " + Detail + " (n)(n) พัฒน์กลยินดีให้บริการครับ");
                                } else if (Acting == "Patkol") {
                                    text.push("(E)10002D ซ่อมเสร็จแล้ว(n)ขณะนี้ ทีมช่างพัฒน์กล ได้ทำการแก้ไข " + eqname + " แล้วครับ(n)สาเหตุเกิดจาก " + Detail + " (n)(n)พัฒน์กลยินดีให้บริการครับ");
                                }
                                pushmsg(text, userpush, Custsite_insuccess);
                            }
                            CallMonitoringDetail(TypeList, $("#HeaderIssueDetail").attr("data-custsite"));
                            CallMonitoringTask();
                            //$("#IMGUpload").modal("hide");
                            $("#ModalIssueListDetail").modal("hide");
                        }
                    });

                } else {
                    alert("กรุณาตรวจสอบผลการซ่อม");
                }
            }

            function pushmsg(data, user, cussite) {
                $.ajax({
                    type: "POST",
                    async: false,
                    //contentType: "application/json; charset=utf-8",
                    url: "https://tpm-patkol.com/TPMLinebot/API_push_Message.php",
                    //dataType: "json",
                    data: { msg: data, userpush: user }
                });
            }

            function pushmsgOwner(data) {
                $.ajax({
                    type: "POST",
                    async: false,
                    //contentType: "application/json; charset=utf-8",
                    url: "https://tpm-patkol.com/TPMLinebot/API_UserPushOwner_Update.php",
                    //dataType: "json",
                    data: { msg: data }
                });
            }


            function CallIssueListDetail(Status, TPMCode, ID, IssueType) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetIssueList") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Status: Status, TPMCode: TPMCode, ID: ID, IssueType: IssueType }),
                    success: function (response) {

                        var TPMCode = response.d[0][0];
                        var Acting = response.d[0][1];
                        var Status = response.d[0][2];
                        var DueDate = ("" + response.d[0][3]).substr(0, 10);
                        var Detail = response.d[0][4];
                        var Picture = response.d[0][5];
                        var HoldReason = response.d[0][6];
                        var Priority = response.d[0][7];
                        var Machine_EquipmentName = response.d[0][8];
                        var cust_num_site = response.d[0][9];
                        var FixStatus = response.d[0][11];
                        var UpdateBy = response.d[0][12];
                        var UpdateBy_Name = response.d[0][13];
                        var ID_IssueList = response.d[0][15];
                        var textStatus = Status == "Inprocess" ? "รอการซ่อม" : Status == "Hold" ? "รอกำหนดการซ่อม" : Status == "Report" ? "พัฒน์กลตรวจผลการซ่อม" : Status == "Reject" ? "ตรวจซ่อมใหม่" : "";

                        $("#HeaderIssueDetail").attr("data-tpmcode", TPMCode).text(TPMCode + " : " + Machine_EquipmentName);
                        $("#txtActing").val(Acting).attr("data-idissueList", ID_IssueList).attr("data-nameengi", UpdateBy_Name).attr("data-eqname", Machine_EquipmentName);
                        $("#txtStatus").val(Status);
                        $("#txttextStatus").val(textStatus);
                        if (FixStatus == "Fix") {
                            $("#rdFix").prop("checked", true);
                        } else if (FixStatus == "Hold") {
                            $("#rdHold").prop("checked", true);
                        } else {
                            $("#rdFix").prop("checked", false);
                            $("#rdHold").prop("checked", false);
                        }
                        DueDate ? $("#dtdateIssueList").val(DueDate) : $("#dtdateIssueList").val("");
                        $("#txtIssueHoldReason").val(HoldReason);
                        $("#txtIssueDetail").val(Detail);
                        if (Picture != "") {
                            $("#s2 .img-preview").attr("src", Picture);
                            $("#uploadFile").addClass("ImagesAddUpdate");
                            $("#uploadFile").removeClass("ImagesNotUpdate");
                            $("#s1").hide();
                            $("#s2").show();

                        } else {
                            $("#s2 .img-preview").attr("src", "");
                            $("#uploadFile").removeClass("ImagesAddUpdate");
                            $("#uploadFile").addClass("ImagesNotUpdate");
                            $("#s1").show();
                            $("#s2").hide();
                        }

                    }
                });

            }

            function CallMonitoringTask() {
                $("#IMGUpload").modal("show");
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetMonitoring_Task") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        var AlarmYellow = response.d[0][0];
                        var AlarmRed = response.d[0][1];
                        var AlarmGrey = response.d[0][2];
                        var IssueYellow = response.d[0][3];
                        var IssueRed = response.d[0][4];
                        var IssueGrey = response.d[0][5];
                        var IssueReported = response.d[0][6];
                        var HoldGreen = response.d[0][7];
                        var HoldYellow = response.d[0][8];
                        var HoldRed = response.d[0][9];
                        var Delay = response.d[0][10];
                        var Reported = response.d[0][11];

                        $("#lblAlarmEmergency").find("p span").text(AlarmRed);
                        $("#lblAlarmLisk").find("p span").text(AlarmYellow);
                        $("#lblAlarmLate").find("p span").text(AlarmGrey);
                        $("#lblIssueEmergency").find("p span").text(IssueRed);
                        $("#lblIssueLisk").find("p span").text(IssueYellow);
                        $("#lblIssueLate").find("p span").text(IssueGrey);
                        $("#lblIssueCheck").find("p span").text(IssueReported);
                        $("#lblHoldOverDue").find("p span").text(HoldRed);
                        $("#lblHoldNearToDue").find("p span").text(HoldYellow);
                        $("#lblHoldOnPlan").find("p span").text(HoldGreen);
                        $("#txtToDayOverDue").text("ล่าช้า : " + Delay);
                        $("#txtToDay").text("รายงานแล้ว : " + Reported);
                        $("#IMGUpload").modal("hide");
                    },
                    error: function () {
                        alert("Error");
                        $("#IMGUpload").modal("hide");
                    }
                });

            }

            function CallCustomerSiteList(BrowseType) {
                $("#IMGUpload").modal("show");
                $("#TBodyCustomer").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetCustomerSiteMonitoringList") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ BrowseType: BrowseType }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var TPMQty = val[0];
                                var cust_num_site = val[1];
                                var CustomerName = val[2];

                                frament += "<tr data-cussite='" + cust_num_site + "'>";
                                frament += "<td><a class='ClickSelectCustomer" + BrowseType + "' href='javascript:void(0)' data-dismiss='modal'>" + CustomerName + "</a></td>";
                                frament += "<td><a class='ClickSelectCustomer" + BrowseType + "' href='javascript:void(0)' data-dismiss='modal'>" + TPMQty + "</a></td>";
                                frament += "</tr>";
                            });
                            $("#TBodyCustomer").append(frament);
                        }
                        $("#IMGUpload").modal("hide");
                    }
                });
            }


            function CallIssueHoldReason() {
                //$("#txtIssueHoldReason").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetIssueHoldReason") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Name = val[1];
                                frament += '<option value="' + ID + '">' + Name + '</option>';
                            });
                            $("#txtIssueHoldReason").append(frament);
                        }
                    }
                });
            }

            function CallMonitoringDetail(BrowseType, cust_site) {
                $("#List" + BrowseType + "RedZone").empty();
                $("#List" + BrowseType + "YellowZone").empty();
                $("#List" + BrowseType + "GreyZone").empty();
                $("#List" + BrowseType + "GreenZone").empty();
                $("#List" + BrowseType + "BlueZone").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetMonitoringTaskDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ BrowseType: BrowseType, cust_site: cust_site }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var TPMCode = val[0];
                                var Acting = val[1];
                                var Status = val[2];
                                var DueDate = ("" + val[3]);
                                var Detail = val[4];
                                var Picture = val[5];
                                var HoldReason = val[6];
                                var Priority = val[7];
                                var Machine_EquipmentName = val[8];
                                var cust_num_site = val[9];
                                var CreateDate = val[10];
                                var FixStatus = val[11];
                                var MonitorType = val[12];
                                var PriorityName = val[13];
                                var ID_ListIssue = val[14];
                                var textActing = Acting == "Patkol" ? "พัฒน์กล" : Acting == "Customer" ? "ลูกค้า" : "";
                                var IssueType = val[15];
                                var frament = "";
                                frament += '<tr data-idissue="' + ID_ListIssue + '" data-tpmcode="' + TPMCode + '" data-custsite="' + cust_num_site + '" data-issuetype="' + IssueType + '">';
                                frament += '<td style="width: 50%">';
                                frament += '<h4 class="text-gray" style="margin-top: 3px; font-size: 16px;">' + Machine_EquipmentName + '</h4>';
                                frament += '</td>';

                                if (BrowseType == "Alarm") {
                                    frament += '<td style="width: 30%">';
                                    frament += '<label class="radio-inline">';
                                    frament += '<input type="radio" name="' + TPMCode + '' + cust_num_site + '' + (index + 1) + '" value="Patkol">Patkol</label>';
                                    frament += '<label class="radio-inline">';
                                    frament += '<input type="radio" name="' + TPMCode + '' + cust_num_site + '' + (index + 1) + '" value="Customer">Customer</label></td>';
                                }
                                else if (BrowseType == "Issue") {
                                    frament += '<td style="width: 20%">';
                                    frament += '<h4 class="text-gray" style="margin-top: 3px; font-size: 16px;">' + textActing + '</h4>';
                                    frament += '</td>';
                                    frament += '<td style="width: 20%">';
                                    frament += '<button type="button" class="btn btn-gray clickModalIssueDetail" style="max-width: 100px;"><i class="glyphicon glyphicon-edit"></i></button>';
                                    frament += '</td>';
                                }
                                else if (BrowseType == "Report") {
                                    frament += '<td style="width: 20%">';
                                    frament += '<h4 class="text-gray" style="margin-top: 3px; font-size: 16px;">' + textActing + '</h4>';
                                    frament += '</td>';
                                    frament += '<td style="width: 20%">';
                                    frament += '<button type="button" class="btn btn-gray clickModalReportDetail" style="max-width: 100px;"><i class="glyphicon glyphicon-edit"></i></button>';
                                    frament += '</td>';
                                }
                                else if (BrowseType == "Hold") {
                                    frament += '<td style="width: 15%">';
                                    frament += '<h4 class="text-gray" style="margin-top: 3px; font-size: 16px;">' + textActing + '</h4>';
                                    frament += '</td>';
                                    frament += '<td style="width: 15%">';
                                    frament += '<h4 style="margin-top: 3px; font-size: 16px;" class="text-gray">' + DueDate.substring(0, 10) + '</h4>';
                                    frament += '</td>';

                                    frament += '<td style="width: 10%">';
                                    frament += '<button type="button" class="btn btn-gray clickModalHoldDetail" style="max-width: 100px"><i class="glyphicon glyphicon-edit"></i></button>';
                                    frament += '</td>';
                                }

                                if (MonitorType == "Grey") {
                                    frament += '<td style="width: 10%">';
                                    frament += '<h4 style="margin-top: 3px; font-size: 16px;" class="text-gray">' + PriorityName + '</h4>';
                                    frament += '</td>';
                                }

                                frament += '</tr>';
                                $("#List" + BrowseType + "" + MonitorType + "Zone").append(frament);
                            });

                        }
                    }
                });
            }

            function SP_IssueList_Update(ID, Username, TPMCode, Acting, Status, DueDate, Detail, Picture, HoldReason, FixStatus, IssueType) {
                console.log({ ID: ID, Username: Username, TPMCode: TPMCode, Acting: Acting, Status: Status, DueDate: DueDate, Detail: Detail, Picture: Picture, HoldReason: HoldReason, FixStatus: FixStatus, IssueType: IssueType });
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_IssueList_UpdateV3") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Username: Username, TPMCode: TPMCode, Acting: Acting, Status: Status, DueDate: DueDate, Detail: Detail, Picture: Picture, HoldReason: HoldReason, FixStatus: FixStatus, IssueType: IssueType }),
                    success: function (response) {

                    }
                });
            }


            function SP_Appointment_Assign_Process(appNo, cust_site, Cust_name, plan_starttime, UserName, Appname) {
                var data = { appNo: parseInt(appNo), UserName: UserName };
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Appointment_Trans_Assign_Process") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    success: function (response) {
                        var text = [];
                        text.push("(E)100049 เรากำลังส่งทีมช่างพัฒน์กลเข้าไปแก้ไขหน้างาน(n)(n)" + Appname + "(n)(n)จะถึงที่โรงงาน " + Cust_name + " ของลูกค้าภายในเวลา " + plan_starttime + " น.");
                        var userpush = CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/GetUserPushLine") %>", { custsite: cust_site });
                        pushmsg(text, userpush, cust_site);
                    }
                });
            }

            function SP_Appointment_Assign_New(appNo, cust_site, team_ID, working_date, plan_starttime, plan_endtime, UserName, AppName) {
                var data = { appNo: parseInt(appNo), cust_site: parseInt(cust_site), team_ID: parseInt(team_ID), working_date: working_date, plan_starttime: plan_starttime, plan_endtime: plan_endtime, UserName: UserName, AppName: AppName };
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Appointment_Assign_Trans") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    success: function (response) {
                        alert("บันทึกสำเร็จ");
                        CallAssignAwaitingAssign();
                        $("#ModalAwaitingAssign").modal("hide");
                    }
                });
            }

            function SP_Appointment_CheckIn(appNo, latitude, longitude, UserName, custSite) {
                var data = { appNo: parseInt(appNo), latitude: latitude, longitude: longitude, UserName: UserName };
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_Appointment_Trans_CheckIn") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    success: function (response) {
                        CallAssignAwaitingAssign();
                        CallAssignMyTask();
                        var text = [];
                        text.push("ขณะนี้ทีมช่างพัฒน์กลได้ถึงที่โรงงาน " + $("#txtCustomerCheckin").text() + " เรียบร้อยแล้วครับ");
                        var userpush = CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/GetUserPushLine") %>", { custsite: custSite });
                        pushmsg(text, userpush, custSite);
                        alert("CheckIn Complete");
                    }
                });
            }

            function CallAssignMyTask() {
                $("#ListAssignMyTask").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListAssignMyTask_New") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var cust_name = val[0];
                                var cust_site_name = val[1];
                                var Team_Name = val[2];
                                var working_date = val[3];
                                var plan_starttime = val[4];
                                var status = val[5] == "Assigned" ? "ยังไม่ได้เข้าทำการซ่อม" : val[5] == "On Site" ? "ถึงโรงงานแล้ว กำหนดดำเนินการซ่อม" : "";
                                var appNo = val[6];
                                var cust_num_site = val[7];
                                var AppName = val[8];

                                frament += '<tr data-appno="' + appNo + '" data-custsite="' + cust_num_site + '">';
                                frament += '<td>' + AppName + '</td>';
                                frament += '<td>' + cust_name + '</td>';
                                frament += '<td>' + cust_site_name + '</td>';
                                frament += '<td>' + Team_Name + '</td>';
                                frament += '<td>' + working_date + '</td>';
                                frament += '<td>' + plan_starttime + '</td>';
                                frament += '<td data-checkin="' + val[5] + '">' + status + '</td>';
                                frament += '<td><button type="button" class="btn btn-default btnClickAssignCheckIn"><i class="fa fa-map-marker" aria-hidden="true"></i></button></td>';
                                frament += '</tr>';
                            });
                            $("#ListAssignMyTask").append(frament);
                        } else {
                            var frament = "";
                            frament += '<tr>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '<td>ไม่มีข้อมูล</td>';
                            frament += '</tr>';
                            $("#ListAssignMyTask").append(frament);
                        }
                    }
                });
            }

            function CallAssignAwaitingAssign() {
                $("#ListAwaitAssign").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListAwaitAssign_New") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var cust_name = val[0];
                                var cust_site_name = val[1];
                                var appNo = val[2];
                                var cust_site = val[3];
                                var working_date = ("" + val[4]).substr(0, 10);
                                var plan_starttime = val[5];
                                var plan_endtime = val[6];
                                var team_ID = val[7];
                                var Team_Name = val[8];
                                var AppName = val[9];

                                frament += '<tr data-appno="' + appNo + '" data-custsite="' + cust_site + '" data-teamid="' + team_ID + '">';
                                frament += '<td><input type="checkbox" class="checkboxAwaiting"/></td>';
                                frament += '<td>' + AppName + '</td>';
                                frament += '<td>' + cust_name + '</td>';
                                frament += '<td>' + cust_site_name + '</td>';
                                frament += '<td>' + Team_Name + '</td>';
                                frament += '<td>' + working_date + '</td>';
                                frament += '<td>' + plan_starttime + '</td>';
                                frament += '<td><button type="button" class="btn btn-block btn-info ClickEditAwatingAssign">Edit</button></td>';
                                frament += '</tr>';

                            });
                            $("#ListAwaitAssign").append(frament);
                        }
                    }
                });
            }

            function GetServiceTeam() {
                $("#IMGUpload").modal("show");
                $("#TBodyServiceTeam").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetServiceTeam") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Team_Name = val[1];

                                frament += '<tr data-id="' + ID + '">';
                                frament += '<td><a class="ClickSelectorTeam" href="javascript:void(0)" data-dismiss="modal">' + Team_Name + '</a></td>';
                                frament += '</tr>';

                            });
                            $("#TBodyServiceTeam").append(frament);
                        }
                        $("#IMGUpload").modal("hide");
                        $("#ModalListServiceTeam").modal("show");
                    }
                });
            }

            function GetCustomerIssueList() {
                $("#IMGUpload").modal("show");
                $("#TBodyCustomerIssueList").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetCustomer_inside_IssueList") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({}),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var frament = "";
                            $.each(response.d, function (index, val) {
                                var cust_num = val[0];
                                var cust_name = val[1];
                                var cust_num_site = val[2];
                                var cust_site_name = val[3];

                                frament += '<tr data-custnum="' + cust_num + '" data-custsitenum="' + cust_num_site + '">';
                                frament += '<td><a class="ClickSelectorCustomerIssue" href="javascript:void(0)" data-dismiss="modal">' + cust_name + '</a></td>';
                                frament += '<td><a class="ClickSelectorCustomerIssue" href="javascript:void(0)" data-dismiss="modal">' + cust_site_name + '</a></td>';
                                frament += '</tr>';

                            });
                            $("#TBodyCustomerIssueList").append(frament);
                        }
                        $("#IMGUpload").modal("hide");
                        $("#ModalListCustomerIssueList").modal("show");
                    }
                });
            }

            function getLocation(callback) {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(callback);
                }
            }


        });

    </script>
</asp:Content>
