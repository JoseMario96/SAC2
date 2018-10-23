<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ActualizarPaciente.aspx.cs" Inherits="SAC.formularios.frm_ActualizarPaciente" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>
    <style>
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
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <br />
                <br />

                <div>
                    <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                        runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                            <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                            <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                            <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />

                        </Columns>
                    </asp:GridView>

                </div>
                <br />
            </div>

            <div id="formularioP" style="display: none" tabindex="-1">

                <table class="striped">
                    <tr>
                        <th colspan="5" style="text-align: center">Registro de pacientes</th>
                    </tr>
                    <tr>
                        <th>Cédula</th>
                        <th>Primer nombre</th>
                        <th>Segundo nombre</th>
                        <th>Primer apellido</th>
                        <th>Segundo apellido</th>
                    </tr>

                    <tr>
                        <td>
                            <label id="cedula" runat="server" class="validate" maxlength="44" required onkeypress="return solonumeros(event)"></label>

                        </td>
                        <td>
                            <asp:TextBox ID="nombre1" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="nombre2" runat="server" class="validate" maxlength="44"  onkeypress="return sololetras(event)"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="apellido1" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="apellido2" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th>Teléfono</th>
                        <th>Celulare</th>
                        <th>Correo electrónico</th>
                        <th>Sexo</th>
                        <th>Encargado</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="telefono" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                        </td>
                        <td>

                            <asp:TextBox ID="celular" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required></asp:TextBox>
                        </td>
                        <td>

                            <asp:TextBox ID="correo" runat="server" class="validate" maxlength="44" required></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="generoM" />
                                <span>Masculino</span>
                            </label>

                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="generoF" />
                                <span>Femenino</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="generoO" />
                                <span>Otro</span>
                            </label>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group4" runat="server" type="radio" id="SiE" onclick="mostrar()" />
                                <span>Sí</span>
                            </label>

                            <label>
                                <input class="with-gap" name="group4" runat="server" type="radio" id="NoE" onclick="ocultar()" />
                                <span>No</span>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th>Fecha de nacimiento</th>
                        <th>Fecha de inscripción</th>
                        <th>Dirección</th>

                    </tr>

                    <tr>
                        <td>

                            <asp:TextBox ID="fechaN" runat="server" required></asp:TextBox>
                        </td>
                        <td>

                            <asp:TextBox ID="fechaI" runat="server" required></asp:TextBox>
                        </td>
                        <td>

                            <asp:TextBox ID="direccion" runat="server" class="validate" maxlength="249"  required></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="Panel1" runat="server">

                    <div id="encargado" class="espacio" tabindex="-1">
                        <div>
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="actualizarE_Click" />
                        </div>

                        <table class="striped">

                            <tr>
                                <th colspan="5" style="text-align: center">Encargado</th>
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

                                    <asp:TextBox ID="cedula_encargado" runat="server" OnTextChanged="cedula_encargado_TextChanged" AutoPostBack="true" class="validate" MaxLength="14" onkeypress="return solonumeros(event)" ></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox ID="nombre1_encargado" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="nombre2_encargado" runat="server" class="validate" maxlength="44"  onkeypress="return sololetras(event)"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox ID="apellido1_encargado" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox ID="apellido2_encargado" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)"></asp:TextBox>
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
                                    <asp:TextBox ID="telefono_encargado" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox ID="celular_encargado" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox ID="correo_encargado" runat="server" class="validate" maxlength="44"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="parentezco" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                </td>
                                <td>
                                    <label>
                                        <input class="with-gap" name="group5" runat="server" type="radio" id="generoEM" />
                                        <span>Masculino</span>
                                    </label>

                                    <label>
                                        <input class="with-gap" name="group5" runat="server" type="radio" id="generoEF" />
                                        <span>Femenino</span>
                                    </label>
                                    <label>
                                        <input class="with-gap" name="group5" runat="server" type="radio" id="generoEO" />
                                        <span>Otro</span>
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <th>Dirección</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="direccion_encargado" runat="server"  class="validate" maxlength="249"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>

                </asp:Panel>
            </div>
            <div id="Botones" style="display: none">
                <div class="row">
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                    </div>
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                function mostrar() {
                    document.getElementById('encargado').style.display = 'block';
                }
                function ocultar() {
                    document.getElementById('encargado').style.display = 'none';
                }

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
            </script>
        </form>
    </div>
    <script src="js/materialize.min.js"></script>
</body>
</html>

