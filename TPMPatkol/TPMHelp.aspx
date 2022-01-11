<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TPMHelp.aspx.cs" Inherits="TPMPatkol.TPMHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .box {
            font-size: 18px;
            text-align: center;
            padding: 10px;
            line-height: 60px;
            position: relative;
            display: block;
            color: #000;
            border: 1px solid #cccccc;
            border-radius: 10px;
            background: #ededed;
            margin: 5px;
            font-weight: bold;
            /*text-shadow: 1px 1px 1px #000;*/
        }

            .box:hover, .box:focus {
                text-decoration: none;
                /*opacity: 0.7;*/
                border: 1px solid #000;
            }

        .IMGLogoPatkolCenter {
            width: 100%;
            max-width: 400px;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #3F5FA5;
            color: white;
            text-align: center;
        }

        .bg {
            position: relative;
            height: 100vh;
            /*margin-top: 15px;*/
            padding-top: 25px;
        }

            .bg:before {
                background-image: url('image/PBKG.png');
                background-repeat: no-repeat;
                background-size: cover;
                position: absolute;
                display: block;
                content: "";
                left: 0;
                right: 0;
                top: 0;
                bottom: 0;
                z-index: -1;
                opacity: 1;
            }

        @media screen and (min-width: 768px) {
            .IMGLogoPatkolCenter {
            }
        }
    </style>


    <div class="bg">
        <div class="container">
            <div class="page-header">
                <div class="row">
                    <div class=" col-md-12">
                        <h2><a href="TPMHelp.aspx" id="helphome">TPM Help</a></h2>
                    </div>
                </div>
            </div>
            <div class="form-group" id="DisplayLocationType">
                <div class="row groupData">
                </div>
            </div>
            <div class="form-group" id="DisplayMainGuide" style="display: none;">
                <div class="row groupData">
                </div>
            </div>
            <div class="form-group" id="DisplayStep" style="display: none;">
                <div class="row">
                    <div id="smartwizard" class="col-md-12">
                        <ul id="Steper" class="nav">
                        </ul>
                        <div id="ShowDetailSteper" class="tab-content">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {

            var GetKeyword = getAllUrlParams("word");

            if (GetKeyword) {
                $("#DisplayLocationType").hide();
                $("#DisplayMainGuide").show();
                $("#DisplayStep").hide();
                CallListGuide(0, GetKeyword);
            } else {
                $("#DisplayLocationType").show();
                $("#DisplayMainGuide").hide();
                $("#DisplayStep").hide();
                CallListType();
            }


            $(document).on('click', '.clickLocationType', function () {
                var IDType = $(this).attr("data-id");
                CallListGuide(IDType, "");
                $("#DisplayLocationType").hide();
                $("#DisplayMainGuide").show();
            });
            $(document).on('click', '.clickMainGuide', function () {
                var IDMain = $(this).attr("data-id");
                CallListStep(IDMain);
                $("#DisplayMainGuide").hide();
                $("#DisplayStep").show();
            });


            function calwizard(index) {
                $('#smartwizard').smartWizard({
                    theme: 'arrows',
                    keyNavigation: false,
                    showStepURLhash: false,
                    selected: index,
                    transitionEffect: 'slide',
                    toolbarSettings: {
                        toolbarPosition: 'both',
                        toolbarButtonPosition: 'center',
                        showNextButton: true,
                        showPreviousButton: true
                    }
                });
                //sma.data('smartWizard')._showStep(index);
            }


            function CallListType() {
                $("#DisplayLocationType").find(".groupData").empty();
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
                                frament += '<div class="col-md-6">';
                                frament += '<a href="#" class="box clickLocationType" data-id="' + ID + '">' + Name + '</a>';
                                frament += '</div>';
                            });
                        }
                        $("#DisplayLocationType").find(".groupData").append(frament);
                    }
                });
            }

            function CallListGuide(IDType, Keyword) {
                $("#DisplayMainGuide").find(".groupData").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGuideMain") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ IDType: IDType, Keyword: Keyword }),
                    success: function (response) {
                        var frament = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Name_Guide = val[1];
                                var Location_ID = val[2];
                                frament += '<div class="col-md-6">';
                                frament += '<a href="#" class="box clickMainGuide" data-id="' + ID + '" data-typeid="' + Location_ID + '">' + Name_Guide + '</a>';
                                frament += '</div>';
                            });
                        }
                        $("#DisplayMainGuide").find(".groupData").append(frament);
                    }
                });
            }

            function CallListStep(IDMain) {
                $("#Steper").empty();
                $("#ShowDetailSteper").empty();
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

                                frament += '<li data-step="Step' + StepNo + '"><a href="#step-' + StepNo + '">' + StepName + '</a></li>';
                                CallListStepDetail(ID, StepNo, StepName);
                            });
                        }
                        $("#Steper").append(frament);
                        calwizard(0);
                    }
                });
            }

            function CallListStepDetail(IDStep, StepNo, StepName) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("GenerateQRCode.aspx/GetListGuideStepDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ IDStep: IDStep }),
                    success: function (response) {
                        var frament = "";
                        frament += '<div id="step-' + StepNo + '">';
                        frament += '<div class="panel-group">';
                        frament += '<div class="panel panel-default" style="margin-top: 1em;">';
                        frament += '<div class="panel-heading">';
                        frament += '<h4>' + StepName + '</h4>';
                        frament += '</div>';
                        frament += '<div class="panel-body">';
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Step_ID = val[1];
                                var ListNo = val[2];
                                var IMG_Path = val[3] + "/" + ID + ".png";
                                var Description = val[4];

                                frament += '<div class="form-group">';
                                frament += '<div class="row">';
                                frament += '<img src="' + IMG_Path + '" style="max-width:100%;max-height:70em;" />';
                                frament += '</div>';
                                frament += '</div>';
                            });
                        }
                        frament += '</div>';
                        frament += '</div>';
                        frament += '</div>';
                        frament += '</div>';

                        $("#ShowDetailSteper").append(frament);
                    }
                });
            }

        });
    </script>


</asp:Content>
