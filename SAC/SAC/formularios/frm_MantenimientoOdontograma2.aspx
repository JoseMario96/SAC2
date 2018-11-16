<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_MantenimientoOdontograma2.aspx.cs" Inherits="SAC.formularios.frm_MantenimientoOdontograma2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>
    <style>
        table thead {
            color: #000;
            background-color: #3AC0F2;
        }

        table {
            width: 70%;
            margin: auto;
        }

        label, th, tr {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
    <style>
        #NmyCanvas {
            border: 2px solid #000;
        }

        #NmyCanvas2 {
            border: 2px solid #000;
        }

        #NmyCanvas3 {
            border: 2px solid #000;
        }

        #NmyCanvas4 {
            border: 2px solid #000;
        }

        body {
            text-align: center;
        }
    </style>
    <style type="text/css">
        body, a, a:hover {
            cursor: url("..images/cur438.cur");
        }
    </style>
    <script>
        $(function () {
            $("#Nradio").buttonset();
            $("#Nradio_seccion").buttonset();
            $('#Nradio').change(function () {
                accion = $("input[name='Naccion']:checked").val();
                if (accion == 'Nborrar') {
                    $("#Nradio_seccion").show('blind', 500);
                } else {
                    $("#Nradio_seccion").hide();
                }
            });
        });
    </script>
</head>
<body>
    <form id="Nform1" runat="server">
        <div class="row">
            <div class="input-field col s2" style="left: 0px; right: 69px; top: 0px; width: 6%">
                <asp:Label ID="NLabel5" runat="server" Text="Label">Cédula:
                </asp:Label>
            </div>
            <div class="input-field col s2">
                <asp:TextBox ID="BudquedaExp" runat="server" title="Cédula" placeholder="Cédula" OnTextChanged="BudquedaExp_TextChanged" AutoPostBack="true" onkeypress="return solonumeros (event)"></asp:TextBox>
            </div>
        </div>

        <asp:HiddenField ID="NcolorO" runat="server" />
        <asp:HiddenField ID="NdienteO" runat="server" />
        <asp:HiddenField ID="NseccionO" runat="server" />
        <asp:HiddenField ID="NcontextoO" runat="server" />
        <asp:HiddenField ID="NmarcaO" runat="server" />
        <asp:HiddenField ID="NborrarO" runat="server" />
        <asp:HiddenField ID="NcolorM" runat="server" />
        <asp:HiddenField ID="NBDcolorO" runat="server" />
        <asp:HiddenField ID="NBDdienteO" runat="server" />
        <asp:HiddenField ID="NBDseccionO" runat="server" />
        <asp:HiddenField ID="NBDdienteM" runat="server" />

        <div id="Nodontograma" style="display: none" tabindex="1">
            <h1>Odontograma</h1>
            <br>
            <br>
            <div id="Nradio">
                <input type="radio" id="Nradio1" name="accion" value="Ncarie" checked="checked" /><label for="radio1">Carie</label>
                <input type="radio" id="Nradio6" name="accion" value="Nsellante" /><label for="radio6">Sellante</label>
                <input type="radio" id="Nradio2" name="accion" value="Nrestauracion" /><label for="radio2">Obturado</label>
                <input type="radio" id="Nradio4" name="accion" value="Nextraccion" /><label for="radio4">Ausencia</label>
                <input type="radio" id="Nradio5" name="accion" value="Nexodoncia" /><label for="radio5">Exodoncia</label>
                <input type="radio" id="Nradio3" name="accion" value="Nborrar" /><label for="radio3">Borrar</label>
            </div>
            <br>
            <div id="Ncanvasesdiv" style="position: relative; width: 890px; height: 200px">
                <canvas id="NmyCanvas" width="510" height="200" style="z-index: 1; position: absolute; left: 46%; top: 0px;"></canvas>
                <canvas id="NmyCanvas2" width="510" height="200" style="z-index: 2; position: absolute; left: 46%; top: 0px;"></canvas>
                <canvas id="NmyCanvas3" width="510" height="200" style="z-index: 3; position: absolute; left: 46%; top: 0px;"></canvas>
                <canvas id="NmyCanvas4" width="510" height="200" style="z-index: 4; position: absolute; left: 46%; top: 0px;"></canvas>
            </div>
            <div id="Nradio_seccion" style='display: none'>
                <input type="radio" id="Nradio_1" name="seccion" value="seccion" checked="checked" /><label for="radio_1">Seccion</label>
                <input type="radio" id="Nradio_2" name="seccion" value="diente" /><label for="radio_2">Diente</label>
            </div>
            <br />
            <div class="input-field col s4">
                <asp:Button ID="NButton1" runat="server" OnClick="Guardar_Click" Text="Guardar" class="waves-effect waves-light btn" />
            </div>
            <script>

                // Funcion para dibujar las lineas negras de cada diente
                function Ndibuja_contorno(Ncontext, inicio_x, inicio_y, med, separacion_x, separacion_y) {
                    var ctx = Ncontext;
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
                function Ndibuja_seccion(contexto, num_diente, seccion, color_pas) {
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
                    else if(num_diente < 20) {
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
                function Nmarcar_seccion(contexto, num_diente, seccion, color_pas) {
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
                function Nmarcar_diente(contexto, num_diente, color_pas) {
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
                function Nmarcar_extraccion(contexto, num_diente, color_pas2) {
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
                function Nmarcar_puente(contexto, dient_1, dient_2, color_pas) {
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
                function Nborrar_diente(contexto, num_diente) {
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
                function Nmarcar_exodoncia(contexto, num_diente, color_pas) {
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
                var Ncanvas = document.getElementById('myCanvas');
                var Ncontext = Ncanvas.getContext('2d');
                //
                var Nlayer2 = document.getElementById("myCanvas2");
                var Nctx2 = Nlayer2.getContext("2d");
                //
                var Nlayer3 = document.getElementById("myCanvas3");
                var Nctx3 = Nlayer3.getContext("2d");
                //
                var layer4 = document.getElementById("myCanvas4");
                var Nctx4 = Nlayer4.getContext("2d");
                //
                var Ncolor_line = 'black';
                var Nmedida = 40;
                var Nseparacion_x = 10;
                var Nseparacion_x2 = 15;
                var Nseparacion_y = 10;
                var Niniciar_x = 0;
                var Niniciar_y = 20;
                //Dientes para el puente
                var Ndiente1 = 0;
                var Ndiente2 = 0;
                // 1 - 16 dientes
                var Nsec = 56;
                var Nsec2 = 60;
                var Nsec3 = 86;
                var Nsec4 = 70;

                var Ncon = 1;
                var Ncontador = 0;
                var NcolorArray = new Array();
                var NborrarArrayC = new Array();
                var NborrarArrayD = new Array();
                var NborrarArrayS = new Array();
                var NborrarArrayM = new Array();

                var Nindex = "";
                var NposicionArray = new Array();
                var NdienteArray = new Array();
                var NseccionArray = new Array();
                var NmarcacolorArray = new Array();
                var Ncontador = 0;
                var Ncontador2 = 0;
                var Nbandera = 0;
                var Nbandera2 = 0;
                var NbanderaArray = new Array();
                var Nbandera2Array = new Array();
                var NcontadorBandera = 0;
                var NcontadorBandera2 = 0;
                var NcontadorBorrar = 0;
                var NcontadorBorrar2 = 0;

                var Ny = 0;
                var Ncolor2 = '';

                var Nseccion2 = 0;
                var Ncont = 0;

                var Nverificacion1 = false;
                var Nverificacion2 = false;

                var NBDColor = new Array();
                var NBDSeccion = new Array();
                var NBDDiente = new Array();
                var NBDMarca = new Array();
                var NBDcontador = 0;
                var NBDborradorC = new Array();
                var NBDborradorD = new Array();
                var NBDborradorS = new Array();
                var NBDborradorM = new Array();

                var NBDNuevos = new Array();

                var Nbdcontado2 = 0;
                var Nbdcontado3 = 0;

                var Nremplazo = 0;
                var NtamanoB = 0;
                var Nsalvaguarda = 0;
                var Npruebas = new Array();
                var Npruebaseccion = new Array();
                var Npruebacolor = new Array();
                var Nflag = 0;
                var Nverificarseccion;
                var Npintarsecciones = new Array();
                var Npintarcolores = new Array();
                var NclickSecciones = new Array();
                var NclickColores = new Array();
                var Nclickfecha = new Array();
                var Nfec = new Array();
                var NmarcaP;
                var Ncomprobando;


                //Los numeros
                for (x = 0; x < 10; x++) {

                    if (Nsec > 51) {
                        Niniciar_x = (x *Nmedida) + (Nseparacion_x * x) + Nseparacion_x;
                        Ndibuja_contorno(Ncontext, Niniciar_x, Niniciar_y, Nmedida, Nseparacion_x, 10);
                        /* Numero de diente */
                        Ncontext.font = '12pt Calibri';
                        Ncontext.textAlign = 'center';
                        Ncontext.fillStyle = 'blue';
                        Nsec--;
                        Ncontext.fillText(Nsec, Niniciar_x + (Nmedida / 2), (Niniciar_y / 2) + 5);
                    }
                    else {

                        Nseparacion_x2 = 15;
                        Niniciar_x = (x * Nmedida) + (Nseparacion_x * x) + Nseparacion_x;
                        dibuja_contorno(Ncontext, Niniciar_x, Niniciar_y, Nmedida, NNseparacion_x, 10);
                        /* Numero de diente */
                        Ncontext.font = '12pt Calibri';
                        Ncontext.textAlign = 'center';
                        Ncontext.fillStyle = 'blue';
                        Nsec2++;
                        Ncontext.fillText(Nsec2, iniciar_x + (medida / 2), (iniciar_y / 2) + 5);
                        //}

                    }

                }
                // 17 - 32 dientes
                Niniciar_x = 0;
                Niniciar_y = medida + 100;
                for (x = 0; x < 10; x++) {
                   
                    if (Nsec3 > 81) {
                        Niniciar_x = (x * Nmedida) + (Nseparacion_x * x) + Nseparacion_x;
                        Ndibuja_contorno(Ncontext, Niniciar_x, Niniciar_y, Nmedida, Nseparacion_x, 10);
                        /* Numero de diente */
                       Ncontext.font = '12pt Calibri';
                        Ncontext.textAlign = 'center';
                        Ncontext.fillStyle = 'blue';
                        Nsec3--;
                        Ncontext.fillText(Nsec3, Niniciar_x + (Nmedida / 2), (Niniciar_y - 10) + 5);
                    }
                    else {
                        Nseparacion_x2 = 15;
                        Niniciar_x = (x * Nmedida) + (Nseparacion_x * x) + Nseparacion_x;
                        Ndibuja_contorno(Ncontext, Niniciar_x, Niniciar_y, Nmedida, Nseparacion_x, 10);
                        /* Numero de diente */
                        Ncontext.font = '12pt Calibri';
                        Ncontext.textAlign = 'center';
                        Ncontext.fillStyle = 'blue';
                       Nsec4++;
                       Ncontext.fillText(Nsec4, Niniciar_x + (Nmedida / 2), (Niniciar_y - 10) + 5);
                    }

                }
                window.onload = function () {
                    localStorage.clear();
                    click();
                }
                function click() {
                    //Añadimos un addEventListener al canvas para reconocer el click
                    Nlayer4.addEventListener("click",
                        //Una vez se haya clickado se activará la siguiente función
                        NgetPosition
                        , false);
                    Nlayer4.addEventListener("mousemove", NMarcar, false);
                }
                //canvas.addEventListener("mousedown", getPosition, false);

                function NgetPosition(event) {
                    var Nx = event.pageX - 411.9;// pintar en eje x
                    var Ny = event.pageY; // pintar en eje y

                    var Ncanvas = document.getElementById("myCanvas");
                    var Ndiv_can = document.getElementById("canvasesdiv");
                   Nx -= div_can.offsetLeft;
                    Ny -= div_can.offsetTop;

                    var Ndiv = 0;
                    var Ncolor = '';
                    var Naccion = '';
                    Nseleccion = $("input[name='Naccion']:checked").val();
                    if (Nseleccion == 'Ncarie') {
                        Ncolor = 'red';
                        Ncolor2 = color;
                        Naccion = 'Nseccion';
                    }
                    else if (Nseleccion == 'Nrestauracion') {
                        Ncolor = 'blue';
                        Ncolor2 = color;
                       Naccion = 'Nseccion';
                    }
                    else if (Nseleccion == 'Nsellante') {
                        Ncolor = 'black';
                        Ncolor2 = color;
                        Naccion = 'Nseccion';
                    }
                    else if (Nseleccion == 'Nextraccion') {
                        Ncolor = '2';
                        Naccion = 'Nmarcar';

                    }
                    else if (Nseleccion == 'Nexodoncia') {
                        Ncolor = '1';
                        Naccion = 'NmarcarE';
                    }
                    else if (Nseleccion == 'Nborrar') {
                        Naccion = 'Nborrar';
                    }

                    Ndiente = 0;
                    Nseccion = 0;

                    if (Ny >= 20 && Ny <= 60) {

                        if (Nx >= 10 && Nx <= 50) {
                            Ndiente = 1;
                        }
                        else if (Nx >= 60 && Nx <= 800) {
                            Ndiv = parseInt(Nx / 50, 10);
                            Nini = (Ndiv * 40) + (10 * Ndiv) + 10;
                            Nfin = Nini + 40;
                            if (x >= Nini && x <= Nfin) {
                                Ndiente = Ndiv + 1;
                            }
                        }
                    }
                    else if (Ny >= 140 && Ny <= 180) {
                        if (Nx >= 10 && Nx <= 50) {
                            Ndiente = 11;
                        }
                        else if (Nx >= 60 && Nx <= 800) {
                            Ndiv = parseInt(Nx / 50, 10);
                            Nini = (Ndiv * 40) + (10 * Ndiv) + 10;
                            Nfin = Nini + 40;
                            if (Nx >= Nini && x <= Nfin) {
                                Ndiente = Ndiv + 11;
                            }
                        }
                    }

                    if (Ndiente) {
                        if (Naccion == 'Nseccion') {
                            var NestadoDiente = false;
                            for (var zz = 0; zz < NBDMarca.length; zz++) {
                                if (Ndiente == NBDMarca[zz]) {
                                    NestadoDiente = true;
                                }
                            }
                            if (NestadoDiente == false) {
                                Nx = Nx - ((Ndiv * 40) + (10 * Ndiv) + 10);
                                y = y - 20;
                                if (diente > 10) {
                                    y = y - 120;
                                }
                                if (y > 0 && y < 10 && x > y && y < 40 - x) {
                                    seccion = 1;
                                } else if (x > 30 && x < 40 && y < x && 40 - x < y) {
                                    seccion = 2;

                                } else if (y > 30 && y < 40 && x < y && x > 40 - y) {
                                    seccion = 3;

                                } else if (x > 0 && x < 10 && y > x && x < 40 - y) {
                                    seccion = 4;

                                } else if (x > 10 && x < 30 && y > 10 && y < 30) {
                                    seccion = 5;
                                }
                            } else {
                                alert("No se puede pintar sobre una Ausencia o Exodoncia");
                            }


                        } else if (accion == 'marcar') {
                            cod = diente + '-0-' + '4';
                            var verificacion1 = false;
                            var cargado3 = false;

                            if (banderaArray.length > 0 || bandera2Array.length > 0) {

                                for (var p = 0; p <= banderaArray.length; p++) {
                                    if (banderaArray[p] == diente) {
                                        verificacion1 = true;
                                    }
                                }
                                for (var r = 0; r <= bandera2Array.length; r++) {
                                    if (bandera2Array[r] == diente) {
                                        verificacion1 = true;
                                    }
                                }
                            }
                            for (var c = 0; c < BDMarca.length; c++) {
                                if (BDMarca[c] == diente) {
                                    cargado3 = true;
                                }
                            }

                            if (verificacion1 == false && cargado3 == false) {
                                if (cod && !localStorage.getItem(cod)) {
                                    new_array = [diente, 0, 4, Date.now(), 0];
                                    guardar = new_array.toLocaleString();
                                    localStorage.setItem(cod, guardar);
                                    marcar_extraccion(ctx2, diente, 'black')
                                    marcacolorArray[contador2] = 'black';
                                    seccionArray[contador2] = diente;
                                    contador2++;
                                    banderaArray[contadorBandera] = diente;
                                    contadorBandera++;
                                    document.getElementById('colorM').value = marcacolorArray.join(',');
                                    document.getElementById('marcaO').value = seccionArray.join(',');
                                }
                                else {
                                    alert("El diente ya contiene un tratamiento");
                                }
                            }
                            else {
                                alert('Ya se realizó algún tipo de extracción')
                            }
                        } else if (accion == 'marcarE') {
                            cod2 = diente + '-0-' + '5';
                            var verificacion2 = false;
                            var cargado2 = false;

                            if (banderaArray.length > 0 || bandera2Array.length > 0) {
                                for (var p = 0; p <= banderaArray.length; p++) {
                                    if (banderaArray[p] == diente) {

                                        verificacion2 = true;
                                    }
                                }
                                for (var r = 0; r <= bandera2Array.length; r++) {
                                    if (bandera2Array[r] == diente) {
                                        verificacion2 = true;
                                    }
                                }

                            }
                            for (var c = 0; c < BDMarca.length; c++) {
                                if (BDMarca[c] == diente) {
                                    cargado2 = true;
                                }
                            }

                            if (verificacion2 == false && cargado2 == false) {
                                if (cod2 && !localStorage.getItem(cod2)) {
                                    new_array2 = [diente, 0, 5, Date.now(), 0];
                                    guardar2 = new_array2.toLocaleString();
                                    localStorage.setItem(cod2, guardar2);
                                    marcar_exodoncia(ctx2, diente, 'red')
                                    marcacolorArray[contador2] = 'red';
                                    seccionArray[contador2] = diente;
                                    contador2++;
                                    bandera2Array[contadorBandera2] = diente;
                                    contadorBandera2++;
                                    document.getElementById('marcaO').value = seccionArray.join(',');
                                    document.getElementById('colorM').value = marcacolorArray.join(',');

                                } else {
                                    alert("El diente ya contiene un tratamiento");
                                }
                            }
                            else {
                                alert('Ya se realizó algún tipo de extracción')
                            }
                        }

                        ////////////////////////////////////////////////////////////////
                        else if (accion == 'borrar') {
                            borrar_diente(ctx2, diente);
                            document.getElementById('borrarO').value = diente;
                            ////Cargar el ultimo pintado

                            seccion_chk = $("input[name='seccion']:checked").val();
                            if (seccion_chk == 'seccion') {
                                x = x - ((div * 40) + (10 * div) + 10);
                                y = y - 20;
                                if (diente > 10) {
                                    y = y - 120;
                                }
                                if (y > 0 && y < 10 && x > y && y < 40 - x) {
                                    seccion2 = 1;
                                } else if (x > 30 && x < 40 && y < x && 40 - x < y) {
                                    seccion2 = 2;

                                } else if (y > 30 && y < 40 && x < y && x > 40 - y) {
                                    seccion2 = 3;

                                } else if (x > 0 && x < 10 && y > x && x < 40 - y) {
                                    seccion2 = 4;

                                } else if (x > 10 && x < 30 && y > 10 && y < 30) {
                                    seccion2 = 5;
                                } else {
                                    alert("Seleccione bien la sección deseada");
                                    pintartodo();
                                }

                                borrarArrayC[contadorBorrar] = color2;
                                borrarArrayD[contadorBorrar] = diente;
                                borrarArrayS[contadorBorrar] = seccion2;
                                contadorBorrar++;
                                con = 0;
                                var usando = 0;
                                var con2 = 0;

                                for (var xx = 0; xx < BDDiente.length; xx++) {
                                    for (var yy = 0; yy < borrarArrayD.length; yy++) {
                                        if (BDDiente[xx] == borrarArrayD[yy] && BDSeccion[xx] == borrarArrayS[yy]) {
                                            con++;

                                            if (con == 1) {
                                                alert("En el 1");
                                                BDborradorC[bdcontado2] = BDColor[xx];
                                                BDborradorD[bdcontado2] = BDDiente[xx];
                                                BDborradorS[bdcontado2] = BDSeccion[xx];
                                                //BDColor.splice(xx, 1);
                                                //BDDiente.splice(xx, 1);
                                                //BDSeccion.splice(xx, 1);
                                                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                                bdcontado2++;
                                                usando++;
                                            }
                                            else if (con == 2) {
                                                alert("En el 2");
                                                bdcontado2--;
                                                BDborradorC[bdcontado2] = BDColor[xx];
                                                BDborradorD[bdcontado2] = BDDiente[xx];
                                                BDborradorS[bdcontado2] = BDSeccion[xx];
                                                //BDColor.splice(xx, 1);
                                                //BDDiente.splice(xx, 1);
                                                //BDSeccion.splice(xx, 1);
                                                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                                bdcontado2++;

                                            }
                                            else if (con == 3) {
                                                alert("En el 3");
                                                bdcontado2--;
                                                BDborradorC[bdcontado2] = BDColor[xx];
                                                BDborradorD[bdcontado2] = BDDiente[xx];
                                                BDborradorS[bdcontado2] = BDSeccion[xx];
                                                BDColor.splice(xx, 1);
                                                BDDiente.splice(xx, 1);
                                                BDSeccion.splice(xx, 1);
                                                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                                bdcontado2++;

                                            }

                                        }
                                    }
                                }
                                con = 0;

                                var auxiliarArrayC = new Array();
                                var auxiliarArrayD = new Array();
                                var auxiliarArrayS = new Array();
                                var contando = 0;
                                var prueba = 0;
                                var borrarDS = 0;

                                for (var dd = 0; dd < dienteArray.length; dd++) {
                                    for (var ss = 0; ss < borrarArrayD.length; ss++) {
                                        if (dienteArray[dd] == borrarArrayD[ss] && posicionArray[dd] == borrarArrayS[ss]) {
                                            borrarDS++;
                                            contando++;
                                            if (contando == 1) {
                                                contadorB1 = dd;
                                                auxiliarArrayD[prueba] = dienteArray[dd];
                                                auxiliarArrayS[prueba] = posicionArray[dd];
                                                auxiliarArrayC[prueba] = colorArray[dd];
                                                colorArray.splice(dd, 1);
                                                //dienteArray.splice(dd, 1);
                                                //posicionArray.splice(dd, 1);

                                                // alert(auxiliarArrayC[prueba]);
                                                prueba++;
                                                //document.getElementById('colorO').value = colorArray.join(',');
                                                //document.getElementById('dienteO').value = dienteArray.join(',');
                                                //document.getElementById('seccionO').value = posicionArray.join(',');

                                            }
                                            else if (contando == 2) {
                                                contadorB2 = dd;
                                                auxiliarArrayC[prueba] = colorArray[dd - 1];
                                                colorArray.splice(dd - 1, 1, auxiliarArrayC[prueba - 1]);
                                                //colorArray.splice(dd, 1);
                                                //dienteArray.splice(dd, 1);
                                                //posicionArray.splice(dd, 1);                              
                                                prueba++;
                                                //document.getElementById('colorO').value = colorArray.join(',');
                                                //document.getElementById('dienteO').value = dienteArray.join(',');
                                                //document.getElementById('seccionO').value = posicionArray.join(',');

                                            }
                                            else if (contando == 3) {
                                                contadorB3 = dd;
                                                auxiliarArrayC[prueba] = colorArray[dd - 1];

                                                colorArray.splice(dd - 1, 1, auxiliarArrayC[prueba - 1]);
                                                //colorArray.splice(dd, 1);
                                                //dienteArray.splice(dd, 1);
                                                //posicionArray.splice(dd, 1);                              
                                                prueba++;
                                                //document.getElementById('colorO').value = colorArray.join(',');
                                                //document.getElementById('dienteO').value = dienteArray.join(',');
                                                //document.getElementById('seccionO').value = posicionArray.join(',');
                                            }
                                        }
                                    }
                                }
                                if (contando == 1) {
                                    dienteArray.splice(contadorB1, 1);
                                    posicionArray.splice(contadorB1, 1);
                                    document.getElementById('colorO').value = colorArray.join(',');
                                    document.getElementById('dienteO').value = dienteArray.join(',');
                                    document.getElementById('seccionO').value = posicionArray.join(',');
                                }
                                else if (contando == 2) {
                                    dienteArray.splice(contadorB2, 1);
                                    posicionArray.splice(contadorB2, 1);
                                    document.getElementById('colorO').value = colorArray.join(',');
                                    document.getElementById('dienteO').value = dienteArray.join(',');
                                    document.getElementById('seccionO').value = posicionArray.join(',');
                                }
                                else if (contando == 3) {
                                    //dienteArray.splice(contadorB2, 1);
                                    //posicionArray.splice(contadorB2, 1);
                                    dienteArray.splice(contadorB3, 1);
                                    posicionArray.splice(contadorB3, 1);
                                    document.getElementById('colorO').value = colorArray.join(',');
                                    document.getElementById('dienteO').value = dienteArray.join(',');
                                    document.getElementById('seccionO').value = posicionArray.join(',');
                                }


                                seccion_b = ubica_seccion(x, y);
                                verificarseccion = seccion_b;

                                if (seccion_b) {
                                    ultimo = '';
                                    key_cod = '';
                                    key_cod2 = '';
                                    var primero;
                                    var segundo;
                                    var colores1;
                                    var colores2;
                                    var colores3;
                                    var colores;
                                    var dient = 0;
                                    tamanoB = 0;
                                    tamanoB = localStorage.length;
                                    var borrarVarios = new Array();
                                    var contVarios = 0;

                                    for (var i = 0; i < localStorage.length; i++) {
                                        var key_namee = localStorage.key(i);
                                        itemm = localStorage.getItem(key_namee);
                                        itemm = itemm.split(',');
                                        dienteVarios = parseInt(itemm[0], 10);
                                        seccionVarios = parseInt(itemm[1], 10);
                                        colores = parseInt(itemm[2], 10);
                                        if (dienteVarios == diente && seccionVarios == seccion2) {
                                            borrarVarios[contVarios] = i;
                                            contVarios++;
                                        }
                                        if (dienteVarios == diente && (colores == 5 || colores == 4)) {
                                            comprobando = colores;
                                        }
                                    }
                                    tamanoB = borrarVarios.length;
                                    if (tamanoB == 3) {
                                        var coloresU = localStorage.key(borrarVarios[0]);
                                        colores1 = localStorage.getItem(coloresU);
                                        colores1 = colores1.split(',');
                                        var coloresD = localStorage.key(borrarVarios[1]);
                                        colores2 = localStorage.getItem(coloresD);
                                        colores2 = colores2.split(',');
                                        var coloresT = localStorage.key(borrarVarios[2]);
                                        colores3 = localStorage.getItem(coloresT);
                                        colores3 = colores3.split(',');
                                        if ((colores1[3] < colores2[3]) && (colores1[3] < colores3[3])) {
                                            if (colores2[3] > colores3[3]) {
                                                key_cod = coloresD;
                                            } else {
                                                key_cod = coloresT;
                                            }
                                        } else if ((colores1[3] > colores2[3]) && (colores1[3] < colores3[3])) {
                                            key_cod = coloresT;

                                        } else if ((colores1[3] > colores2[3]) && (colores1[3] > colores3[3])) {
                                            key_cod = coloresU;
                                        } else {
                                            key_cod = coloresD;
                                        }
                                    } else {
                                        for (var i = 0; i < localStorage.length; i++) {
                                            var key_name = localStorage.key(i);
                                            item = localStorage.getItem(key_name);
                                            item = item.split(',');
                                            diente_comp = parseInt(item[0], 10);
                                            seccion_comp = parseInt(item[1], 10);
                                            accion_comp = parseInt(item[2], 10);
                                            key_cod2 = key_name;
                                            if (diente_comp == diente && seccion_b == seccion_comp && (accion_comp == 1 || accion_comp == 2 || accion_comp == 3)) {
                                                if (ultimo == '') {
                                                    ultimo = item;
                                                    key_cod = key_name;
                                                    var pruebaorig = localStorage.key(i);
                                                    segundo = localStorage.getItem(pruebaorig);
                                                    segundo = segundo.split(',');
                                                }
                                                //Cuando tengo 2 tratamientos
                                                else {
                                                    var pruebasig = localStorage.key(i);
                                                    primero = localStorage.getItem(pruebasig);
                                                    primero = primero.split(',');
                                                    if (segundo[3] < primero[3]) {
                                                        key_cod = pruebasig;
                                                    }
                                                }
                                            }
                                            if (diente_comp == diente && (accion_comp == 5 || accion == 4)) {
                                                comprobando = accion_comp;
                                            }
                                        }
                                    }
                                    //termina el for que recorre para borrar
                                    salvaguarda = key_cod;

                                    if (key_cod != '') {
                                        localStorage.removeItem(key_cod);
                                        pinta_datos();
                                    }
                                    pinta_datos();

                                }
                            }

                            //--------------------------------------------------------------------------------------------
                            else if (seccion_chk == 'diente') {
                                ultimo = '';
                                verificacion1 = false;
                                verificacion2 = false;
                                key_cod = '';
                                seccion2 = 0;


                                banderaArray.splice(contadorBandera - 1, 1);
                                bandera2Array.splice(contadorBandera2 - 1, 1);
                                borrarArrayM[contadorBorrar2] = diente;
                                contadorBorrar2++;

                                //  alert(borrarArrayD[0]);
                                // borrarArrayD[contadorBorrar] = diente;
                                // alert(borrarArray[0]);
                                for (var v = 0; v < BDMarca.length; v++) {
                                    for (var u = 0; u < borrarArrayM.length; u++) {
                                        if (BDMarca[v] == borrarArrayM[u]) {
                                            alert("Si");
                                            BDborradorM[bdcontado3] = BDMarca[v];
                                            document.getElementById('BDdienteM').value = BDborradorM.join(',');
                                            bdcontado3++;
                                        }
                                    }

                                }

                                for (var i = 0; i < localStorage.length; i++) {
                                    var key_name = localStorage.key(i);
                                    item = localStorage.getItem(key_name);
                                    item = item.split(',');
                                    diente_comp = parseInt(item[0], 10);
                                    accion_comp = parseInt(item[2], 10);
                                    if (diente_comp == diente && accion_comp == 4 || accion_comp == 5) {
                                        if (ultimo == '') {
                                            ultimo = item;
                                            key_cod = key_name;
                                        }
                                        else {
                                            fecha_ult = parseInt(item[3], 10);
                                            if (ultimo[3] < fecha_ult) {
                                                ultimo = item;
                                                key_cod = key_name;
                                            }
                                        }
                                    }
                                }
                                if (key_cod != '') {
                                    localStorage.removeItem(key_cod);
                                    pinta_datos();
                                }
                                pinta_datos();

                            }
                        }
                    }
                    if (seccion && color != '') {

                        //[numero_diente, seccion, accion, fecha, diente2]
                        if (color == 'red') {
                            cod = diente + '-' + seccion + '-' + '1';
                            accion_g = 1;
                        } else if (color == 'black') {
                            cod = diente + '-' + seccion + '-' + '2';
                            accion_g = 2;
                        } else if (color == 'blue') {
                            cod = diente + '-' + seccion + '-' + '3';
                            accion_g = 3;
                        };
                        var cargado = false;
                        var verificacion3 = false;

                        if (banderaArray.length > 0 || bandera2Array.length > 0) {
                            for (var p = 0; p <= banderaArray.length; p++) {
                                if (banderaArray[p] == diente) {
                                    verificacion3 = true;

                                }
                            }
                            for (var r = 0; r <= bandera2Array.length; r++) {
                                if (bandera2Array[r] == diente) {

                                    verificacion3 = true;
                                }
                            }
                        }
                        for (var c = 0; c < BDColor.length; c++) {
                            if (BDColor[c] == color && BDDiente[c] == diente && BDSeccion[c] == seccion) {
                                cargado = true;
                            }
                        }
                        if (verificacion3 == false) {
                            //  alert("atascado");
                            if (cargado == false && cod && !localStorage.getItem(cod)) {

                                new_array = [diente, seccion, accion_g, Date.now(), 0];
                                guardar = new_array.toLocaleString();
                                localStorage.setItem(cod, guardar);
                                if (verificacion3 == false) {
                                    dibuja_seccion(ctx2, diente, seccion, color);
                                    colorArray[contador] = color;
                                    dienteArray[contador] = diente;
                                    posicionArray[contador] = seccion;
                                    contador++;
                                    document.getElementById('colorO').value = colorArray.join(',');
                                    document.getElementById('dienteO').value = dienteArray.join(',');
                                    document.getElementById('seccionO').value = posicionArray.join(',');

                                }
                            }
                            else {
                                alert("Este diente ya contiene este tratamiento");
                            }
                        }
                        else {
                            alert('No se puede pintar sobre una Ausencia o Exodoncia')
                        }
                    }
                }
                function ordenartodoclick() {
                    var dientep;
                    var colorp;
                    var seccionp;
                    var fechap;
                    var contandor = 0;
                    var vectorsecc = new Array();
                    var vectorcolorr = new Array();
                    var vectorfecha = new Array();


                    for (var u = 0; u < localStorage.length; u++) {
                        var key_nameee = localStorage.key(u);
                        itemmm = localStorage.getItem(key_nameee);
                        itemmm = itemmm.split(',');
                        dientep = parseInt(itemmm[0], 10);
                        seccionp = parseInt(itemmm[1], 10);
                        colorp = parseInt(itemmm[2], 10);
                        //                  fechap = parseInt(itemmm[3], 10);
                        if (dientep == diente) {
                            vectorsecc[contandor] = seccionp;
                            vectorcolorr[contandor] = colorp;
                            vectorfecha[contandor] = itemmm[3];
                            contandor++;
                        }
                    }
                    pintarclick(vectorsecc, vectorcolorr, vectorfecha);
                    vectorcolorr = [];
                    vectorfecha = [];
                    vectorsecc = [];
                }

                function pintartodo() {
                    var sinseccion = new Array();
                    var coloseccion = new Array();
                    var contseccion = 0;
                    var tipo;
                    var colorpintar;
                    for (var ac = 0; ac < pruebas.length; ac++) {
                        if (pruebas[ac] == diente || BDMarca[ac] == diente) {
                            coloseccion[contseccion] = pruebacolor[ac];
                            sinseccion[contseccion] = pruebaseccion[ac];
                            contseccion++;
                        }
                    }
                    for (var i = 0; i < coloseccion.length; i++) {
                        tipo = coloseccion[i];
                        if (tipo == 1 || tipo == "red" && sinseccion[i] != "") {
                            colorpintar = 'red';
                            dibuja_seccion(ctx2, diente, sinseccion[i], colorpintar);
                        } else if (tipo == 2 || tipo == "black" && sinseccion[i] != "") {
                            colorpintar = 'black';
                            dibuja_seccion(ctx2, diente, sinseccion[i], colorpintar);
                        } else if (tipo == 3 || tipo == "blue" && sinseccion[i] != "") {
                            colorpintar = 'blue';
                            dibuja_seccion(ctx2, diente, sinseccion[i], colorpintar);
                        }
                        else if (tipo == 4 || tipo == "black") {
                            marcar_extraccion(ctx2, diente, 'black');
                        }
                        else if (tipo == 5 || tipo == "red") {
                            marcar_exodoncia(ctx2, diente, 'red');
                        }
                    }
                    ordenartodoclick();
                }

                //Marca la posicion exacta del mouse
                function Marcar(event) {
                    var x = event.pageX - 411.9; // Donde esta la posicion del mouse en el eje x
                    var y = event.pageY; // Donde esta la posicion del mouse en el eje y
                    var canvas2 = document.getElementById("myCanvas2");
                    var div_can = document.getElementById("canvasesdiv");
                    x -= div_can.offsetLeft;
                    y -= div_can.offsetTop;
                    //alert(x);
                    diente = 0;
                    seccion = 0;
                    var div = 0;

                    if (y >= 20 && y <= 60) {
                        //alert(x);
                        if (x >= 10 && x <= 50) {
                            diente = 1;
                        }
                        else if (x >= 60 && x <= 800) {
                            div = parseInt(x / 50, 10);
                            ini = (div * 40) + (10 * div) + 10;
                            fin = ini + 40;
                            if (x >= ini && x <= fin) {
                                diente = div + 1;
                            }
                        }
                    }
                    else if (y >= 140 && y <= 180) {
                        if (x >= 10 && x <= 50) {
                            diente = 11;
                        }
                        else if (x >= 60 && x <= 800) {
                            div = parseInt(x / 50, 10);
                            ini = (div * 40) + (10 * div) + 10;
                            fin = ini + 40;
                            if (x >= ini && x <= fin) {
                                diente = div + 11;
                            }
                        }
                    }
                    //alert(diente);
                    if (diente) {
                        accion = $("input[name='accion']:checked").val();
                        var seleccion = '';
                        if (accion == 'carie') {
                            seleccion = 'seccion';
                        }
                        else if (accion == 'restauracion') {
                            seleccion = 'seccion';
                        }
                        else if (accion == 'sellante') {
                            seleccion = 'seccion';
                        }
                        else if (accion == 'extraccion') {
                            seleccion = 'diente';
                        }
                        else if (accion == 'exodoncia') {
                            seleccion = 'diente';
                        }
                        else if (accion == 'borrar') {
                            seccion_chk = $("input[name='seccion']:checked").val();
                            if (seccion_chk == 'diente') {
                                seleccion = 'diente';
                            }
                            else {
                                seleccion = 'seccion';
                            }
                        }
                        if (seleccion == 'seccion') {
                            x = x - ((div * 40) + (10 * div) + 10);
                            y = y - 20;
                            if (diente > 10) {
                                y = y - 120;
                            }
                            // Ubicar la seccion clickeada
                            if (y > 0 && y < 10 && x > y && y < 40 - x) {
                                seccion = 1;
                                //if (diente == 1) {
                                //    remplazo = 27;
                                //} else if (diente == 17) {
                                //    remplazo = 20;
                                //}
                            } else if (x > 30 && x < 40 && y < x && 40 - x < y) {
                                seccion = 2;
                                //if (diente == 1) {
                                //    remplazo = 37;
                                //} else if (diente == 17) {
                                //    remplazo = 36;
                                //}
                            } else if (y > 30 && y < 40 && x < y && x > 40 - y) {
                                seccion = 3;
                                //if (diente == 1) {
                                //    remplazo = 25;
                                //} else if (diente == 17) {
                                //    remplazo = 28;
                                //}
                            } else if (x > 0 && x < 10 && y > x && x < 40 - y) {
                                seccion = 4;
                                //if (diente == 1 || diente == 17) {
                                //    remplazo = 4;
                                //}
                            } else if (x > 10 && x < 30 && y > 10 && y < 30) {
                                seccion = 5;
                                //if (diente == 1) {
                                //    remplazo = 22;
                                //} else if (diente == 17) {
                                //    remplazo = 23;
                                //}
                            }
                            //Comprobacion de si esta en una seccion
                            if (seccion) {
                                //alert(seccion);
                                color = 'yellow';
                                ctx3.clearRect(0, 0, 910, 200);
                                marcar_seccion(ctx3, diente, seccion, color);
                                //alert(seccion);
                            } else {
                                //ctx2.fillStyle = "white";
                                //ctx2.fillRect(0, 0, 810, 300);
                                ctx3.clearRect(0, 0, 910, 200);
                            }
                        }
                        else if (seleccion == 'diente') {
                            ctx3.clearRect(0, 20, 910, 200);
                            marcar_diente(ctx3, diente, 'yellow');
                        }
                    } else {
                        ctx3.clearRect(0, 0, 910, 200);
                    }

                    //dibuja_contorno(canvas, inicio_x, inicio_y, med, separacion_x, separacion_y)
                }

                function pintarclick(Vectorseccion, vectorcolor, vectorfecha) {
                    colorsec = [];
                    colorsec2 = [];
                    colorsec3 = [];
                    colorsec4 = [];
                    colorsec5 = [];
                    colorsec6 = [];

                    fec = [];
                    fech2 = [];
                    fech3 = [];
                    fech4 = [];
                    fech5 = [];
                    fech6 = [];
                    var seccion1;
                    var colorsec = new Array();
                    var con1 = 0;

                    var seccion2;
                    var colorsec2 = new Array();
                    var fech2 = new Array();
                    var con2 = 0;

                    var seccion3;
                    var colorsec3 = new Array();
                    var fech3 = new Array();
                    var con3 = 0;

                    var seccion4;
                    var colorsec4 = new Array();
                    var fech4 = new Array();
                    var con4 = 0;

                    var seccion5;
                    var colorsec5 = new Array();
                    var fech5 = new Array();
                    var con5 = 0;

                    var seccion6;
                    var colorsec6 = new Array();
                    var fech6 = new Array();
                    var con6 = 0;
                    for (var g = 0; g < Vectorseccion.length; g++) {
                        if (Vectorseccion[g] == 1) {
                            seccion1 = Vectorseccion[g];
                            colorsec[con1] = vectorcolor[g];
                            fec[con1] = vectorfecha[g];
                            con1++;
                        } else if (Vectorseccion[g] == 2) {
                            seccion2 = Vectorseccion[g];
                            colorsec2[con2] = vectorcolor[g];
                            fech2[con2] = vectorfecha[g];
                            con2++;
                        } else if (Vectorseccion[g] == 3) {
                            seccion3 = Vectorseccion[g];
                            colorsec3[con3] = vectorcolor[g];
                            fech3[con3] = vectorfecha[g];
                            con3++;
                        } else if (Vectorseccion[g] == 4) {
                            seccion4 = Vectorseccion[g];
                            colorsec4[con4] = vectorcolor[g];
                            fech4[con4] = vectorfecha[g];
                            con4++;
                        } else if (Vectorseccion[g] == 5) {
                            seccion5 = Vectorseccion[g];
                            colorsec5[con5] = vectorcolor[g];
                            fech5[con5] = vectorfecha[g];
                            con5++;
                        } else {
                            seccion6 = Vectorseccion[g];
                            colorsec6[con6] = vectorcolor[g];
                            fech6[con6] = vectorfecha[g];
                            con6++;
                        }
                    }
                    ordenar(fec, colorsec, seccion1);
                    ordenar(fech2, colorsec2, seccion2);
                    ordenar(fech3, colorsec3, seccion3);
                    ordenar(fech4, colorsec4, seccion4);
                    ordenar(fech5, colorsec5, seccion5);
                    ordenar(fech6, colorsec6, seccion6);
                }

                function ordenar(fechaV, colorV, seccionV) {
                    var resultado = new Array();
                    var colorPin;
                    if (colorV.length == 3) {
                        if (fechaV[0] > fechaV[1] && fechaV[0] > fechaV[2]) {
                            if (fechaV[1] > fechaV[2]) {
                                resultado[0] = colorV[2];
                                resultado[1] = colorV[1];
                                resultado[2] = colorV[0];
                            } else {
                                resultado[0] = colorV[2];
                                resultado[1] = colorV[0];
                                resultado[2] = colorV[1];
                            }
                        } else if (fechaV[0] > fechaV[1] && fechaV[0] < fechaV[2]) {
                            resultado[0] = colorV[1];
                            resultado[1] = colorV[0];
                            resultado[2] = colorV[2];
                        } else if (fechaV[0] < fechaV[1] && fechaV[0] < fechaV[2]) {
                            if (fechaV[1] > fechaV[2]) {
                                resultado[0] = colorV[0];
                                resultado[1] = colorV[2];
                                resultado[2] = colorV[1];
                            } else {
                                resultado[0] = colorV[0];
                                resultado[1] = colorV[1];
                                resultado[2] = colorV[2];
                            }
                        }
                    } else if (colorV.length == 2) {
                        if (fechaV[0] > fechaV[1]) {
                            resultado[0] = colorV[1];
                            resultado[1] = colorV[0];
                        } else {
                            resultado[0] = colorV[0];
                            resultado[1] = colorV[1];
                        }
                    } else if (colorV.length == 1) {
                        resultado[0] = colorV[0];
                    }


                    for (var c = 0; c < resultado.length; c++) {
                        if (resultado[c] == 1) {
                            colorPin = 'red';
                            dibuja_seccion(ctx2, diente, seccionV, colorPin);
                        } else if (resultado[c] == 2) {
                            colorPin = 'black';
                            dibuja_seccion(ctx2, diente, seccionV, colorPin);
                        } else if (resultado[c] == 3) {
                            colorPin = 'blue';
                            dibuja_seccion(ctx2, diente, seccionV, colorPin);
                        }
                        else if (resultado[c] == 4) {
                            marcar_extraccion(ctx2, diente, 'black');
                        }
                        else if (resultado[c] == 5) {
                            marcar_exodoncia(ctx2, diente, 'red');
                        }
                    }
                    resultado = [];
                }

                function pintaBorrado() {
                    var dientepitando;
                    var fechaa;
                    var colorclick;
                    var itemm;
                    var seccionpintado;
                    var pintadoVector = new Array();
                    var contPintado = 0;
                    var contar;
                    var clickcontar = 0;
                    // Tres colores en una seccion
                    //if (tamanoB == 3) {
                    for (var i = 0; i < localStorage.length; i++) {
                        var key_namee = localStorage.key(i);
                        itemm = localStorage.getItem(key_namee);
                        itemm = itemm.split(',');
                        dientepitando = parseInt(itemm[0], 10);
                        seccionpintado = parseInt(itemm[1], 10);
                        colorclick = parseInt(itemm[2], 10);
                        //alert(seccion2);

                        if (dientepitando == diente && seccionpintado == seccion2) {
                            pintadoVector[contPintado] = localStorage.getItem(key_namee).split(',');
                            contPintado++;

                        } else if (dientepitando == diente && seccion2 != seccionpintado) {
                            clickSecciones[clickcontar] = seccionpintado;
                            clickColores[clickcontar] = colorclick;
                            clickfecha[clickcontar] = itemm[3];
                            clickcontar++;

                        }
                    }
                    pintarclick(clickSecciones, clickColores, clickfecha);
                    clickColores = [];
                    clickfecha = [];
                    clickSecciones = [];

                    //} else {
                    //    contar = localStorage.length;
                    //    if (contar > 0) {
                    //        alert("tengo algo locals");
                    //        for (var i = 0; i < localStorage.length; i++) {
                    //            var key_nameee = localStorage.key(i);
                    //            itemmm = localStorage.getItem(key_nameee);
                    //            itemmm = itemmm.split(',');
                    //            dientepitando = parseInt(itemmm[0], 10);
                    //            seccionpintado = parseInt(itemmm[1], 10);
                    //            colorclick = parseInt(itemmm[2], 10);
                    //            if (dientepitando == diente && seccionpintado == seccion2) {
                    //                alert("tengo 2");
                    //                pintadoVector[contPintado] = localStorage.getItem(key_nameee).split(',');
                    //                contPintado++;
                    //            } else if (dientepitando == diente && seccion_b != seccionpintado) {
                    //                alert("tengo 3");
                    //                clickSecciones[clickcontar] = seccionpintado;
                    //                clickColores[clickcontar] = colorclick;
                    //                clickfecha[clickcontar] = itemmm[3];
                    //            }
                    //            //var key_name = localStorage.key(i);
                    //            //pintadoVector[i] = localStorage.getItem(key_name).split(',');
                    //            pintarclick();
                    //            alert("tengo algo locals");
                    //            clickColores = [];
                    //            clickfecha = [];
                    //            clickSecciones = [];
                    //        }
                    //    }
                    //}
                    //tamanoB = 0;
                    return (pintadoVector);
                }

                //Dientes que vienen de BD

                function compararBD() {
                    var contadorBDC = 0;
                    var contarentradas = 0;
                    for (var aa = 0; aa < pruebas.length; aa++) {
                        if (pruebas[aa] == diente && pruebaseccion[aa] == seccion2) {
                            BDNuevos[contadorBDC] = pruebacolor[aa];
                            contadorBDC++;
                        } else if (pruebas[aa] == diente && seccion2 != pruebaseccion[aa]) {
                            pintarsecciones[contarentradas] = pruebaseccion[aa];
                            pintarcolores[contarentradas] = pruebacolor[aa];
                            contarentradas++;
                        } else if (pruebaseccion[aa] == "" && BDMarca[aa] == diente) {
                            BDNuevos[contadorBDC] = pruebacolor[aa];
                            marcaP = BDMarca[aa];
                            contadorBDC++;
                        }
                    }

                }
                //Pinta los dientes
                function pinta_datos() {
                    array_local = [];
                    compararBD();

                    //if (verificarseccion == "") {
                    //  alert("condicion");
                    PintarVectorBD(diente, seccion2);
                    //} 
                    array_local = pintaBorrado();
                    array_local.sort(function (a, b) {
                        var total = new Array();
                        if (a[3] > b[3]) {
                            total = array_local;
                        } else {
                            total = array_local.reverse()
                        }
                        return total; // orden ascendente por las fechas;
                    });

                    for (var i = 0; i < array_local.length; i++) {
                        item = array_local[i];

                        if (parseInt(item[0], 10) == diente) {
                            acc = parseInt(item[2], 10);
                            if (acc == 1) {
                                color = 'red';
                                dibuja_seccion(ctx2, item[0], item[1], color);
                            } else if (acc == 2) {
                                color = 'black';
                                dibuja_seccion(ctx2, item[0], item[1], color);
                            } else if (acc == 3) {
                                color = 'blue';
                                dibuja_seccion(ctx2, item[0], item[1], color);
                            }
                            else if (acc == 4) {
                                marcar_extraccion(ctx2, item[0], 'black');
                            }
                            else if (acc == 5) {
                                marcar_exodoncia(ctx2, item[0], 'red');
                            }
                        }
                    }

                }
                //Pinta los dientes de base de datos
                function PintarVectorBD(dienteM, seccionM) {
                    var colorr;
                    var colores;
                    // Si no se agregado un nuevo color
                    if (salvaguarda == 0) {
                        for (var n = 0; n < BDNuevos.length - 1; n++) {
                            colorr = BDNuevos[n];

                            if (colorr == "blue") {
                                dibuja_seccion(ctx2, dienteM, seccionM, colorr);
                            } else if (colorr == "red") {
                                dibuja_seccion(ctx2, dienteM, seccionM, colorr);
                            } else if (colorr == "black") {
                                dibuja_seccion(ctx2, dienteM, seccionM, colorr);
                            }
                            //else if (colorr == 4) {
                            //    marcar_extraccion(ctx2, item[0], 'black');
                            //}
                            //else if (colorr == 5) {
                            //    marcar_exodoncia(ctx2, item[0], 'red');
                            //}
                        }
                        flag = BDNuevos.length;
                        var contarvuelta = 1;

                        for (var ab = 0; ab < pruebas.length; ab++) {
                            if (pruebas[ab] == diente && pruebaseccion[ab] == seccionM) {
                                if (flag == contarvuelta) {
                                    pruebas.splice(ab, 1);
                                    pruebaseccion.splice(ab, 1);
                                    pruebacolor.splice(ab, 1);
                                }
                                contarvuelta++;
                            } else if (pruebaseccion[ab] == "" && pruebas[ab] == "" && marcaP == dienteM) {
                                pruebas.splice(ab, 1);
                                pruebaseccion.splice(ab, 1);
                                pruebacolor.splice(ab, 1);
                            }
                        }
                        //for (var ba = 0; ba <= BDNuevos.length; ba++) {
                        BDNuevos = [];

                        //}

                        for (var ee = 0; ee < pintarcolores.length; ee++) {
                            colores = pintarcolores[ee];
                            if (colores == "blue") {
                                dibuja_seccion(ctx2, dienteM, pintarsecciones[ee], colores);
                            } else if (colores == "red") {
                                dibuja_seccion(ctx2, dienteM, pintarsecciones[ee], colores);
                            } else if (colores == "black") {
                                dibuja_seccion(ctx2, dienteM, pintarsecciones[ee], colores);
                            }

                        }


                        //cuando se agrega un color (click)
                    } else {
                        var colorrr;
                        var coloress;
                        for (var n = 0; n < BDNuevos.length; n++) {
                            if (colorrr == "blue") {
                                dibuja_seccion(ctx2, dienteM, seccionM, colorrr);

                            } else if (colorrr == "red") {
                                dibuja_seccion(ctx2, dienteM, seccionM, colorrr);
                            } else if (colorrr == "black") {
                                dibuja_seccion(ctx2, dienteM, seccionM, colorrr);
                            }
                        }
                        for (var ee = 0; ee < pintarcolores.length; ee++) {
                            coloress = pintarcolores[ee];
                            if (coloress == "blue") {
                                dibuja_seccion(ctx2, dienteM, pintarsecciones[ee], coloress);
                            } else if (coloress == "red") {
                                dibuja_seccion(ctx2, dienteM, pintarsecciones[ee], coloress);
                            } else if (coloress == "black") {
                                dibuja_seccion(ctx2, dienteM, pintarsecciones[ee], coloress);
                            }
                        }
                    }
                    pintarsecciones = [];
                    pintarcolores = [];
                }

                function ubica_seccion(X, Y) {
                    y = Y;
                    x = X;
                    devolver_seccion = 0;
                    if (y > 0 && y < 10 && x > y && y < 40 - x) {
                        devolver_seccion = 1;
                    } else if (x > 30 && x < 40 && y < x && 40 - x < y) {
                        devolver_seccion = 2;
                    } else if (y > 30 && y < 40 && x < y && x > 40 - y) {
                        devolver_seccion = 3;
                    } else if (x > 0 && x < 10 && y > x && x < 40 - y) {
                        devolver_seccion = 4;
                    } else if (x > 10 && x < 30 && y > 10 && y < 30) {
                        devolver_seccion = 5;
                    }

                    return devolver_seccion;
                }

                function pintarDiente(diente, seccion, color, marca) {
                    var col = color;
                    var sec = seccion;
                    var dient = diente;
                    var marc = marca;
                    BDColor[BDcontador] = col;
                    BDSeccion[BDcontador] = sec;
                    BDDiente[BDcontador] = dient;
                    BDMarca[BDcontador] = marc;
                    pruebas[BDcontador] = dient;
                    pruebaseccion[BDcontador] = sec;
                    pruebacolor[BDcontador] = col;

                    BDcontador++;
                    dibuja_seccion(ctx2, diente, seccion, color);

                    if (color == 'black') {
                        marcar_extraccion(ctx2, marca, 'black');
                    }
                    else {
                        marcar_exodoncia(ctx2, marca, 'red');
                    }


                }
            </script>
        </div>
    </form>
</body>
</html>
