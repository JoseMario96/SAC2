<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarTratamiento.aspx.cs" Inherits="SAC.formularios.frm_AgregarTratamiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col s2">
                <label class="active" for="cedula">Tipos de tratamientos:</label>
            </div>
            <div class="col s6">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="356px">
                </asp:DropDownList>
            </div>

        </div>
    </form>
</body>
</html>
