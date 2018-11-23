﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ActualizarUsuario.aspx.cs" Inherits="SAC.formularios.frm_ActualizarUsuario" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(window).resize(function () {
            //aqui el codigo que se ejecutara cuando se redimencione la ventana
            var ancho = $(window).width();
            if (ancho <= 720) {
                $("#css1").removeClass("row");
                $("#css2").removeClass("col s3");
                $("#css3").removeClass("input-field col s2");
                $("#css4").removeClass("input-field col s2");
                $("#css5").removeClass("input-field col s2");
                $("#css6").removeClass("col s3");
                $("#css3").addClass("row");
                $("#css4").addClass("row");
                $("#css5").addClass("row");
            }
            if (ancho > 720) {
                $("#css3").removeClass("row");
                $("#css4").removeClass("row");
                $("#css5").removeClass("row");
                $("#css1").addClass("row");
                $("#css2").addClass("col s3");
                $("#css3").addClass("input-field col s2");
                $("#css4").addClass("input-field col s2");
                $("#css5").addClass("input-field col s2");
                $("#css6").addClass("col s3");
            }
        })

        $(document).ready(function () {
            //aqui el codigo que se ejecutara cuando se redimencione la ventana
            var ancho = $(window).width();
            if (ancho < 520) {
                $("#css1").removeClass("row");
                $("#css2").removeClass("col s3");
                $("#css3").removeClass("input-field col s2");
                $("#css4").removeClass("input-field col s2");
                $("#css5").removeClass("input-field col s2");
                $("#css6").removeClass("col s3");
                $("#css3").addClass("row");
                $("#css4").addClass("row");
                $("#css5").addClass("row");
            }
        })
    </script>
</head>
<body>
    <header>
        <h1 style="text-align: center">Actualización de usuarios</h1>
    </header>
    <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <div id="grid">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="Gridview_Usuario" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" Height="174px" Width="100%" OnRowDataBound="Gridview_Usuario_RowDataBound" OnSelectedIndexChanged="Gridview_Usuario_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="usuarioUsuario" HeaderText="Nombre de usuario" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="correoUsuario" HeaderText="Correo electrónico" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tipoUsuario" HeaderText="Tipo de usuario" ItemStyle-Width="100">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="campos" style="display: none">
                <div class="row">
                    <div class="col s2">
                    </div>
                    <div class="col s8">
                        <label class="active" for="txt_usuario">Nombre de Usuario</label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txt_usuario" runat="server" class="validate"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s2">
                    </div>
                </div>
                <div class="row">
                    <div class="col s2">
                    </div>
                    <div class="col s8">
                        <label class="active" for="txt_correo">Correo electrónico</label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="txt_correo" runat="server" class="validate" maxlength="45" type="email" required="required" autocomplete="off" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group" runat="server" type="radio" id="admin" />
                                        <span>Administrador</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </p>
                        <p>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group" runat="server" type="radio" id="asist" />
                                        <span>Asistente</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </p>
                    </div>
                    <div class="col s2">
                    </div>
                </div>
                <div id="css1" class="row">
                    <div id="css2" class="col s3">
                    </div>
                    <div id="css3" class="input-field col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_Guardar" runat="server" Text="Guardar" OnClick="btn_Guardar_Click" />
                    </div>
                    <div id="css4" class="input-field col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_Volver" runat="server" Text="Volver" OnClick="btn_Volver_Click" />
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div id="css5" class="input-field col s2">
                                <asp:Button class="waves-effect waves-light btn" ID="btn_Estado" runat="server" Text="Habilitar" OnClick="btn_Estado_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div id="css6" class="col s3">
                    </div>
                </div>
            </div>
        </form>

    </div>
</body>
</html>
