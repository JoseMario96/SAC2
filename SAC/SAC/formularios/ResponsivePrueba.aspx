<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResponsivePrueba.aspx.cs" Inherits="SAC.formularios.ResponsivePrueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>
    <style>
        body, a, a:hover {
            cursor: url(C:\Users\dtrej\source\repos\SAC2\SAC\SAC\images\cur438.cur), progress;
        }

        .auto-style1 {
            left: 0px;
            top: 0px;
        }

        #div {
            width: 50%;
            height: 80%;
            margin: 0 auto;
        }

        #canvas, #myCanvas, #myCanvas2, #myCanvas3, #myCanvas4 {
            border: 1px solid #d9d9d9;
            width: 100%;
            height: 100%;
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
        <asp:HiddenField ID="colorO" runat="server" />
        <asp:HiddenField ID="dienteO" runat="server" />
        <asp:HiddenField ID="seccionO" runat="server" />
        <asp:HiddenField ID="contextoO" runat="server" />


        <div id="radio">
            <input type="radio" id="radio1" name="accion" value="carie" checked="checked" /><label for="radio1">Carie</label>
            <input type="radio" id="radio6" name="accion" value="sellante" /><label for="radio6">Sellante</label>
            <input type="radio" id="radio2" name="accion" value="restauracion" /><label for="radio2">Obturado</label>
            <input type="radio" id="radio4" name="accion" value="extraccion" /><label for="radio4">Extraccion</label>
            <input type="radio" id="radio5" name="accion" value="puente" /><label for="radio5">Puente</label>
            <%--<input type="radio" id="radio3" name="accion" value="borrar" /><label for="radio3">Borrar</label>--%>
        </div>
        <div id="div">
            <canvas id="myCanvas" style="z-index: 1; position: absolute;"></canvas>
            <canvas id="myCanvas2" style="z-index: 2; position: absolute;"></canvas>
            <canvas id="myCanvas3" style="z-index: 3; position: absolute;"></canvas>
            <canvas id="myCanvas4" style="z-index: 4; position: absolute;"></canvas>
        </div>
    </form>

    <script>

        var canvas = document.querySelector("#myCanvas");
        var canvas2 = document.querySelector("#myCanva2");
        var canvas3 = document.querySelector("#myCanvas3");
        var canvas4 = document.querySelector("#myCanvas4");


        var X, Y, W, H, r;
        canvas.height = 250;
        function inicializarCanvas() {
            if (canvas && canvas.getContext) {
                var ctx = canvas.getContext("2d");
                if (ctx) {
                    var s = getComputedStyle(canvas);
                    var w = s.width;
                    var h = s.height;

                    W = canvas.width = w.split("px")[0];
                    H = canvas.height = h.split("px")[0];

                    X = Math.floor(W / 2);
                    Y = Math.floor(H / 2);
                    r = Math.floor(W / 3);


                    dibujarEnElCanvas(ctx);
                }
            }
        }

        function dibujarEnElCanvas(ctx) {
            ctx.strokeStyle = "#006400";
            ctx.fillStyle = "#6ab155";
            ctx.lineWidth = 5;
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

            function dibuja_contorno(context, inicio_x, inicio_y, med, separacion_x, separacion_y) {
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
            ctx.fill();
            ctx.stroke();
        }


        setTimeout(function () {
            inicializarCanvas();
            addEventListener("resize", inicializarCanvas);
        }, 15);
    </script>
</body>
</html>
