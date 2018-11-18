<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Odontograma.aspx.cs" EnableEventValidation="false" Inherits="SAC.formularios.frm_Odontograma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>
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
    <style>
        .espacio {
            padding-top: 5%;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
        <%-- <asp:TextBox ID="BudquedaExp" runat="server" OnTextChanged="BudquedaExp_TextChanged"></asp:TextBox>--%>

        <div class="container">
            <div class="row espacio">
                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre"></asp:TextBox>
                    <label class="active" for="first_name2">Nombre:</label>
                </div>

            </div>

            <div class="row">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                        <asp:GridView ID="GridView_reporteOdontograma" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                            runat="server" AutoGenerateColumns="False" Height="174px" AllowPaging="true" PageSize="3" OnSelectedIndexChanged="GridView_reporteOdontograma_SelectedIndexChanged" OnPageIndexChanging="GridView_reporteOdontograma_PageIndexChanging" OnRowDataBound="GridView_reporteOdontograma_RowDataBound">
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

            <div id="dienteOdontograma" style="display: block" tabindex="1">
                <div class="row">
                    <div class="col s6">
                        <asp:ImageButton ID="ibOdontogramaG" runat="server" src="../images/diente.png" Height="60px" Width="125px" OnClick="ibOdontogramaG_Click" />
                    </div>

                    <div class="col s6">
                        <asp:ImageButton ID="ibOdontogramaN" runat="server" src="../images/diente.png" Height="60px" Width="125px" OnClick="ibOdontogramaN_Click" />
                    </div>
                </div>
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
