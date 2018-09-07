<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarPaciente.aspx.cs" Inherits="SAC.formularios.frm_AgregarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
</head>
<body>
    <header>
        <h1 style="text-align: center">Registro de pacientes</h1>
    </header>
    
    <div class="container">


        <div class="row">
            <form class="col s12" runat="server">
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
                        <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                    </div>
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />
                    </div>

                </div>
            </form>
        </div>
    </div>

    <%--<script>
    window.location = "index.apsx";
    </script>--%>

    <script src="js/materialize.min.js"></script>

</body>
</html>
