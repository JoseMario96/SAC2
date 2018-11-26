<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SAC.formularios.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Clínica Dental Dra. Alina Camacho Barrantes" />
    <meta name="keywords" content="Dental, Clinica, Clínica, Alina, Camacho, Ciudad Neily, Puntarenas" />
    <title>Inicio de sesión</title>
    <link href="../css/login.css" rel="stylesheet" />
    <link href="../css/magnific-popup.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $('#pop').click(function () {
                if (!$('#iframe').length) {
                    $('#po').html('<iframe id="iframe" src="http://google.com"></iframe>');
                }
            });
        });
    </script>
    <style>
        #popup, #popup1 {
            visibility: hidden;
            opacity: 0;
            margin-top: -300px;
        }

            #popup:target, #popup1:target {
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
            /*color: #333;*/
            border-radius: 3px;
            width: 30%;
            height: 45%;
        }

        .popup-contenedorC {
            position: relative;
            margin: 7% auto;
            padding: 30px 50px;
            background-color: #fafafa;
            /*color: #333;*/
            border-radius: 3px;
            width: 30%;
            height: 55%;
        }

        a.popup-cerrar {
            position: absolute;
            top: 3px;
            right: 3px;
            background-color: rgb(255, 0, 0);
            padding: 7px 10px;
            font-size: 24px;
            text-decoration: none;
            line-height: 1;
            color: #fff;
        }

        .responsiveContent {
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
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="86400000"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="contenedor">
            <div class="caja">
                <h2>Inicio de sesión</h2>
                <input class="entrada" runat="server" id="txt_usuario" type="text" placeholder="Usuario" required="required" autocomplete="off" onkeypress="return sololetras(event)" maxlength="15" />
                <br />
                <br />
                <input class="entrada" runat="server" id="txt_contrasena" type="password" placeholder="Contraseña" required="required" onkeypress="return sololetras(event)" maxlength="15" />
                <label runat="server" id="aviso" style="display: none; text-align: center; color: red">Solo se permiten letras y números!</label>
                <br />
                <br />
                <asp:Button CssClass="boton" ID="btn_sesion" runat="server" Text="Ingresar" OnClick="btn_sesion_Click" />
                <br />
                <br />
                <a href="#popup" class="popup-link fh5co-project-item" onclick='document.getElementById("recuperar").src="frm_RecuperarContrasena.aspx";'>¿Olvidó su contraseña?</a>
                <br />
                <br />
                <a href="#popup1" class="popup-link fh5co-project-item" onclick='document.getElementById("cambiar").src="frm_CambiarContrasena.aspx";'>Cambiar contraseña</a>
            </div>
        </div>
        <div class="modal-wrapper" id="popup">
            <div class="popup-contenedor">
                <div class="responsiveContent">
                    <iframe id="recuperar"></iframe>
                    <a class="popup-cerrar" href="#form1">X</a>
                </div>
            </div>
        </div>
        <div class="modal-wrapper" id="popup1">
            <div class="popup-contenedorC">
                <div class="responsiveContent">
                    <iframe id="cambiar"></iframe>
                    <a class="popup-cerrar" href="#form1">X</a>
                </div>
            </div>
        </div>

    </form>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/magnific-popup-options.js"></script>
    <script type="text/javascript">
        function sololetras(e) {
            key = e.keyCoden || e.which;
            teclado = String.fromCharCode(key).toLowerCase();
            letras = "0123456789áéíóúabcdefghijklmnñopqrstuvwxyz";
            especiales = "8-37-38-46-164-9";
            teclado_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true; break;

                }
            }
            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                document.getElementById('aviso').style.display = 'block';
                return false;
            }
            document.getElementById('aviso').style.display = 'none';
        }

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>
