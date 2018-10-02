<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_tratamientos.aspx.cs" Inherits="SAC.formularios.frm_tratamientos" EnableEventValidation="false" %>

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
    </style>
</head>
<body style="margin: 5%;">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <div class="container">
            <header>
                <h2>Mantenimiento de tratamientos</h2>
            </header>
            <div class="navbar-fixed">
                <nav id="menu" style="background-color: rgba(0, 163, 162, 0.8)">
                    <div class="row" id="barraMenu">
                        <div class="col s6"></div>
                        <div class="col s2">
                            <a href="#" class="btnMenu" style="color: black; font-weight: bold;" onclick="mostrarAgregar()">Agregar</a>
                        </div>
                        <div class="col s2">
                            <a href="#" class="btnMenu" style="color: black; font-weight: bold;" onclick="mostrarActualizar()">Modificar</a>
                        </div>
                        <div class="col s2">
                            <a href="#" class="btnMenu" style="color: black; font-weight: bold;" onclick="mostrarEliminar()">Eliminar</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="row">

                <%--Sección agregar--%>

                <div id="seccionAgregar" style="display: block">
                    <h4 style="text-align:center">Agregar</h4>
                    Tipos de tratamientos
        <br />
                    Nuevo:
        <br />
                    <asp:TextBox class="validate" ID="txt_codigoTipo" runat="server" Width="56px" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                    <asp:TextBox class="validate" ID="txt_nombreTipo" runat="server" Width="234px" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                    <br />
                    Existentes:
        <br />
                    <div class="col s6">

                        <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento"></asp:DropDownList>
                    </div>

                    <br />

                    <br />
                    
                    Tratamientos:
                    <br />
                    <asp:TextBox class="validate" ID="txt_codigoTratamiento" runat="server" Width="56px" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                    <asp:TextBox class="validate" ID="txt_nombreTratamiento" runat="server" Width="234px" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                    <asp:TextBox class="validate" ID="txt_precioTratamiento" runat="server" Width="79px" Placeholder="Precio" onkeypress="return solonumeros(event)"></asp:TextBox>
                    <br />
                    Descripción del tratamiento:<br />
                    <textarea id="txt_descripcion" name="S1" rows="2" runat="server"></textarea>
                    <br />
                    <asp:Button class="waves-effect waves-light btn" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />

                </div>



                <%-- Sección de modificar--%>

                <div class="row" id="grid" style="display: none">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <h4 id="titulo1" style="text-align:center; display:none">Actualizar</h4>
                            <h4 id="titulo2" style="text-align:center; display:none">Eliminar</h4>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView2" aligne="center" HeaderStyle-BackColor="#008281" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" OnDataBound="GridView2_DataBound" Height="174px" OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
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
                <br />
                <br />
                <div id="camposModificar" style="display: none" tabindex="-1">
                    <br />
                    <br />
                    Tipos de tratamientos
        <br />
                    Nuevo:
        <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox class="validate" ID="txt_codigoTipoAct" runat="server" Width="56px" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox class="validate" ID="txt_nombreTipoAct" runat="server" Width="234px" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    Existentes:
        <br />
                    <div class="col s6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento"></asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <br />
                    <br />
                    Tratamientos:
        <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox class="validate" ID="txt_codigoTratamientoAct" runat="server" Width="56px" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox class="validate" ID="txt_nombreTratamientoAct" runat="server" Width="234px" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox class="validate" ID="txt_precioAct" runat="server" Width="79px" Placeholder="Precio" onkeypress="return solonumeros(event)"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <br />
                    Descripción del tratamiento:<br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <textarea id="txt_descripcionAct" name="S1" rows="2" runat="server"></textarea>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <br />
                    <asp:Button class="waves-effect waves-light btn" ID="btn_actualizar" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click" />
                </div>





                <%--Sección Eliminar--%>

                <div id="seccionEliminar" style="display: none">

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
                                        <label id="codigoTraEli" runat="server"></label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <label id="NombreTraEli" runat="server"></label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <label id="PrecioTraEli" runat="server"></label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td colspan="2">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <label id="DescriTraEli" runat="server"></label>
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
                                        <label id="codigoTipoTraEli" runat="server"></label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <label id="nombreTipoTraEli" runat="server"></label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button class="waves-effect waves-light btn" ID="btn_eliminar" runat="server" Text="Eliminar" OnClick="btn_eliminar_Click" />
                </div>
            </div>
            <asp:TextBox ID="txtTabla" runat="server"></asp:TextBox>
        </div>
    </form>

    <script type="text/javascript">
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
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=GridView2] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>
</body>
</html>
