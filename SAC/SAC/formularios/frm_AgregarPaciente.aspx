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
                <div class="input-field col s6">
                    <input placeholder="Cédula" id="Cedula" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Primer nombre" id="nombre1" type="text" class="validate" />
                    <%--<label for="first_name">Primer Apellido</label>--%>
                    <input placeholder="Segundo nombre" id="nombre2" type="text" class="validate" />
                    <%--<label for="first_name">Primer Apellido</label>--%>
                    <input placeholder="Primer apellido" id="apellido1" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Segundo apellido" id="apellido2" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Número de teléfono" id="telefono" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Número de celular" id="celular" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Dirección" id="direccion" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Cédula del encargado" id="cedula_encargado" type="text" class="validate" />
                    <%--<label for="last_name">Nombre completo </label>--%>
                    <input placeholder="Correo electrónico" id="correo" type="email" class="validate" />
                    <div>
                        <label>Género </label>
                        <br />
                        <p>
                            <label>
                                <input class="with-gap" name="group3" type="radio" id="masculino" />
                                <span>Masculino</span>
                            </label>
                        </p>
                        <p>
                            <label>
                                <input class="with-gap" name="group3" type="radio" id="femenino" />
                                <span>Femenino</span>
                            </label>
                        </p>
                        <p>
                            <label>
                                <input class="with-gap" name="group3" type="radio" id="otro" />
                                <span>Otro</span>
                            </label>
                        </p>
                    </div>
                    <input id="fecha_nacimiento" type="date" name="fecha" />
                    <input id="fecha_ingreso" type="date" name="fecha" />
                    <asp:Button ID="Guardar" runat="server" Text="Guardar" />
                    <asp:Button ID="Cancelar" runat="server" Text="Cancelar" />
                </div>
            </form>
        </div>
    </div>

    <script src="js/materialize.min.js"></script>

</body>
</html>
