<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SAC.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Clínica Dental Doctora Alina Camacho</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords" content="Dental, Clinica, Clínica, Alina, Camacho, Ciudad Neily, Puntarenas" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content="" />
    <meta property="og:image" content="" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:description" content="" />
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />



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
    <style>
        /* For demo purpose only */

        /* For Demo Purposes Only ( You can delete this anytime :-) */
        #colour-variations {
            padding: 10px;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
            transition: 0.5s;
            width: 140px;
            position: fixed;
            left: 0;
            top: 100px;
            z-index: 999999;
            background: #fff;
            /*border-radius: 4px;*/
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            -webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
            -moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
            /*-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);*/
            box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
        }

            #colour-variations.sleep {
                margin-left: -140px;
            }

            #colour-variations h3 {
                text-align: center;
                font-size: 11px;
                letter-spacing: 2px;
                text-transform: uppercase;
                color: #777;
                margin: 0 0 10px 0;
                padding: 0;
            }

            #colour-variations ul,
            #colour-variations ul li {
                padding: 0;
                margin: 0;
            }

            #colour-variations li {
                list-style: none;
                display: block;
                margin-bottom: 5px !important;
                float: left;
                width: 100%;
            }

                #colour-variations li a {
                    width: 100%;
                    position: relative;
                    display: block;
                    overflow: hidden;
                    -webkit-border-radius: 4px;
                    -moz-border-radius: 4px;
                    /*-ms-border-radius: 4px;*/
                    border-radius: 4px;
                    -webkit-transition: 0.4s;
                    -o-transition: 0.4s;
                    transition: 0.4s;
                }

                    #colour-variations li a:hover {
                        opacity: .9;
                    }

                    #colour-variations li a > span {
                        width: 33.33%;
                        height: 20px;
                        float: left;
                        display: -moz-inline-stack;
                        display: inline-block;
                        zoom: 1;
                        *display: inline;
                    }

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

        /*.modal-open {
            width: 80%;
            max-height: 80%;
            height: 80%;
            top: 0 !important;
            color: #000000
        }*/

        .letra {
            color: black
        }

        /*.imagen {
            width: 100%;
            height: 100%;
            display: block;
            margin: auto;
            vertical-align: middle
        }*/

        #popup, #popup1, #popup2 {
            visibility: hidden;
            opacity: 0;
            margin-top: -300px;
        }

            #popup:target, #popup1:target, #popup2:target {
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

        a.popup-cerrar {
            position: absolute;
            top: 3px;
            right: 3px;
            background-color: rgb(255, 0, 0);
            padding: 7px 10px;
            font-size: 20px;
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
    </style>

    <!-- End demo purposes only -->


    <!-- Modernizr JS -->
    <script src="../js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
    <header role="banner" id="fh5co-header">
        <div class="container">
            <div class="row">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                        <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                        <a class="navbar-brand" href="index.aspx">Clínica Dental Doctora Alina Camacho</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#" data-nav-section="home"><span>Inicio</span></a></li>
                            <li><a href="#" data-nav-section="citas"><span>Citas</span></a></li>
                            <li><a href="#" data-nav-section="work"><span>Pacientes</span></a></li>
                            <li><a href="#" data-nav-section="testimonials"><span>Expedientes</span></a></li>
                            <li><a href="#" data-nav-section="factura"><span>Factura</span></a></li>
                            <li><a href="#" data-nav-section="usuario"><span>Usuarios</span></a></li>
                            <li><a href="#" data-nav-section=""><span>Cerrar sesión</span></a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </header>

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
            <div class="row row-bottom-padded-sm">
                <div class="col-md-3 col-sm-6 col-xxs-12">
                    <a href="../images/agregar.png" class="fh5co-project-item">
                        <img src="../images/agregar.png" alt="Image" class="imagen img-responsive" />
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Agregar</h2>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6 col-xxs-12">
                    <a href="../images/actualizar.png" class="fh5co-project-item">
                        <img src="../images/actualizar.png" alt="Image" class="imagen img-responsive" />
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Actualizar</h2>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6 col-xxs-12">
                    <a href="../images/buscar.png" class="fh5co-project-item">
                        <img src="../images/buscar.png" alt="Image" class="imagen img-responsive" />
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Buscar</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-3 col-sm-6 col-xxs-12">
                    <a href="../images/buscar.png" class="fh5co-project-item">
                        <img src="../images/buscar.png" alt="Image" class="imagen img-responsive" />
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Eliminar</h2>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <%--------------------------------------------------------------Paciente---------------------------------------------------------------------%>
    <section id="fh5co-work" data-section="work">
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

            <%--Agregar--%>
            <div class="row col-xxs-12">
                <div class="col-md-4">
                    <%-- <a href="javascript:popUp('frm_AgregarPaciente.aspx')" class="modal-trigger fh5co-project-item" id="boton">
                        <center><img src="../images/agregar.png" alt="Image" class="img-responsive "/></center>
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Agregar</h2>
                        </div>
                    </a>--%>
                    <%--  <div id="modal1" class="modal modal-content letra">

                     <div id="cargaexterna">--%>
                    <%--<iframe width="800" height="800" src="frm_AgregarPaciente.aspx"></iframe>--%>

                    <%--  <div class="modal-footer">
                            <a href="#!" class="modal-close waves-effect waves-green btn-flat letra ">Agree</a>
                        </div>--%>

                   <a href="#popup" class="popup-link fh5co-project-item">
                        <center><img src="../images/agregar.png" alt="Image" class="img-responsive "/></center>
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Agregar</h2>
                        </div>
                    </a>
                    <div class="modal-wrapper" id="popup">
                        <div class="popup-contenedor">
                            <div class="responsiveContent">
                                <iframe src="formularios/frm_AgregarPaciente.aspx"></iframe>
                                <a class="popup-cerrar" href="#work">X</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Actualizar--%>
                <div class="col-md-4">
                    <a href="#popup1" class="popup1-link fh5co-project-item ">
                        <center><img src="../images/actualizar.png" alt="Image" class="img-responsive" /></center>
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Actualizar</h2>
                        </div>
                    </a>
                    <div id="popup1" class="modal-wrapper">
                        <div class="popup-contenedor">
                            <div class="responsiveContent">
                                <iframe src="formularios/frm_ActualizarPaciente.aspx"></iframe>
                                <a class="popup-cerrar" href="#work">X</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Buscar--%>
                <div class="col-md-4 ">
                    <a href="#popup2" class="popup1-link fh5co-project-item ">
                        <center><img src="../images/buscar.png" alt="Image" class="img-responsive" /></center>
                        <div class="fh5co-text">
                            <h2 style="text-align: center;">Buscar</h2>
                        </div>
                    </a>
                    <div id="popup2" class="modal-wrapper">
                        <div class="popup-contenedor">
                            <div class="responsiveContent">
                                <iframe src="formularios/frm_BuscarPaciente.aspx"></iframe>
                                <a class="popup-cerrar" href="#work">X</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%---------------------------------------------------------------Expediente--------------------------------------------------------------------%>
    <section id="fh5co-testimonials" data-section="testimonials">
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

            <div class="col-md-3 col-sm-6 col-xxs-12">
                <a href="../images/agregar.png" class="fh5co-project-item">
                    <center><img src="../images/agregar.png" alt="Image" class="img-responsive" /></center>
                    <div class="fh5co-text">
                        <h2 style="text-align: center;">Agregar</h2>
                    </div>
                </a>
            </div>
            <div class="col-md-3 col-sm-6 col-xxs-12">
                <a href="../images/actualizar.png" class="fh5co-project-item">
                    <center> <img src="../images/actualizar.png" alt="Image" class="img-responsive" /></center>
                    <div class="fh5co-text">
                        <h2 style="text-align: center;">Actualizar</h2>
                    </div>
                </a>
            </div>

            <%-- <div class="clearfix visible-sm-block"></div>--%>
            <div class="col-md-3 col-sm-6 col-xxs-12">
                <a href="../images/buscar.png" class="fh5co-project-item">
                    <center><img src="../images/buscar.png" alt="Image" class="img-responsive" /></center>
                    <div class="fh5co-text">
                        <h2 style="text-align: center;">Buscar</h2>
                        <!--<span>Web</span>-->
                    </div>
                </a>
            </div>

            <div class="col-md-3 col-sm-6 col-xxs-12">
                <a href="../images/reporte.png" class="fh5co-project-item">
                    <center><img src="../images/reporte.png" alt="Image" class="img-responsive" /></center>
                    <div class="fh5co-text">
                        <h2 style="text-align: center;">Generar reporte</h2>
                        <!--<span>UI/UX</span>-->
                    </div>
                </a>
            </div>

            <!--<div class="row">
        <div class="col-md-4">
            <div class="box-testimony">
                <blockquote class="to-animate-2">
                    <p>&ldquo;Beyond the horizon of the place we lived when we were young, In a world of magnets and miracles. Our thoughts strayed constantly and without boundary, The ringing of the division bell had begun.&rdquo;</p>
                </blockquote>
                <div class="author to-animate">
                    <figure><img src="images/person1.jpg" alt="Person"></figure>
                    <p>
                    Jean Doe, CEO <a href="#">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box-testimony">
                <blockquote class="to-animate-2">
                    <p>&ldquo; Along the Long Road and on down the Causeway, Do they still meet there by the Cut? There was a ragged band that followed in our footsteps. Running before times took our dreams away. Leaving the myriad small creatures trying to tie us to the ground. To a life consumed by slow decay.&rdquo;</p>
                </blockquote>
                <div class="author to-animate">
                    <figure><img src="images/person2.jpg" alt="Person"></figure>
                    <p>
                    John Doe, Senior UI <a href="#">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="box-testimony">
                <blockquote class="to-animate-2">
                    <p>&ldquo; The grass was greener. The light was brighter. When friends surrounded. The nights of wonder. &rdquo;</p>
                </blockquote>
                <div class="author to-animate">
                    <figure><img src="images/person3.jpg" alt="Person"></figure>
                    <p>
                    Chris Nash, Director <a href="#">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
                    </p>
                </div>
            </div>
        </div>
-->
        </div>
    </section>

    <%--------------------------------------------------------------Factura---------------------------------------------------------------------%>
    <section id="fh5co-services" data-section="factura">
        <div class="container">
            <div class="row">
                <div class="col-md-12 section-heading text-center">
                    <h2 class="to-animate">Factura</h2>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 subtext to-animate">
                            <h3>En esta sección se puede realizar reportes de cuentas por cobrar de los pacientes</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <%-- <div class="col-md-12 section-heading text-left">
                    <h2 class=" left-border to-animate">Services</h2>
                    <div class="row">
                        <div class="col-md-8 subtext to-animate">
                            <h3>Encumbered forever by desire and ambition. There's a hunger still unsatisfied!</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 fh5co-service to-animate">
                    <i class="icon to-animate-2 icon-anchor"></i>
                    <h3>Brand &amp; Strategy</h3>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
                </div>
                <div class="col-md-6 col-sm-6 fh5co-service to-animate">
                    <i class="icon to-animate-2 icon-layers2"></i>
                    <h3>Web &amp; Interface</h3>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
                </div>

                <div class="clearfix visible-sm-block"></div>

                <div class="col-md-6 col-sm-6 fh5co-service to-animate">
                    <i class="icon to-animate-2 icon-video2"></i>
                    <h3>Photo &amp; Video</h3>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
                </div>
                <div class="col-md-6 col-sm-6 fh5co-service to-animate">
                    <i class="icon to-animate-2 icon-monitor"></i>
                    <h3>CMS &amp; eCommerce</h3>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
                </div>--%>
            </div>
        </div>
    </section>

    <%--  <section id="fh5co-about" data-section="about">
        <div class="container">
            <div class="row">
                <div class="col-md-12 section-heading text-center">
                    <h2 class="to-animate">About</h2>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 subtext to-animate">
                            <h3>Our weary eyes still stray to the horizon. Though down this road we've been so many times.</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="col-md-4 col-sm-6 col-xxs-12">
                        <a onclick="return popup('frm_agregarPaciente.aspx',1250,650)" class="fh5co-project-item">
                            <img src="../images/agregar.png" alt="Image" class="img-responsive" />

                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Agregar</h2>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-person text-center to-animate">
                        <figure>
                            <img src="images/person2.jpg" alt="Image" />
                        </figure>
                        <h3>Rob Smith</h3>
                        <span class="fh5co-position">Web Developer</span>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
                        <ul class="social social-circle">
                            <li><a href="#"><i class="icon-twitter"></i></a></li>
                            <li><a href="#"><i class="icon-facebook"></i></a></li>
                            <li><a href="#"><i class="icon-github"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-person text-center to-animate">
                        <figure>
                            <img src="images/person3.jpg" alt="Image" />
                        </figure>
                        <h3>Larry Ben</h3>
                        <span class="fh5co-position">Web Designer</span>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
                        <ul class="social social-circle">
                            <li><a href="#"><i class="icon-twitter"></i></a></li>
                            <li><a href="#"><i class="icon-facebook"></i></a></li>
                            <li><a href="#"><i class="icon-dribbble"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
    <%--------------------------------------------------------------Usuario---------------------------------------------------------------------%>
    <section id="fh5co-about" style="background-image: url(images/full_image_1.jpg);" data-stellar-background-ratio="0.5" data-section="usuario">
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

                <div class="row row-bottom-padded-sm">
                    <div class="col-md-3 col-sm-6 col-xxs-12">
                        <a href="../images/agregar.png" class="fh5co-project-item">
                            <img src="../images/agregar.png" alt="Image" class="imagen img-responsive" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Agregar</h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xxs-12">
                      <a href="../images/actualizar.png" class="fh5co-project-item">
                            <img src="../images/actualizar.png" alt="Image" class="imagen img-responsive" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Actualizar</h2>
                            </div>
                        </a>
                    </div>
             
                    <div class="col-md-3 col-sm-6 col-xxs-12">
                        <a href="../images/buscar.png"  class="fh5co-project-item">
                            <img src="../images/buscar.png"  alt="Image" class="imagen img-responsive" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Buscar</h2>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 col-xxs-12">
                        <a href="../images/buscar.png" class="fh5co-project-item">
                            <img src="../images/buscar.png" alt="Image" class="imagen img-responsive" />
                            <div class="fh5co-text">
                                <h2 style="text-align: center;">Eliminar</h2>
                            </div>
                        </a>
                    </div>

                </div>
                <%-- <div class="container">
            <div class="row">
                <div class="col-md-12 section-heading text-center to-animate">
                    <h2>Usuarios</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="fh5co-counter to-animate">
                        <i class="fh5co-counter-icon icon-briefcase to-animate-2"></i>
                        <span class="fh5co-counter-number js-counter" data-from="0" data-to="89" data-speed="5000" data-refresh-interval="50">89</span>
                        <span class="fh5co-counter-label">Finished projects</span>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="fh5co-counter to-animate">
                        <i class="fh5co-counter-icon icon-code to-animate-2"></i>
                        <span class="fh5co-counter-number js-counter" data-from="0" data-to="2343409" data-speed="5000" data-refresh-interval="50">2343409</span>
                        <span class="fh5co-counter-label">Line of codes</span>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="fh5co-counter to-animate">
                        <i class="fh5co-counter-icon icon-cup to-animate-2"></i>
                        <span class="fh5co-counter-number js-counter" data-from="0" data-to="1302" data-speed="5000" data-refresh-interval="50">1302</span>
                        <span class="fh5co-counter-label">Cup of coffees</span>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="fh5co-counter to-animate">
                        <i class="fh5co-counter-icon icon-people to-animate-2"></i>
                        <span class="fh5co-counter-number js-counter" data-from="0" data-to="52" data-speed="5000" data-refresh-interval="50">52</span>
                        <span class="fh5co-counter-label">Happy clients</span>
                    </div>
                </div>
            </div>
        </div>--%>
            </div>
    </section>

    <footer id="footer" role="contentinfo">
        <a href="#" class="gotop js-gotop">Regresar<i class="icon-arrow-up2">al inicio</i></a>
        <%--     <div class="container">
            <div class="">
                <div class="col-md-12 text-center">
                    <p>
                        &copy; Elate Free HTML5. All Rights Reserved.
                            <br>
                        Created by <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> Images: <a href="http://pexels.com/" target="_blank">Pexels</a>, <a href="http://plmd.me/" target="_blank">plmd.me</a>
                    </p>

                </div>
            </div>
        </div>--%>
    </footer>

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

    <%--    <script type="text/javascript">
        function popUp(URL) {
            window.open(URL, 'ventana', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=800,height=500,left = 390,top =50');
            window.focus();
        }
    </script>
    --%>
</body>
</html>
