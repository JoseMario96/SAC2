<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ReporteOdontogramas.aspx.cs" Inherits="SAC.formularios.frm_ReporteOdontogramas" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <title></title>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>
    <script src="../js/jspdf.plugin.autotable.min.js"></script>

    <script src="../js/html2canvas.js"></script>
    <script src="../js/html2canvas.min.js"></script>
    <style>
        #myCanvas {
            border: 2px solid #000000;
        }

        #myCanvas2 {
            border: 2px solid #000000;
        }

        #myCanvas3 {
            border: 2px solid #000000;
        }

        #myCanvas4 {
            border: 2px solid #000000;
        }

        #NmyCanvas, #NmyCanvas2, #NmyCanvas3, #NmyCanvas4 {
            border: 2px solid #000000;
        }

        body {
            text-align: center;
        }

        .izquierda {
            text-align: left;
        }

        td, th {
            padding: 15px 1px;
        }

        .margen {
            margin-left: 30px;
            border: none;
        }
    </style>

    <style type="text/css">
        body, a, a:hover {
            cursor: url(C:\Users\dtrej\source\repos\SAC2\SAC\SAC\images\cur438.cur), progress;
        }

        .auto-style6 {
            width: 96px;
            height: 10px;
        }

        .auto-style7 {
            height: 10px;
        }

        .auto-style8 {
            width: 96px;
            height: 5px;
        }

        .auto-style9 {
            height: 10px;
        }

        td {
            padding: 5px;
        }

        .botones {
            margin-top: .9em;
        }

        #Panel1 {
            border: 1px solid white;
        }

            #Panel1.highlighted {
                border: 3px solid red;
            }

        .claseDelDiv {
            background-image: url("/images/4.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <div class="container">

            <div class="row">
                <br />
                <br />
                <asp:GridView ID="GridView_reporteOdontograma" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                    runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" AllowPaging="true" PageSize="3" OnSelectedIndexChanged="GridView_reporteOdontograma_SelectedIndexChanged" OnPageIndexChanging="GridView_reporteOdontograma_PageIndexChanging" OnRowDataBound="GridView_reporteOdontograma_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                        <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Panel ID="Panel1" runat="server" Visible="false" TabIndex="-1">
                <h5 class="izquierda">Datos personales</h5>
                <div>
                    <table class="margen" style="border: hidden;">
                        <tr>
                            <td class="auto-style8" style="border: hidden;">
                                <asp:Label ID="Label2" runat="server" Text="Paciente:"></asp:Label>
                            </td>
                            <td class="auto-style9" style="border: hidden;">
                                <asp:Label ID="nombre1" runat="server" Text="paciente"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8" style="border: hidden">
                                <asp:Label ID="Label1" runat="server" Text="Cédula:"></asp:Label>
                            </td>
                            <td class="auto-style9" style="border: hidden">

                                <asp:Label ID="cedulaP" runat="server" Text="cedula"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8" style="border: hidden">
                                <asp:Label ID="Label3" runat="server" Text="Télefono:"></asp:Label>
                            </td>
                            <td class="auto-style9" style="border: hidden">
                                <asp:Label ID="telefono" runat="server" Text="telefono"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6" style="border: hidden">
                                <asp:Label ID="Label4" runat="server" Text="Correo:"></asp:Label>
                            </td>
                            <td class="auto-style7" style="border: hidden">
                                <asp:Label ID="correo" runat="server" Text="correo"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <h5 class="izquierda">Odontograma</h5>
                <div id="canvasesdiv" style="position: relative; width: 810px; height: 200px">
                    <canvas id="myCanvas" width="810" height="200" style="z-index: 1; position: absolute; left: 25%; top: 0px;"></canvas>
                    <canvas id="myCanvas2" width="810" height="200" style="z-index: 2; position: absolute; left: 25%; top: 0px;"></canvas>
                    <canvas id="myCanvas3" width="810" height="200" style="z-index: 3; position: absolute; left: 25%; top: 0px;"></canvas>
                    <canvas id="myCanvas4" width="810" height="200" style="z-index: 4; position: absolute; left: 25%; top: 0px;"></canvas>
                </div>
                <br />
                <br />
                <div id="canvasesdiv2" style="position: relative; width: 890px; height: 200px">
                    <canvas id="NmyCanvas" width="510" height="200" style="z-index: 1; position: absolute; left: 46%; top: 0px;"></canvas>
                    <canvas id="NmyCanvas2" width="510" height="200" style="z-index: 2; position: absolute; left: 46%; top: 0px;"></canvas>
                    <canvas id="NmyCanvas3" width="510" height="200" style="z-index: 3; position: absolute; left: 46%; top: 0px;"></canvas>
                    <canvas id="NmyCanvas4" width="510" height="200" style="z-index: 4; position: absolute; left: 46%; top: 0px;"></canvas>
                </div>

                <div style="margin-left: auto; margin-right: auto;">
                    <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                        runat="server" AutoGenerateColumns="False" Height="174px" Width="70%" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="date_format(fechaExpedienteTratamiento,'%Y-%m-%d')" HeaderText="Fecha" ItemStyle-Width="30" />
                            <asp:BoundField DataField="piezaExpedienteTratamiento" HeaderText="Diente" ItemStyle-Width="100" />
                            <asp:BoundField DataField="tratamientoExpedienteTratamiento" HeaderText="Tratamiento" ItemStyle-Width="100" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="row botones">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="input-field col s2">
                                <asp:Button class="waves-effect waves-light btn" ID="btnSave" runat="server" Text="Generar reporte" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="input-field col s2">
                        <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="cancelar" />
                    </div>
                </div>
                <script>

                    // Funcion para dibujar las lineas negras de cada diente
                    function dibuja_contorno(context, inicio_x, inicio_y, med, separacion_x, separacion_y) {
                        var ctx = context;
                        // Definiendo puntos de dibujo
                        cua = med / 4;
                        ter = cua * 3;
                        /* 1ra zona */
                        if (ctx) {
                            ctx.strokeStyle = color_line;
                            ctx.beginPath();
                            ctx.moveTo(inicio_x, inicio_y);
                            ctx.lineTo(med + inicio_x, inicio_y);
                            ctx.lineTo(ter + inicio_x, cua + inicio_y);
                            ctx.lineTo(cua + inicio_x, cua + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                        /* 2da zona */
                        if (ctx) {
                            ctx.strokeStyle = color_line;
                            ctx.beginPath();
                            ctx.moveTo(ter + inicio_x, cua + inicio_y);
                            ctx.lineTo(med + inicio_x, inicio_y);
                            ctx.lineTo(med + inicio_x, med + inicio_y);
                            ctx.lineTo(ter + inicio_x, ter + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                        /* 3ra zona */
                        if (ctx) {
                            ctx.strokeStyle = color_line;
                            ctx.beginPath();
                            ctx.moveTo(cua + inicio_x, ter + inicio_y);
                            ctx.lineTo(ter + inicio_x, ter + inicio_y);
                            ctx.lineTo(med + inicio_x, med + inicio_y);
                            ctx.lineTo(inicio_x, med + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                        /* 4ta zona */
                        if (ctx) {
                            ctx.strokeStyle = color_line;
                            ctx.beginPath();
                            ctx.moveTo(inicio_x, inicio_y);
                            ctx.lineTo(cua + inicio_x, cua + inicio_y);
                            ctx.lineTo(cua + inicio_x, ter + inicio_y);
                            ctx.lineTo(inicio_x, med + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                    }
                    // Funcion para pintar una region del diente
                    function dibuja_seccionNinos(contexto, num_diente, seccion, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        cua = med / 4;
                        ter = cua * 3;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 10) {
                            inicio_y = 20;
                        }
                        else if (num_diente < 20) {
                            num_diente = num_diente - 10;
                            inicio_y = med + 100;
                            //if(num_diente==1){num_diente=0;}
                        }
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        /* 1ra zona */
                        if (seccion == 1) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 2da zona */
                        if (seccion == 2) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 3ra zona */
                        if (seccion == 3) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }

                        }
                        /* 4ta zona */
                        if (seccion == 4) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 5ta zona(medio) */
                        if (seccion == 5) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }

                    }
                    // Funcion para sombrear en amarillo
                    function marcar_seccion(contexto, num_diente, seccion, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        cua = med / 4;
                        ter = cua * 3;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 10) {
                            inicio_y = 20;
                        }
                        else if (num_diente < 20) {
                            num_diente = num_diente - 10;
                            inicio_y = med + 100;
                            //if(num_diente==1){num_diente=0;}
                        }

                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        /* 1ra zona */
                        if (seccion == 1) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 2da zona */
                        if (seccion == 2) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 3ra zona */
                        if (seccion == 3) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 4ta zona */
                        if (seccion == 4) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 5ta zona(medio) */
                        if (seccion == 5) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                    }
                    // Funcion para sombrear diente completo
                    function marcar_diente(contexto, num_diente, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 10) {
                            inicio_y = 20;
                        }
                        else if (num_diente < 20) {
                            num_diente = num_diente - 10;
                            inicio_y = med + 100;
                        }
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;

                        ctx.fillStyle = color_line;
                        ctx.beginPath();
                        ctx.moveTo(inicio_x, inicio_y);
                        ctx.lineTo(inicio_x + 40, inicio_y);
                        ctx.lineTo(inicio_x + 40, inicio_y + 40);
                        ctx.lineTo(inicio_x, inicio_y + 40);
                        ctx.closePath();
                        ctx.strokeStyle = color_line;
                        ctx.stroke();
                    }
                    // Funcion para sombrear diente completo(extraccion)
                    function marcar_extraccion(contexto, num_diente, color_pas2) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        color_line = color_pas2;
                        if (num_diente < 10) {
                            inicio_y = 20;
                        }
                        else if (num_diente < 20) {
                            num_diente = num_diente - 10;
                            inicio_y = med + 100;
                        }

                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        ctx.fillStyle = 'black';
                        ctx.strokeStyle = 'black';
                        ctx.beginPath();
                        ctx.lineWidth = 3;
                        ctx.moveTo(inicio_x, inicio_y);
                        ctx.lineTo(inicio_x + 40, inicio_y + 40);
                        ctx.moveTo(inicio_x + 40, inicio_y);
                        ctx.lineTo(inicio_x, inicio_y + 40);
                        ctx.stroke();
                        ctx.lineWidth = 1;
                    }
                    // Funcion para marcar puente
                    function marcar_puente(contexto, dient_1, dient_2, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente1 = dient_1 - 1;
                        num_diente2 = dient_2 - 1;
                        color_line = color_pas;
                        if (num_diente1 < 10) {
                            inicio_y = 80;
                        }
                        else if (num_diente < 20) {
                            num_diente1 = num_diente1 - 10;
                            num_diente2 = num_diente2 - 10;
                            inicio_y = med + 160;
                        }
                        inicio_x = (num_diente1 * med) + (separacion_x * num_diente1) + separacion_x + (med / 2);
                        fin_x = (num_diente2 * med) + (separacion_x * num_diente2) + separacion_x + (med / 2);
                        ctx.fillStyle = color_line;
                        ctx.beginPath();
                        ctx.lineWidth = 4;
                        ctx.moveTo(inicio_x, inicio_y);
                        ctx.lineTo(fin_x, inicio_y);
                        //ctx.moveTo(inicio_x+40,inicio_y);
                        //ctx.lineTo(inicio_x,inicio_y+40);
                        ctx.stroke();
                        ctx.lineWidth = 1;
                    }
                    // Funcion para borrar diente
                    function borrar_diente(contexto, num_diente) {
                        ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        if (num_diente < 10) {
                            inicio_y = 20;
                        }
                        else if (num_diente < 20) {
                            num_diente = num_diente - 10;
                            inicio_y = med + 100;
                        }
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;

                        ctx.clearRect(inicio_x, inicio_y, med, med);
                    }
                    function marcar_exodoncia(contexto, num_diente, color_pas) {
                        var ctxx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 10) {
                            inicio_y = 20;
                        }
                        else if (num_diente < 20) {
                            num_diente = num_diente - 10;
                            inicio_y = med + 100;
                        }

                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;

                        ctxx.fillStyle = color_line;

                        ctxx.strokeStyle = 'red';
                        ctxx.beginPath();
                        ctxx.lineWidth = 3;
                        ctxx.moveTo(inicio_x + 40, inicio_y);
                        ctxx.lineTo(inicio_x, inicio_y + 40);
                        ctxx.stroke();
                        ctxx.lineWidth = 1;
                    }
                    // Valores iniciales de las propiedades del diente
                    var canvas = document.getElementById('NmyCanvas');
                    var context = canvas.getContext('2d');
                    //
                    var layer6 = document.getElementById("NmyCanvas2");
                    var ctxN = layer6.getContext("2d");
                    //
                    var layer3 = document.getElementById("NmyCanvas3");
                    var ctx3 = layer3.getContext("2d");
                    //
                    var layer4 = document.getElementById("NmyCanvas4");
                    var ctx4 = layer4.getContext("2d");
                    //
                    var color_line = 'black';
                    var medida = 40;
                    var separacion_x = 10;
                    var separacion_x2 = 15;
                    var separacion_y = 10;
                    var iniciar_x = 0;
                    var iniciar_y = 20;
                    //Dientes para el puente
                    var diente1 = 0;
                    var diente2 = 0;
                    // 1 - 10 dientes
                    var sec = 56;
                    var sec2 = 60;
                    var sec3 = 86;
                    var sec4 = 70;


                    var con = 1;
                    var contador = 0;
                    var colorArray = new Array();
                    var borrarArrayC = new Array();
                    var borrarArrayD = new Array();
                    var borrarArrayS = new Array();
                    var borrarArrayM = new Array();

                    var index = "";
                    var posicionArray = new Array();
                    var dienteArray = new Array();
                    var seccionArray = new Array();
                    var marcacolorArray = new Array();
                    var contador = 0;
                    var contador2 = 0;
                    var bandera = 0;
                    var bandera2 = 0;
                    var banderaArray = new Array();
                    var bandera2Array = new Array();
                    var contadorBandera = 0;
                    var contadorBandera2 = 0;
                    var contadorBorrar = 0;
                    var contadorBorrar2 = 0;

                    var y = 0;
                    var color2 = '';

                    var seccion2 = 0;
                    var cont = 0;

                    var verificacion1 = false;
                    var verificacion2 = false;

                    var BDColor = new Array();
                    var BDSeccion = new Array();
                    var BDDiente = new Array();
                    var BDMarca = new Array();
                    var BDcontador = 0;
                    var BDborradorC = new Array();
                    var BDborradorD = new Array();
                    var BDborradorS = new Array();
                    var BDborradorM = new Array();

                    var BDNuevos = new Array();

                    var bdcontado2 = 0;
                    var bdcontado3 = 0;

                    var remplazo = 0;
                    var tamanoB = 0;
                    var salvaguarda = 0;
                    var pruebas = new Array();
                    var pruebaseccion = new Array();
                    var pruebacolor = new Array();
                    var flag = 0;
                    var verificarseccion;
                    var pintarsecciones = new Array();
                    var pintarcolores = new Array();
                    var clickSecciones = new Array();
                    var clickColores = new Array();
                    var clickfecha = new Array();
                    var fec = new Array();
                    var marcaP;
                    var noborrarseccion = false;
                    var comprobando;


                    //Los numeros
                    for (x = 0; x < 10; x++) {

                        if (sec > 51) {
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec--;
                            context.fillText(sec, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                        }
                        else {

                            separacion_x2 = 15;
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec2++;
                            context.fillText(sec2, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                            //}

                        }

                    }
                    // 11 - 20 dientes
                    iniciar_x = 0;
                    iniciar_y = medida + 100;
                    for (x = 0; x < 10; x++) {

                        if (sec3 > 81) {
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec3--;
                            context.fillText(sec3, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                        }
                        else {
                            separacion_x2 = 15;
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec4++;
                            context.fillText(sec4, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                        }

                    }
                    function pintarDienteNino(diente, seccion, color, marca) {
                        dibuja_seccionNinos(ctxN, diente, seccion, color);
                        if (color == 'black') {
                            marcar_extraccion(ctxN, marca, 'black');
                        }
                        else {

                            marcar_exodoncia(ctxN, marca, 'red');
                        }

                    }
                    //---------------------------------------------------------------------------------------

                    function dibuja_contorno(context, inicio_x, inicio_y, med) {
                        var ctx = context;
                        // Definiendo puntos de dibujo
                        cua = med / 4;
                        ter = cua * 3;
                        /* 1ra zona */
                        if (ctx) {
                            ctx.strokeStyle = 'black';
                            ctx.beginPath();
                            ctx.moveTo(inicio_x, inicio_y);
                            ctx.lineTo(med + inicio_x, inicio_y);
                            ctx.lineTo(ter + inicio_x, cua + inicio_y);
                            ctx.lineTo(cua + inicio_x, cua + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                        /* 2da zona */
                        if (ctx) {
                            ctx.strokeStyle = 'black';
                            ctx.beginPath();
                            ctx.moveTo(ter + inicio_x, cua + inicio_y);
                            ctx.lineTo(med + inicio_x, inicio_y);
                            ctx.lineTo(med + inicio_x, med + inicio_y);
                            ctx.lineTo(ter + inicio_x, ter + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                        /* 3ra zona */
                        if (ctx) {
                            ctx.strokeStyle = 'black';
                            ctx.beginPath();
                            ctx.moveTo(cua + inicio_x, ter + inicio_y);
                            ctx.lineTo(ter + inicio_x, ter + inicio_y);
                            ctx.lineTo(med + inicio_x, med + inicio_y);
                            ctx.lineTo(inicio_x, med + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                        /* 4ta zona */
                        if (ctx) {
                            ctx.strokeStyle = 'black';
                            ctx.beginPath();
                            ctx.moveTo(inicio_x, inicio_y);
                            ctx.lineTo(cua + inicio_x, cua + inicio_y);
                            ctx.lineTo(cua + inicio_x, ter + inicio_y);
                            ctx.lineTo(inicio_x, med + inicio_y);
                            ctx.closePath();
                            ctx.stroke();
                        }
                    }
                    // Funcion para pintar una region del diente
                    function dibuja_seccion(contexto, num_diente, seccion, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        cua = med / 4;
                        ter = cua * 3;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 16) {
                            inicio_y = 20;
                        }
                        else {
                            num_diente = num_diente - 16;
                            inicio_y = med + 100;
                            //if(num_diente==1){num_diente=0;}
                        }
                        //alert(num_diente);
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        /* 1ra zona */
                        if (seccion == 1) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 2da zona */
                        if (seccion == 2) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 3ra zona */
                        if (seccion == 3) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 4ta zona */
                        if (seccion == 4) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                        /* 5ta zona(medio) */
                        if (seccion == 5) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                ctx.fill();
                                ctx.strokeStyle = 'black';
                                ctx.stroke();
                            }
                        }
                    }
                    // Funcion para sombrear en amarillo
                    function marcar_seccion(contexto, num_diente, seccion, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        cua = med / 4;
                        ter = cua * 3;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 16) {
                            inicio_y = 20;
                        }
                        else {
                            num_diente = num_diente - 16;
                            inicio_y = med + 100;
                            //if(num_diente==1){num_diente=0;}
                        }
                        //alert(num_diente);
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        /* 1ra zona */
                        if (seccion == 1) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 2da zona */
                        if (seccion == 2) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(med + inicio_x, inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 3ra zona */
                        if (seccion == 3) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(med + inicio_x, med + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 4ta zona */
                        if (seccion == 4) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(inicio_x, inicio_y);
                                ctx.lineTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.lineTo(inicio_x, med + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                        /* 5ta zona(medio) */
                        if (seccion == 5) {
                            if (ctx) {
                                ctx.fillStyle = color_line;
                                ctx.beginPath();
                                ctx.moveTo(cua + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, cua + inicio_y);
                                ctx.lineTo(ter + inicio_x, ter + inicio_y);
                                ctx.lineTo(cua + inicio_x, ter + inicio_y);
                                ctx.closePath();
                                //ctx.fill();
                                ctx.strokeStyle = 'yellow';
                                ctx.stroke();
                            }
                        }
                    }
                    // Funcion para sombrear diente completo
                    function marcar_diente(contexto, num_diente, color_pas) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 16) {
                            inicio_y = 20;
                        }
                        else {
                            num_diente = num_diente - 16;
                            inicio_y = med + 100;
                        }
                        //alert(num_diente);
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;

                        ctx.fillStyle = color_line;
                        ctx.beginPath();
                        ctx.moveTo(inicio_x, inicio_y);
                        ctx.lineTo(inicio_x + 40, inicio_y);
                        ctx.lineTo(inicio_x + 40, inicio_y + 40);
                        ctx.lineTo(inicio_x, inicio_y + 40);
                        ctx.closePath();
                        ctx.strokeStyle = color_line;
                        ctx.stroke();
                    }
                    // Funcion para sombrear diente completo(extraccion)
                    function marcar_extraccion(contexto, num_diente, color_pas2) {
                        var ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        color_line = color_pas2;
                        if (num_diente < 16) {
                            inicio_y = 20;
                        }
                        else {
                            num_diente = num_diente - 16;
                            inicio_y = med + 100;
                        }
                        //alert(num_diente);
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        ctx.fillStyle = 'black';
                        ctx.strokeStyle = 'black';
                        ctx.beginPath();
                        ctx.lineWidth = 3;
                        ctx.moveTo(inicio_x, inicio_y);
                        ctx.lineTo(inicio_x + 40, inicio_y + 40);
                        ctx.moveTo(inicio_x + 40, inicio_y);
                        ctx.lineTo(inicio_x, inicio_y + 40);
                        ctx.stroke();
                        ctx.lineWidth = 1;
                    }

                    function marcar_exodoncia(contexto, num_diente, color_pas) {
                        var ctxx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        color_line = color_pas;
                        if (num_diente < 16) {
                            inicio_y = 20;
                        }
                        else {
                            num_diente = num_diente - 16;
                            inicio_y = med + 100;
                        }
                        //alert(num_diente);
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;

                        ctxx.fillStyle = color_line;

                        ctxx.strokeStyle = 'red';
                        ctxx.beginPath();
                        ctxx.lineWidth = 3;
                        ctxx.moveTo(inicio_x + 40, inicio_y);
                        ctxx.lineTo(inicio_x, inicio_y + 40);
                        ctxx.stroke();
                        ctxx.lineWidth = 1;
                    }

                    // Valores iniciales de las propiedades del diente
                    var canvas = document.getElementById('myCanvas');
                    var context = canvas.getContext('2d');
                    //
                    var layer2 = document.getElementById("myCanvas2");
                    var ctx2 = layer2.getContext("2d");
                    //
                    var layer3 = document.getElementById("myCanvas3");
                    var ctx3 = layer3.getContext("2d");
                    //
                    var layer4 = document.getElementById("myCanvas4");
                    var ctx4 = layer4.getContext("2d");
                    //
                    var color_line = 'black';
                    var medida = 40;
                    var separacion_x = 10;
                    var separacion_x2 = 15;
                    var separacion_y = 10;
                    var iniciar_x = 0;
                    var iniciar_y = 20;
                    //Dientes para el puente
                    var diente1 = 0;
                    var diente2 = 0;
                    // 1 - 16 dientes
                    var sec = 19;
                    var sec2 = 20;
                    var sec3 = 49;
                    var sec4 = 30;

                    //Los numeros
                    for (x = 0; x < 16; x++) {

                        if (sec > 11) {
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec--;
                            context.fillText(sec, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                        }
                        else {

                            separacion_x2 = 15;
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec2++;
                            context.fillText(sec2, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                            //}

                        }

                    }
                    // 17 - 32 dientes
                    iniciar_x = 0;
                    iniciar_y = medida + 100;
                    for (x = 0; x < 16; x++) {

                        if (sec3 > 41) {
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec3--;
                            context.fillText(sec3, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                        }
                        else {
                            separacion_x2 = 15;
                            iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                            dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                            /* Numero de diente */
                            context.font = '12pt Calibri';
                            context.textAlign = 'center';
                            context.fillStyle = 'blue';
                            sec4++;
                            context.fillText(sec4, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                        }

                    }

                    function pintarDiente(diente, seccion, color, marca) {

                        dibuja_seccion(ctx2, diente, seccion, color);
                        if (color == 'black') {
                            marcar_extraccion(ctx2, marca, 'black');
                        }
                        else {
                            marcar_exodoncia(ctx2, marca, 'red');
                        }

                    }

                    var logo = new Image();
                    logo.src = '../images/ReporteExpediente.png';




                    btnSave.addEventListener("click", function () {

                        var medida = 40;
                        var separacion_x = 10;

                        var iniciar_x = 0;
                        var iniciar_y = 20;
                        //Dientes para el puente


                        // 1 - 16 dientes
                        var sec = 19;
                        var sec2 = 20;
                        var sec3 = 49;
                        var sec4 = 30;
                        color_pas = 'red';

                        var canvas = document.getElementById("myCanvas2");
                        var context = canvas.getContext("2d");

                        for (x = 0; x < 16; x++) {
                            if (sec > 11) {
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                context.font = '12pt Calibri';
                                context.textAlign = 'center';
                                context.fillStyle = 'blue';
                                sec--;
                                context.fillText(sec, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                            }
                            else {

                                separacion_x2 = 15;
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                context.font = '12pt Calibri';
                                context.textAlign = 'center';
                                context.fillStyle = 'blue';
                                sec2++;
                                context.fillText(sec2, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                                //}

                            }
                        }
                        iniciar_x = 0;
                        iniciar_y = medida + 100;
                        for (x = 0; x < 16; x++) {

                            if (sec3 > 41) {
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                context.font = '12pt Calibri';
                                context.textAlign = 'center';
                                context.fillStyle = 'blue';
                                sec3--;
                                context.fillText(sec3, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                            }
                            else {
                                //separacion_x2 = 15;
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(context, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                context.font = '12pt Calibri';
                                context.textAlign = 'center';
                                context.fillStyle = 'blue';
                                sec4++;
                                context.fillText(sec4, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                            }
                        }



                        var medida = 40;
                        var separacion_x = 10;
                        var iniciar_x = 0;
                        var iniciar_y = 20;

                        var sec = 56;
                        var sec2 = 60;
                        var sec3 = 86;
                        var sec4 = 70;
                        color_pas = 'red';

                        var canvasninos = document.getElementById("NmyCanvas2");
                        var contextninos = canvasninos.getContext("2d");

                        for (x = 0; x < 10; x++) {

                            if (sec > 51) {
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(contextninos, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                contextninos.font = '12pt Calibri';
                                contextninos.textAlign = 'center';
                                contextninos.fillStyle = 'blue';
                                sec--;
                                contextninos.fillText(sec, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                            }
                            else {

                                separacion_x2 = 15;
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(contextninos, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                contextninos.font = '12pt Calibri';
                                contextninos.textAlign = 'center';
                                contextninos.fillStyle = 'blue';
                                sec2++;
                                contextninos.fillText(sec2, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                                //}

                            }

                        }
                        // 11 - 20 dientes
                        iniciar_x = 0;
                        iniciar_y = medida + 100;
                        for (x = 0; x < 10; x++) {

                            if (sec3 > 81) {
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(contextninos, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                contextninos.font = '12pt Calibri';
                                contextninos.textAlign = 'center';
                                contextninos.fillStyle = 'blue';
                                sec3--;
                                contextninos.fillText(sec3, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                            }
                            else {
                                separacion_x2 = 15;
                                iniciar_x = (x * medida) + (separacion_x * x) + separacion_x;
                                dibuja_contorno(contextninos, iniciar_x, iniciar_y, medida, separacion_x, 10);
                                /* Numero de diente */
                                contextninos.font = '12pt Calibri';
                                contextninos.textAlign = 'center';
                                contextninos.fillStyle = 'blue';
                                sec4++;
                                contextninos.fillText(sec4, iniciar_x + (medida / 2), (iniciar_y - 10) + 5);
                            }

                        }

                        //Reporte PDF


                        var cedula = document.getElementById("cedulaP").innerHTML;
                        var nombre1 = document.getElementById("nombre1").innerHTML;
                        var telefono = document.getElementById("telefono").innerHTML;
                        var correo = document.getElementById("correo").innerHTML;


                        var imgDataNino = canvasninos.toDataURL("image/png", 1.0);
                        var imgData = canvas.toDataURL("image/png", 1.0);


                        var pdf = new jsPDF('L', 'mm', 'A4');

                        var lMargin = 15;
                        var rMargin = 15;
                        var pdfInMM = pdf.internal.pageSize.width;
                        var limite = pdf.internal.pageSize.height;
                        var pageCenter = pdfInMM / 2;
                        pdf.setFontType("bold");
                        var paragraph = "    Clínica Dental\n Dra. Alina Camacho B.";

                        var lines = pdf.splitTextToSize(paragraph, (pdfInMM - lMargin - rMargin));
                        pdf.text(lines, pageCenter, 20, 'center'); //see this line
                        var today = new Date();
                        pdf.setFontType("normal");
                        var newdat = "Fecha:  " + today.toLocaleDateString();
                        pdf.text(210, 40, newdat);

                        pdf.setFontSize(14);
                        pdf.setFontType("bold");
                        pdf.text("Datos del paciente", 20, 40);

                        pdf.setFontType("normal");
                        pdf.setFontSize(12);
                        pdf.text(20, 50, "Paciente:");
                        pdf.text(40, 50, nombre1);
                        pdf.text(20, 55, "Cédula:");
                        pdf.text(40, 55, cedula);
                        pdf.text(20, 60, "Télefono:");
                        pdf.text(40, 60, telefono);
                        pdf.text(20, 65, "Correo:");
                        pdf.text(40, 65, correo);

                        pdf.setFontSize(14);
                        pdf.setFontType("bold");
                        pdf.text(20, 80, "Odontograma");
                        pdf.setFontType("normal");

                        pdf.addImage(imgData, 'png', 20, 90);
                        pdf.addImage(imgDataNino, 'png', pageCenter / 2, 145);
                        pdf.addImage(logo, 'png', 240, 95, 25, 35);
                        var numeropagina = 1;

                        pdf.text(260, 198, "pág." + numeropagina);
                        //----------------------------------------------------------------------------------------------

                        try {
                            var grid = document.getElementById("GridView1");

                            var total, saltopagina;
                            saltopagina = limite - 20;
                            var y = 50;
                            if (grid.rows.length > 0) {
                                pdf.addPage();
                                pdf.setFontType("bold");
                                lines = pdf.splitTextToSize(paragraph, (pdfInMM - lMargin - rMargin));
                                pdf.text(lines, pageCenter, 20, 'center');
                                pdf.setFontType("bold");
                                pdf.text("Fecha", 20, 40);
                                pdf.text("Diente", 80, 40);
                                pdf.text("Tratamiento", 120, 40);
                                pdf.setFontType("normal");

                                for (i = 1; i < grid.rows.length; i++) {
                                    try {
                                        nom1 = grid.rows[i].cells[0].innerHTML;
                                        nom2 = grid.rows[i].cells[1].innerHTML;
                                        ape1 = grid.rows[i].cells[2].innerHTML;


                                        total = nom1 + " " + nom2 + " " + ape1;
                                        pdf.text(20, y, nom1);
                                        pdf.text(80, y, nom2);
                                        pdf.text(120, y, ape1);
                                    } catch{


                                    }
                                    if (y == 195) {
                                        numeropagina = numeropagina + 1;
                                        pdf.text(250, 198, "pág." + numeropagina);
                                    }

                                    if (y >= saltopagina) {
                                        numeropagina = numeropagina + 1;
                                        y = 40;
                                        pdf.addPage();
                                        pdf.setFontType("bold");
                                        lines = pdf.splitTextToSize(paragraph, (pdfInMM - lMargin - rMargin));
                                        pdf.text(lines, pageCenter, 20, 'center');
                                        pdf.setFontType("bold");
                                        pdf.text("Fecha", 20, 40);
                                        pdf.text("Diente", 80, 40);
                                        pdf.text("Tratamiento", 120, 40);
                                        pdf.setFontType("normal");
                                        pdf.text(250, 198, "pág." + numeropagina);
                                    }
                                    y = y + 5;
                                }
                                nom1, nom1, ape1, total = " ";
                            }
                        } catch{

                        }

                        //----------------------------------------------------------------------------------------------
                        pdf.save(nombre1 + ".pdf");
                        alert("Reporte descargado");
                    }, false);
                </script>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
