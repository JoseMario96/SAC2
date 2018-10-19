<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarCita.aspx.cs" EnableEventValidation="false" Inherits="SAC.formularios.frm_AgregarCita" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../css/materialize.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
</head>
<body>
    <header style="text-align: center">
        Agregar cita
    </header>
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col s4">
                        <label class="active" for="cedula">Cédula del paciente</label>
                        <input id="cedula" type="text" runat="server" class="validate" maxlength="15" required onkeypress="return sololetras(event)" />

                    </div>
                    <div class="col s4">
                        <label class="active" for="nombre2">Fecha de la cita</label>
                        <input id="fecha" type="date" runat="server" class="validate" required />

                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        <label class="active" for="hora">Hora de la cita</label>
                        <input id="hora" type="number" runat="server" class="validate" required maxlength="24" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />

                    </div>
                    <div class="col s4">
                        <label class="active" for="telefono">Teléfono de contacto </label>
                        <input id="telefono" type="number" runat="server" class="validate" required maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />

                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">


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
