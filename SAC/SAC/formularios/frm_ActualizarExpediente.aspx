<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ActualizarExpediente.aspx.cs" Inherits="SAC.formularios.frm_ActualizarExpediente" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 54px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <br />
            <br />
            <form id="form1" runat="server">
                <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                    runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="codigoExpediente" HeaderText="N° de Expediente" ItemStyle-Width="100" />
                        <asp:BoundField DataField="cedulaPaciente" HeaderText="N° de Cédula" ItemStyle-Width="100" />
                        <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <br />
                <br />
                <br />
                <table class="striped">
                    <tr>
                        <th colspan="5" style="text-align: center">Datos personales</th>
                    </tr>
                    <tr>
                        <th>N° de cédula</th>
                        <th>Primer nombre</th>
                        <th>Segundo nombre</th>
                        <th>Primer apellido</th>
                        <th>Segundo apellido</th>
                    </tr>
                    <tr>
                        <td>
                            <label id="cedula" runat="server"></label>
                        </td>
                        <td>
                            <label id="nombre1" runat="server"></label>
                        </td>
                        <td>
                            <label id="nombre2" runat="server"></label>
                        </td>
                        <td>
                            <label id="apellido1" runat="server"></label>
                        </td>
                        <td>
                            <label id="apellido2" runat="server"></label>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: center">Datos expediente</th>
                    </tr>
                    <tr>
                        <th>N° de expediente</th>
                        <th>Fecha</th>
                        <th colspan="3">Observaciones</th>
                    </tr>
                    <tr>
                        <td>
                            <label id="expediente" runat="server"></label>
                        </td>
                        <td>
                            <label id="fecha" runat="server"></label>
                        </td>
                        <td colspan="3">
                            <label id="observaciones" runat="server"></label>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: center">Historia médica</th>
                    </tr>
                    <tr>
                        <th>1-Enfermedades cardiacas</th>
                        <th>2-Presión arterial</th>
                        <th>3-Fiebre reumática</th>
                        <th>4-VIH+ ó SIDA</th>
                        <th>5-Accidente cerebrovascular (derrame)</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="cardiaco" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="presion" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group1" runat="server" type="radio" id="reumaticaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group1" runat="server" type="radio" id="reumaticaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>

                        <td>
                            <label>
                                <input class="with-gap" name="group2" runat="server" type="radio" id="sidaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group2" runat="server" type="radio" id="sidaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>

                        <td>
                            <label>
                                <input class="with-gap" name="group3" runat="server" type="radio" id="derrameS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group3" runat="server" type="radio" id="derrameN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                    </tr>
                    <tr>
                        <th>6-Anemia</th>
                        <th>7-Transfusión de sangre</th>
                        <th>8-Salió del país</th>
                        <th>9-Dónde</th>
                        <th>10-Tiempo</th>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <input class="with-gap" name="group4" runat="server" type="radio" id="anemiaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group4" runat="server" type="radio" id="anemiaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group5" runat="server" type="radio" id="sangreS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group5" runat="server" type="radio" id="sangreN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="paisS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group6" runat="server" type="radio" id="paisN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="donde" runat="server"></asp:TextBox>

                        </td>
                        <td>
                            <asp:TextBox ID="tiempo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>11-Moretes</th>
                        <th>12-Problemas de riñón</th>
                        <th>13-Problemas gastrointestinales</th>
                        <th>14-Problemas de visión</th>
                        <th>15-Tratamientos con corticoesteroides</th>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <input class="with-gap" name="group7" runat="server" type="radio" id="moretesS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group7" runat="server" type="radio" id="moretesN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="rinnon" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="gastro" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group8" runat="server" type="radio" id="visionS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group8" runat="server" type="radio" id="visionN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                         <td>
                            <label>
                                <input class="with-gap" name="group22" runat="server" type="radio" id="corticoS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group22" runat="server" type="radio" id="corticoN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                    </tr>
                    <tr>
                        <th>16-Diabetes</th>
                        <th>17-Epilepsia</th>
                        <th>18-Enfermedades respiratorias</th>
                        <th>19-Radioterapia o quimioterapia</th>
                        <th>20-Reumatismo</th>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <input class="with-gap" name="group9" runat="server" type="radio" id="diabetesS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group9" runat="server" type="radio" id="diabetesN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group10" runat="server" type="radio" id="epilepsiaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group10" runat="server" type="radio" id="epilepsiaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group11" runat="server" type="radio" id="respiratoriaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group11" runat="server" type="radio" id="respiratoriaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group12" runat="server" type="radio" id="quimioS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group12" runat="server" type="radio" id="quimioN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group13" runat="server" type="radio" id="reumatismoS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group13" runat="server" type="radio" id="reumatismoN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                    </tr>
                    <tr>
                        <th>21-Problemas hepáticos</th>
                        <th>22-Virus del herpes</th>
                        <th>23-Pérdida de peso</th>
                        <th>24-Aumento de peso</th>
                        <th>25-Artritis</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="hepaticos" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group14" runat="server" type="radio" id="herpesS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group14" runat="server" type="radio" id="herpesN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="perdida_peso" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="aumento_peso" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group15" runat="server" type="radio" id="artritisS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group15" runat="server" type="radio" id="artritisN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                    </tr>
                    <tr>
                        <th>26-Tratamiento psiquiátrico</th>
                        <th>27-Problemas de tiroides</th>
                        <th>28-Enfermedades de transmisión sexual</th>
                        <th>29-Osteoporosis</th>
                        <th>30-Migraña</th>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <input class="with-gap" name="group16" runat="server" type="radio" id="psiquiatricoS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group16" runat="server" type="radio" id="psiquiatricoN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="tiroides" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group17" runat="server" type="radio" id="transmisionS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group17" runat="server" type="radio" id="transmisionN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group18" runat="server" type="radio" id="osteoporosisS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group18" runat="server" type="radio" id="osteoporosisN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group19" runat="server" type="radio" id="migrannaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group19" runat="server" type="radio" id="migrannaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                    </tr>
                    <tr>
                        <th>31-Tratamiento con bifosfonados</th>
                        <th>32-Consume drogas</th>
                        <th>33-Fuma</th>
                        <th>34-Cigarros por día</th>
                        <th>35-Periodo</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="bifos" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="drogas" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="fuma" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="cigarroDia" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="cigarroPeriodo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>36-Bebidas alcohólicas</th>
                        <th>37-Frecuencia</th>
                        <th>38-Cicatrices o tatuajes</th>
                        <th>39-Shock anafiláctico</th>
                    </tr>
                    <tr>
                      <td>
                            <label>
                                <input class="with-gap" name="group20" runat="server" type="radio" id="alcoholS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group20" runat="server" type="radio" id="alcoholN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="frecuenciaAlcohol" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="cicatriz" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group21" runat="server" type="radio" id="shockS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group21" runat="server" type="radio" id="shockN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: center">Signos Vitales</th>
                    </tr>
                    <tr>
                        <th>Presión arterial</th>
                        <th>Pulso</th>
                        <th>Frecuencia respiratoria</th>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:TextBox ID="arterialSignos" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pulsoSignos" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="frecuenciaSignos" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: center">Historial médico solo mujeres</th>
                    </tr>
                    <tr>
                        <th>Embarazada</th>
                        <th>Semanas</th>
                        <th>Tratamientos anticonceptivos</th>
                        <th>Ginecoobstetricos</th>
                        <th>Abortos</th>
                    </tr>
                    <tr>
                         <td>
                            <label>
                                <input class="with-gap" name="group23" runat="server" type="radio" id="embarazadaS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group23" runat="server" type="radio" id="embarazadaN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="semanas" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <label>
                                <input class="with-gap" name="group24" runat="server" type="radio" id="anticoceptivosS" onclick="" />
                                <span>Sí</span>
                            </label>
                            <label>
                                <input class="with-gap" name="group24" runat="server" type="radio" id="anticoceptivosN" onclick="" />
                                <span>No</span>
                            </label>

                        </td>
                        <td>
                            <asp:TextBox ID="gineco" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="abortos" runat="server"></asp:TextBox>   
                        </td>
                    </tr>
                    <tr>
                        <th>Cesareas</th>
                        <th colspan="4">Observaciones</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="cesareas" runat="server"></asp:TextBox>
                        </td>
                        <td colspan="4">
                            <asp:TextBox ID="observacionesMujer" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                </table>
                  <div class="row">

                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                    </div>
                    <div class="input-field col s4">
                        <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />
                    </div>
                </div>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script type="text/javascript" src="../js/quicksearch.js"></script>

                <script type="text/javascript">
                    $(function () {
                        $('.search_textbox').each(function (i) {
                            $(this).quicksearch("[id*=GridView1] tr:not(:has(th))", {
                                'testQuery': function (query, txt, row) {
                                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                                }
                            });
                        });
                    });
                </script>
            </form>
        </div>
    </div>
</body>
</html>

