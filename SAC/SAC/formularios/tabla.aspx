<%@ Page Language="C#" CodeBehind="tabla.aspx.cs" Inherits="SAC.formularios.tabla" AutoEventWireup="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    </style>
    <script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=GridView1] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <asp:TextBox ID="BudquedaExp" runat="server" OnTextChanged="BudquedaExp_TextChanged"></asp:TextBox>

        <br />
        <br />
        <h5>Tratamientos Efectuados</h5>


        <br />

        <div style="margin-left: auto; margin-right: auto;">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                    <asp:GridView ID="gvBanquet" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                        runat="server" AutoGenerateColumns="False" Height="174px" Width="70%" HorizontalAlign="Center" AllowPaging="true" PageSize="2" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                            <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                            <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                            <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <div class="row">
            <div class="col s10">
            </div>
            <div class="col s1">
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
