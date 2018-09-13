<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarExpediente.aspx.cs" Inherits="SAC.formularios.frm_AgregarExpediente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario de Expedientes</title>
    <link href="../css/materialize.css" rel="stylesheet" />
</head>
<body>
    <header>
        <h1 style="text-align: center">Registro de Expediente</h1>
    </header>

    <div class="container">
        <div class="row">
            <form runat="server">
                <div class="row">
                    <div class="col s10"></div>
                    <div class="col s2">
                        <input id="fecha_nacimiento" type="date" runat="server" name="fecha" />
                        <label class="active" for="fecha_nacimiento">Fecha</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <input id="Text1" type="text" runat="server" class="validate" />
                        <label class="active" for="cedula">Cédula </label>
                    </div>
                </div>
                <div class="section">
                    <h5>Signos Vitales</h5>
                    <div class="row">
                        <div class="col s6">
                            <textarea id="textarea1" class="materialize-textarea"></textarea>
                            <label class="active" for="cedula">Descripción </label>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h5>Historial médico</h5>
                    <div class="row">
                        <div class="col s12">
                            <textarea id="textarea2" class="materialize-textarea"></textarea>
                            <label class="active" for="cedula">Enfermedadaes Historial Médico </label>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h5>Historial médico de Mujer</h5>
                    <div class="row">
                        <div class="col s12">
                            <textarea id="textarea3" class="materialize-textarea"></textarea>
                            <label class="active" for="cedula">Enfermedadaes Historial Médico Mujer </label>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <h5>Tratamientos</h5>
                    <div class="row">
                        <div class="col s6">
                            <input id="Text2" type="text" runat="server" class="validate" />
                            <label class="active" for="cedula"></label>
                        </div>
                        <div class="col s6">
                            <input id="Text3" type="text" runat="server" class="validate" />
                            <label class="active" for="cedula">Precio</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <textarea id="textarea4" class="materialize-textarea"></textarea>
                            <label class="active" for="cedula">Descripción del tratamiento</label>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <h5>Odontograma</h5>
                    <div class="row">                  
                        <div class="col s12">
                            <center><img src="../images/Odontograma.png"  width="1024"/></center>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
