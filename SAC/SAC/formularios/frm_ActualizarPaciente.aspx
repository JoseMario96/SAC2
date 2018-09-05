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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="PACIENTES">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre">
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="apellido1Paciente" HeaderText="Primero Apellido">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="PACIENTES" runat="server" ConnectionString="<%$ ConnectionStrings:bd_sacConnectionStringPaciente %>" ProviderName="<%$ ConnectionStrings:bd_sacConnectionStringPaciente.ProviderName %>" SelectCommand="SELECT [cedulaPaciente], [nombre1Paciente], [apellido1Paciente], [apellido2Paciente] FROM [tbl_paciente]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
