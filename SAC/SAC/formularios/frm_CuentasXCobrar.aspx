<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_CuentasXCobrar.aspx.cs" Inherits="SAC.formularios.frm_CuentasXCobrar" EnableEventValidation="false" %>

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
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <header>
                <h2 style="text-align: center">Cuentas por cobrar</h2>
            </header>


            <div class="row">
                <div class="row">
                    <div class="input-field col s3 ">
                        <asp:TextBox ID="txtSearch" runat="server" title="Nombre" onkeypress="return sololetras(event)"  maxlength="20"></asp:TextBox>
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
                        <asp:GridView ID="Gridview_CxC" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" OnPageIndexChanging="Gridview_CxC_PageIndexChanging" Height="174px" OnRowDataBound="Gridview_CxC_RowDataBound" OnSelectedIndexChanged="Gridview_CxC_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="codigoVenta" HeaderText="Código" ItemStyle-Width="50">
                                    <ItemStyle Width="40px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula del paciente" ItemStyle-Width="90">
                                    <ItemStyle Width="40px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nombre1Paciente" HeaderText="Primer nombre" ItemStyle-Width="90">
                                    <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="apellido1Paciente" HeaderText="Segundo nombre" ItemStyle-Width="90">
                                    <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fechaVenta" HeaderText="Fecha" ItemStyle-Width="70">
                                    <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="montoTotalVenta" HeaderText="Monto" ItemStyle-Width="60">
                                    <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="saldoVenta" HeaderText="Saldo" ItemStyle-Width="60">
                                    <ItemStyle Width="60px" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#3AC0F2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                            <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


            <div id="abonosNo" style="display: none">
                <div class="row">
                    <div class="col s5">
                        <h5><b>>Detalle de la venta y desglose de abonos:</b></h5>
                    </div>
                </div>
                <p style="font-weight: bold; font-size: medium">Detalle:</p>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lbl_detalle1" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label runat="server">No hay abonos registrados</asp:Label>
            </div>

            <div id="cabecera" style="display: none">
                <div class="row">
                    <div class="col s7">
                        <h5><b>Detalle de la venta y desglose de abonos:</b></h5>
                    </div>
                </div>
                <p style="font-weight: bold; font-size: medium">Detalle:</p>
                <div class="row">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lbl_detalle" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="row">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px">
                                <Columns>
                                    <asp:BoundField DataField="codigo_abono" HeaderText="Código del abono" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="codigoVenta" HeaderText="Código de la venta" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaAbono" HeaderText="Fecha del abono" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="montoAbono" HeaderText="Monto abonado" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>

                                <HeaderStyle BackColor="#3AC0F2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div id="seccionAbono" class="row" style="display: none">
                <div class="row">
                    <div class="col s7">
                        <h5><b>Abono nuevo:</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="txt_abono" style="font-size: medium; color: black">Monto del abono</label>
                                <input id="txt_abono" type="number" runat="server" title="Monto del abono" class="validate" onkeydown="return solonumeros(event)" />
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
            <script src="js/materialize.min.js"></script>
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
            <script type="text/javascript" src="../js/quicksearch.js"></script>



        </form>
    </div>
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
