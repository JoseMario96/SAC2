<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_AgregarExpediente.aspx.cs" Inherits="SAC.formularios.frm_AgregarExpediente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario de Expedientes</title>
    <link href="../css/materialize.css" rel="stylesheet" />

    <style>
        .espacio {
            padding-top: 5%;
        }

        .ajustar {
            font-size: 15px;
        }

        label, span, p {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
</head>

<body oncopy="return false" onpaste="return false">
    <header>
        <h2 style="text-align: center">Registro de expedientes</h2>
    </header>

    <div class="container">
        <%-- <div class="row">--%>
        <form runat="server">
            <asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <div class="row espacio">
                <div class="col s9"></div>
                <div class="col s3">
                    <label class="active" for="fecha" title="Fecha actual">Fecha: </label>
                    <asp:Label ID="lblfecha" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col s4">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="cedulaEx" runat="server" AutoPostBack="true" title="Cédula" class="validate" required onkeypress="return solonumeros(event)" OnTextChanged="cedulaEx_TextChanged" MaxLength="14"></asp:TextBox>
                            <label class="active" for="cedula">Cédula</label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <%--------------------------------------------Historia medica-----------------------------------------------------%>
            <div>
                <div class="row">
                    <div class="col s12">
                        <h5><b>Historia médica</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div>
                        <p style="margin-left: 14px;">Ha padecido o padece alguna de las siguientes enfermedades:</p>

                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi1" runat="server" type="radio" id="hmradi1" onclick="uncheckRadio(this), mostrar('cardiaco')" />
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
                                    <input class="with-gap" name="hmradi2" runat="server" type="radio" id="hmradi2" onclick="uncheckRadio(this), mostrar('presion')" />
                                    <span>2) Problemas de presión arterial?</span>
                                </label>
                            </div>
                            <div id="presion" style="display: none">
                                <input id="hmrespu2" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu2">Explique</label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi3" runat="server" type="radio" id="hmradi3" onclick="uncheckRadio(this)" />
                                <span>3) Fiebre reumática</span>
                            </label>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi4" runat="server" type="radio" id="hmradi4" onclick="uncheckRadio(this)" />
                                <span>4) VIH+ o SIDA</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col s6">
                                <label>
                                    <input class="with-gap" name="hmradi5" runat="server" type="radio" id="hmradi5" onclick="uncheckRadio(this)" />
                                    <span>5) Accidente cerebrovascular (derrame)</span>
                                </label>
                            </div>

                            <div class="col s6 ">
                                <label>
                                    <input class="with-gap" name="hmradi6" runat="server" type="radio" id="hmradi6" onclick="uncheckRadio(this)" />
                                    <span>Anemia</span>
                                </label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi7" runat="server" type="radio" id="hmradi7" onclick="uncheckRadio(this)" />
                                <span>6) Transfusión de sangre</span>
                            </label>
                        </div>



                        <div class="row">
                            <div class="col s12">
                                 <label><span class="ajustar" style="margin-left: 35px; color:#FF0000">*</span></label>
                                <label><span class="ajustar" title="Pregunta obligatoria">7) Ha vivido o reside fuera del país?</span></label>
                            </div>
                            <div class="col s12">
                                <div class="col s1">
                                    <label style="margin-left: 35px;">
                                        <input class="with-gap" name="hm" runat="server" type="radio" id="hmsi" onclick="uncheckRadio(this), mostrar('fuerapais')" />
                                        <span>Si</span>
                                    </label>
                                </div>
                            </div>
                            <div class="col s12">
                                <div class="col s1">
                                    <label style="margin-left: 35px;">
                                        <input class="with-gap" name="hm" runat="server" type="radio" id="hmnooo" onclick="ocultar('fuerapais')" />
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
                                <input class="with-gap" name="hmradi8" runat="server" type="radio" id="hmradi8" onclick="uncheckRadio(this)" />
                                <span>8) Aparición de equimosís (moretes)</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <p>
                                    <label>
                                        <input class="with-gap" name="hmradi9" runat="server" type="radio" id="hmradi9" onclick="uncheckRadio(this), mostrar('rinon')" />
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
                                <input class="with-gap" name="hmradi10" runat="server" type="radio" id="hmradi10" onclick="uncheckRadio(this), mostrar('gastro')" />
                                <span>10) Problemas gastrointestinales</span>
                            </label>

                            <div id="gastro" style="display: none">
                                <input id="hmrespu6" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu6">Explique</label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi11" runat="server" type="radio" id="hmradi11" onclick="uncheckRadio(this)" />
                                <span>11) Problemas de visión</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi12" runat="server" type="radio" id="hmradi12" onclick="uncheckRadio(this)" />
                                <span>12) Tratamientos de corticoesteroides</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi13" runat="server" type="radio" id="hmradi13" onclick="uncheckRadio(this)" />
                                <span>13) Diabetes I Ó II </span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi14" runat="server" type="radio" id="hmradi14" onclick="uncheckRadio(this)" />
                                <span>14) Epilepsia, convulsiones o desmayos</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi15" runat="server" type="radio" id="hmradi15" onclick="uncheckRadio(this)" />
                                <span>15) Enfermedades respiratorias (asma, sinusitis, tuberculosis, enfisema,EPOC)</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi16" runat="server" type="radio" id="hmradi16" onclick="uncheckRadio(this)" />
                                <span>16) Tratamientos con radioterapia y/o quimioterapia</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi17" runat="server" type="radio" id="hmradi17" onclick="uncheckRadio(this)" />
                                <span>17) Reumatismo</span>
                            </label>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi18" runat="server" type="radio" id="hmradi18" onclick="uncheckRadio(this), mostrar('hepatitis')" />
                                <span>18) Problemas hepáticos</span>
                            </label>

                            <div id="hepatitis" style="display: none">
                                <input id="hmrespu7" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu7">Explique</label>
                            </div>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi19" runat="server" type="radio" id="hmradi19" onclick="uncheckRadio(this)" />
                                <span>19) Virus del Herpes</span>
                            </label>
                        </div>
                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi20" runat="server" type="radio" id="hmradi20" onclick="uncheckRadio(this), mostrar('perdida')" />
                                    <span>20) Pérdida excesiva de peso</span>
                                </label>
                            </div>
                            <div id="perdida" style="display: none" class="col 1">
                                <input id="hmrespu8" type="text" runat="server" class="validate" maxlength="44" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                <label class="active" for="hmrespu8">Kg</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi20" runat="server" type="radio" id="hmradioPeso" onclick="uncheckRadio(this), mostrar('exceso')" />
                                    <span>Aumento excesivo de peso</span>
                                </label>
                            </div>
                            <div id="exceso" class="col 1" style="display: none">
                                <input id="excesop" type="text" runat="server" class="validate" maxlength="44" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                <label class="active" for="hmrespu">Kg</label>
                            </div>
                        </div>

                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi21" runat="server" type="radio" id="hmradi21" onclick="uncheckRadio(this)" />
                                <span>21) Artritis</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi22" runat="server" type="radio" id="hmradi22" onclick="uncheckRadio(this)" />
                                <span>22) Tratamiento psiquiátrico</span>
                            </label>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi23" runat="server" type="radio" id="hmradi23" onclick="uncheckRadio(this), mostrar('tiroides')" />
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
                                <input class="with-gap" name="hmradi24" runat="server" type="radio" id="hmradi24" onclick="uncheckRadio(this)" />
                                <span>24) Enfermedades transmisión sexual</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi25" runat="server" type="radio" id="hmradi25" onclick="uncheckRadio(this)" />
                                <span>25) Osteoporosis</span>
                            </label>
                        </div>
                        <div class="col s12">
                            <label>
                                <input class="with-gap" name="hmradi26" runat="server" type="radio" id="hmradi26" onclick="uncheckRadio(this)" />
                                <span>26) Migraña</span>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col 3">
                                <label>
                                    <input class="with-gap" name="hmradi27" runat="server" type="radio" id="hmradi27" onclick="uncheckRadio(this), mostrar('bifos')" />
                                    <span>27) Ha tomado o se encuentra en tratamiento con bifosfonados vía oral o endovenos?</span>
                                </label>
                            </div>

                            <div class="col 3" id="bifos" style="display: none">
                                <input id="hmrespu10" type="text" runat="server" class="validate" maxlength="44" />
                                <label class="active" for="hmrespu10">Por cuánto tiempo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <label>
                                    <input class="with-gap" name="hmradi28" runat="server" type="radio" id="hmradi28" onclick="uncheckRadio(this), mostrar('drogas')" />
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
                                    <input class="with-gap" name="hmradi29" runat="server" type="radio" id="hmradi29" onclick="uncheckRadio(this), mostrar('fuma')" />
                                    <span>29) Fuma o fumó? Cuántos cigarros diarios? </span>
                                </label>
                            </div>
                            <div id="fuma" style="display: none">
                                <div class="col 3">
                                    <input id="hmrespu12" type="text" runat="server" class="validate" maxlength="4" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
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
                                    <input class="with-gap" name="hmradi30" runat="server" type="radio" id="hmradi30" onclick="uncheckRadio(this), mostrar('bebidas')" />
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
                                    <input class="with-gap" name="hmradi31" runat="server" type="radio" id="hmradi31" onclick="uncheckRadio(this), mostrar('tatuajes')" />
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
                                <input class="with-gap" name="hmradi32" runat="server" type="radio" id="hmradi32" onclick="uncheckRadio(this)" />
                                <span>32) Shock anafiláctico</span>
                            </label>
                        </div>
                        <div class="row">
                            <input id="Text2" type="text" runat="server" class="validate" maxlength="44" />
                            <label class="active" for="cedula">Observaciones generales</label>
                        </div>
                    </div>
                </div>
            </div>
            <%--------------------------------------------Solo mujeres-----------------------------------------------------%>
            <div>
                <div class="row">
                    <div class="col s12">
                        <h5><b>Historial médico de Mujer</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        <label>
                            <input class="with-gap" name="smradi1" runat="server" type="radio" id="smradi1" onclick="uncheckRadio(this), mostrar('embarazo')" />
                            <span>33) Está usted o cree estar embarazada?</span>
                        </label>
                    </div>
                    <div id="embarazo" class="row" style="display: none">
                        <div class="col 3">
                            <input id="smrespu1" type="text" runat="server" class="validate" maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            <label class="active" for="smrespu1">Cuántas semanas aproximadamente?</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <label>
                            <input class="with-gap" name="smradi2" runat="server" type="radio" id="smradi2" onclick="uncheckRadio(this)" />
                            <span>34) Está usted bajo tratamiento anticonceptivo u hormonal?</span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <label>
                            <input class="with-gap" name="smradi3" runat="server" type="radio" id="smradi3" onclick="uncheckRadio(this), mostrar('gine')" />
                            <span>35) Ginecoobstétricos:</span>
                        </label>
                    </div>
                    <div id="gine" style="display: none">
                        <div class="col s2">
                            <input id="smrespu2" type="text" runat="server" title="Partos" class="validate" maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            <label class="active" for="smrespu2"># partos</label>
                        </div>
                        <div class="col s2">

                            <input id="smrespu3" type="text" runat="server" title="Abortos" class="validate" maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            <label class="active" for="smrespu4"># abortos</label>
                        </div>
                        <div class="col s2">
                            <input id="smrespu4" type="text" runat="server" class="validate" title="Cesáreas" maxlength="10" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                            <label class="active" for="smrespu5"># cesáreas</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <input id="smrespu5" type="text" runat="server" class="validate" maxlength="44" />
                        <label class="active" for="smrespu6">Observaciones</label>
                    </div>
                </div>
            </div>
            <%--------------------------------------------Signos vitales-----------------------------------------------------%>
            <div>
                <div class="row">
                    <div class="col s12">
                        <h5><b>Signos vitales</b></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        <span>Presión arterial</span>
                        <input id="svrespu1" type="text" runat="server" class="validate" title="Presión" onkeypress="return presion(event)" maxlength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        <label class="active" for="svrespu1">mm/Hg</label>
                    </div>
                    <div class="col s4">
                        <span>Pulso</span>
                        <input id="svrespu2" type="text" runat="server" class="validate" title="Pulso" onkeypress="return solonumeros(event)" maxlength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        <label class="active" for="svrespu2">ppm</label>
                    </div>
                    <div class="col s4">
                        <span>Frecuencia respiratoria</span>
                        <input id="svrespu3" type="text" runat="server" class="validate" title="Frecuencia respiratoria" onkeypress="return solonumeros(event)" maxlength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                        <label class="active" for="svrespu3">pm</label>
                    </div>
                </div>
            </div>
            <div class="row espacio">
                <div class=" col s5"></div>
                <div class="input-field col s2">
                    <asp:Button class=" btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" BackColor="#009999" />
                </div>                
                <div class=" col s5"></div>
            </div>
        </form>
        <script type="text/javascript">

            var era;
            var previo = null;
            var estado;

            function uncheckRadio(rbutton) {
                if (previo && previo != rbutton) {
                    previo.era = false;
                }

                if (rbutton.checked == true && rbutton.era == true) {
                    rbutton.checked = false;
                    estado = false;

                } else {
                    rbutton.checked = true;
                    estado = true;
                }
                rbutton.era = rbutton.checked;
                previo = rbutton;
            }

            function mostrar(variable) {
                if (estado == true) {
                    document.getElementById(variable).style.display = 'block';
                } else {
                    document.getElementById(variable).style.display = 'none';
                }


            }
            function ocultar(variable) {
                document.getElementById(variable).style.display = 'none';
            }
        </script>

        <script>

            function presion(e) {
                key = e.keyCoden || e.which;
                teclado = String.fromCharCode(key);
                numero = "1234567890/";
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
