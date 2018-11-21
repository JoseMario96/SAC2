﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_BuscarPaciente.aspx.cs" Inherits="SAC.formularios.frmBuscar" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>

    <style>
        /*.colorLetra {
            color: black;
        }*/

        .espacio {
            padding-top: 5%;
        }

        #formularioP {
            border: 1px solid white;
        }

            #formularioP.highlighted {
                border: 3px solid red;
            }

        label, tr, th {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
        <div class="container">
            <header style="text-align: center">
                <h2>Busqueda de pacientes</h2>
            </header>
            <div class="row espacio">
                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre" onkeypress="return sololetras(event)" MaxLength="20"></asp:TextBox>
                    <label class="active" for="first_name2" style="font-family: sans-serif; font-size: x-large; color: black;">Nombre:</label>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                        <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                            runat="server" UseAccessibleHeader="true" AutoGenerateColumns="False" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="true" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnPreRender="GridView1_PreRender">
                            <Columns>
                                <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                                <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                                <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                                <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script type="text/javascript" src="../js/quicksearch.js"></script>

            </div>

            <div id="formularioP" style="display: none" class="espacio centrar" tabindex="-1">
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cedula" runat="server" title="Cédula"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombre1" runat="server" title="Nombre"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombre2" runat="server" title="Nombre"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="apellido1" runat="server" title="Primer apellido"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="apellido2" runat="server" title="Segundo apellido"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="telefono" runat="server" title="Teléfono"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="celular" runat="server" title="Celular"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="correo" runat="server" title="Correo"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="sexo" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="Label1" type="text" runat="server" title="Encargado" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <th>Fecha nacimiento</th>
                        <th>Fecha de inscripción</th>
                        <th>Dirección</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>

                                    <label id="fechaN" runat="server" title="Fecha nacimiento"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="fechaI" runat="server" title="Fecha inscripción"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="direcion" runat="server" title="Dirección"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>

                    </tr>
                </table>
            </div>

            <div id="encargado" style="display: none" class="espacio">
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cedula_encargado" runat="server" title="Cédula"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombre1_encargado" runat="server" title="Nombre"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombre2_encargado" runat="server" title="Nombre"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="apellido1_encargado" runat="server" title="Primer apellido"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="apellido2_encargado" runat="server" title="Segundo apellido"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="telefono_encargado" runat="server" title="Teléfono"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="celular_encargado" runat="server" title="Celular"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="correo_encargado" runat="server" title="Correo"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="parentezco" runat="server" title="Parentezco"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="sexoE" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>

                    <tr>
                        <th colspan="5">Dirección</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="direccion_encargado" runat="server" title="Dirección"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

            </div>

        </div>
    </form>
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

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("apellido1").required = false;
            document.getElementById("apellido2").required = false;
            $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                $('#<%=InvisButton.ClientID%>').click();
            });
        });


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

        function scrollToDiv() {
            document.getElementById('formularioP').scrollIntoView();
        }
    </script>

    <script src="js/materialize.min.js"></script>
</body>
</html>
