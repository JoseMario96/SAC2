﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ReporteOdontograma.aspx.cs" Inherits="SAC.formularios.frm_ReporteOdontograma" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <title></title>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>

    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.2.min.js" type="text/javascript"></script>

    <style>
        #myCanvas {
            border: 2px solid #00ff90;
        }

        #myCanvas2 {
            border: 2px solid #00ff90;
        }

        #myCanvas3 {
            border: 2px solid #00ff90;
        }

        #myCanvas4 {
            border: 2px solid #00ff90;
        }

        body {
            text-align: center;
        }
    </style>
    <style type="text/css">
        body, a, a:hover {
            cursor: url(C:\Users\dtrej\source\repos\SAC2\SAC\SAC\images\cur438.cur), progress;
        }

        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
    <script>
        $(function () {
            $("#radio").buttonset();
            $("#radio_seccion").buttonset();
            $('#radio').change(function () {
                accion = $("input[name='accion']:checked").val();
                if (accion == 'borrar') {
                    $("#radio_seccion").show('blind', 500);
                } else {
                    $("#radio_seccion").hide();
                }
            });
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>


            <asp:HiddenField ID="colorO" runat="server" />
            <asp:HiddenField ID="dienteO" runat="server" />
            <asp:HiddenField ID="seccionO" runat="server" />
            <asp:HiddenField ID="contextoO" runat="server" />

            <h1>Odontograma</h1>
            <br>
            <br>
            <div id="radio">
                <input type="radio" id="radio1" name="accion" value="carie" checked="checked" /><label for="radio1">Carie</label>
                <input type="radio" id="radio6" name="accion" value="sellante" /><label for="radio6">Sellante</label>
                <input type="radio" id="radio2" name="accion" value="restauracion" /><label for="radio2">Obturado</label>
                <input type="radio" id="radio4" name="accion" value="extraccion" /><label for="radio4">Extraccion</label>
                <input type="radio" id="radio5" name="accion" value="puente" /><label for="radio5">Puente</label>
                <input type="radio" id="radio3" name="accion" value="borrar" /><label for="radio3">Borrar</label>
            </div>

            <br>

            <div id="canvasesdiv" style="position: relative; width: 890px; height: 200px">
                <canvas id="myCanvas" width="890" height="200" style="z-index: 1; position: absolute; left: 25%; top: 0px;"></canvas>
                <canvas id="myCanvas2" width="890" height="200" style="z-index: 2; position: absolute; left: 25%; top: 0px;"></canvas>
                <canvas id="myCanvas3" width="890" height="200" style="z-index: 3; position: absolute; left: 25%; top: 0px;"></canvas>
                <canvas id="myCanvas4" width="890" height="200" style="z-index: 4; position: absolute; left: 25%; top: 0px;"></canvas>
            </div>

            <div id="radio_seccion" style='display: none'>
                <input type="radio" id="radio_1" name="seccion" value="seccion" checked="checked" /><label for="radio_1">Seccion</label>
                <input type="radio" id="radio_2" name="seccion" value="diente" /><label for="radio_2">Diente</label>
            </div>
            <br />

            <asp:Button ID="Button1" runat="server" Text="Prueba" OnClick="Button1_Click" />
            <input type="button" id="btnSave" name="btnSave" value="Save the canvas to server" />
            <%--        <div id="radio_seccion2" style='display: none'>
            <input type="radio" id="amalgamaO" name="amalgama" value="seccion" /><label for="amalgamaO">Amalgama</label>
            <input type="radio" id="resinaO" name="resina" value="diente" /><label for="resinaO">Resina</label>
        </div>--%>


            <asp:Button ID="Guardar" runat="server" Text="Guardar" class="waves-effect waves-light btn" CssClass="auto-style1" OnClick="Guardar_Click1" />
            <asp:Panel ID="Panel1" runat="server" Visible="true">

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
                    // Funcion para sombrear diente completo
                    function marcar_extraccion(contexto, num_diente, color_pas) {
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
                        if (num_diente1 < 16) {
                            inicio_y = 80;
                        }
                        else {
                            num_diente1 = num_diente1 - 16;
                            num_diente2 = num_diente2 - 16;
                            inicio_y = med + 160;
                        }
                        //alert(num_diente);
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
                    // Funcion para borrar puente
                    function borrar_diente(contexto, num_diente) {
                        ctx = contexto;
                        // Definiendo puntos de dibujo
                        med = medida;
                        num_diente = num_diente - 1;
                        if (num_diente < 16) {
                            inicio_y = 20;
                        }
                        else {
                            num_diente = num_diente - 16;
                            inicio_y = med + 100;
                        }
                        //alert(num_diente);
                        inicio_x = (num_diente * med) + (separacion_x * num_diente) + separacion_x;
                        ctx.clearRect(inicio_x, inicio_y, med, med);
                    }

                    // Valores iniciales de las propiedades del diente
                    var canvas = document.getElementById('myCanvas');
                    var context = canvas.getContext('2d');

                    alert(context);
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
                    var bandera = 0;
                    var colorArray = new Array();
                    var posicionArray = new Array();
                    var dienteArray = new Array();
                    var contador = 0;

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
                    //dibuja_seccion(context, 2, 3, 'red');
                    //dibuja_seccion(context, 18, 5, 'green');
                    //dibuja_seccion(context, 24, 4, 'blue');
                    window.onload = function () {
                        localStorage.clear();
                        click();
                    }
                    function click() {
                        //Añadimos un addEventListener al canvas para reconocer el click
                        layer4.addEventListener("click",
                            //Una vez se haya clickado se activará la siguiente función
                            getPosition
                            , false);
                        layer4.addEventListener("mousemove", Marcar, false);
                    }
                    //canvas.addEventListener("mousedown", getPosition, false);

                    function getPosition(event) {
                        var x = event.x - 225;
                        var y = event.y;
                        //alert(y);
                        //alert(x);
                        var canvas = document.getElementById("myCanvas");
                        var div_can = document.getElementById("canvasesdiv");
                        x -= div_can.offsetLeft;
                        y -= div_can.offsetTop;
                        //alert(div_can.offsetTop);
                        var div = 0;
                        var color = '';
                        var accion = '';
                        seleccion = $("input[name='accion']:checked").val();
                        if (seleccion == 'carie') {
                            color = 'red';
                            accion = 'seccion';
                        }
                        else if (seleccion == 'restauracion') {
                            color = 'blue';
                            accion = 'seccion';
                        }
                        else if (seleccion == 'extraccion') {
                            color = '1';
                            accion = 'marcar';
                        }
                        else if (seleccion == 'puente') {
                            accion = 'puente';
                        }
                        else if (seleccion == 'sellante') {
                            color = 'black';
                            accion = 'seccion';
                        }
                        else if (seleccion == 'borrar') {
                            accion = 'borrar';
                        }
                        //alert(y);
                        diente = 0;
                        seccion = 0;
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
                                diente = 17;
                            }
                            else if (x >= 60 && x <= 800) {
                                div = parseInt(x / 50, 10);
                                ini = (div * 40) + (10 * div) + 10;
                                fin = ini + 40;
                                if (x >= ini && x <= fin) {
                                    diente = div + 17;
                                }
                            }
                        }
                        if (diente) {
                            //alert(diente);
                            if (accion == 'seccion') {
                                x = x - ((div * 40) + (10 * div) + 10);
                                y = y - 20;
                                if (diente > 16) {
                                    y = y - 120;
                                }
                                //alert(y);
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
                            } else if (accion == 'marcar') {
                                cod = diente + '-0-' + '3';
                                if (cod && !localStorage.getItem(cod)) {
                                    new_array = [diente, 0, 3, Date.now(), 0];
                                    guardar = new_array.toLocaleString();
                                    localStorage.setItem(cod, guardar);
                                    marcar_extraccion(ctx2, diente, 'black')
                                } else {
                                    alert("Ya fue marcado");
                                }
                            } else if (accion == 'puente') {
                                if (diente1 == 0) {
                                    marcar_diente(ctx4, diente, 'red');
                                    diente1 = diente;
                                } else if (diente2 == 0) {
                                    diente2 = diente;
                                    menor = 0;
                                    mayor = 0;
                                    if (diente1 > diente2) {
                                        mayor = diente1;
                                        menor = diente2;
                                    } else {
                                        mayor = diente2;
                                        menor = diente1
                                    }
                                    diente1 = menor;
                                    diente2 = mayor;
                                    if ((diente1 < 17 && diente2 < 17 && diente1 != diente2) || (diente1 > 17 && diente2 > 17 && diente1 != diente2)) {
                                        marcar_diente(ctx4, diente, 'red');
                                        ctx4.clearRect(0, 0, 810, 70);
                                        ctx4.clearRect(0, 135, 810, 70);
                                        cod = diente1 + '-0-4-' + diente2;
                                        if (cod && !localStorage.getItem(cod)) {
                                            new_array = [diente1, 0, 4, Date.now(), diente2];
                                            guardar = new_array.toLocaleString();
                                            localStorage.setItem(cod, guardar);
                                        } else {
                                            alert("Ya fue marcado");
                                        }
                                        marcar_puente(ctx4, diente1, diente2, 'red');
                                    } else {
                                        ctx4.clearRect(0, 0, 810, 70);
                                        ctx4.clearRect(0, 135, 810, 70);
                                    }

                                    diente1 = 0;
                                    diente2 = 0;
                                }
                            } else if (accion == 'borrar') {
                                borrar_diente(ctx2, diente);
                                //cargar el ultimo pintado
                                seccion_chk = $("input[name='seccion']:checked").val();
                                if (seccion_chk == 'seccion') {
                                    x = x - ((div * 40) + (10 * div) + 10);
                                    y = y - 20;
                                    if (diente > 16) {
                                        y = y - 120;
                                    }
                                    seccion_b = ubica_seccion(x, y);
                                    if (seccion_b) {
                                        ultimo = '';
                                        key_cod = '';
                                        for (var i = 0; i < localStorage.length; i++) {
                                            var key_name = localStorage.key(i);
                                            item = localStorage.getItem(key_name);
                                            item = item.split(',');
                                            diente_comp = parseInt(item[0], 10);
                                            seccion_comp = parseInt(item[1], 10);
                                            accion_comp = parseInt(item[2], 10);
                                            if (diente_comp == diente && seccion_b == seccion_comp && (accion_comp == 1 || accion_comp == 2)) {
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
                                            //console.log(key_cod);
                                            localStorage.removeItem(key_cod);
                                        }
                                    }

                                } else if (seccion_chk == 'diente') {
                                    ultimo = '';
                                    key_cod = '';
                                    for (var i = 0; i < localStorage.length; i++) {
                                        var key_name = localStorage.key(i);
                                        item = localStorage.getItem(key_name);
                                        item = item.split(',');
                                        diente_comp = parseInt(item[0], 10);
                                        accion_comp = parseInt(item[2], 10);
                                        if (diente_comp == diente && accion_comp == 3) {
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
                                        //console.log(key_cod);
                                        localStorage.removeItem(key_cod);
                                    }
                                }
                                //alert('a');
                                pinta_datos();
                            }
                        }
                        //alert(diente);
                        if (seccion && color != '') {
                            //alert(color);

                            //alert(seccion);
                            //[numero_diente, seccion, accion, fecha, diente2]
                            if (color == 'red') {
                                cod = diente + '-' + seccion + '-' + '1';
                                accion_g = 1;
                            } else if (color == 'blue') {
                                cod = diente + '-' + seccion + '-' + '2';
                                accion_g = 2;
                            }
                            else if (color == 'black') {
                                cod = diente + '-' + seccion + '-' + '5';
                                accion_g = 5;
                            };
                            if (cod && !localStorage.getItem(cod)) {
                                new_array = [diente, seccion, accion_g, Date.now(), 0];
                                guardar = new_array.toLocaleString();
                                localStorage.setItem(cod, guardar);
                                var contextoO = document.getElementById('contextoO');
                                contextoO.value = ctx2;
                                dibuja_seccion(ctx2, diente, seccion, color);
                                //var contextoO = document.getElementById('contextoO')
                                //contextoO.value = ctx2;
                                colorArray[contador] = color;
                                dienteArray[contador] = diente;
                                posicionArray[contador] = seccion;
                                contador++;
                            }

                            else {
                                alert("ya fue marcado");
                            }
                            document.getElementById('colorO').value = colorArray.join(',');
                            document.getElementById('dienteO').value = dienteArray.join(',');
                            document.getElementById('seccionO').value = posicionArray.join(',');
                        }
                        if ('borrar' == $("input[name='accion']:checked").val()) {
                            //alert("x-> "+x+" y-> "+y);
                            //ctx4.clearRect(0, 0, 810, 300);

                            if (x >= 30 && x <= 780 && ((y > 78 && y < 82) || (y > 198 && y < 202))) {
                                //alert(x);
                                div = parseInt(x / 50, 10);
                                //alert(div);
                                ultimo = '';
                                key_cod = '';
                                for (var i = 0; i < localStorage.length; i++) {
                                    var key_name = localStorage.key(i);
                                    item = localStorage.getItem(key_name);
                                    item = item.split(',');
                                    diente1_comp = parseInt(item[0], 10);
                                    diente2_comp = parseInt(item[4], 10);
                                    accion_comp = parseInt(item[2], 10);
                                    if (accion_comp == 4) {
                                        if (diente1_comp > 16) {
                                            diente1_comp = diente1_comp - 17;
                                            diente2_comp = diente2_comp - 17;
                                        } else {
                                            diente1_comp = diente1_comp - 1;
                                            diente2_comp = diente2_comp - 1;
                                        }
                                        inicio_x = (diente1_comp * 40) + (10 * diente1_comp) + 10 + 20;
                                        fin_X = (diente2_comp * 40) + (10 * diente2_comp) + 10 + 20;
                                        if (x >= inicio_x && x <= fin_x) {
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
                                }
                                if (key_cod != '') {
                                    console.log(key_cod);
                                    if (parseInt(ultimo[0], 10) < 16) {
                                        seccion_p = 1;
                                        ctx4.clearRect(0, 0, 810, 130);
                                    }
                                    else {
                                        ctx4.clearRect(0, 130, 810, 150);
                                        seccion_p = 2;
                                    }
                                    localStorage.removeItem(key_cod);
                                    pinta_puentes(seccion_p);
                                }
                            }

                        }

                    }

                    //dibuja_seccion(x, y, 5, 5);
                    //dibuja_seccion(context, num_diente, seccion, color)
                    //Marca la posicion exacta del mouse
                    function Marcar(event) {
                        var x = event.x - 225;
                        var y = event.y;
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
                                //alert("1");
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
                                diente = 17;
                            }
                            else if (x >= 60 && x <= 800) {
                                div = parseInt(x / 50, 10);
                                ini = (div * 40) + (10 * div) + 10;
                                fin = ini + 40;
                                if (x >= ini && x <= fin) {
                                    diente = div + 17;
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
                            else if (accion == 'puente') {
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
                                if (diente > 16) {
                                    y = y - 120;
                                }
                                //alert(y);
                                /*if (y>=x && y<=39){}*/
                                // Ubicar la seccion clickeada
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
                    function pinta_datos() {
                        array_local = [];
                        for (var i = 0; i < localStorage.length; i++) {
                            var key_name = localStorage.key(i);
                            array_local[i] = localStorage.getItem(key_name).split(',');
                        }
                        //console.log(array_local);
                        array_local.sort(function (a, b) {
                            return a[3] > b[3]; // orden ascendente por las fechas;
                        });
                        //console.log(array_local);
                        for (var i = 0; i < array_local.length; i++) {
                            item = array_local[i];
                            if (parseInt(item[0], 10) == diente) {
                                acc = parseInt(item[2], 10);
                                //console.log(acc);
                                if (acc == 1) {
                                    color = 'red';
                                    dibuja_seccion(ctx2, item[0], item[1], color);
                                } else if (acc == 2) {
                                    color = 'blue';
                                    dibuja_seccion(ctx2, item[0], item[1], color);
                                } else if (acc == 3) {
                                    marcar_extraccion(ctx2, item[0], 'black');
                                } else if (acc == 5) {
                                    color = 'black';
                                    dibuja_seccion(ctx2, item[0], item[1], color);
                                }
                            }
                        }
                    }
                    function pinta_puentes(seccion_p) {
                        array_local = [];
                        for (var i = 0; i < localStorage.length; i++) {
                            var key_name = localStorage.key(i);
                            array_local[i] = localStorage.getItem(key_name).split(',');
                        }
                        //console.log(array_local);
                        array_local.sort(function (a, b) {
                            return a[3] > b[3]; // orden ascendente por las fechas;
                        });
                        //console.log(array_local);
                        for (var i = 0; i < array_local.length; i++) {
                            item = array_local[i];
                            acc = parseInt(item[2], 10);
                            //console.log(acc);
                            if (acc == 4) {
                                color_pas = 'red';
                                if (seccion_p == 1) {
                                    if (parseInt(item[0], 10) < 17) {
                                        marcar_puente(ctx4, item[0], item[4], color_pas);
                                    }
                                }
                                else {
                                    if (parseInt(item[0], 10) > 16) {
                                        marcar_puente(ctx4, item[0], item[4], color_pas);
                                    }
                                }
                                //dibuja_seccion(ctx2, item[0], item[1], color);
                            }

                        }
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

                    function creandoimagen() {

                        var canvas = document.getElementById("myCanvas");
                        var image = canvas.toDataURL("image/png");

                        var canvas = document.getElementById("myCanvas2");
                        var image2 = canvas.toDataURL("image2/png");


                        document.write('<center><img src="' + image2 + '"/</center>');
                        document.write('<center><img src="' + image + '"/</center>');

                    }

                </script>
            </asp:Panel>
        </div>
    </form>

</body>
</html>
