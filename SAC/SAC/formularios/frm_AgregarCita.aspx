<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarCita.aspx.cs" EnableEventValidation="false" Inherits="SAC.formularios.frm_AgregarCita" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>

    <style>
        label, th, tr {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">

    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <header style="text-align: center">
                    <h2>Citas del día</h2>
                </header>
                <div class="row">
                    <div class="col s12">
                        <h5>
                       <b><asp:Label ID="Label1" runat="server" Style="text-align: center; font-size: medium">Fecha:</asp:Label>
                        <asp:Label ID="titulo" runat="server" Style="text-align: center; font-size: medium"></asp:Label></b></h5>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                    runat="server" AutoGenerateColumns="False" Height="174px">
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
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="js/materialize.min.js"></script>

</body>
</html>
