<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="frm_ActualizarPaciente.aspx.cs" Inherits="SAC.formularios.frm_ActualizarPaciente" EnableEventValidation="false" %>

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
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
        <div class="container">

            <div class="row espacio">
                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre"></asp:TextBox>
                    <label class="active" for="first_name2">Nombre:</label>
                </div>

                <div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                            <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cedula" runat="server" class="validate" maxlength="44" required onkeypress="return solonumeros(event)"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="nombre1" runat="server" class="validate" MaxLength="44" required onkeypress="return sololetras(event)"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="nombre2" runat="server" class="validate" MaxLength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="apellido1" runat="server" class="validate" MaxLength="44" required onkeypress="return sololetras(event)"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="apellido2" runat="server" class="validate" MaxLength="44" required onkeypress="return sololetras(event)"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="telefono" runat="server" class="validate" MaxLength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="celular" runat="server" class="validate" MaxLength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="correo" runat="server" class="validate" MaxLength="44" required></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>

                                        <input class="with-gap" name="group6" runat="server" type="radio" id="generoM" />

                                        <span>Masculino</span>

                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>

                                        <input class="with-gap" name="group6" runat="server" type="radio" id="generoF" />

                                        <span>Femenino</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>

                                        <input class="with-gap" name="group6" runat="server" type="radio" id="generoO" />

                                        <span>Otro</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>

                                        <input class="with-gap" name="group4" runat="server" type="radio" id="SiE" onclick="mostrar()" />

                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>

                                        <input class="with-gap" name="group4" runat="server" type="radio" id="NoE" onclick="ocultar()" />

                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>

                    <tr>
                        <th>Fecha de nacimiento</th>
                        <th>Fecha de inscripción</th>
                        <th>Dirección</th>

                    </tr>

                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="fechaN" runat="server" required onkeypress="return solofechas(event)"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="fechaI" runat="server" required onkeypress="return solofechas(event)"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="direccion" runat="server" class="validate" MaxLength="249" required></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="Panel1" runat="server">

                    <div id="encargado" class="espacio" tabindex="-1">
                        <div>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="actualizarE_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="cedula_encargado" runat="server" OnTextChanged="cedula_encargado_TextChanged" AutoPostBack="true" class="validate" MaxLength="14" onkeypress="return solonumeros(event)"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="nombre1_encargado" runat="server" class="validate" MaxLength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="nombre2_encargado" runat="server" class="validate" MaxLength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="apellido1_encargado" runat="server" class="validate" MaxLength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="apellido2_encargado" runat="server" class="validate" MaxLength="44" onkeypress="return sololetras(event)"></asp:TextBox>
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
                                            <asp:TextBox ID="telefono_encargado" runat="server" class="validate" MaxLength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="celular_encargado" runat="server" class="validate" MaxLength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="correo_encargado" runat="server" class="validate" MaxLength="44"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="parentezco" runat="server" class="validate" MaxLength="44" onkeypress="return sololetras(event)"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <label>

                                                <input class="with-gap" name="group5" runat="server" type="radio" id="generoEM" />

                                                <span>Masculino</span>
                                            </label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <label>

                                                <input class="with-gap" name="group5" runat="server" type="radio" id="generoEF" />

                                                <span>Femenino</span>
                                            </label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <label>

                                                <input class="with-gap" name="group5" runat="server" type="radio" id="generoEO" />

                                                <span>Otro</span>
                                            </label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>

                            <tr>
                                <th>Dirección</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="direccion_encargado" runat="server" class="validate" MaxLength="249"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>

                </asp:Panel>
            </div>
            <div id="Botones" style="display: none">
                <div class="row">
                    <div class="input-field col s4">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="input-field col s4">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                function solofechas(e) {
                    key = e.keyCoden || e.which;
                    teclado = String.fromCharCode(key);
                    numero = "1234567890/";
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

        </div>
    </form>
    <script type="text/javascript">

                $(document).ready(function () {


                    $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                        document.getElementById("cedula").required = false;
                        document.getElementById("nombre1").required = false;
                        document.getElementById("apellido1").required = false;
                        document.getElementById("apellido2").required = false;
                        document.getElementById("celular").required = false;
                        document.getElementById("correo").required = false;
                        document.getElementById("fechaN").required = false;
                        document.getElementById("fechaI").required = false;
                        document.getElementById("direccion").required = false;
                        $('#<%=InvisButton.ClientID%>').click();

                    });
                });

    </script>
    <script src="js/materialize.min.js"></script>

</body>
</html>
