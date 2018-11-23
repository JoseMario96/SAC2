﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarPaciente.aspx.cs" Inherits="SAC.formularios.frm_AgregarPaciente" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
    <style>
        label {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }

        #encargado {
            border: 1px solid white;
        }

            #encargado.highlighted {
                border: 3px solid red;
            }

        .espacio {
            padding-top: 5%;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <header>
        <h2 style="text-align: center">Registro de pacientes</h2>
    </header>
    <div class="container">
        <form runat="server">
            <div class="row">
                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>
                <div class="row espacio">
                    <div class="col s6">
                        <label class="active" for="cedula">Cédula </label>
                        <asp:TextBox ID="cedula" runat="server" class="validate" MaxLength="14" title="Cédula" required onkeypress="return solonumeros(event)" AutoPostBack="true" OnTextChanged="cedula_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="nombre1">Primer Nombre</label>
                        <input id="nombre1" type="text" runat="server" class="validate" maxlength="44" title="Nombre" required onkeypress="return sololetras(event)" />

                    </div>
                    <div class="col s6">
                        <label class="active" for="nombre2">Segundo Nombre</label>
                        <input id="nombre2" type="text" runat="server" class="validate" maxlength="44" title="Nombre" onkeypress="return sololetras(event)" />

                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="apellido1">Primer Apellido </label>
                        <input id="apellido1" type="text" runat="server" class="validate" maxlength="44" title="Primer Apellido" required onkeypress="return sololetras(event)" />

                    </div>
                    <div class="col s6">
                        <label class="active" for="apellido2">Segundo Apellido </label>
                        <input id="apellido2" type="text" runat="server" class="validate" maxlength="44" title="Segundo Apellido" required onkeypress="return sololetras(event)" />

                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="telefono">Teléfono</label>
                        <input id="telefono" type="number" runat="server" class="validate" maxlength="14" title="Teléfono" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />

                    </div>
                    <div class="col s6">
                        <label class="active" for="celular">Celular</label>
                        <input id="celular" type="number" runat="server" onfocusout="celular()" class="validate" maxlength="14" title="Celular" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required />

                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <label class="active" for="direcion">Dirección</label>
                        <input id="direccion" type="text" runat="server" class="validate" title="Dirección" maxlength="249" required />

                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 13">
                        <label class="active" for="correo">Correo electrónico</label>
                        <input id="correo" type="email" runat="server" class="validate" title="Correo electrónico" maxlength="44" required />

                    </div>
                </div>
                <div>
                    <label>Género </label>
                    <br />
                    <p>
                        <label>
                            <input class="with-gap" name="group3" runat="server" title="Sexo" type="radio" id="masculino" />
                            <span>Masculino</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group3" runat="server" title="Sexo" type="radio" id="femenino" />
                            <span>Femenino</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group3" runat="server" title="Sexo" type="radio" id="otro" />
                            <span>Otro</span>
                        </label>
                    </p>
                </div>
                <div class="row">
                    <div class="col s4">
                        <label class="active" for="fecha_nacimiento">Fecha de nacimiento</label>
                        <input id="fecha_nacimiento" type="date" runat="server" title="Fecha de nacimiento" name="fecha" required />

                    </div>
                    <div class="col s4">
                        <label class="active" for="fecha_ingreso">Fecha de ingreso</label>
                        <input id="fecha_ingreso" type="date" runat="server" title="Fecha de  ingreso" name="fecha" required />

                    </div>
                </div>
                <div>
                    <%--                    Aquí comienza el html del encargado--%>
                    <label>Encargado </label>
                    <br />
                    <p>
                        <label>
                            <input class="with-gap" name="group4" runat="server" type="radio" id="siE" onclick="mostrar()" />
                            <span>Sí</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group4" runat="server" type="radio" id="noE" checked onclick="ocultar()" />
                            <span>No</span>
                        </label>
                    </p>
                </div>
            </div>
            <div id="encargado" style="display: none" tabindex="-1">
                <div class="row">
                    <div class="col s12 m6 13">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="cedula_encargado2">Cédula del encargado</label>
                                <asp:TextBox ID="cedula_encargad" class="validate" MaxLength="14" title="Cédula" runat="server" OnTextChanged="cedula_encargad_TextChanged" AutoPostBack="true" onkeypress="return solonumeros(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="nombre1_encargado">Primer nombre</label>
                                <input id="nombre1_encargado" type="text" runat="server" class="validate" title="Nombre" maxlength="44" onkeypress="return sololetras(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="nombre2_encargado">Segundo nombre</label>
                                <input id="nombre2_encargado" type="text" runat="server" class="validate" title="Nombre" maxlength="44" onkeypress="return sololetras(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="apellido1_encargado">Primer apellido</label>
                                <input id="apellido1_encargado" type="text" runat="server" class="validate" title="Primer apellido" maxlength="44" onkeypress="return sololetras(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="apellido2_encargado">Segundo apellido</label>
                                <input id="apellido2_encargado" type="text" runat="server" class="validate" title="Segundo apellido" maxlength="44" onkeypress="return sololetras(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="telefono_encargado">Teléfono</label>
                                <input id="telefono_encargado" type="text" runat="server" class="validate" title="Teléfono" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="celular_encargado">Celular</label>
                                <input id="celular_encargado" type="text" runat="server" class="validate" title="Celular" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="direccion_encargado">Dirección</label>
                                <input id="direccion_encargado" type="text" runat="server" class="validate" title="Dirección" maxlength="249" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">

                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="correo_encargado">Correo electrónico</label>
                                <input id="correo_encargado" type="email" runat="server" class="validate" title="Correo electrónico" maxlength="44" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <label class="active" for="parentezco">Parentezco con el menor</label>
                                <input id="parentezco" type="text" runat="server" class="validate" maxlength="44" title="Parentezco" onkeypress="return sololetras(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label>Género </label>
                            <br />
                            <p>
                                <label>
                                    <input class="with-gap" name="group5" runat="server" title="Sexo" type="radio" id="masculinoE" />
                                    <span>Masculino</span>
                                </label>
                            </p>
                            <p>
                                <label>
                                    <input class="with-gap" name="group5" runat="server" title="Sexo" type="radio" id="femeninoE" />
                                    <span>Femenino</span>
                                </label>
                            </p>
                            <p>
                                <label>
                                    <input class="with-gap" name="group5" runat="server" title="Sexo" type="radio" id="otroE" />
                                    <span>Otro</span>
                                </label>
                            </p>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="row">
                <div class="col s5"></div>
                <div class="input-field col s2">
                    <asp:Button class="waves-effect waves-light btn" Style="text-align: center" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                </div>
                <div class="col s5"></div>
            </div>
        </form>

    </div>
    <script type="text/javascript">
        function mostrar() {
            document.getElementById('encargado').style.display = 'block';
        }
        function ocultar() {
            document.getElementById('encargado').style.display = 'none';
        }

        function celular() {
            
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
    <script src="js/materialize.min.js"></script>

</body>
</html>
