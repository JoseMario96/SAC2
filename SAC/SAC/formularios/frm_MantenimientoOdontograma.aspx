<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_MantenimientoOdontograma.aspx.cs" Inherits="SAC.formularios.frm_MantenimientoOdontograma" %>

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
            cursor: url("..images/cur438.cur");
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
        <div class="row">
            <div class="input-field col s2" style="left: 0px; right: 69px; top: 0px; width: 6%">
                <asp:Label ID="Label5" runat="server" Text="Label">Cédula:
                </asp:Label>
            </div>
            <div class="input-field col s2">
                <asp:TextBox ID="BudquedaExp" runat="server" title="Cédula" placeholder="Cédula" OnTextChanged="BudquedaExp_TextChanged" AutoPostBack="true" onkeypress="return solonumeros (event)"></asp:TextBox>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />

        <asp:HiddenField ID="colorO" runat="server" />
        <asp:HiddenField ID="dienteO" runat="server" />
        <asp:HiddenField ID="seccionO" runat="server" />
        <asp:HiddenField ID="contextoO" runat="server" />
        <asp:HiddenField ID="marcaO" runat="server" />
        <asp:HiddenField ID="borrarO" runat="server" />
        <asp:HiddenField ID="colorM" runat="server" />
        <asp:HiddenField ID="BDcolorO" runat="server" />
        <asp:HiddenField ID="BDdienteO" runat="server" />
        <asp:HiddenField ID="BDseccionO" runat="server" />

        <div id="odontograma" style="display: none" tabindex="1">

            <h1>Odontograma</h1>
            <br>
            <br>
            <div id="radio">
                <input type="radio" id="radio1" name="accion" value="carie" checked="checked" /><label for="radio1">Carie</label>
                <input type="radio" id="radio6" name="accion" value="sellante" /><label for="radio6">Sellante</label>
                <input type="radio" id="radio2" name="accion" value="restauracion" /><label for="radio2">Obturado</label>
                <input type="radio" id="radio4" name="accion" value="extraccion" /><label for="radio4">Ausencia</label>
                <input type="radio" id="radio5" name="accion" value="exodoncia" /><label for="radio5">Exodoncia</label>
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
            <div class="input-field col s4">
                <asp:Button ID="Button1" runat="server" OnClick="Guardar_Click" Text="Guardar" class="waves-effect waves-light btn" />
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
                // Funcion para borrar diente
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

                var contador = 0;
                var colorArray = new Array();
                var borrarArrayC = new Array();
                var borrarArrayD = new Array();
                var borrarArrayS = new Array();
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
                var y = 0;
                var color2 = '';
                var div = 0;
                var color = '';
                var seccion2 = 0;
                var cont = 0;
                var BDColor = new Array();
                var BDSeccion = new Array();
                var BDDiente = new Array();
                var BDMarca = new Array();
                var BDcontador = 0;
                var BDborradorC = new Array();
                var BDborradorD = new Array();
                var BDborradorS = new Array();
                var bdcontado2 = 0;
                var remplazo = 0;
                var tamanoB = 0;
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

                    var x = event.x - 225;// pintar en eje x
                    var y = event.y; // pintar en eje y
                    //alert(y);
                    var canvas = document.getElementById("myCanvas");
                    var div_can = document.getElementById("canvasesdiv");
                    x -= div_can.offsetLeft;
                    y -= div_can.offsetTop;
                    //alert(div_can.offsetTop);


                    var accion = '';
                    seleccion = $("input[name='accion']:checked").val();
                    if (seleccion == 'carie') {
                        color = 'red';
                        color2 = color;
                        accion = 'seccion';
                    }
                    else if (seleccion == 'restauracion') {
                        color = 'blue';
                        color2 = color;
                        accion = 'seccion';
                    }
                    else if (seleccion == 'sellante') {
                        color = 'black';
                        color2 = color;
                        accion = 'seccion';
                    }
                    else if (seleccion == 'extraccion') {
                        color = '4';
                        accion = 'marcar';
                    }
                    else if (seleccion == 'exodoncia') {
                        color = '5';
                        accion = 'marcarE';
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
                            //alert(x + "    x");
                            //alert(y + "    y");
                            ////---------------------------------------------------------------------------------------------
                            if (diente == 1 || diente == 17) {

                                x = remplazo;
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

                        } else if (accion == 'marcar') {
                            cod = diente + '-0-' + '4';
                            var verificacion = false;
                            if (banderaArray.length > 0 || bandera2Array.length > 0) {

                                for (var x = 0; x <= banderaArray.length; x++) {
                                    if (banderaArray[x] == diente || bandera2Array[x] == diente) {

                                        verificacion = true;
                                    }
                                }
                            }
                            if (verificacion == false) {
                                if (cod && !localStorage.getItem(cod)) {
                                    new_array = [diente, 0, 4, Date.now(), 0];
                                    guardar = new_array.toLocaleString();
                                    localStorage.setItem(cod, guardar);
                                    marcar_extraccion(ctx2, diente, 'black')
                                    marcacolorArray = 'black';
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
                            var verificacion = false;

                            if (banderaArray.length > 0 || bandera2Array.length > 0) {
                                for (var x = 0; x <= banderaArray.length; x++) {
                                    if (banderaArray[x] == diente || bandera2Array[x] == diente) {
                                        verificacion = true;
                                    }
                                }

                            }
                            if (verificacion == false) {
                                if (cod2 && !localStorage.getItem(cod2)) {
                                    new_array2 = [diente, 0, 5, Date.now(), 0];
                                    guardar2 = new_array2.toLocaleString();
                                    localStorage.setItem(cod2, guardar2);
                                    marcar_exodoncia(ctx2, diente, 'red')
                                    marcacolorArray = 'red';
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
                        else if (accion == 'borrar') {
                            borrar_diente(ctx2, diente);
                            document.getElementById('borrarO').value = diente;
                            ////Cargar el ultimo pintado
                            seccion_chk = $("input[name='seccion']:checked").val();
                            if (seccion_chk == 'seccion') {

                                x = x - ((div * 40) + (10 * div) + 10);
                                y = y - 20;
                                if (diente > 16) {
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

                                }
                                borrarArrayC[contadorBorrar] = color2;
                                borrarArrayD[contadorBorrar] = diente;
                                borrarArrayS[contadorBorrar] = seccion2;

                                contadorBorrar++;
                                var con = 1;
                                var con2 = 0;
                                for (var x = 0; x < BDDiente.length; x++) {
                                    for (var y = 0; y < borrarArrayD.length; y++) {
                                        if (BDDiente[x] == borrarArrayD[y] && BDSeccion[x] == borrarArrayS[y]) {
                                            if (con == 1) {
                                                alert("Entro 1");   
                                                BDborradorC[bdcontado2] = BDColor[x];
                                                BDborradorD[bdcontado2] = BDDiente[x];
                                                BDborradorS[bdcontado2] = BDSeccion[x];
                                                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                                bdcontado2++;
                                                con++;
                                            }
                                            else if (con == 2) {
                                                alert("Entro 2");   
                                                bdcontado2--;
                                                BDborradorC[bdcontado2] = BDColor[x];
                                                BDborradorD[bdcontado2] = BDDiente[x];
                                                BDborradorS[bdcontado2] = BDSeccion[x];
                                                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                                bdcontado2++;
                                                con++;
                                            }
                                            else if (con == 3) {
                                                alert("Entro 3");
                                                bdcontado2--;
                                                BDborradorC[bdcontado2] = BDColor[x];
                                                BDborradorD[bdcontado2] = BDDiente[x];
                                                BDborradorS[bdcontado2] = BDSeccion[x];
                                                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                                bdcontado2++;
                                                con++;
                                            }
                                          
                                        }
                                    }
                                }

                                //borrarArrayD.forEach((a1) => BDDiente.forEach((a2) => {
                                //    if (a1 == a2) {
                                //        // alert(" entro 1");
                                //        BDSeccion.forEach((a3) => borrarArrayS.forEach((a4) => {

                                //            if (a3 == a4) {
                                //                // alert("solo1");

                                //                // alert(con2);
                                                
                                //                //BDColor.forEach((a5) => borrarArrayC.forEach((a6) => {
                                //                //    if (a5 == a6) {
                                //                alert("Muchaas veces");
                                //                BDborradorC[bdcontado2] = BDColor[con];
                                //                BDborradorD[bdcontado2] = BDDiente[con];
                                //                BDborradorS[bdcontado2] = BDSeccion[con];
                                //                document.getElementById('BDcolorO').value = BDborradorC.join(',');
                                //                document.getElementById('BDdienteO').value = BDborradorD.join(',');
                                //                document.getElementById('BDseccionO').value = BDborradorS.join(',');
                                //                bdcontado2++;
                                //                //    }
                                //                //}
                                //                //));
                                //            }
                                //        }
                                //        ));
                                //    }
                                //}
                                //));
                                con = 0;
                                dienteArray.forEach((e1) => borrarArrayD.forEach((e2) => {
                                    if (e1 === e2) {
                                        posicionArray.forEach((e3) => borrarArrayS.forEach((e4) => {

                                            if (e3 === e4) {
                                                cont++;
                                                colorArray.forEach((e5) => borrarArrayC.forEach((e6) => {
                                                    if (e5 === e6) {
                                                        colorArray.splice(cont, 1);
                                                        dienteArray.splice(cont, 1);
                                                        posicionArray.splice(cont, 1);
                                                        document.getElementById('colorO').value = colorArray.join(',');
                                                        document.getElementById('dienteO').value = dienteArray.join(',');
                                                        document.getElementById('seccionO').value = posicionArray.join(',');
                                                    }
                                                }
                                                ));
                                            }
                                        }
                                        ));
                                    }
                                }
                                ));
                                seccion_b = ubica_seccion(x, y);
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

                                    alert(localStorage.length);
                                    var borrarVarios = new Array();
                                    var contVarios = 0;

                                    for (var i = 0; i < localStorage.length; i++) {
                                        var key_namee = localStorage.key(i);
                                        itemm = localStorage.getItem(key_namee);
                                        itemm = itemm.split(',');
                                        dienteVarios = parseInt(itemm[0], 10);
                                        seccionVarios = parseInt(itemm[1], 10);
                                        if (dienteVarios == diente && seccionVarios == seccion2) {
                                            borrarVarios[contVarios] = i;
                                            contVarios++;
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
                                        }
                                    }
                                    //termina el for que recorre para borrar
                                    alert(key_cod);
                                    if (key_cod != '') {

                                        localStorage.removeItem(key_cod);
                                        pinta_datos();
                                    }
                                }
                            }
                            else if (seccion_chk == 'diente') {
                                ultimo = '';
                                key_cod = '';
                                alert("DienteP");
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
                                    //console.log(key_cod);
                                    localStorage.removeItem(key_cod);
                                    pinta_datos();
                                }
                            }
                            //alert('a');

                        }
                    }
                    //alert(diente);

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
                        var verificacion = false;
                        if (banderaArray.length > 0 || bandera2Array.length > 0) {
                            for (var x = 0; x <= banderaArray.length; x++) {
                                if (banderaArray[x] == diente || bandera2Array[x] == diente) {
                                    verificacion = true
                                }
                            }
                        }
                        for (var c = 0; c < BDColor.length; c++) {
                            if (BDColor[c] == color && BDDiente[c] == diente && BDSeccion[c] == seccion) {
                                cargado = true;
                            }
                        }
                        if (verificacion == false) {
                            //  alert("atascado");
                            if (cargado == false && cod && !localStorage.getItem(cod)) {

                                new_array = [diente, seccion, accion_g, Date.now(), 0];
                                guardar = new_array.toLocaleString();
                                localStorage.setItem(cod, guardar);
                                if (verificacion == false) {
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

                //Marca la posicion exacta del mouse
                function Marcar(event) {
                    var x = event.x - 225;//Donde esta la posicion del mouse en el eje x
                    var y = event.y;//Donde esta la posicion del mouse en el eje y
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
                            if (diente > 16) {
                                y = y - 120;
                            } else if (diente == 17) {

                            }
                            // Ubicar la seccion clickeada
                            if (y > 0 && y < 10 && x > y && y < 40 - x) {
                                seccion = 1;
                                if (diente == 1) {
                                    remplazo = 27;
                                } else if (diente == 17) {
                                    remplazo = 20;
                                }
                            } else if (x > 30 && x < 40 && y < x && 40 - x < y) {
                                seccion = 2;
                                if (diente == 1) {
                                    remplazo = 37;
                                } else if (diente == 17) {
                                    remplazo = 36;
                                }
                            } else if (y > 30 && y < 40 && x < y && x > 40 - y) {
                                seccion = 3;
                                if (diente == 1) {
                                    remplazo = 25;
                                } else if (diente == 17) {
                                    remplazo = 28;
                                }
                            } else if (x > 0 && x < 10 && y > x && x < 40 - y) {
                                seccion = 4;
                                if (diente == 1 || diente == 17) {
                                    remplazo = 4;
                                }
                            } else if (x > 10 && x < 30 && y > 10 && y < 30) {
                                seccion = 5;
                                if (diente == 1) {
                                    remplazo = 22;
                                } else if (diente == 17) {
                                    remplazo = 23;
                                }
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

                function pintaBorrado() {
                    var dientepitando;
                    var itemm;
                    var seccionpintado;
                    var pintadoVector = new Array();
                    var contPintado = 0;

                    if (tamanoB == 3) {
                        for (var i = 0; i < localStorage.length; i++) {
                            var key_namee = localStorage.key(i);
                            itemm = localStorage.getItem(key_namee);
                            itemm = itemm.split(',');
                            dientepitando = parseInt(itemm[0], 10);
                            seccionpintado = parseInt(itemm[1], 10);
                            if (dientepitando == diente && seccionpintado == seccion2) {
                                pintadoVector[contPintado] = localStorage.getItem(key_namee).split(',');
                                contPintado++;
                                alert("mim");
                            }
                        }
                    } else {
                        for (var i = 0; i < localStorage.length; i++) {
                            var key_name = localStorage.key(i);
                            pintadoVector[i] = localStorage.getItem(key_name).split(',');
                        }
                    }
                    tamanoB = 0;
                    return (pintadoVector);
                }
                function pinta_datos() {
                    array_local = [];
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
                    console.log(array_local);
                    for (var i = 0; i < array_local.length; i++) {
                        item = array_local[i];
                        if (parseInt(item[0], 10) == diente) {

                            acc = parseInt(item[2], 10);
                            //console.log(acc);

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


            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <br />
            <br />
            <h5>Tratamientos Efectuados</h5>
            <br />

            <div style="margin-left: auto; margin-right: auto;">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                            runat="server" AutoGenerateColumns="False" Height="174px" Width="70%" HorizontalAlign="Center" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="fechaExpedienteTratamiento" HeaderText="Fecha" ItemStyle-Width="30" />
                                <asp:BoundField DataField="tratamientoExpedienteTratamiento" HeaderText="Tratamiento" ItemStyle-Width="100" />
                                <asp:BoundField DataField="piezaExpedienteTratamiento" HeaderText="Diente" ItemStyle-Width="100" />
                                <asp:BoundField DataField="descripcionExpedienteTratamiento" HeaderText="Descripción" ItemStyle-Width="100" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <br />
            <br />

            <div id="tablaDetalle" style="display: block" tabindex="-1">
                <h5>Nuevos tratamientos</h5>
                <br />
                <br />
                <div class="row">
                    <div class="col s2">
                    </div>
                    <div class="col s10">
                        <div class="col s2">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="Fecha">Fecha </label>
                                    <asp:Label ID="fecha" title="Fecha" runat="server"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col s3">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="Tratamiento">Tipo de tratamiento </label>
                                    <asp:DropDownList ID="DropDownList1" title="Tipos de tratamientos" Style="border: 2px solid black;" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <div class="col s3">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="Tipotratamiento">Tratamiento</label>
                                    <asp:DropDownList ID="DropDownList2" title="Tratamientos" Style="border: 2px solid black;" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTratamiento" DataValueField="nombreTratamiento" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <div class="col s3">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="active" for="Diente">Diente</label>
                                    <input type='text' name='dient' title="Dientes afectados" id="diente" runat="server" maxlength="44" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="col s2"></div>
                            <div class="col s8">
                                <label class="active" for="Descripcion">Descripción</label>
                                <input type='text' name='debe' id="descrip" title="Descripción" runat="server" maxlength="244" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="col s1">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button ID="AgregarDetalle" runat="server" class="waves-effect waves-light btn" OnClick="AgregarDetalle_Click" Text="+" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function solonumeros(e) {
                key = e.keyCoden || e.which;
                teclado = String.fromCharCode(key);
                numero = "1234567890";
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
        </script>
    </form>
</body>
</html>
