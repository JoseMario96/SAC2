<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_BuscarPaciente.aspx.cs" Inherits="SAC.formularios.frmBuscar" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>

    <style>
        .colorLetra {
            color: black;
        }

        .espacio {
            padding-top: 5%;
        }

        #formularioP {
            border: 1px solid white;
        }

            #formularioP.highlighted {
                border: 3px solid red;
            }

        label, th, tr {
            font-family: sans-serif;
            font-size: medium;
            color: black;
            font-size: 0.9rem;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <br />
                <br />

                <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                    runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                        <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                    </Columns>
                </asp:GridView>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script type="text/javascript" src="../js/quicksearch.js"></script>

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

            </div>
            <div id="formularioP" style="display: none" class="espacio centrar">
                <table class="striped">
                    <tr>
                        <th colspan="5" style="text-align: center; font-size: 15px;">Datos del paciente</th>
                    </tr>
                    <tr>
                        <th>N° de cédula</th>
                        <th>Primer nombre</th>
                        <th>Segundo nombre</th>
                        <th>Primer apellido</th>
                        <th>Segundo apellido</th>
                    </tr>
                    <tr class="colorLetra">
                        <td>
                            <label id="cedula" runat="server"></label>
                        </td>
                        <td>
                            <label id="nombre1" runat="server"></label>
                        </td>
                        <td>
                            <label id="nombre2" runat="server"></label>
                        </td>
                        <td>
                            <label id="apellido1" runat="server"></label>
                        </td>
                        <td>
                            <label id="apellido2" runat="server"></label>
                        </td>
                    </tr>

                    <tr>
                        <th>Teléfono</th>
                        <th>Celular</th>
                        <th>Correo</th>
                        <th>Sexo</th>
                        <th>Encargado</th>
                    </tr>
                    <tr>
                        <td>
                            <label id="telefono" runat="server"></label>
                        </td>
                        <td>
                            <label id="celular" runat="server"></label>
                        </td>
                        <td>
                            <label id="correo" runat="server"></label>
                        </td>
                        <td>
                            <label id="sexo" runat="server"></label>
                        </td>
                        <td>
                            <label id="Label1" type="text" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th>Fecha nacimiento</th>
                        <th>Fecha de inscripción</th>
                        <th>Dirección</th>
                    </tr>
                    <tr>
                        <td>
                            <label id="fechaN" runat="server"></label>

                        </td>
                        <td>
                            <label id="fechaI" runat="server"></label>
                        </td>
                        <td>
                            <label id="direcion" runat="server"></label>
                        </td>

                    </tr>
                </table>
            </div>

            <div id="encargado" style="display: none" tabindex="-1" class="espacio">
                <table class="striped">
                    <tr>
                        <th colspan="5" style="text-align: center">Datos del encargado</th>
                    </tr>

                    <tr>
                        <th>Cédula del encargado</th>
                        <th>Primer nombre</th>
                        <th>Segundo nombre</th>
                        <th>Primer apellido</th>
                        <th>Segundo apellido</th>
                    </tr>

                    <tr>
                        <td>
                            <label id="cedula_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="nombre1_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="nombre2_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="apellido1_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="apellido2_encargado" runat="server"></label>
                        </td>

                    </tr>

                    <tr>
                        <th>Teléfono</th>
                        <th>Celular</th>
                        <th>Correo electrónico</th>
                        <th>Parentezco con el menor</th>
                        <th>Género</th>
                    </tr>

                    <tr>
                        <td>
                            <label id="telefono_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="celular_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="correo_encargado" runat="server"></label>
                        </td>
                        <td>
                            <label id="parentezco" runat="server"></label>
                        </td>
                        <td>
                            <label id="sexoE" runat="server"></label>
                        </td>
                    </tr>

                    <tr>
                        <th colspan="5">Dirección</th>
                    </tr>
                    <tr>
                        <td>
                            <label id="direccion_encargado" runat="server"></label>
                        </td>
                    </tr>
                </table>

            </div>
        </form>
    </div>

    <script type="text/javascript">
        var valor = document.getElementById("Label1").innerHTML;
        if (valor == "Si") {
            document.getElementById('encargado').style.display = 'block';

        } else {
            document.getElementById('encargado').style.display = 'none';
        }
    </script>

    <script type="text/javascript"> 

        function mostrar() {
            document.getElementById('encargado').style.display = 'block';
        }

        function ocultar() {
            document.getElementById('encargado').style.display = 'none';

        }

    </script>
    <script src="js/materialize.min.js"></script>
</body>
</html>
