<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DndMapRepo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>D&D Map Repo</h1>
        <p>Welcome to my D&D map library</p>

        <asp:Repeater ID="rptMaps" runat="server">
            <ItemTemplate>
                <div class="map-card">
                    <h3><%# Eval("Name") %></h3>
                    <div><strong>Id:</strong> <%# Eval("Id") %></div>
                    <div class="file-path">
                        <strong>File:</strong> <%# Eval("File") %>
                    </div>

                    <asp:Button
                        ID="btnPlay"
                        runat="server"
                        Text="Play"
                        CommandName="Play"
                        CommandArgument='<%# Eval("Id") %>'
                        OnClientClick='<%# "window.open(\"Player.aspx?id=" + Eval("Id") + "\", \"_blank\"); return false;" %>'
                        OnCommand="btnPlay_Command" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
