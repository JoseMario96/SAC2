<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarCita.aspx.cs" EnableEventValidation="false" Inherits="SAC.formularios.frm_AgregarCita" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../css/materialize.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
</head>
<body>
    <header style="text-align: center">
        <h2>CITAS DE HOY</h2>
    </header>
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <div style="padding-left:15%; padding-top:5%">
                    <asp:Label ID="titulo" runat="server" style="text-align:center; font-size:medium"></asp:Label>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#008281" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="80%">
                                <Columns>
                                    <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula del paciente" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre del paciente" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="horaCita" HeaderText="Hora de la cita" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="telefonoCita" HeaderText="Contacto" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                        <HeaderStyle BackColor="#008281" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                        <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </form>
        </div>
    </div>
    <script src="js/materialize.min.js"></script>
    
</body>
</html>
