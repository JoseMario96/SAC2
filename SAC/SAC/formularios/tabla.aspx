<%@ Page Language="C#" CodeBehind="tabla.aspx.cs" Inherits="SAC.formularios.tabla" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />

    <style>
        table thead {
            color: #000;
            background-color: #3AC0F2;
        }

        table {
            width: 70%;
            margin: auto;
        }

        .auto-style1 {
            left: 4px;
            top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="BudquedaExp" runat="server" OnTextChanged="BudquedaExp_TextChanged"  AutoPostBack="true"></asp:TextBox>

        <br />
        <br />
        <h5>Tratamientos Efectuados</h5>
        <br />
        <div style="margin-left: auto; margin-right: auto;">
            <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                runat="server" AutoGenerateColumns="False" Height="174px" Width="70%" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                    <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                    <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                    <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="row">

            <div class="col s10">
            </div>
            <div class="col s1">
                <asp:Button ID="AgregarDetalle" runat="server" Text="+" class="waves-effect waves-light btn" OnClick="AgregarDetalle_Click" />
            </div>
        </div>

        <div id="tablaDetalle" style="display: none" tabindex="-1">
            <div class="row">
                <div class="col s3">
                    <label class="active" for="Fecha">Fecha </label>
                    <asp:Label ID="fecha" runat="server" Text=""></asp:Label>
                </div>
                <div class="col s3">
                    <label class="active" for="Descripción">Descripción </label>
                    <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento"></asp:DropDownList>
                </div>
                <div class="col s3">
                    <label class="active" for="Debe">Debe </label>
                    <input type='text' name='debe' />
                </div>
            </div>
            <div class="row">
                <div class="col s3">
                    <label class="active" for="Diente">Diente</label>
                    <input type='text' name='dient' />
                </div>
                <div class="col s3">
                    <label class="active" for="Abono">Abono</label>
                    <input type='text' name='abono' />
                </div>
                <div class="col s3">
                    <label class="active" for="Saldo">Saldo</label>
                    <input type='text' name='saldo' />
                </div>
            </div>
        </div>
        <asp:Button ID="guardar" runat="server" Text="" OnClick="guardar_Click" />
        <script>
            var f = new Date();
            document.getElementById('fecha').innerHTML = f.toLocaleDateString();;
        </script>
    </form>
</body>
</html>
