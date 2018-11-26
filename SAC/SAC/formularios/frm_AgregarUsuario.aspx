<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarUsuario.aspx.cs" Inherits="SAC.formularios.frm_AgregarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
    <style>
        label {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }

        .espacio {
            padding-top: 5%;
        }
    </style>
</head>
<body>
    <header>
        <h3 style="text-align: center">Registro de usuarios</h3>
    </header>
    <div class="container">
        <form id="form1" runat="server">
            <div class="row espacio">
                <div class="col s2">
                </div>
                <div class="col s8">
                    <label class="active" for="txt_usuario">Nombre de Usuario</label>
                    <asp:TextBox ID="txt_usuario" runat="server" class="validate" MaxLength="15" required="required" AutoCompleteType="Disabled" onkeypress="return sololetras(event)" AutoPostBack="true" OnTextChanged="txt_usuario_TextChanged"></asp:TextBox>
                </div>
                <div class="col s2">
                </div>
            </div>

            <div class="row">
                <div class="col s2">
                </div>
                <div class="col s8">
                    <label class="active" for="txt_correo">Correo electrónico</label>
                    <input id="txt_correo" runat="server" class="validate" maxlength="45" type="email" required="required" autocomplete="off" />
                </div>
                <div class="col s2">
                </div>
            </div>
            <div class="row">
                <div class="col s2">
                </div>
                <div class="col s8">
                    <label>Tipo de usuario</label>
                    <br />
                    <p>
                        <label>
                            <input class="with-gap" name="group" runat="server" type="radio" id="admin" />
                            <span>Administrador</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input class="with-gap" name="group" runat="server" type="radio" id="asist" />
                            <span>Asistente</span>
                        </label>
                    </p>
                </div>
                <div class="col s2">
                </div>
            </div>
            <div class="row">
                <div class="col s5">
                </div>
                <div class="input-field col s2">
                    <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                </div>
                <div class="col s5">
                </div>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript">

    function sololetras(e) {
        key = e.keyCoden || e.which;
        teclado = String.fromCharCode(key).toLowerCase();
        letras = "1234567890áéíóúabcdefghijklmnñopqrstuvwxyz";
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
</html>
