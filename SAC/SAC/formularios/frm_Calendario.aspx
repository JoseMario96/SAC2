<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Calendario.aspx.cs" Inherits="SAC.formularios.frm_Calendario" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
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
        label, tr, th {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }

        td th .calendario {
            text-align: center;
        }

        td {
            text-align: center;
        }

        .calendario {
            text-align: center;
            text-transform: uppercase;
        }
        .espacio {
            padding-top: 5%;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <div class="container">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <header>
                <h2 style="text-align: center">Agenda de citas</h2>
            </header>

            <div class="row espacio">
                <div class="col s12 calendario">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Full" Font-Names="Arial" Font-Size="15pt" ForeColor="#003399" Height="432px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" Font-Underline="true" />
                                <NextPrevStyle Font-Size="18pt" ForeColor="#000606" />
                                <OtherMonthDayStyle ForeColor="#999999" HorizontalAlign="Center" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <TitleStyle BackColor="#009999" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="18pt" ForeColor="#CCCCFF" Height="25px" />
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <%-- HOY--%>
            <div id="cabecera" style="display: none">
                <div class="row">
                    <div class=" col s3">
                        <h5><b>Citas de hoy:
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="fechaCabecera" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </b></h5>
                    </div>
                </div>
            </div>

            <div id="grid" style="display: none;">
                <div class="row">
                    <div class="col s12">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="Gridview_Hoy" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                    runat="server" AutoGenerateColumns="False" Height="174px" OnRowDataBound="Gridview_Hoy_RowDataBound" OnSelectedIndexChanged="Gridview_Hoy_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula del paciente" ItemStyle-Width="100">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre del paciente" ItemStyle-Width="100">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="horaCita" HeaderText="Hora de la cita" ItemStyle-Width="100">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="telefonoCita" HeaderText="Contacto" ItemStyle-Width="100">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                    </Columns>                                
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div id="Actualizar_Eliminar" style="display: none;">
                <table class="striped">
                    <tr>
                        <th colspan="4" style="text-align: center">Datos de la cita</th>
                    </tr>
                    <tr>
                        <th>Cédula</th>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <input id="cedulaA" type="text" class="validate" title="Cédula" runat="server" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <input id="nombreA" type="text" class="validate" title="Nombre" runat="server" maxlength="44" onkeypress="return sololetras(event)" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <input id="fechaA" type="text" class="validate" title="Fecha" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <input id="horaA" type="time" class="validate" title="Hora" runat="server" step="1800" onkeypress="return solonumeros(event)" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <th>Teléfono</th>
                        <th colspan="3">Correo electrónico</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <input id="telefonoA" type="text" class="validate" title="Teléfono" runat="server" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td colspan="3">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <input id="correoA" type="email" class="validate" title="Correo" runat="server" maxlength="44" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <div class="row">
                    <div class="input-field col s3">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_Actualizar" runat="server" Text="Actualizar" OnClick="btn_Actualizar_Click" />
                    </div>
                    <div class="input-field col s3">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_Eliminar" runat="server" Text=" Eliminar " OnClick="btn_Eliminar_Click" />
                    </div>
                    <div class="input-field col s3">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_Nuevo" runat="server" Text="   Nueva  " OnClick="btn_Nuevo_Click" />
                    </div>
                    <div class="input-field col s3">
                        <asp:Button class="waves-effect waves-light btn" ID="btn_Notificación" runat="server" Text="Notificar " OnClick="btn_Notificación_Click" />
                    </div>
                </div>
            </div>

            <div id="agregar" class="row" style="display: none;">
                <div class="row">
                    <div class="col s12">
                        <div id="cabecera2" style="display: none">
                            <h5><b>Agregar una nueva cita</b></h5>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s6">
                        <label class="active" for="cedula" style="font-size: medium">Cédula del paciente</label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="cedula" type="text" runat="server" class="validate" title="Cédula" maxlength="14" onkeypress="return solonumeros(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="col s6">
                        <label class="active" for="nombre" style="font-size: medium">Nombre completo</label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="nombre" type="text" runat="server" class="validate" title="Nombre" maxlength="44" onkeypress="return sololetras(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="row">

                    <div class="col s6">
                        <label class="active" for="fechaC" style="font-size: medium">Fecha de la cita</label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="fechaC" type="text" runat="server" title="Fecha de la cita" class="validate" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="col s6">
                        <label class="active" for="hora" style="font-size: medium">Hora de la cita</label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="hora" type="time" runat="server" title="Hora de la cita" class="validate" step="1800" onkeypress="return solonumeros(event)" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="row">
                    <div class="col s6">
                        <label class="active" for="telefono" style="font-size: medium">Teléfono de contacto </label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="telefono" type="number" runat="server" title="Teléfono" class="validate" maxlength="14" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="col s6">
                        <label class="active" for="correo" style="font-size: medium">Correo electrónico </label>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input id="correo" type="email" runat="server" title="Correo" class="validate" maxlength="44" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col s4"></div>
                    <div class="input-field col s2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button class="waves-effect waves-light btn" ID="btn_Agregar" runat="server" Text="Guardar" OnClick="btn_Agregar_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="input-field col s2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button class="waves-effect waves-light btn" ID="btn_Limpiar" runat="server" Text="Limpiar" OnClick="btn_Limpiar_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col s4"></div>
                </div>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript">
    function ventana() {
        // alert('sAS');
        document.getElementById("agregarP").src = "frm_AgregarCita.aspx";
        //window.showModalDialog('frm_AgregarCita.aspx', '', 'dialogHeight:450 px;dialogWidth:670px;center:Yes;help:No;resizable: No;status:No;');
    }

    function solonumeros(e) {
        key = e.keyCoden || e.which;
        teclado = String.fromCharCode(key);
        numero = ":1234567890";
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

<!-- End demo purposes only -->
<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<!-- jQuery Easing -->

<script src="../js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="../js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="../js/jquery.waypoints.min.js"></script>
<!-- Stellar Parallax -->
<script src="../js/jquery.stellar.min.js"></script>
<!-- Counter -->
<script src="../js/jquery.countTo.js"></script>
<!-- Magnific Popup -->
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/magnific-popup-options.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
<script src="../js/google_map.js"></script>
<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
<script src="../js/jquery.style.switcher.js"></script>
<script src="../js/materialize.js"></script>

<script src="../js/main.js"></script>
</html>
