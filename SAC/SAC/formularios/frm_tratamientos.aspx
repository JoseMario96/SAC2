﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_tratamientos.aspx.cs" Inherits="SAC.formularios.frm_tratamientos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.css" rel="stylesheet" />
    <title></title>
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
                <nav style="background-color: rgba(0, 163, 162, 0.8)">
                    <div class="nav-wrapper">
                        <ul class="right hide-on-med-and-down">
                            <li><a href="#" onclick="mostrarAgregar()">Agregar</a></li>
                            <li><a href="#" onclick="mostrarActualizar()">Modificar</a></li>
                            <li><a href="#" onclick="mostrarEliminar()">Ver</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="row">



                <%--Sección agregar--%>



                <div id="seccionAgregar" style="display: block">
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
                        <%--        <asp:SqlDataSource ID="dropdownlist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select nombreTipoTratamiento from tbl_tipotratamiento order by codigoTipoTratamiento"></asp:SqlDataSource>--%>
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

                <br />
                <br />
                <div id="seccionModificar" style="display: block">
                    <div>
                        <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#0080ff " HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="codigoTratamiento" HeaderText="Código del tratamiento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="nombreTratamiento" HeaderText="Nombre" ItemStyle-Width="100" />
                                <asp:BoundField DataField="precioTratamiento" HeaderText="Precio" ItemStyle-Width="100" />
                                <asp:BoundField DataField="nombreTipoTratamiento" HeaderText="Tipo de tratamiento" ItemStyle-Width="100" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                    <br />
                    <br />
                    <div id="camposModificar" style="display: none">
                        Tipos de tratamientos
        <br />
                        Nuevo:
        <br />
                        <asp:TextBox class="validate" ID="txt_codigoTipoAct" runat="server" Width="56px" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                        <asp:TextBox class="validate" ID="txt_nombreTipoAct" runat="server" Width="234px" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                        <br />
                        Existentes:
        <br />
                        <div class="col s6">

                            <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento"></asp:DropDownList>
                            <%--        <asp:SqlDataSource ID="dropdownlist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select nombreTipoTratamiento from tbl_tipotratamiento order by codigoTipoTratamiento"></asp:SqlDataSource>--%>
                        </div>

                        <br />
                        <br />
                        Tratamientos:
        <br />
                        <asp:TextBox class="validate" ID="txt_codigoTratamientoAct" runat="server" Width="56px" Placeholder="Código" onkeypress="return solonumeros(event)"></asp:TextBox>
                        <asp:TextBox class="validate" ID="txt_nombreTratamientoAct" runat="server" Width="234px" Placeholder="Nombre" onkeypress="return sololetras(event)"></asp:TextBox>
                        <asp:TextBox class="validate" ID="txt_precioAct" runat="server" Width="79px" Placeholder="Precio" onkeypress="return solonumeros(event)"></asp:TextBox>
                        <br />
                        Descripción del tratamiento:<br />
                        <textarea id="txt_descripcionAct" name="S1" rows="2" runat="server"></textarea>
                        <br />
                        <asp:Button class="waves-effect waves-light btn" ID="btn_actualizar" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click" />
                    </div>
                



                <%--Sección Eliminar--%>



                <div id="seccionEliminar" style="display: none">
                </div>
            </div>
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
            document.getElementById('seccionModificar').style.display = 'block';
            ocultarAgregar();
            ocultarEliminar();
        }
        function ocultarActualizar() {
            document.getElementById('seccionModificar').style.display = 'none';
        }

        function mostrarEliminar() {
            document.getElementById('seccionEliminar').style.display = 'block';
            ocultarAgregar();
            ocultarActualizar();
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
</body>
</html>
