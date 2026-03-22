<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DndMapRepo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>D&D Map Repo</h1>
        <p>Welcome to my D&D map library</p>

        <asp:Repeater ID="rptMaps" runat="server">
            <HeaderTemplate><div class="row g-3"></HeaderTemplate>
            <ItemTemplate>
                <div class="col-sm-6 col-md-4">
                    <div class="card h-100">
                        <video class="card-img-top" src='<%# ResolveUrl(Eval("File").ToString()) %>' autoplay loop muted style="max-height:160px; object-fit:cover;"></video>
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Name") %></h5>
                        </div>
                        <div class="card-footer">
                            <asp:Button
                                ID="btnPlay"
                                runat="server"
                                Text="▶ Play"
                                CssClass="btn btn-primary btn-sm"
                                CommandName="Play"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClientClick='<%# "window.open(\"Player.aspx?id=" + Eval("Id") + "\", \"_blank\"); return false;" %>'
                                OnCommand="btnPlay_Command" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
