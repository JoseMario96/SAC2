<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarPaciente.aspx.cs" Inherits="SAC.formularios.frm_AgregarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <title></title>
</head>
<body>
  
    <div class="row">
        <form class="col s12">
            <div class="row">
                <div class="input-field col s6">
                    <input placeholder="Placeholder" id="Primer_apellido" type="text" class="validate"/>
                    <label for="first_name">Primer Apellido</label>
                </div>
                <div class="input-field col s6">
                    <input id="last_name" type="text" class="validate"/>
                    <label for="last_name">Nombre completo </label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input disabled value="I am not editable" id="disabled" type="text" class="validate"/>
                    <label for="disabled">Disabled</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="password" type="password" class="validate"/>
                    <label for="password">Password</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="email" type="email" class="validate"/>
                    <label for="email">Email</label>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    This is an inline input field:
                    <div class="input-field inline">
                        <input id="email_inline" type="email" class="validate"/>
                        <label for="email_inline">Email</label>
                        <span class="helper-text" data-error="wrong" data-success="right">Helper text</span>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="js/materialize.min.js"></script>

</body>
</html>
