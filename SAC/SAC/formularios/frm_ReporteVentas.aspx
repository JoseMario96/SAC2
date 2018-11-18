<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ReporteVentas.aspx.cs" Inherits="SAC.formularios.frm_ReporteVentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../css/materialize.css" rel="stylesheet" />
    <title></title>
</head>
<body oncopy="return false" onpaste="return false">
    <header>
        <h1 style="text-align:center">Reporte de ventas</h1>
    </header>
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <div class="row">
                    <div class="col s2"></div>
                    <div class="col s4">
                        <label class="active" for="txt_fecha1" style="font-size:medium">Fecha inicio</label>
                        <input id="txt_fecha1" type="date" runat="server" class="validate" required/>
                    </div>
                    <div class="col s4">
                        <label class="active" for="txt_fecha2" style="font-size:medium">Fecha fin</label>
                        <input id="txt_fecha2" type="date" runat="server" class="validate" required/>
                    </div>
                    <div class="col s5"></div>
                    <div class="col s2">
                        <asp:Button ID="btn_buscar" runat="server" Text="Buscar" class="waves-effect waves-light btn" OnClick="btn_buscar_Click" />
                    </div>
                </div>
                <div id="busqueda" style="display:none">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" >
                                <Columns>
                                    <asp:BoundField DataField="codigoVenta" HeaderText="Código" ItemStyle-Width="100">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="100">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaVenta" HeaderText="Fecha" ItemStyle-Width="100">
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
                                
                                <HeaderStyle BackColor="#3AC0F2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label id="lbl_totalTitulo" runat="server" style="padding-left:70%; font-size:medium; color:black; font-weight:bold">Total: ₡</label>
                            <label id="lbl_total" runat="server" style="font-size:medium; color:black; font-weight:bold"></label>
                            <label id="lbl_saldoTitulo" runat="server" style="font-size:medium; color:black; font-weight:bold">| Total: ₡</label>
                            <label id="lbl_saldo" runat="server" style="font-size:medium; color:black; font-weight:bold"></label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Button ID="btn_descargar" runat="server" Text="Descargar reporte" class="waves-effect waves-light btn" OnClick="btn_descargar_Click" />
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>
