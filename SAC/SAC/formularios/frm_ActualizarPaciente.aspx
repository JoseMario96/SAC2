<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ActualizarPaciente.aspx.cs" Inherits="SAC.formularios.frm_ActualizarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="Paciente">
            </asp:GridView>
            <asp:SqlDataSource ID="Paciente" runat="server" ConnectionString="<%$ ConnectionStrings:bd_sacConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_sacConnectionString.ProviderName %>" SelectCommand="SELECT cedulaPaciente, nombre1Paciente, apellido1Paciente, apellido2Paciente FROM tbl_paciente"></asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>
