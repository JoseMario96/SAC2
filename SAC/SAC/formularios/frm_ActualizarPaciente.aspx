<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ActualizarPaciente.aspx.cs" Inherits="SAC.formularios.frm_ActualizarPaciente" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
</head>
<body>

    <div class="container">

        <form id="form1" runat="server">
            <div class="row">
                <br />
                <br />

                <div>
                    <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#0080ff " HeaderStyle-ForeColor="White" class="col s12"
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
            <div id="formularioP" style="display: none">
                <header>
                    <h1 style="text-align: center">Registro de pacientes</h1>
                </header>

                <div class="row">
                    <div class="col s6">
                        <label class="active" for="cedula">Cédula </label>
                        <input id="cedula" readonly="readonly" type="text" runat="server" class="validate" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="nombre1">Primer Nombre</label>
                        <input id="nombre1" type="text" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)" />
                        
                    </div>
                    <div class="col s6">
                        <label class="active" for="nombre2">Segundo Nombre</label>
                        <input id="nombre2" type="text" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="apellido1">Primer Apellido </label>
                        <input id="apellido1" type="text" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)" />
                        
                    </div>
                    <div class="col s6">
                        <label class="active" for="apellido2">Segundo Apellido </label>
                        <input id="apellido2" type="text" runat="server" class="validate" maxlength="44" required onkeypress="return sololetras(event)" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="telefono">Teléfono</label>
                        <input id="telefono" type="text" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        
                    </div>
                    <div class="col s6">
                        <label class="active" for="celular">Celular</label>
                        <input id="celular" type="text" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <label class="active" for="direcion">Dirección</label>
                        <input id="direccion" type="text" runat="server" class="validate" maxlength="249" required />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 13">
                        <label class="active" for="correo">Correo electrónico</label>
                        <input id="correo" type="email" runat="server" class="validate" maxlength="44" required />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s8">
                        <label>Género </label>
                        <br />
                        <p>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="generoM" />
                                <span>Masculino</span>
                            </label>
                        </p>
                        <p>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="generoF" />
                                <span>Femenino</span>
                            </label>
                        </p>
                        <p>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="generoO" />
                                <span>Otro</span>
                            </label>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <label class="active" for="fechaN">Fecha de nacimiento</label>
                        <input id="fechaN" type="text" maxlength="9" runat="server" class="validate" required />

                    </div>

                    <div class="input-field col s4">
                        <label class="active" for="fechaI">Fecha de inscripción</label>
                        <input id="fechaI" type="text" maxlength="9" runat="server" class="validate" required />
                    </div>
                </div>
                <div id="BuscarE">
                    <label>Encargado </label>
                    <br />
                    <p>
                        <label>
                            <input class="with-gap" name="group4" runat="server" type="radio" id="SiE" onclick="mostrar()" />
                            <span>Sí</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group4" runat="server" type="radio" id="NoE" onclick="ocultar()" />
                            <span>No</span>
                        </label>
                    </p>
                </div>
            </div>


            <div id="encargado" style="display: none">
                <div class="row">
                    <div class="col s12 m6 13">
                        <label class="active" for="cedula_encargado">Cédula del encargado</label>
                        <input id="cedula_encargado" type="text" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="nombre1_encargado">Primer nombre</label>
                        <input id="nombre1_encargado" type="text" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)" />
                        
                    </div>
                    <div class="col s6">
                        <label class="active" for="nombre2_encargado">Segundo nombre</label>
                        <input id="nombre2_encargado" type="text" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="apellido1_encargado">Primer apellido</label>
                        <input id="apellido1_encargado" type="text" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)" />
                        
                    </div>
                    <div class=" col s6">
                        <label class="active" for="apellido2_encargado">Segundo apellido</label>
                        <input id="apellido2_encargado" type="text" runat="server" class="validate" maxlength="44" onkeypress="return sololetras(event)" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <label class="active" for="telefono_encargado">Teléfono</label>
                        <input id="telefono_encargado" type="number" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        
                    </div>
                    <div class="col s6">
                        <label class="active" for="celular_encargado">Celular</label>
                        <input id="celular_encargado" type="number" runat="server" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <label class="active" for="direccion_encargado">Dirección</label>
                        <input id="direccion_encargado" type="text" runat="server" class="validate" maxlength="249" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <label class="active" for="correo_encargado">Correo electrónico</label>
                        <input id="correo_encargado" type="email" runat="server" class="validate" maxlength="44" />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <label class="active" for="parentezco">Parentezco con el menor</label>
                        <input id="parentezco" type="text" runat="server" class="validate" maxlength="44"  />
                        
                    </div>
                </div>
                <div>
                    <label>Género </label>
                    <br />
                    <p>
                        <label>
                            <input class="with-gap" name="group5" runat="server" type="radio" id="generoEM" />
                            <span>Masculino</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group5" runat="server" type="radio" id="generoEF" />
                            <span>Femenino</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group5" runat="server" type="radio" id="generoEO" />
                            <span>Otro</span>
                        </label>
                    </p>
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
            <%--            <script type="text/javascript">
                function onEnter(_input) {
                    _input.style.backgroundColor = "yellow";
                }
                function onLeave(_input) {
                    _input.style.backgroundColor = "blue";
                }
            </script>--%>
            <div id="Botones" style="display:none">
                <div class="row">

                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                    </div>
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />
                    </div>
                </div>

            </div>
        </form>
    </div>

    <script src="js/materialize.min.js"></script>



</body>
</html>

