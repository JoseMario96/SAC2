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
</head>
<body oncopy="return false" onpaste="return false">
    <header>
        <h1 style="text-align: center">Ventas</h1>
    </header>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <div class="container">
            <div class="row">

                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre"></asp:TextBox>
                    <label class="active" for="first_name2">Nombre:</label>
                </div>

                <div class="row">
                    <div id="grid">


                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                                <asp:GridView ID="Gridview_Paciente" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                    runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" AllowPaging="true" PageSize="3" OnRowDataBound="Gridview_Paciente_RowDataBound" OnSelectedIndexChanged="Gridview_Paciente_SelectedIndexChanged" OnPageIndexChanging="Gridview_Paciente_PageIndexChanging">
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
                </div>
                <div id="tabla" style="display: none">
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
                                        <asp:Label ID="lbl_codigo" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lbl_cedula" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lbl_fecha" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lbl_detalle" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lbl_monto" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lbl_saldo" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btn_volver" class="waves-effect waves-light btn" runat="server" Text="Volver" OnClick="btn_volver_Click" />
                </div>
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
