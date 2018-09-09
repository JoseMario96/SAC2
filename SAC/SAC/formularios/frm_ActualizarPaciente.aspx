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

            <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="520px">
                <Columns>
                    <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                    <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                    <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                    <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />

                </Columns>
            </asp:GridView>

            <div id="formularioP" style="display: none">
                <header>
                    <h1 style="text-align: center">Registro de pacientes</h1>
                </header>

                <div class="row">
                    <div class="input-field col s4">
                        <input id="cedula" type="text" runat="server" class="validate" />
                        <label class="active" for="cedula">Cédula </label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input id="nombre1" type="text" runat="server" class="validate" />
                        <label class="active" for="nombre1">Primer Nombre</label>
                    </div>
                    <div class="input-field col s4">
                        <input id="nombre2" type="text" runat="server" class="validate" />
                        <label class="active" for="nombre2">Segundo Nombre</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input id="apellido1" type="text" runat="server" class="validate" />
                        <label class="active" for="apellido1">Primer Apellido </label>
                    </div>
                    <div class="input-field col s4">
                        <input id="apellido2" type="text" runat="server" class="validate" />
                        <label class="active" for="apellido2">Segundo Apellido </label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input id="telefono" type="text" runat="server" class="validate" />
                        <label class="active" for="telefono">Teléfono</label>
                    </div>
                    <div class="input-field col s4">
                        <input id="celular" type="text" runat="server" class="validate" />
                        <label class="active" for="celular">Celular</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s8">
                        <input id="direccion" type="text" runat="server" class="validate" />
                        <label class="active" for="direcion">Dirección</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s8">
                        <input id="correo" type="email" runat="server" class="validate" />
                        <label class="active" for="correo">Correo electrónico</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input id="cedula_encargado" type="text" runat="server" class="validate" />
                        <label class="active" for="cedula_encargado">Cédula del encargado</label>
                    </div>
                </div>

                <div>
                    <label>Género </label>
                    <br />
                    <p>
                        <label>
                            <input class="with-gap" name="group3" runat="server" type="radio" id="masculino" />
                            <span>Masculino</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group3" runat="server" type="radio" id="femenino" />
                            <span>Femenino</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group3" runat="server" type="radio" id="otro" />
                            <span>Otro</span>
                        </label>
                    </p>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input id="fecha_nacimiento" type="date" runat="server" name="fecha" />
                        <label class="active" for="fecha_nacimiento">Fecha de nacimiento</label>
                    </div>
                    <div class="input-field col s4">
                        <input id="fecha_ingreso" type="date" runat="server" name="fecha" />
                        <label class="active" for="fecha_ingreso">Fecha de ingreso</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" />
                    </div>
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" />
                    </div>
                </div>
            </div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

<%--            <script type="text/javascript">
                function onEnter(_input) {
                    _input.style.backgroundColor = "yellow";
                }
                function onLeave(_input) {
                    _input.style.backgroundColor = "blue";
                }
            </script>--%>
        </form>
    </div>
    <script src="js/materialize.min.js"></script>

</body>
</html>

