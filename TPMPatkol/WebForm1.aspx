<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TPMPatkol.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <input type="file" class="form-control" id="file" />
    <button type="button" id="btn">Click</button>


    <script>

        $(document).ready(function () {



            $("#btn").on('click', function () {
                $("#IMGUpload").modal("show");

                insertFile($("#file")[0].files[0], 'Testinput', "TestUpload");

            });




        });

    </script>


</asp:Content>
