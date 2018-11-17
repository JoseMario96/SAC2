<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarVenta.aspx.cs" Inherits="SAC.formularios.frm_AgregarVenta" EnableEventValidation="false" %>

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
        <h1 style="text-align:center">Ventas</h1>
    </header>
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <div style="padding-left:10%">
                    <h3 style="text-align:center">Pacientes pendientes de pago</h3>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Paciente" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" OnSelectedIndexChanged="Gridview_Paciente_SelectedIndexChanged" OnRowDataBound="Gridview_Paciente_RowDataBound" OnDataBound="Gridview_Paciente_DataBound">
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
                                <HeaderStyle BackColor="#3AC0F2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
                <br />
                <br />
                <div id="cabecera" style="padding-left:10%; display:none">
                    <h3 style="text-align:center">Detalle del pago</h3>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" >
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
                                
                                <HeaderStyle BackColor="#3AC0F2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label id="lbl_totalTitulo" runat="server" style="padding-left:75%; font-size:medium; color:black">Total: ₡</label>
                            <label id="lbl_total" runat="server" style="font-size:medium; color:black"></label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <div class="row">
                        <div class="col s4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="txt_abono" style="font-size:medium; color:black">Abono</label>
                                    <input id="txt_abono" type="number" runat="server" class="validate" onkeydown="return solonumeros(event)" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col s4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="txt_extra" style="font-size:medium; color:black">Extra</label>
                                    <input id="txt_extra" type="number" runat="server" class="validate" onkeydown="return solonumeros(event)" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col s4">
                            <asp:Button class="waves-effect waves-light btn" ID="btn_factura" runat="server" Text="Guardar" OnClick="btn_factura_Click" />
                        </div>
                    </div>
                </div>
                
            </form>
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script type="text/javascript" src="../js/quicksearch.js"></script>

                <script type="text/javascript">
                    $(function () {
                        $('.search_textbox').each(function (i) {
                            $(this).quicksearch("[id*=Gridview_Paciente] tr:not(:has(th))", {
                                'testQuery': function (query, txt, row) {
                                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                                }
                            });
                        });
                    });
                </script>
</body>
</html>
