<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SAC.formularios.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="Login1" runat="server" 
                LoginButtonText="Ingresar"
                PasswordLabelText="Contraseña:" 
                RememberMeText="Recordarme la proxima vez." 
                TitleText=""
                UserNameLabelText="Usuario:" OnAuthenticate="Login1_Authenticate" >
            </asp:Login>
        </div>
    </form>
</body>
</html>
