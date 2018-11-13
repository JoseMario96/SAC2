<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_CuentasXCobrar.aspx.cs" Inherits="SAC.formularios.frm_CuentasXCobrar" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>
    <title></title>
</head>
<body>
    <header>
        <h1 style="text-align:center">Cuentas por cobrar</h1>
    </header>
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <div style="padding-left:5%">
                    <h4 style="text-align:center">Pacientes pendientes de pago</h4>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_CxC" aligne="center" HeaderStyle-BackColor="#008281" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="90%" OnRowDataBound="Gridview_CxC_RowDataBound" OnSelectedIndexChanged="Gridview_CxC_SelectedIndexChanged" OnDataBound="Gridview_CxC_DataBound">
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
                                <HeaderStyle BackColor="#008281" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
                <br />
                <br />
                <div id="abonosNo" style="padding-left:5%; display:none">
                    <h4 style="text-align:center">Detalle de la venta y desglose de abonos</h4>
                    <p style="font-weight:bold; font-size:medium">Detalle:</p>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lbl_detalle1" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <br />
                    <asp:Label runat="server">No hay abonos registrados</asp:Label>  
                    <br />
                    <br />
                </div>
                <div id="cabecera" style="padding-left:5%; display:none">
                    <h4 style="text-align:center">Detalle de la venta y desglose de abonos</h4>
                    <p style="font-weight:bold; font-size:medium">Detalle:</p>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lbl_detalle" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#008281" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="90%" >
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
                                
                                <HeaderStyle BackColor="#008281" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <br />
                </div>
                    <div id="seccionAbono" class="row" style="padding-left:5%; display:none">
                        <h4>Abono nuevo</h4>
                        <div class="col s4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="txt_abono" style="font-size:medium; color:black">Monto del abono</label>
                                    <input id="txt_abono" type="number" runat="server" class="validate" onkeypress="return solonumeros(event)" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col s4">
                            <asp:Button class="waves-effect waves-light btn" ID="btn_factura" runat="server" Text="Guardar" OnClick="btn_factura_Click" />
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

                <script type="text/javascript">
                    $(function () {
                        $('.search_textbox').each(function (i) {
                            $(this).quicksearch("[id*=Gridview_CxC] tr:not(:has(th))", {
                                'testQuery': function (query, txt, row) {
                                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                                }
                            });
                        });
                    });
                </script>
            </form>
        </div>
    </div>
    
</body>
</html>
