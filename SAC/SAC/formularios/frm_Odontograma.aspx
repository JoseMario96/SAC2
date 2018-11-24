<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="frm_Odontograma.aspx.cs" EnableEventValidation="false" Inherits="SAC.formularios.frm_Odontograma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>
    <%--    <script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=GridView1] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>--%>
    <style>
        .boton1 {
            width: 123px;
            height: 150px;
            background-image: url(../images/odontoAdultos.png);
            border: 0px;
        }

        .boton2 {
            width: 123px;
            height: 150px;
            background-image: url(../images/odontoNiños.png);
            border: 0px;
            overflow: hidden;
        }

        .boton1:hover {
            -webkit-transform: scale(1.25);
            -moz-transform: scale(1.25);
            -ms-transform: scale(1.25);
            -o-transform: scale(1.25);
            transform: scale(1.25);
        }

        .boton2:hover {
            -webkit-transform: scale(1.25);
            -moz-transform: scale(1.25);
            -ms-transform: scale(1.25);
            -o-transform: scale(1.25);
            transform: scale(1.25);
        }

        .espacio {
            padding-top: 5%;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
        <header style="text-align: center">
            <h2>Odontograma</h2>
        </header>
        <div class="container">
            <div class="row espacio">
                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre" onkeypress="return sololetras(event)" MaxLength="20"></asp:TextBox>
                    <label class="active" for="first_name2" style="font-family: sans-serif; font-size: x-large; color: black;">Nombre:</label>
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
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div id="dienteOdontograma" class="row espacio" style="display: none">
                        <div class="row">
                            <center>
                    <div class="col s2"></div>
                    <div class="col s4">
                        <asp:ImageButton CssClass="boton1" ID="ibOdontogramaG" runat="server" title="Odontograma de Adultos" src="../images/odontoAdultos.png" OnClick="ibOdontogramaG_Click" />
                    </div>
                    <div class="col s4">
                        <asp:ImageButton CssClass="boton2" ID="ibOdontogramaN" runat="server"  title="Odontograma de Niños" src="../images/odontoNiños.png" OnClick="ibOdontogramaN_Click" />
                    </div>
                    <div class="col s2"></div>
                </center>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </form>
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

        function scrollOdonto() {
            document.getElementById('dienteOdontograma').scrollIntoView();
        }

    </script>
    <script>
        function scrollToDiv() {
            document.getElementById('dienteOdontograma').scrollIntoView();
            //setTimeout(scrollToDiv, 1);
        }
    </script>
</body>
</html>
