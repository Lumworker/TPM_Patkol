<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueList.aspx.cs" Inherits="TPMPatkol.IssueList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Issue List</h2>
    </div>
    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                        <asp:Label ID="Label11" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Cusotmer :"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <div class="input-group">
                                <input type="text" id="txtCusotmer" class="form-control" style="min-width: 100%" />
                                <div class="input-group-btn">
                                    <button class="btn btn-default" id="btnModalCusotmer" type="button">
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
                        <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Site :"></asp:Label>
                        <div class="col-md-9 col-xs-12">
                            <div class="input-group">
                                <input type="text" id="txtCusotmerSite" class="form-control" style="min-width: 100%" />
                                <div class="input-group-btn">
                                    <button class="btn btn-default" id="btnModalCusotmerSite" type="button">
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
                <h4 style="color: white">Red Zone</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tableIssueRedZone">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ListIssueRedZone">
                                    <tr>
                                        <td>ระดับน้ำยา</td>
                                        <td>
                                            <label class="radio-inline">
                                                <input type="radio" name="optradio" checked>Patkol</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optradio">Customer</label></td>
                                        <td><i class="glyphicon glyphicon-edit"></i></td>
                                    </tr>
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
                <h4 style="color: white">Yellow Zone</h4>
            </div>
            <div class="panel-body">
            </div>
        </div>
    </div>
</asp:Content>
