﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarExpediente.aspx.cs" Inherits="SAC.formularios.frm_AgregarExpediente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario de Expedientes</title>
    <link href="../css/materialize.css" rel="stylesheet" />

    <style>
        .ajustar {
            font-size: 15px;
        }
    </style>
</head>

<body>
    <header>
        <h1 style="text-align: center">Registro de Expediente</h1>
    </header>

    <div class="container">
        <%-- <div class="row">--%>
        <form runat="server">
            <div class="row">
                <div class="col s9"></div>
                <div class="col s3">
                    <input id="fechaEx" type="date" runat="server" name="fechaEx"  required />
                    <label class="active" for="fecha_nacimiento" >Fecha</label>
                </div>

            </div>
            <div class="row">
                <div class="col s4">
                    <asp:TextBox ID="cedulaEx" runat="server" AutoPostBack="true" class="validate" required onkeypress="return solonumeros(event)" OnTextChanged="cedulaEx_TextChanged" maxlength="14"></asp:TextBox>
                    <label class="active" for="cedula">Cédula</label>
                </div>
            </div>

            <%--------------------------------------------Historia medica-----------------------------------------------------%>
            <div class="section">
                <center><h5>Historia médica</h5></center>
                <div class="row">
                    <div>
                        <p>Ha padecido o padece alguna de las siguientes enfermedades:</p>
                        <br />

                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi1" runat="server" type="radio" id="hmradi1" onclick="mostrar('cardiaco')" />
                                    <span>1) Enfermedades o procedimientos cardíacos</span>
                                </label>
                            </div>
                            <div id="cardiaco" style="display: none">
                                <input id="hmrespu1" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu1">Explique</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi2" runat="server" type="radio" id="hmradi2" onclick="mostrar('presion')" />
                                    <span>2) Problemas de presión arterial?</span>
                                </label>
                            </div>
                            <div id="presion" style="display: none">
                                <input id="hmrespu2" type="text" runat="server" class="validate" maxlength="44"/>
                                <label class="active" for="hmrespu2">Explique</label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi3" runat="server" type="radio" id="hmradi3" />
                                <span>3) Fiebre reumática</span>
                            </label>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi4" runat="server" type="radio" id="hmradi4" />
                                <span>4) VIH+ o SIDA</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col s6">
                                <label>
                                    <input class="with-gap" name="hmradi5" runat="server" type="radio" id="hmradi5" />
                                    <span>5) Accidente cerebrovascular (derrame)</span>
                                </label>
                            </div>

                            <div class="col s6 ">
                                <label>
                                    <input class="with-gap" name="hmradi6" runat="server" type="radio" id="hmradi6" />
                                    <span>Anemia</span>
                                </label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi7" runat="server" type="radio" id="hmradi7" />
                                <span>6) Transfusión de sangre</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <label><span class="ajustar" style="margin-left: 35px;">7) Ha vivido o reside fuera del país?</span></label>
                            </div>
                            <div class="col s12">
                                <div class="col s1">
                                    <label style="margin-left: 35px;">
                                        <input class="with-gap" name="hm" runat="server" type="radio" id="hmsi" onclick="mostrar('fuerapais')" />
                                        <span>Si</span>
                                    </label>
                                </div>
                            </div>
                            <div class="col s12">
                                <div class="col s1">
                                    <label style="margin-left: 35px;">
                                        <input class="with-gap" name="hm" runat="server" type="radio" id="hmno" onclick="ocultar('fuerapais')" />
                                        <span>No</span>
                                    </label>
                                </div>
                            </div>
                            <div id="fuerapais" style="display: none">
                                <div class="col 3">
                                    <input id="hmrespu3" type="text" runat="server" class="validate" maxlength="44" />
                                    <label class="active" for="hmrespu3">Dónde?</label>
                                </div>
                                <div class="col 3"></div>
                                <div class="col 3">
                                    <input id="hmrespu4" type="text" runat="server" class="validate" maxlength="44" />
                                    <label class="active" for="hmrespu4">Durante cuánto tiempo?</label>
                                </div>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi8" runat="server" type="radio" id="hmradi8" />
                                <span>8) Aparición de equimosís (moretes)</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <p>
                                    <label>
                                        <input class="with-gap" name="hmradi9" runat="server" type="radio" id="hmradi9" onclick="mostrar('rinon')" />
                                        <span>9) Problemas de riñón</span>

                                    </label>
                                </p>
                            </div>
                            <div id="rinon" class="col 2" style="display: none">
                                <input id="hmrespu5" type="text" runat="server" class="validate" maxlength="44" />
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi10" runat="server" type="radio" id="hmradi10" onclick="mostrar('gastro')" />
                                <span>10) Problemas gastrointestinales</span>
                            </label>

                            <div id="gastro" style="display: none">
                                <input id="hmrespu6" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu6">Explique</label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi11" runat="server" type="radio" id="hmradi11" />
                                <span>11) Problemas de visión</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi12" runat="server" type="radio" id="hmradi12" />
                                <span>12) Tratamientos de corticoesteroides</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi13" runat="server" type="radio" id="hmradi13" />
                                <span>13) Diabetes I Ó II </span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi14" runat="server" type="radio" id="hmradi14" />
                                <span>14) Epilepsia, convulsiones o desmayos</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi15" runat="server" type="radio" id="hmradi15" />
                                <span>15) Enfermedades respiratorias (asma, sinusitis, tuberculosis, enfisema,EPOC)</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi16" runat="server" type="radio" id="hmradi16" />
                                <span>16) Tratamientos con radioterapia y/o quimioterapia</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi17" runat="server" type="radio" id="hmradi17" />
                                <span>17) Reumatismo</span>
                            </label>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi18" runat="server" type="radio" id="hmradi18" onclick="mostrar('hepatitis')" />
                                <span>18) Problemas hepáticos</span>
                            </label>

                            <div id="hepatitis" style="display: none">
                                <input id="hmrespu7" type="text" runat="server" class="validate" maxlength="44"/>
                                <label class="active" for="hmrespu7">Explique</label>
                            </div>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi19" runat="server" type="radio" id="hmradi19" />
                                <span>19) Virus del Herpes</span>
                            </label>
                        </div>
                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi20" runat="server" type="radio" id="hmradi20" onclick="mostrar('perdida')" />
                                    <span>20) Pérdida excesiva de peso</span>
                                </label>
                            </div>
                            <div id="perdida" style="display: none" class="col 1">
                                <input id="hmrespu8" type="text" runat="server" class="validate" maxlength="44" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
                                <label class="active" for="hmrespu8">Kg</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi20" runat="server" type="radio" id="hmradioPeso" onclick="mostrar(exceso)" />
                                    <span>Aumento excesivo de peso</span>
                                </label>
                            </div>
                            <div id="exceso" class="col 1" style="display: none">
                                <input id="excesop" type="text" runat="server" class="validate" maxlength="44" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
                                <label class="active" for="hmrespu">Kg</label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi21" runat="server" type="radio" id="hmradi21" />
                                <span>21) Artritis</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi22" runat="server" type="radio" id="hmradi22" />
                                <span>22) Tratamiento psiquiátrico</span>
                            </label>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi23" runat="server" type="radio" id="hmradi23" onclick="mostrar('tiroides')" />
                                    <span>23) Problemas de tiroides?</span>
                                </label>
                            </div>

                            <div id="tiroides" style="display: none">
                                <input id="hmrespu9" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu9">Explique</label>
                            </div>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi24" runat="server" type="radio" id="hmradi24" />
                                <span>24) Enfermedades transmisión sexual</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi25" runat="server" type="radio" id="hmradi25" />
                                <span>25) Osteoporosis</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi26" runat="server" type="radio" id="hmradi26" />
                                <span>26) Migraña</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi27" runat="server" type="radio" id="hmradi27" onclick="mostrar('bifos')" />
                                    <span>27) Ha tomado o se encuentra en tratamiento con bifosfonados vía oral o endovenos?</span>
                                </label>
                            </div>

                            <div class="col 3" id="bifos" style="display: none">
                                <input id="hmrespu10" type="text" runat="server" class="validate" maxlength="44"/>
                                <label class="active" for="hmrespu10">Por cuánto tiempo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi28" runat="server" type="radio" id="hmradi28" onclick="mostrar('drogas')" />
                                    <span>28) Consume algún tipo de droga(s)? Cuál(es)?</span>
                                </label>
                            </div>
                            <div id="drogas" style="display: none">
                                <input id="hmrespu11" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu11">Explique</label>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi29" runat="server" type="radio" id="hmradi29" onclick="mostrar('fuma')" />
                                    <span>29) Fuma o fumó? Cuántos cigarros diarios? </span>
                                </label>
                            </div>
                            <div id="fuma" style="display: none">
                                <div class="col 3">
                                    <input id="hmrespu12" type="text" runat="server" class="validate" maxlength="4" />
                                    <label class="active" for="hmrespu12">Cuántos cigarrillos diarios?</label>
                                </div>
                                <div class="col 3">
                                   <input id="hmrespu13" type="text" runat="server" class="validate" maxlength="44" />
                                    <label class="active" for="hmrespu13">Por cuánto tiempo?</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi30" runat="server" type="radio" id="hmradi30" onclick="mostrar('bebidas')" />
                                    <span>30) Bebidas alcohólocas? </span>
                                </label>
                            </div>
                            <div id="bebidas" class="col 3" style="display: none">
                                <input id="hmrespu14" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu14">Con qué frecuencia?</label>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi31" runat="server" type="radio" id="hmradi31" onclick="mostrar('tatuajes')" />
                                    <span>31) Cicatrices, tatuajes o señales particulares </span>
                                </label>
                            </div>
                            <div id="tatuajes" class="col 3" style="display: none">
                                <input id="hmrespu15" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu15"></label>
                            </div>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi32" runat="server" type="radio" id="hmradi32" />
                                <span>32) Shock anafiláctico</span>
                            </label>
                        </div>

                    </div>
                </div>
            </div>


            <%--------------------------------------------Solo mujeres-----------------------------------------------------%>
            <div class="section">
                <center><h5>Historial médico de Mujer</h5></center>

                <div class="row">
                    <div class="col s4">
                        <label>
                            <input class="with-gap" name="smradi1" runat="server" type="radio" id="smradi1" onclick="mostrar('embarazo')" />
                            <span>33) Está usted o cree estar embarazada?</span>
                        </label>
                    </div>
                    <div id="embarazo" class="row" style="display: none">
                        <div class="col 3">
                            <input id="smrespu1" type="text" runat="server" class="validate"  maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
                            <label class="active" for="smrespu1">Cuántas semanas aproximadamente?</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <label>
                            <input class="with-gap" name="smradi2" runat="server" type="radio" id="smradi2" />
                            <span>34) Está usted bajo tratamiento anticonceptivo u hormonal?</span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <label>
                            <input class="with-gap" name="smradi3" runat="server" type="radio" id="smradi3" onclick="mostrar('gine')" />
                            <span>35) Ginecoobstétricos:</span>
                        </label>
                    </div>
                    <div id="gine" style="display: none">
                        <div class="col 1">
                            <input id="smrespu2" type="text" runat="server" class="validate" maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            <label class="active" for="smrespu2"># partos</label>
                        </div>
                        <div class="col 1">

                            <input id="smrespu3" type="text" runat="server" class="validate"  maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            <label class="active" for="smrespu4"># abortos</label>
                        </div>
                        <div class="col 1">
                            <input id="smrespu4" type="text" runat="server" class="validate"  maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
                            <label class="active" for="smrespu5"># cesáreas</label>
                        </div>
                    </div>
                    <input id="smrespu5" type="text" runat="server" class="validate" maxlength="44"  />
                    <label class="active" for="smrespu6">Observaciones</label>
                </div>

            </div>
            <%--------------------------------------------Signos vitales-----------------------------------------------------%>
            <div class="section">
                <br />
                <br />
                <br />
                <br />
                <center><h5>Signos vitales</h5></center>
                <div class="row">
                    <div class="col s4">
                        <span>Presión arterial</span>
                        <input id="svrespu1" type="text" runat="server" class="validate" onkeypress="return solonumeros(event)" maxlength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        <label class="active" for="svrespu1">mm/Hg</label>
                    </div>
                    <div class="col s4">
                        <span>Pulso</span>
                        <input id="svrespu2" type="text" runat="server" class="validate" onkeypress="return solonumeros(event)" maxlength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        <label class="active" for="svrespu2">ppm</label>
                    </div>
                    <div class="col s4">
                        <span>Frecuencia respiratoria</span>
                        <input id="svrespu3" type="text" runat="server" class="validate" onkeypress="return solonumeros(event)" maxlength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        <label class="active" for="svrespu3">pm</label>
                    </div>
                </div>
            </div>
             <div class="row">              
                    <input id="Text2" type="text" runat="server" class="validate" maxlength="44" />
                    <label class="active" for="cedula">Observaciones generales</label>
            </div>

            <br />
            <br />
            <div class="row">
                <div class="col s6">
                    <asp:Button class=" btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" BackColor="#009999" />
                </div>
            </div>
        </form>
        <script type="text/javascript">
            function mostrar(variable) {
                document.getElementById(variable).style.display = 'block';
            }
            function ocultar() {
                document.getElementById(variable).style.display = 'none';
            }
        </script>

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

    </div>



    <%--    </div>--%>
</body>
</html>
