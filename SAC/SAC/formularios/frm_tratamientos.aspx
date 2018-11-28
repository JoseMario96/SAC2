﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_tratamientos.aspx.cs" Inherits="SAC.formularios.frm_tratamientos" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.css" rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>
    <title></title>
    <style>
        #menu div#barraMenu a.btnMenu:hover {
            background-color: #008281;
        }

        #menu div#barraMenu a.btnMenu:active {
            background-color: #008281;
            color: black;
        }

        .espacio {
            padding-top: 5%;
        }

        label, tr, th {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>


        <div class="container">
            <header>
                <h2 style="text-align: center">Mantenimiento de tratamientos</h2>
            </header>

            <div class="navbar-fixed">
                <nav id="menu" style="background-color: rgba(0, 163, 162, 0.8)">
                    <div class="row" id="barraMenu">
                        <div id="menucss" class="col s6"></div>
                        <div class="col s2">
                            <a href="#" class="btnMenu" style="color: black; font-weight: bold;" onclick="mostrarAgregar()">Agregar</a>
                        </div>
                        <div id="mediocss"></div>
                        <div class="col s2">
                            <a href="#" class="btnMenu" style="color: black; font-weight: bold;" onclick="mostrarActualizar()">Actualizar</a>
                        </div>
                        <div id="mediocss2"></div>
                        <div class="col s2">
                            <a href="#" class="btnMenu" style="color: black; font-weight: bold;" onclick="mostrarEliminar()">Eliminar</a>
                        </div>
                    </div>
                </nav>
            </div>

            <%--Sección agregar--%>
            <div id="seccionAgregar" style="display: block">

                <h5 style="text-align: center"><b>Agregar</b></h5>
                <div class="row">
                    <div class=" col s12">
                        <h5><b>Tipos de tratamientos:</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s7">
                        <p>
                            <b>Nuevos: </b>
                        </p>
                    </div>
                    <div class="col s5">
                        <p><b>Existentes:</b></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" title="Código" ID="txt_codigoTipo" runat="server" Placeholder="Código" AutoPostBack="true" onkeypress="return solonumeros(event)" OnTextChanged="txt_codigoTipo_TextChanged1"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s5">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" title="Nombre" ID="txt_nombreTipo" runat="server" Placeholder="Nombre" AutoPostBack="true" onkeypress="return sololetras(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s5">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList2" title="Tipo de tratamiento" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="row">
                    <div class=" col s12">
                        <h5><b>Tratamientos:</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s2">
                        <asp:TextBox class="validate" ID="txt_codigoTratamiento" title="Código" runat="server" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>

                    </div>
                    <div class="col s5">
                        <asp:TextBox class="validate" ID="txt_nombreTratamiento" title="Nombre" runat="server" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>

                    </div>
                    <div class="col s5">
                        <asp:TextBox class="validate" ID="txt_precioTratamiento" title="Precio" runat="server" Placeholder="Precio" onkeypress="return solonumeros(event)"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <p>Descripción del tratamiento:</p>
                        <textarea id="txt_descripcion" name="S1" rows="2" title="Descripción" runat="server"></textarea>
                    </div>
                </div>


                <div class="row espacio">
                    <div class="col s5"></div>
                    <div class="input-field col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
                    </div>
                    <div class="col s5"></div>
                </div>
            </div>
    
            <%-- Sección de modificar--%>
            <div class="row" id="grid" style="display: none">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <h5 id="titulo1" style="display: none; text-align: center"><b>Actualizar</b></h5>
                        <h5 id="titulo2" style="display: none; text-align: center"><b>Eliminar</b></h5>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="row">
                    <div class="input-field col s3">
                        <asp:TextBox ID="txtSearch" runat="server" title="Nombre" onkeypress="return sololetras(event)" MaxLength="20" autofocus="autofocus"></asp:TextBox>
                        <label style="font-family: sans-serif; font-size: x-large; color: black;">Nombre:</label>
                    </div>
                </div>

                <div class="row">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                            <asp:GridView ID="GridView2" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" Height="174px" OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="codigoTratamiento" HeaderText="Código del tratamiento" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="nombreTratamiento" HeaderText="Nombre" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="precioTratamiento" HeaderText="Precio" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="nombreTipoTratamiento" HeaderText="Tipo de tratamiento" ItemStyle-Width="100" />
                                </Columns>

                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div id="camposModificar" style="display: none" class="espacio">
                <div class="row">
                    <div class=" col s12">
                        <h5><b>Tipos de tratamientos:</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s7">
                        <p>
                            <b>Nuevos: </b>
                        </p>
                    </div>
                    <div class="col s5">
                        <p><b>Existentes:</b></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" ID="txt_codigoTipoAct" title="Código" runat="server" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s5">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" ID="txt_nombreTipoAct" title="Nombre" runat="server" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s5">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList1" title="Tipo de tratamiento" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="row">
                    <div class=" col s12">
                        <h5><b>Tratamientos:</b></h5>
                    </div>
                </div>

                <div class="row">
                    <div class="col s2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" ID="txt_codigoTratamientoAct" title="Código" runat="server" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s5">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" ID="txt_nombreTratamientoAct" title="Nombre" runat="server" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s5">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:TextBox class="validate" ID="txt_precioAct" runat="server" title="Precio" Placeholder="Precio" onkeypress="return solonumeros(event)"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <p>Descripción del tratamiento:</p>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <textarea id="txt_descripcionAct" name="S1" title="Descripción" rows="2" runat="server"></textarea>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row espacio">
                    <div class="col s5"></div>
                    <div class="input-field col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_actualizar" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click" />
                    </div>
                    <div class="col s5"></div>
                </div>
                <br />
            </div>

            <%--Sección Eliminar--%>

            <div id="seccionEliminar" style="display: none" class="espacio">
                <table class="striped">
                    <tr>
                        <th colspan="5" style="text-align: center">Tratamiento</th>
                    </tr>
                    <tr>
                        <th>Código tratamiento</th>
                        <th>Nombre tratamiento</th>
                        <th>Precio tratamiento</th>
                        <th colspan="2">Descripción tratamiento</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="codigoTraEli" runat="server" title="Código"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="NombreTraEli" runat="server" title="Nombre"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="PrecioTraEli" runat="server" title="Precio"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td colspan="2">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="DescriTraEli" runat="server" title="Descripción"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: center">Tipo Tratamiento</th>
                    </tr>
                    <tr>
                        <th>Código tipo tratamiento</th>
                        <th>Nombre tipo tratamiento</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="codigoTipoTraEli" runat="server" title="Código"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombreTipoTraEli" runat="server" title="Nombre"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <div class="row espacio">
                    <div class="col s5"></div>
                    <div class="input-field col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_eliminar" runat="server" Text="Eliminar" OnClick="btn_eliminar_Click" />
                    </div>
                    <div class="col s5"></div>
                </div>
            </div>
        </div>
        <asp:TextBox ID="txtTabla" runat="server"></asp:TextBox>
    </form>
    <script src="../js/materialize.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script type="text/javascript">

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems, options);
        })

        // Or with jQuery

        //$(document).ready(function () {
        //    $('.sidenav').sidenav();
        //});

        $(document).ready(function () {
            var ancho = $(window).width();
            if (ancho < 520) {
                $("#menucss").removeClass("col s6");
                $("#mediocss").addClass("col s1");
                $("#mediocss2").addClass("col s2");
            }
        });

        $(window).resize(function () {
            //aqui el codigo que se ejecutara cuando se redimencione la ventana
            var ancho = $(window).width();
            if (ancho <= 520) {
                $("#menucss").removeClass("col s6");
                $("#mediocss").addClass("col s1");
                $("#mediocss2").addClass("col s2");
            }
            else {
                $("#menucss").addClass("col s6");
                $("#mediocss").removeClass("col s1");
                $("#mediocss2").removeClass("col s2");
            }
        });

        function mostrarAgregar() {
            document.getElementById('seccionAgregar').style.display = 'block';
            ocultarActualizar();
            ocultarEliminar();
        }
        function ocultarAgregar() {
            document.getElementById('seccionAgregar').style.display = 'none';
        }

        function mostrarActualizar() {
            document.getElementById('grid').style.display = 'block';
            document.getElementById('camposModificar').style.display = 'block';
            ocultarAgregar();
            ocultarEliminar();
            document.getElementById("txtTabla").value = "modificar";
            document.getElementById('titulo1').style.display = 'block';
            document.getElementById('titulo2').style.display = 'none';
        }
        function ocultarActualizar() {
            document.getElementById('grid').style.display = 'none';
            document.getElementById('camposModificar').style.display = 'none';
        }
        function ocultarActualizarSinGrid() {
            document.getElementById('camposModificar').style.display = 'none';
        }

        function mostrarEliminar() {
            document.getElementById('grid').style.display = 'block';
            document.getElementById('seccionEliminar').style.display = 'block';
            ocultarAgregar();
            ocultarActualizarSinGrid();
            document.getElementById("txtTabla").value = "eliminar";
            document.getElementById('titulo2').style.display = 'block';
            document.getElementById('titulo1').style.display = 'none';
        }
        function ocultarEliminar() {
            document.getElementById('seccionEliminar').style.display = 'none';
        }

        function solonumeros(e) {
            key = e.keyCoden || e.which;
            teclado = String.fromCharCode(key);
            numero = ",.1234567890";
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

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                $('#<%=InvisButton.ClientID%>').click();

            });
        });
        function scrollTratamientoModi() {
            document.getElementById('camposModificar').scrollIntoView();
        }
        function scrollTratamientoEli() {
            document.getElementById('seccionEliminar').scrollIntoView();
        }
    </script>
</body>
</html>
