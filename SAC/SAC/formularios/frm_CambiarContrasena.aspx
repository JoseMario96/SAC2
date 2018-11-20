<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_CambiarContrasena.aspx.cs" Inherits="SAC.formularios.frm_CambiarContrasena" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor2">
            <div class="caja2">
                <h4>Cambio de contraseña</h4>
                <input class="entrada2" runat="server" id="txt_usuario" type="text" placeholder="Usuario" required="required" autocomplete="off" onkeydown="return sololetras(event)" maxlength="15" />
                <br />
                <br />
                <input class="entrada2" runat="server" id="txt_contraAnte" type="password" placeholder="Contraseña anterior" required="required" onkeydown="return sololetras(event)" maxlength="15" />
                <br />
                <br />
                <input class="entrada2" runat="server" id="txt_contraNueva" type="password" placeholder="Contraseña nueva" required="required" onkeydown="return sololetras(event)" maxlength="15" />
                <br />
                <br />
                <input class="entrada2" runat="server" id="txt_contraNueva2" type="password" placeholder="Repita la nueva contraseña" required="required" onkeydown="return sololetras(event)" maxlength="15" />
                <br />
                <br />
                <asp:Button CssClass="boton2" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
            </div>
        </div>
    </form>
</body>
    <script type="text/javascript">
        function sololetras(e) {
            key = e.keyCoden || e.which;
            teclado = String.fromCharCode(key).toLowerCase();
            letras = "1234567890áéíóúabcdefghijklmnñopqrstuvwxyz";
            especiales = "8-37-38-46-164-9";
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
</html>
