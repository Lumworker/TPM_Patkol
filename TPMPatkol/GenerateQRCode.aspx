<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateQRCode.aspx.cs" Inherits="TPMPatkol.GenerateQRCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section style="margin-top: 0.8em;">
        <div class="row">
            <div class="col-md-12">
                <div class='page-header'>
                    <h2>Generate QRCode</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <asp:Label ID="Label4" class="col-md-12 col-xs-12" runat="server" Font-Bold="True" Text="Qty QR Code to generate : "></asp:Label>
                <div class="col-md-12 col-xs-12" style="margin-top: 10px">
                    <input id="text" class="form-control" type="number" value="" style="min-width: 100%" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <asp:Label ID="Label6" class="col-md-12 col-xs-12" runat="server" Font-Bold="True" Text="Type TPM : "></asp:Label>
                <div class="col-md-12 col-xs-12" style="margin-top: 10px">
                    <select class="form-control" id="stcTypeTPM" style="min-width: 100%">
                    </select>
                </div>
                <div class="col-md-12 col-xs-12" style="margin-top: 10px">
                    <button class="btn btn-success btn-block" id="GenerateQRCode" type="button">Generate</button>
                </div>
            </div>
        </div>
        <hr>



        <div id="DisplayLot" style="display: none;">
            <div class="row">
                <div class="form-group col-md-6">
                    <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Lot : "></asp:Label>
                    <div class="col-md-9 col-xs-12">
                        <input class="form-control" id="txtLotID" type="text" value="" style="min-width: 100%" disabled />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="TPM Code"></asp:Label>
                    <div class="col-md-9 col-xs-12">
                        <input class="form-control" id="txtTPMStart" type="text" value="" style="min-width: 100%" disabled />
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="Label5" class="col-md-1 col-xs-12" runat="server" Font-Bold="True" Text="To"></asp:Label>
                    <div class="col-md-9 col-xs-12">
                        <input class="form-control" id="txtTPMEnd" type="text" value="" style="min-width: 100%" disabled />
                    </div>
                </div>
            </div>
            <%--<div class="row">
                <div class="form-group col-md-6">
                    <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="File Path : "></asp:Label>
                    <div class="col-md-9 col-xs-12">
                        <span class="form-control" id="txtLotFilePath" style="min-width: 100%; color: orange"></span>
                    </div>
                </div>
            </div>--%>
        </div>
        <hr>
        <div class="row" style="height: 0px; overflow: hidden">
            <div id="qrcode" style="width: 100%; height: 100%; margin-top: 15px;"></div>
        </div>
    </section>

    <script type="text/javascript">

        $(document).ready(function () {


            for (var i = 17; i < 51; i++) {
                var frament = "";
                frament += '<option value="' + i + '">20' + i + '</option>';
                $("#stcTypeTPM").append(frament);
            }

            var GetDate = new Date();
            $("#stcTypeTPM").val(GetDate.getFullYear());

            <%--$.ajax({
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
                            frament += '<option value="' + Code + '" data-id="' + ID + '">' + Name + '</option>';
                            $("#stcTypeTPM").append(frament);
                        });
                    }
                }
            });--%>


            $("#GenerateQRCode").on('click', function () {
                $("#qrcode").empty();
                var elText = document.getElementById("text");
                var usernameLogin = sessionStorage.getItem("username");
                if (!elText.value) {
                    alert("Please enter a valid number in this field !!");
                    elText.focus();
                    $("#click").hide();
                    return;
                } else {
                    var Codetypetpm = $("#stcTypeTPM").val();
                    //var IDtypetpm = parseInt($("#stcTypeTPM").find(':selected').attr('data-id'));
                    var LotID = parseInt(CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_Lot") %>", { LotID: 0, StartTPMCode: "", EndTPMCode: "" }));
                    $("#DisplayLot").show();
                    $("#txtLotFilePath").text("https://tpm-patkol.com/TPMPatkolQRCode/QRCode/" + LotID);
                    $("#txtLotID").val(LotID);
                    var SaveTPMCode = [];

                    for (var i = 0; i < parseInt(elText.value); i++) {
                        var frament = "<div class='col-md-4 col-sm-6 col-xs-12' id='qrcode" + (i + 1) + "' style='text-align:center; margin-top:10px;'></div>";
                        $("#qrcode").append(frament);

                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_Insert") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ TMPCode: "", proj_num: "", job_num: "", lot_num: "", serial_num: "", TypeTPM: 0, CodeTypeTPM: Codetypetpm, UpdateBy: usernameLogin  }),
                            success: function (response) {
                                SaveTPMCode[i] = response.d;
                                var text = "" + response.d;
                                //const imgUrl = qrcode.makeCode(text);
                                var qrcode = new QRCode(document.getElementById("qrcode" + (i + 1)), { text: text, correctLevel: QRCode.CorrectLevel.H });
                                var save = qrcode._el.childNodes[1];
                                save.setAttribute("id", "QRCode" + (i + 1));
                                $("#qrcode" + (i + 1)).append(save);
                                var namefile = "" + response.d;
                                //var date = new Date();
                                //var GetdateToday = date.getFullYear() + "" + (date.getMonth() + 1) + "" + date.getDate();

                                $("#qrcode" + (i + 1)).find('img').on('load', function () {
                                    //console.log(this.src);
                                    fetch(this.src)
                                        .then(res => res.blob())
                                        .then(blob => {
                                            const file = new File([blob], namefile, { type: 'image/png' });
                                            insertFile(file, namefile, "QRCode\\" + LotID);
                                            console.log(namefile);
                                        })
                                        .catch(error => console.error(error))
                                });


                                if (i == 0) {
                                    CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_Lot") %>", { LotID: LotID, StartTPMCode: SaveTPMCode[0], EndTPMCode: SaveTPMCode[0] });
                                } else if (i == (parseInt(elText.value) - 1)) {
                                    CallAjaxReturnData("<%= ResolveUrl("GenerateQRCode.aspx/SP_TPM_Code_Lot") %>", { LotID: LotID, StartTPMCode: SaveTPMCode[0], EndTPMCode: SaveTPMCode[i] });
                                }
                            }
                        });
                    }

                    alert("Generate Complete");
                    $("#txtTPMStart").val(SaveTPMCode[0]);
                    $("#txtTPMEnd").val(SaveTPMCode[SaveTPMCode.length - 1]);
                    //console.log(SaveTPMCode);
                }


                //console.log(SaveTPMCode);

            });


            $("#click").on('click', function () {
                var src = $("#qrcode1").find("img").attr('src');
                //if (typeof src != undefined) {
                //    alert("Not have QRCode");
                //    $("#text").focus();
                //    return;
                //}
                console.log(src);
                $("#click").attr('href', src);
            });

        });




    </script>

</asp:Content>
