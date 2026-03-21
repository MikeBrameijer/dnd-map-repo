<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Player.aspx.cs" Inherits="DndMapRepo.Player" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Map Player</title>
</head>
<body style="margin:0; background:black;">
    <form id="form1" runat="server">
        <video id="vidMap" runat="server" controls autoplay loop style="width:100%; height:100vh;">
            Your browser does not support the video tag.
        </video>
    </form>
</body>
</html>