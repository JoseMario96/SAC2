<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_BuscarVenta.aspx.cs" Inherits="SAC.formularios.frm_BuscarVenta" EnableEventValidation="false" %>

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

        label, tr, th {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <header>
        <h2 style="text-align: center">Busqueda de ventas</h2>
    </header>
    <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <div id="grid" class="row espacio">
 <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre"></asp:TextBox>
                    <label class="active" for="first_name2">Nombre:</label>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
<asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                        <asp:GridView ID="Gridview_Paciente" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" AllowPaging="true" PageSize="3" OnPageIndexChanging="Gridview_Paciente_PageIndexChanging" OnRowDataBound="Gridview_Paciente_RowDataBound" OnSelectedIndexChanged="Gridview_Paciente_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="codigoVenta" HeaderText="Código" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer nombre" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer apellido" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fechaVenta" HeaderText="Fecha" ItemStyle-Width="100">
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

            <div id="tabla" style="display: none" class="espacio">
                <table class="striped">
                    <tr>
                        <th colspan="6" style="text-align: center">Detalles de la venta</th>
                    </tr>
                    <tr>
                        <th>Código</th>
                        <th>Cédula</th>
                        <th>Fecha</th>
                        <th>Detalle</th>
                        <th>Monto total</th>
                        <th>Saldo</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_codigo" runat="server" title="Código" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_cedula" runat="server" title="Cédula" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_fecha" runat="server" title="Fecha" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_detalle" runat="server" title="Detalle" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_monto" runat="server" title="Monto" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_saldo" runat="server" tile="Saldo" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <div class="row espacio">
                    <div class="col s5"></div>
                    <div class="col s2">
                        <asp:Button ID="btn_volver" class="waves-effect waves-light btn" runat="server" Text="Volver" OnClick="btn_volver_Click" />
                    </div>
                    <div class="col s5"></div>
                </div>
            </div>
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
            <script type="text/javascript" src="../js/quicksearch.js"></script>

            </div>
        </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                $('#<%=InvisButton.ClientID%>').click();
            });
        });
    </script>
</body>
</html>
