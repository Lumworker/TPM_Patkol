<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginTPMPortal.aspx.cs" Inherits="TPMPortal.LoginTPMPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <link href="Content/Login/nprogress.css" rel="stylesheet" />
    <link href="Content/Login/animate.min.css" rel="stylesheet" />
    <link href="Content/Login/custom.css" rel="stylesheet" />
    <style>
        .boxlohinform {
            background-color: #fff;
            padding: 10px;
            -webkit-border-radius: 10px 10px 10px 10px;
            border-radius: 10px 10px 10px 10px;
            -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
            box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
        }

        .fadeInDown {
            -webkit-animation-name: fadeInDown;
            animation-name: fadeInDown;
            -webkit-animation-duration: 1s;
            animation-duration: 1s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }

        @-webkit-keyframes fadeInDown {
            0% {
                opacity: 0;
                -webkit-transform: translate3d(0, -100%, 0);
                transform: translate3d(0, -100%, 0);
            }

            100% {
                opacity: 1;
                -webkit-transform: none;
                transform: none;
            }
        }

        @keyframes fadeInDown {
            0% {
                opacity: 0;
                -webkit-transform: translate3d(0, -100%, 0);
                transform: translate3d(0, -100%, 0);
            }

            100% {
                opacity: 1;
                -webkit-transform: none;
                transform: none;
            }
        }

        @-webkit-keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @-moz-keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .fadeIn {
            opacity: 0;
            -webkit-animation: fadeIn ease-in 1;
            -moz-animation: fadeIn ease-in 1;
            animation: fadeIn ease-in 1;
            -webkit-animation-fill-mode: forwards;
            -moz-animation-fill-mode: forwards;
            animation-fill-mode: forwards;
            -webkit-animation-duration: 1s;
            -moz-animation-duration: 1s;
            animation-duration: 1s;
        }

            .fadeIn.first {
                padding-top: 15px;
                padding-bottom: 15px;
                -webkit-animation-delay: 0.4s;
                -moz-animation-delay: 0.4s;
                animation-delay: 0.4s;
            }

            .fadeIn.second {
                -webkit-animation-delay: 0.6s;
                -moz-animation-delay: 0.6s;
                animation-delay: 0.6s;
            }

            .fadeIn.third {
                -webkit-animation-delay: 0.8s;
                -moz-animation-delay: 0.8s;
                animation-delay: 0.8s;
            }

            .fadeIn.fourth {
                -webkit-animation-delay: 1s;
                -moz-animation-delay: 1s;
                animation-delay: 1s;
            }

        .underlineHover:after {
            display: block;
            left: 0;
            bottom: -10px;
            width: 0;
            height: 2px;
            background-color: #56baed;
            content: "";
            transition: width 0.2s;
        }

        .underlineHover:hover {
            color: #0d0d0d;
        }

            .underlineHover:hover:after {
                width: 100%;
            }

        *:focus {
            outline: none;
        }

        #icon {
            width: 60%;
        }

        * {
            box-sizing: border-box;
        }
    </style>
</head>
<body class="login" style="background-color: #56baed;">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
            </Scripts>
        </asp:ScriptManager>
        <script src="Scripts/jquery-ui.js"></script>

        <div>
            <div class="login_wrapper">
                <div class="animate form login_form boxlohinform fadeInDown">
                    <section class="login_content">
                        <h1 class="fadeIn" style="margin-bottom: 0;">
                            <img src="Images/Logo1-01.png" style="width: 150px" /></h1>
                        <h1 class="fadeIn" style="margin-top: 0;">( Pilot )</h1>
                        <div class="form-group">
                            <input type="text" id="username" class="fadeIn form-control" placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <input type="password" id="password" class="fadeIn form-control" placeholder="Password" />
                        </div>
                        <div class="form-group">
                            <button class="fadeIn btn btn-default btn-block" style="margin-left: 0; color: #fff; background-color: #337ab7;" type="button">Log in</button>
                        </div>

                    </section>
                </div>
            </div>
        </div>

        <div class="modal fade" id="ModalClose" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <%--<h4 class="modal-title">Modal Header</h4>--%>
                    </div>
                    <div class="modal-body" style="overflow-y: scroll; max-height: 30em;">
                        <div class="row">
                            <div class="form-group">
                                <h1 style="text-align: center">ปิดระบบปรับปรุงชั่วคราว</h1>
                            </div>
                            <!--End col-md-12-->
                        </div>
                        <!--End col-md-12-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script>

            $(document).ready(function () {

                $("button").on('click', function () {

                    //$("#ModalClose").modal("show");

                    var username = $("#username").val();
                    var password = $("#password").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("GenerateQRCode.aspx/GetLoginTPM") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ user: username, pass: password }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                sessionStorage.setItem("username", username);
                                sessionStorage.setItem("nameengi", response.d[0][1]);
                                //sessionStorage.setItem("tokenline", response.d[0][4]);
                                //sessionStorage.setItem("cussite", response.d[0][5]);
                                window.location.href = "Default.aspx";

                            } else {
                                alert("คุณยังไม่ได้เป็นสมาชิกกรุณาติดต่อ Patkol");
                            }
                        }
                    });

                });

            });

        </script>
    </form>
</body>
</html>
