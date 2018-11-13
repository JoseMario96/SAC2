<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ReporteCxC.aspx.cs" Inherits="SAC.formularios.frm_ReporteCxC" EnableEventValidation="false" %>

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
        <h1 style="text-align:center">Reporte de cuentas por cobrar</h1>
    </header>
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <div class="col s4">
                        <asp:Button ID="btn_todos" runat="server" Text="Descargar reporte" class="waves-effect waves-light btn" OnClick="btn_todos_Click" />
                </div>
                <div class="col s4">
                        <asp:Button ID="btn_uno" runat="server" Text="Pacientes" class="waves-effect waves-light btn" OnClick="btn_uno_Click" />
                </div>
                <br />
                <br />
                <div id="busqueda" style="display:block">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Gridview_Venta" aligne="center" HeaderStyle-BackColor="#008281" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" OnRowDataBound="Gridview_Venta_RowDataBound" OnSelectedIndexChanged="Gridview_Venta_SelectedIndexChanged" OnDataBound="Gridview_Venta_DataBound" >
                                <Columns>
                                    <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula del paciente" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Nombre1Paciente" HeaderText="Primer nombre" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Nombre2Paciente" HeaderText="Segundo nombre" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="apellido1Paciente" HeaderText="primer apellido" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo apellido" ItemStyle-Width="100">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                                
                                <HeaderStyle BackColor="#008281" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                                <PagerStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                
                <script src="js/materialize.min.js"></script>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script type="text/javascript" src="../js/quicksearch.js"></script>

                <script type="text/javascript">
                    $(function () {
                        $('.search_textbox').each(function (i) {
                            $(this).quicksearch("[id*=Gridview_Venta] tr:not(:has(th))", {
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
