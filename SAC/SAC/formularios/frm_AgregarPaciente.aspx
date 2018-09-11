<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarPaciente.aspx.cs" Inherits="SAC.formularios.frm_AgregarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>

    <style>
        #popup {
            visibility: hidden;
            opacity: 0;
            margin-top: -300px;
        }

            #popup:target {
                visibility: visible;
                opacity: 1;
                background-color: rgba(0,0,0,0.8);
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                margin: 0;
                z-index: 999;
                transition: all 1s;
            }

        .popup-contenedor {
            position: relative;
            margin: 7% auto;
            padding: 30px 50px;
            background-color: #fafafa;
            color: #333;
            border-radius: 3px;
            width: 65%;
            height: 75%;
        }

        a.popup-cerrar {
            position: absolute;
            top: 3px;
            right: 3px;
            background-color: #333;
            padding: 7px 10px;
            font-size: 20px;
            text-decoration: none;
            line-height: 1;
            color: #fff;
        }

        .responsiveContent {
            position: relative;
            height: 0;
            overflow: hidden;
            padding-bottom: 56.2%;
            margin-bottom: 20px;
        }

            .responsiveContent iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
    </style>
</head>
<body>
    <header>
        <h1 style="text-align: center">Registro de pacientes</h1>
    </header>

    <div class="container">
        <div class="row">
            <form runat="server">

                <div class="row">
                    <div class="col s6">
                        <input id="cedula" type="text" runat="server" class="validate" />
                        <label class="active" for="cedula">Cédula </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6" >
                        <input id="nombre1" type="text" runat="server" class="validate" />
                        <label class="active" for="nombre1">Primer Nombre</label>
                    </div>
                    <div class="col s6">
                        <input id="nombre2" type="text" runat="server" class="validate" />
                        <label class="active" for="nombre2">Segundo Nombre</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s6" >
                        <input id="apellido1" type="text" runat="server" class="validate" />
                        <label class="active" for="apellido1">Primer Apellido </label>
                    </div>
                    <div class="col s6" >
                        <input id="apellido2" type="text" runat="server" class="validate" />
                        <label class="active" for="apellido2">Segundo Apellido </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6" >
                        <input id="telefono" type="text" runat="server" class="validate" />
                        <label class="active" for="telefono">Teléfono</label>
                    </div>
                    <div class="col s6">
                        <input id="celular" type="text" runat="server" class="validate" />
                        <label class="active" for="celular">Celular</label>
                    </div>
                </div>
                <div class="row">
                    <div>
                        <input id="direccion" type="text" runat="server" class="validate" />
                        <label class="active" for="direcion">Dirección</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 l3" >
                        <input id="correo" type="email" runat="server" class="validate" />
                        <label class="active" for="correo">Correo electrónico</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 l3">
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
                    <div class="col s12 m6 l3">
                        <input id="fecha_nacimiento" type="date" runat="server" name="fecha" />
                        <label class="active" for="fecha_nacimiento">Fecha de nacimiento</label>
                    </div>
                    <div class="col s12 m6 l3">
                        <input id="fecha_ingreso" type="date" runat="server" name="fecha" />
                        <label class="active" for="fecha_ingreso">Fecha de ingreso</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 l3" >
                        <asp:Button class=" btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" BackColor="#009999" />
                    </div>
                    <div class="col s12 m6 l3" >
                        <asp:Button class=" btn" ID="Button1" runat="server" Text="Limpiar" OnClick="limpiar_Click" BackColor="#009999" />
                    </div>
                    <%--<asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />--%>
                    <%--<input class="waves-effect waves-light btn" type='button' name='close' value='cerrar' onclick="window.close();" />--%>
                </div>
            </form>
        </div>
    </div>




















    <script src="js/materialize.min.js"></script>


    <script type="text/javascript">
        function urlVolver() {
            window.parent.closeModal();
            alert('No se registro la información correctamente');
        }
    </script>

    <%--<script>

        $(document).ready(function () {

            $("#close").click(function () {
                var modal1 = $('#cerrarprin', window.parent.document);
                modal1.click();
                alert('No se registro la información correctamente');
            });

        });
    </script>--%>
</body>
</html>
