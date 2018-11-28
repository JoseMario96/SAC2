<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SAC.index" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="body">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Clínica Dental Doctora Alina Camacho</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords" content="Dental, Clinica, Clínica, Alina, Camacho, Ciudad Neily, Puntarenas" />

    <!-- Place favicon.ico and apple-touchm-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico" />
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css' />
    <!-- Animate.css -->

    <link href="../css/animate.css" rel="stylesheet" />
    <!-- Icomoon Icon Fonts-->
    <link href="../css/icomoon.css" rel="stylesheet" />

    <!-- Simple Line Icons -->
    <link href="../css/simple-line-icons.css" rel="stylesheet" />

    <!-- Magnific Popup -->
    <link href="../css/magnific-popup.css" rel="stylesheet" />

    <!-- Bootstrap  -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#pop').click(function () {
                if (!$('#iframe').length) {
                    $('#po').html('<iframe id="iframe" src="http://google.com"></iframe>');
                }
            });
        });

        $(window).resize(function () {
            //aqui el codigo que se ejecutara cuando se redimencione la ventana
            var ancho = $(window).width();
            if (ancho <= 520) {
                //calendario
                $("#calendariocss").removeClass("col-md-6");
                $("#calendariocss").addClass("row abajo2");
                $("#calendariocss2").removeClass("col-md-6");
                $("#calendariocss2").addClass("row abajo4");
                //pacientes
                $("#pacientecss").removeClass("col-md-3 col-xs-12");
                $("#pacientecss").addClass("row abajo3");
                $("#pacientecss2").removeClass("col-md-3 col-xs-12");
                $("#pacientecss2").addClass("row abajo3");
                $("#pacientecss3").removeClass("col-md-3 col-xs-12 abajo");
                $("#pacientecss3").addClass("row abajo");
                //expedientes
                $("#expedientecss").removeClass("col-md-3");
                $("#expedientecss").addClass("row abajo2");
                $("#expedientecss2").removeClass("col-md-3");
                $("#expedientecss2").addClass("row abajo2");
                $("#expedientecss3").removeClass("col-md-3");
                $("#expedientecss3").addClass("row abajo2");
                $("#expedientecss4").removeClass("col-md-3");
                $("#expedientecss4").addClass("row abajo2");

                $("#quitarcss").removeClass("row espacio");
                $("#quitarcss2").removeClass("col-md-3");
                $("#quitarcss3").removeClass("col-md-4");

                $("#expedientecss5").removeClass("col-md-3");
                $("#expedientecss5").addClass("row abajo2");
                $("#expedientecss6").removeClass("col-md-3");
                $("#expedientecss6").addClass("row abajo4");
                //ventas
                $("#ventascss").removeClass("col-md-3 col-xs-12");
                $("#ventascss").addClass("row abajo3");
                $("#quitarcss4").removeClass("col-md-1");
                $("#quitarcss5").removeClass("col-md-1");
                $("#ventascss2").removeClass("col-md-3 col-xs-12");
                $("#ventascss2").addClass("row abajo3");
                $("#ventascss3").removeClass("col-md-3 col-xs-12");
                $("#ventascss3").addClass("row abajo3");
                $("#quitarcss9").removeClass("row row-bottom-padded-sm");
                $("#quitarcss6").removeClass("col-md-1");
                $("#quitarcss7").removeClass("col-md-1");
                $("#ventascss4").removeClass("col-md-3 col-xs-12");
                $("#ventascss4").addClass("row abajo3");
                $("#quitarcss8").removeClass("col-md-1");
                $("#ventascss5").removeClass("col-md-3 col-xs-12 abajo");
                $("#ventascss5").addClass("row abajo");
                //usuarios
                $("#usuarioscss").removeClass("col-md-3 col-sm-6 col-xxs-12");
                $("#usuarioscss").addClass("row abajo2");
                $("#usuarioscss2").removeClass("col-md-3 col-sm-6 col-xxs-12");
                $("#usuarioscss2").addClass("row abajo4");
            }
            else{
                //calendario
                $("#calendariocss").removeClass("row abajo2");
                $("#calendariocss").addClass("col-md-6");
                $("#calendariocss2").removeClass("row abajo4");
                $("#calendariocss2").addClass("col-md-6");
                //pacientes
                $("#pacientecss").removeClass("row abajo3");
                $("#pacientecss").addClass("col-md-3 col-xs-12");
                $("#pacientecss2").removeClass("row abajo3");
                $("#pacientecss2").addClass("col-md-3 col-xs-12");
                $("#pacientecss3").removeClass("row abajo");
                $("#pacientecss3").addClass("col-md-3 col-xs-12 abajo");
                //expedientes
                $("#expedientecss").removeClass("row abajo2");
                $("#expedientecss").addClass("col-md-3");
                $("#expedientecss2").removeClass("row abajo2");
                $("#expedientecss2").addClass("col-md-3");
                $("#expedientecss3").removeClass("row abajo2");
                $("#expedientecss3").addClass("col-md-3");
                $("#expedientecss4").removeClass("row abajo2");
                $("#expedientecss4").addClass("col-md-3");

                $("#quitarcss").addClass("row espacio");
                $("#quitarcss2").addClass("col-md-3");
                $("#quitarcss3").addClass("col-md-4");

                $("#expedientecss5").removeClass("row abajo2");
                $("#expedientecss5").addClass("col-md-3");
                $("#expedientecss6").removeClass("row abajo4");
                $("#expedientecss6").addClass("col-md-3");
                //ventas
                $("#ventascss").removeClass("row abajo3");
                $("#ventascss").addClass("col-md-3 col-xs-12");
                $("#quitarcss4").addClass("col-md-1");
                $("#quitarcss5").addClass("col-md-1");
                $("#ventascss2").removeClass("row abajo3");
                $("#ventascss2").addClass("col-md-3 col-xs-12");
                $("#ventascss3").removeClass("row abajo3");
                $("#ventascss3").addClass("col-md-3 col-xs-12");
                $("#quitarcss9").addClass("row row-bottom-padded-sm");
                $("#quitarcss6").addClass("col-md-1");
                $("#quitarcss7").addClass("col-md-1");
                $("#ventascss4").removeClass("row abajo3");
                $("#ventascss4").addClass("col-md-3 col-xs-12");
                $("#quitarcss8").addClass("col-md-1");
                $("#ventascss5").removeClass("row abajo");
                $("#ventascss5").addClass("col-md-3 col-xs-12 abajo");
                //usuarios
                $("#usuarioscss").removeClass("row abajo2");
                $("#usuarioscss").addClass("col-md-3 col-sm-6 col-xxs-12");
                $("#usuarioscss2").removeClass("row abajo4");
                $("#usuarioscss2").addClass("col-md-3 col-sm-6 col-xxs-12");
            }
        })

        $(document).ready(function () {
            //aqui el codigo que se ejecutara cuando se redimencione la ventana
            var ancho = $(window).width();
            if (ancho < 520) {
                //calendario
                $("#calendariocss").removeClass("col-md-6");
                $("#calendariocss").addClass("row abajo2");
                $("#calendariocss2").removeClass("col-md-6");
                $("#calendariocss2").addClass("row abajo4");
                //pacientes
                $("#pacientecss").removeClass("col-md-3 col-xs-12");
                $("#pacientecss").addClass("row abajo3");
                $("#pacientecss2").removeClass("col-md-3 col-xs-12");
                $("#pacientecss2").addClass("row abajo3");
                $("#pacientecss3").removeClass("col-md-3 col-xs-12 abajo");
                $("#pacientecss3").addClass("row abajo");
                //expedientes
                $("#expedientecss").removeClass("col-md-3");
                $("#expedientecss").addClass("row abajo3");
                $("#expedientecss2").removeClass("col-md-3");
                $("#expedientecss2").addClass("row abajo3");
                $("#expedientecss3").removeClass("col-md-3");
                $("#expedientecss3").addClass("row abajo3");
                $("#expedientecss4").removeClass("col-md-3");
                $("#expedientecss4").addClass("row abajo2");

                $("#quitarcss").removeClass("row espacio");
                $("#quitarcss2").removeClass("col-md-3");
                $("#quitarcss3").removeClass("col-md-4");

                $("#expedientecss5").removeClass("col-md-3");
                $("#expedientecss5").addClass("row abajo2");
                $("#expedientecss6").removeClass("col-md-3");
                $("#expedientecss6").addClass("row abajo4");
                //ventas
                $("#ventascss").removeClass("col-md-3 col-xs-12");
                $("#ventascss").addClass("row abajo3");
                $("#quitarcss4").removeClass("col-md-1");
                $("#quitarcss5").removeClass("col-md-1");
                $("#ventascss2").removeClass("col-md-3 col-xs-12");
                $("#ventascss2").addClass("row abajo3");
                $("#ventascss3").removeClass("col-md-3 col-xs-12");
                $("#ventascss3").addClass("row abajo3");
                $("#quitarcss9").removeClass("row row-bottom-padded-sm");
                $("#quitarcss6").removeClass("col-md-1");
                $("#quitarcss7").removeClass("col-md-1");
                $("#ventascss4").removeClass("col-md-3 col-xs-12");
                $("#ventascss4").addClass("row abajo3");
                $("#quitarcss8").removeClass("col-md-1");
                $("#ventascss5").removeClass("col-md-3 col-xs-12 abajo");
                $("#ventascss5").addClass("row abajo");
                //usuarios
                $("#usuarioscss").removeClass("col-md-3 col-sm-6 col-xxs-12");
                $("#usuarioscss").addClass("row abajo3");
                $("#usuarioscss2").removeClass("col-md-3 col-sm-6 col-xxs-12");
                $("#usuarioscss2").addClass("row abajo4");
            }
            
        })
    </script>
    <style>
        .option-toggle {
            position: absolute;
            right: 0;
            top: 0;
            margin-top: 5px;
            margin-right: -30px;
            width: 30px;
            height: 30px;
            background: #f64662;
            text-align: center;
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            color: #fff;
            cursor: pointer;
            -webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
            -moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
            /*-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);*/
            box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
        }

            .option-toggle i {
                top: 2px;
                position: relative;
            }

            .option-toggle:hover, .option-toggle:focus, .option-toggle:active {
                color: #fff;
                text-decoration: none;
                outline: none;
            }

        #popup, #popup1, #popup2, #popup3, #popup4, #popup5, #popup6, #popup7, #popup8, #popup9, #popup10, #popup11, #popup12, #popup13, #popup14, #popup15, #popup16, #popup17, #popup18 {
            visibility: hidden;
            opacity: 0;
            margin-top: -300px;
        }

            #popup:target, #popup1:target, #popup2:target, #popup3:target, #popup4:target, #popup5:target, #popup6:target, #popup7:target, #popup8:target, #popup9:target, #popup10:target, #popup11:target, #popup12:target, #popup13:target, #popup14:target, #popup15:target, #popup16:target, #popup17:target, #popup18:target {
                visibility: visible;
                opacity: 1;
                background-color: rgba(0,0,0,0.8);
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                margin: 0;
                z-index: 999;
                transition: all 1s;
            }

        .popup-contenedorO {
            position: relative;
            margin: 7% auto;
            padding: 30px 50px;
            background-color: #fafafa;
            /*color: #333;*/
            border-radius: 3px;
            width: 95%;
            height: 75%;
        }

        .popup-contenedor {
            position: relative;
            margin: 7% auto;
            padding: 30px 50px;
            background-color: #fafafa;
            /*color: #333;*/
            border-radius: 3px;
            width: 65%;
            height: 75%;
        }

        .popup-contenedorC {
            position: relative;
            margin: 5% auto;
            padding: 30px 50px;
            background-color: #fafafa;
            /*color: #333;*/
            border-radius: 3px;
            width: 90%;
            height: 80%;
        }

        a.popup-cerrar {
            position: absolute;
            top: 3px;
            right: 3px;
            background-color: rgb(255, 0, 0);
            padding: 7px 10px;
            font-size: 24px;
            text-decoration: none;
            line-height: 1;
            color: #fff;
        }

        .responsiveContent {
            /*position: relative;*/
            height: 0;
            overflow: hidden;
            padding-bottom: 56.2%;
            margin-bottom: 20px;
        }

            .responsiveContent iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }

        .espacio {
            padding-top: 21%;
        }

        .abajo {
            padding-bottom: 10%;
        }

        .abajo2 {
            padding-bottom: 15%;
        }

        .abajo3 {
            padding-bottom: 25%;
        }

        .abajo4 {
            padding-bottom: 30%;
        }

        .letrasgrande {
            font-size: 24px;
        }

        .centrar {
            display: block;
            margin: auto;
        }

        .derecha {
            float: right;
            margin-top: 0px;
            margin-right: 5px;
            padding-top: 5px;
        }

            .derecha:hover {
                -webkit-transform: scale(1.25);
                -moz-transform: scale(1.25);
                -ms-transform: scale(1.25);
                -o-transform: scale(1.25);
                transform: scale(1.25);
            }
    </style>

    <script src="../js/modernizr-2.6.2.min.js"></script>

</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>

        <header role="banner" id="fh5co-header">
            <a href="documentos/Manual de Usuario.pdf" target="_blank">
                <img class="derecha" src="images/help.png" title="Ayuda"/>
            </a>
            <asp:ImageButton CssClass="derecha" ID="img_cerrarsesion" ImageUrl="~/images/logout.png" runat="server" OnClick="img_cerrarsesion_Click" title="Cerrar sesión" />
            <br />
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                            <a class="navbar-brand" href="index.aspx">Doctora Alina Camacho</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="#" data-nav-section="home"><span>Inicio</span></a></li>
                                <li><a href="#" data-nav-section="citas"><span>Citas</span></a></li>
                                <li><a href="#" data-nav-section="pacientes"><span>Pacientes</span></a></li>
                                <li><a href="#" data-nav-section="expedientes"><span>Expedientes</span></a></li>
                                <li><a href="#" data-nav-section="factura"><span>Factura</span></a></li>
                                <li id="ocultar" style="display:none"><a href="#" data-nav-section="usuario"><span>Usuarios</span></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:Timer ID="refrescar" runat="server" Interval="600000" OnTick="refrescar_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>


        <%--<form id="form1" runat="server">--%>
        <section id="fh5co-home" data-section="home" style="background-image: url(images/diente.jpg);" data-stellar-background-ratio="0.5">
            <div class="gradient"></div>
            <div class="container">
                <div class="text-wrap">
                    <div class="text-inner">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <h1 class="to-animate">Clínica Dental Doctora Alina Camacho</h1>
                                <h2 class="to-animate">Ciudad Neily, Puntarenas, Costa Rica</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slant"></div>
        </section>

        <%--  <section id="fh5co-intro">
	</section>--%>

        <%------------------------------------------------------------------Citas---------------------------------------------------------------------------%>
        <section id="fh5co-contact" data-section="citas">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 section-heading text-center">
                        <h2 class="to-animate">Citas</h2>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 subtext to-animate">
                                <h3>En esta sección se puede agregar, buscar, actualizar y eliminar citas</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="calendariocss" class="col-md-6">
                    <a href="#popup9" class="popup-link fh5co-project-item" onclick='document.getElementById("calendario").src="formularios/frm_Calendario.aspx";'>
                        <img src="../images/calendario.png" alt="Image" class="img-responsive centrar" />
                        <div class="letrasgrande">
                            <h2 style="text-align: center;">Ver Agenda</h2>
                        </div>
                    </a>
                    <div class="modal-wrapper" id="popup9">
                        <div class="popup-contenedorC">
                            <div class="responsiveContent">
                                <iframe id="calendario"></iframe>
                                <a class="popup-cerrar" href="#fh5co-contact">X</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="calendariocss2" class="col-md-6">
                    <a href="#popup10" class="popup-link fh5co-project-item" onclick='document.getElementById("citas_Hoy").src="formularios/frm_AgregarCita.aspx";'>
                        <img src="../images/calendario_hoy.png" alt="Image" class="img-responsive centrar" />
                        <div class="letrasgrande">
                            <h2 style="text-align: center;">Ver citas de hoy</h2>
                        </div>
                    </a>
                    <div class="modal-wrapper" id="popup10">
                        <div class="popup-contenedor">
                            <div class="responsiveContent">
                                <iframe id="citas_Hoy"></iframe>
                                <a class="popup-cerrar" href="#fh5co-contact">X</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <%--------------------------------------------------------------Paciente---------------------------------------------------------------------%>
        <section id="fh5co-work" data-section="pacientes">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 section-heading text-center">
                        <h2 class="to-animate">Pacientes</h2>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 subtext to-animate">
                                <h3>En esta sección se puede agregar, buscar y actualizar la información personal de un paciente</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row row-bottom-padded-sm">
                    <div id="pacientecss" class="col-md-3 col-xs-12">
                        <a href="#popup" class="popup-link fh5co-project-item" onclick='document.getElementById("agregarP").src="formularios/frm_AgregarPaciente.aspx";'>
                            <img src="../images/agregar.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Agregar</h2>
                            </div>
                        </a>
                        <div class="modal-wrapper" id="popup">
                            <div class="popup-contenedor">
                                <div id="po" class="responsiveContent">
                                    <iframe id="agregarP"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-work">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <%--Actualizar--%>
                    <div id="pacientecss2" class="col-md-3 col-xs-12">
                        <a href="#popup1" class="popup-link fh5co-project-item " onclick='document.getElementById("actuP").src="formularios/frm_ActualizarPaciente.aspx";'>
                            <img src="../images/actualizar.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Actualizar</h2>
                            </div>
                        </a>
                        <div id="popup1" class="modal-wrapper">
                            <div class="popup-contenedor">
                                <div id="actualizar" class="responsiveContent">
                                    <iframe id="actuP"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-work">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <%--Buscar--%>
                    <div id="pacientecss3" class="col-md-3 col-xs-12 abajo">
                        <a href="#popup2" class="popup-link fh5co-project-item " onclick='document.getElementById("buscarP").src="formularios/frm_BuscarPaciente.aspx";'>
                            <img src="../images/buscar.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Buscar</h2>
                            </div>
                        </a>
                        <div id="popup2" class="modal-wrapper">
                            <div class="popup-contenedor">
                                <div class="responsiveContent">
                                    <iframe id="buscarP"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-work">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%---------------------------------------------------------------Expediente--------------------------------------------------------------------%>
        <section id="fh5co-testimonials" data-section="expedientes">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 section-heading text-center">
                        <h2 class="to-animate">Expedientes</h2>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 subtext to-animate">
                                <h3>En esta sección se puede agregar, buscar, actualizar y generar el reporte de un expediente</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <%--Agregar--%>
                    <div id="expedientecss" class="col-md-3 ">
                        <a href="#popup3" class="popup-link fh5co-project-item" onclick='document.getElementById("agregarE").src="formularios/frm_AgregarExpediente.aspx";'>
                            <img src="../images/agregar.png" alt="Image" class="img-responsive centrar" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Agregar</h2>
                            </div>
                        </a>
                        <div id="popup3" class="modal-wrapper">
                            <div class="popup-contenedor">
                                <div class="responsiveContent">
                                    <iframe id="agregarE"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-testimonials">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Actualizar--%>
                    <div id="expedientecss2" class="col-md-3">
                        <a href="#popup4" class="popup-link fh5co-project-item " onclick='document.getElementById("actuE").src="formularios/frm_ActualizarExpediente.aspx";'>
                            <img src="../images/actualizar.png" alt="Image" class="img-responsive centrar" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Actualizar</h2>
                            </div>
                        </a>
                        <div id="popup4" class="modal-wrapper">
                            <div class="popup-contenedor">
                                <div class="responsiveContent">
                                    <iframe id="actuE"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-testimonials">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Buscar--%>
                    <div id="expedientecss3" class="col-md-3">
                        <a href="#popup5" class="popup-link fh5co-project-item " onclick='document.getElementById("buscarE").src="formularios/frm_BuscarExpediente.aspx";'>
                            <img src="../images/buscar.png" alt="Image" class="img-responsive centrar" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Buscar</h2>
                            </div>
                        </a>
                        <div id="popup5" class="modal-wrapper">
                            <div class="popup-contenedor">
                                <div class="responsiveContent">
                                    <iframe id="buscarE"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-testimonials">X</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Reporte--%>
                    <div id="expedientecss4" class="col-md-3 ">
                        <a href="#popup6" class="popup-link fh5co-project-item " onclick='document.getElementById("Odonto").src="formularios/frm_Odontograma.aspx";'>
                            <img src="../images/Odontogroma.jpg" alt="Image" class="img-responsive centrar" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Odontograma</h2>
                            </div>
                        </a>
                        <div id="popup6" class="modal-wrapper">
                            <div class="popup-contenedorO">
                                <div class="responsiveContent">
                                    <iframe id="Odonto"></iframe>
                                    <a id="cerrar" class="popup-cerrar" href="#fh5co-testimonials">X</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <%--Odontograma--%>
                <div id="quitarcss" class="row espacio">
                    <div id="quitarcss2" class="col-md-3"></div>
                    <div id="expedientecss5" class="col-md-3">
                        <a href="#popup7" class="popup-link fh5co-project-item " onclick='document.getElementById("reporteE").src="formularios/frm_ReporteOdontogramas.aspx";'>
                            <img src="../images/reporte.png" alt="Image" class="img-responsive centrar" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Reporte</h2>
                            </div>
                        </a>
                        <div id="popup7" class="modal-wrapper">
                            <div class="popup-contenedorO">
                                <div class="responsiveContent">
                                    <iframe id="reporteE"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-testimonials">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="quitarcss3" class="col-md-4"></div>
                    <div id="expedientecss6" class="col-md-3">
                        <a href="#popup8" class="popup-link fh5co-project-item" onclick='document.getElementById("tratamientos").src="formularios/frm_tratamientos.aspx";'>
                            <img src="../images/tratamientos.png" alt="Image" class="img-responsive centrar" />
                            <div class="fh5co-text">

                                <h2 style="text-align: center;">Tratamientos</h2>
                            </div>
                        </a>
                        <div id="popup8" class="modal-wrapper">
                            <div class="popup-contenedor">
                                <div class="responsiveContent">
                                    <iframe id="tratamientos"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-testimonials">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
        <br />
        <br />
        <br />

        <%--------------------------------------------------------------Factura---------------------------------------------------------------------%>
        <section id="fh5co-services" data-section="factura">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 section-heading text-center">
                        <h2 class="to-animate">Factura</h2>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 subtext to-animate">
                                <h3>En esta sección se puede facturar, realizar abonos a cuentas por cobrar y ver reportes de cuentas por cobrar y ventas a los pacientes</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-bottom-padded-sm">
                    <%--Ventas--%>
                    <div id="ventascss" class="col-md-3 col-xs-12">
                        <a href="#popup11" class="popup-link fh5co-project-item" onclick='document.getElementById("ventas").src="formularios/frm_AgregarVenta.aspx";'>
                            <img src="../images/factura.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Ventas</h2>
                            </div>
                        </a>
                        <div class="modal-wrapper" id="popup11">
                            <div class="popup-contenedorC">
                                <div class="responsiveContent">
                                    <iframe id="ventas"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-services">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="quitarcss4" class="col-md-1">
                    </div>
                    <%--Mostrar Ventas--%>
                    <div id="ventascss2" class="col-md-3 col-xs-12">
                        <a href="#popup12" class="popup-link fh5co-project-item" onclick='document.getElementById("mostrarVentas").src="formularios/frm_BuscarVenta.aspx";'>
                            <img src="../images/mostrar_facturas.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Buscar ventas</h2>
                            </div>
                        </a>
                        <div class="modal-wrapper" id="popup12">
                            <div class="popup-contenedorC">
                                <div class="responsiveContent">
                                    <iframe id="mostrarVentas"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-services">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="quitarcss5" class="col-md-1">
                    </div>
                    <%--Reporte Factura--%>
                    <div id="ventascss3" class="col-md-3 col-xs-12 abajo">
                        <a href="#popup13" class="popup-link fh5co-project-item" onclick='document.getElementById("reporteVentas").src="formularios/frm_ReporteVentas.aspx";'>
                            <img src="../images/reporte_factura.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Reporte de ventas</h2>
                            </div>
                        </a>
                        <div class="modal-wrapper" id="popup13">
                            <div class="popup-contenedorC">
                                <div class="responsiveContent">
                                    <iframe id="reporteVentas"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-services">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="quitarcss9" class="row row-bottom-padded-sm">
                    <%--Cuentas por cobrar--%>
                    <div id="quitarcss6" class="col-md-1">
                    </div>
                    <div id="quitarcss7" class="col-md-1">
                    </div>
                    <div id="ventascss4" class="col-md-3 col-xs-12">
                        <a href="#popup14" class="popup-link fh5co-project-item" onclick='document.getElementById("Cuentas").src="formularios/frm_CuentasXCobrar.aspx";'>
                            <img src="../images/CxC.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Cuentas por cobrar</h2>
                            </div>
                        </a>
                        <div class="modal-wrapper" id="popup14">
                            <div class="popup-contenedorC">
                                <div class="responsiveContent">
                                    <iframe id="Cuentas"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-services">X</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="quitarcss8" class="col-md-1">
                    </div>
                    <%--Reporte Cuentas por Cobrar--%>
                    <div id="ventascss5" class="col-md-3 col-xs-12 abajo">
                        <a href="#popup16" class="popup-link fh5co-project-item" onclick='document.getElementById("reporteCuentas").src="formularios/frm_ReporteCxC.aspx";'>
                            <img src="../images/ReporteCxC.png" alt="Image" class="img-responsive centrar" />
                            <div class="letrasgrande">
                                <h2 style="text-align: center;">Reporte de CxC</h2>
                            </div>
                        </a>
                        <div class="modal-wrapper" id="popup16">
                            <div class="popup-contenedorC">
                                <div class="responsiveContent">
                                    <iframe id="reporteCuentas"></iframe>
                                    <a class="popup-cerrar" href="#fh5co-services">X</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%--------------------------------------------------------------Usuario---------------------------------------------------------------------%>
        <div id="ocultar1" style="display:none">
            <section id="fh5co-about" data-section="usuario">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 section-heading text-center">
                            <h2 class="to-animate">Usuario</h2>
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 subtext to-animate">
                                    <h3>En esta sección se puede agregar, buscar, actualizar y eliminar los usuarios del sistema</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="quitarcss10" class="col-md-3 col-sm-6 col-xxs-12">
                    </div>
                    <div class="row row-bottom-padded-sm">
                        <div id="usuarioscss" class="col-md-3 col-sm-6 col-xxs-12">
                            <a id="usu1" href="#popup17" class="fh5co-project-item" onclick='document.getElementById("agregarUsuario").src="formularios/frm_AgregarUsuario.aspx";'>
                                <img src="../images/agregar_usuario.png" alt="Image" class="imagen img-responsive centrar" />
                                <div class="fh5co-text">
                                    <h2 style="text-align: center;">Agregar</h2>
                                </div>
                            </a>
                            <div class="modal-wrapper" id="popup17">
                                <div class="popup-contenedor">
                                    <div class="responsiveContent">
                                        <iframe id="agregarUsuario"></iframe>
                                        <a class="popup-cerrar" href="#fh5co-about">X</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="usuarioscss2" class="col-md-3 col-sm-6 col-xxs-12">
                            <a id="usu3" href="#popup18" class="fh5co-project-item" onclick='document.getElementById("actualizarUsuario").src="formularios/frm_ActualizarUsuario.aspx";'>
                                <img src="../images/actualizar_usuario.png" alt="Image" class="imagen img-responsive centrar" />
                                <div class="fh5co-text">
                                    <h2 style="text-align: center;">Actualizar</h2>
                                </div>
                            </a>
                            <div class="modal-wrapper" id="popup18">
                                <div class="popup-contenedor">
                                    <div class="responsiveContent">
                                        <iframe id="actualizarUsuario"></iframe>
                                        <a class="popup-cerrar" href="#fh5co-about">X</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="quitarcss11" class="col-md-3 col-sm-6 col-xxs-12">
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <br />
        <br />
        <br />
        <br />
        <footer id="footer" role="contentinfo" style="text-align: center">
            <a href="#" class="gotop js-gotop"><i class="icon-arrow-up2">Inicio</i></a>
            <p>&copy; 2018 - Clínica Dental Alina Camacho. Todos los derechos reservados.</p>
        </footer>
        <script src="../js/jquery.min.js"></script>


        <script src="../js/jquery.easing.1.3.js"></script>

        <script src="../js/bootstrap.min.js"></script>

        <script src="../js/jquery.waypoints.min.js"></script>

        <script src="../js/jquery.stellar.min.js"></script>

        <script src="../js/jquery.countTo.js"></script>

        <script src="../js/jquery.magnific-popup.min.js"></script>

        <script src="../js/magnific-popup-options.js"></script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
        <script src="../js/google_map.js"></script>

        <script src="../js/jquery.style.switcher.js"></script>
        <script src="../js/materialize.js"></script>

        <script src="../js/main.js"></script>
    </form>
</body>
</html>
