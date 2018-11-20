<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarVenta.aspx.cs" Inherits="SAC.formularios.frm_AgregarVenta" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>
    <title></title>

    <style>
        .espacio {
            padding-top: 5%;
        }

        label, th, tr {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>

</head>
<body oncopy="return false" onpaste="return false">
    <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <header>
                <h2 style="text-align: center">Ventas</h2>
            </header>



            <div class="row">
                <div class="row">
                    <div class="input-field col s3 ">
                        <asp:TextBox ID="txtSearch" runat="server" title="Nombre" onkeypress="return sololetras(event)" MaxLength="20"></asp:TextBox>
                        <label class="active" for="first_name2" style="font-family: sans-serif; font-size: x-large; color: black;">Nombre:</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <h5><b>Pacientes pendientes de pago:</b></h5>
                    </div>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                        <asp:GridView ID="Gridview_Paciente" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" Height="174px" Width="100%" OnSelectedIndexChanged="Gridview_Paciente_SelectedIndexChanged" OnPageIndexChanging="Gridview_Paciente_PageIndexChanging" OnRowDataBound="Gridview_Paciente_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula del paciente" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer nombre" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre2Paciente" HeaderText="Segundo nombre" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer apellido" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo apellido" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="cabecera" style="display: none">
                <div class="row">
                    <div class=" col s12">
                        <h5><b>Detalle del pago:</b></h5>
                    </div>
                </div>

                <div class="row">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="nombreTratamiento" HeaderText="Tratamiento" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaExpedienteTratamiento" HeaderText="Fecha y hora" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcionExpedienteTratamiento" HeaderText="Descripción" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="precioTratamiento" HeaderText="Monto" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



                <div class="row">
                    <div class="col s4">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="txt_abono" style="font-size: medium; color: black">Abono</label>
                                <input id="txt_abono" type="number" runat="server" class="validate" title="Monto Abono" onkeydown="return solonumeros(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s4">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="txt_extra" title="Extra" style="font-size: medium; color: black">Extra</label>
                                <input id="txt_extra" type="number" runat="server" title="Monto extra" class="validate" onkeydown="return solonumeros(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s4">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <center><label id="lbl_totalTitulo" runat="server" style="font-size: medium; color: black">Total: ₡</label>
                                <label id="lbl_total" runat="server" style="font-size: medium; color: black"></label></center>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col s5"></div>
                    <div class="col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_factura" runat="server" Text="Guardar" OnClick="btn_factura_Click" />
                    </div>
                    <div class="col s5"></div>
                </div>

            </div>
        </form>
    </div>

    <script type="text/javascript">
        function solonumeros(e) {
            key = e.keyCoden || e.which;
            teclado = String.fromCharCode(key);
            numero = "1234567890";
            especiales = "8-37-38-46";
            teclado_especial = false;
            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true;
                }
            }
            if (numero.indexOf(teclado) == -1 && !teclado_especial) {
                return false;
            }
        }
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>

    <script type="text/javascript">
        function sololetras(e) {
            key = e.keyCoden || e.which;
            teclado = String.fromCharCode(key).toLowerCase();
            letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
            especiales = "8-37-38-46-164";
            teclado_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true; break;

                }

            }
            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                return false;

            }
        }

        $(document).ready(function () {
            $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                $('#<%=InvisButton.ClientID%>').click();

            });
        });
    </script>
</body>
</html>
