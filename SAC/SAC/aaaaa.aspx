<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aaaaa.aspx.cs" Inherits="SAC.aaaaa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <script language= "javascript">
    function resize() {
    resizeTo(800,500);
    } 
</script>

</head>
<body onload="resize();">
    <form id="form1" runat="server">
        <asp:Image ID="Image1" runat="server" Height="188px" Width="171px" />
        <asp:Calendar ID="Calendar1" runat="server" Width="358px"></asp:Calendar>
    </form>
</body>
</html>
