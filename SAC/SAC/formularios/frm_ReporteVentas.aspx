<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ReporteVentas.aspx.cs" Inherits="SAC.formularios.frm_ReporteVentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.css" rel="stylesheet" />
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
    <header>
        <h2 style="text-align: center">Reporte de ventas</h2>
    </header>
    <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <div class="row espacio">
                <div class="col s2"></div>
                <div class="col s4">
                    <label class="active" for="txt_fecha1" style="font-size: medium">Fecha inicio</label>
                    <input id="txt_fecha1" type="date" runat="server" title="Fecha de inicio" class="validate" required />
                </div>
                <div class="col s4">
                    <label class="active" for="txt_fecha2" style="font-size: medium">Fecha fin</label>
                    <input id="txt_fecha2" type="date" runat="server" title="Fecha de fin" class="validate" required />
                </div>
                <div class="col s1" style="padding: 0px 0px 0px 0px;">
                    <asp:Button ID="btn_buscar" runat="server" Text="Buscar" class="waves-effect waves-light btn" OnClick="btn_buscar_Click" />
                </div>
            </div>

            <div id="busqueda" style="display: none" class="row">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" Height="174px" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="codigoVenta" HeaderText="Código" ItemStyle-Width="100">
                                    <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="100">
                                    <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DATE_FORMAT(tbl_venta.fechaVenta,'%d-%m-%Y')" HeaderText="Fecha" ItemStyle-Width="100">
                                    <ItemStyle Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="detalleVenta" HeaderText="Detalle" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="montoTotalVenta" HeaderText="Monto" ItemStyle-Width="100">
                                    <ItemStyle Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="saldoVenta" HeaderText="Saldo" ItemStyle-Width="100">
                                    <ItemStyle Width="70px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="row" id="monto">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label id="lbl_totalTitulo" runat="server" style="padding-left: 70%; font-size: medium; color: black; font-weight: bold">Total: ₡</label>
                            <label id="lbl_total" runat="server" style="font-size: medium; color: black; font-weight: bold"></label>
                            <label id="lbl_saldoTitulo" runat="server" style="font-size: medium; color: black; font-weight: bold">| Total: ₡</label>
                            <label id="lbl_saldo" runat="server" style="font-size: medium; color: black; font-weight: bold"></label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="row">
                    <div class="col s5"></div>
                    <div class="col s2">
                        <asp:Button ID="btn_descargar" runat="server" Text="Descargar reporte" class="waves-effect waves-light btn" Style="margin-top=" OnClick="btn_descargar_Click" />
                    </div>
                    <div class="col s5"></div>
                </div>
            </div>
        </form>
        <script>
            function scrollreporte() {
                document.getElementById('monto').scrollIntoView();
            }
        </script>
    </div>
</body>
</html>
