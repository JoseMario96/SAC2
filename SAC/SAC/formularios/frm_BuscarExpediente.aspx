﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_BuscarExpediente.aspx.cs" Inherits="SAC.formularios.frm_BuscarExpediente" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/quicksearch.js"></script>

    <style>
        .espacio {
            padding-top: 5%;
        }

        #formularioP {
            border: 1px solid white;
        }

            #formularioP.highlighted {
                border: 3px solid red;
            }

        label, tr, th {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
        <div class="container">
            <header style="text-align: center">
                <h2>Busqueda de expediente </h2>
            </header>
            <div class="row espacio">
                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre" onkeypress="return sololetras(event)" MaxLength="20"></asp:TextBox>
                    <label class="active" for="first_name2" style="font-family: sans-serif; font-size: x-large; color: black;">Nombre:</label>
                </div>
                <div class="row espacio">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                            <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                                runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="codigoExpediente" HeaderText="N° de Expediente" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="cedulaPaciente" HeaderText="N° de Cédula" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                                    <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div id="formularioP" style="display: none" class="espacio">
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cedula" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombre1" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="nombre2" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="apellido1" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="apellido2" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="expediente" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="fecha" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td colspan="3">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="observaciones" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: center">Historia médica</th>
                    </tr>
                    <tr>
                        <th style="color:#FF0000">1-Enfermedades cardiacas</th>
                        <th style="color:#FF0000">2-Presión arterial</th>
                        <th>3-Fiebre reumática</th>
                        <th>4-VIH+ ó SIDA</th>
                        <th>5-Accidente cerebrovascular (derrame)</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cardiaco" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="presion" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="reumatica" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="sida" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="derrame" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="anemia" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="sangre" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="pais" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="donde" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="tiempo" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="moretes" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="rinnon" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="gastro" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="vision" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cortico" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <th style="color:#FF0000">16-Diabetes</th>
                        <th>17-Epilepsia</th>
                        <th>18-Enfermedades respiratorias</th>
                        <th>19-Radioterapia o quimioterapia</th>
                        <th>20-Reumatismo</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="diabetes" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="epilepsia" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="respiratorias" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="radio_quimio" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="reumatismo" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="hepaticos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="herpes" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="perdidaP" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="aumentoP" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="artritis" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="psiquiatra" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="tiroides" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="transmision" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="osteoporosis" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="migranna" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="bifos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="drogas" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="fuma" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cigarroDia" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cigarroPeriodo" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="alcohol" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="frecuenciaAlcohol" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cicatrices" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="shock" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="arterialSignos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="pulsoSignos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="FrecuenciaSignos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="embarazo" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="semanas" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="anticonceptivos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="gineco" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="abortos" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <th>Cesareas</th>
                        <th colspan="4">Observaciones</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="cesareas" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td colspan="4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label id="observacionesMujer" runat="server"></label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>

            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
            <script type="text/javascript" src="../js/quicksearch.js"></script>

        </div>
    </form>
    <script type="text/javascript">
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
        function scrollExpe() {
            document.getElementById('formularioP').scrollIntoView();
        }

        $(document).ready(function () {
            $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                $('#<%=InvisButton.ClientID%>').click();

            });
        });
    </script>
</body>
</html>
