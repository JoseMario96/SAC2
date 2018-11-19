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

        #formularioP {
            border: 1px solid white;
        }

            #formularioP.highlighted {
                border: 3px solid red;
            }

        label, th, tr {
            font-family: sans-serif;
            font-size: medium;
            color: black;
        }

        .espacio {
            padding-top: 5%;
        }
    </style>
</head>
<body oncopy="return false" onpaste="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <div class="container">
            <div class="row espacio">

                <div class="input-field col s3 ">
                    <asp:TextBox ID="txtSearch" runat="server" title="Nombre"></asp:TextBox>
                    <label class="active" for="first_name2">Nombre:</label>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Button ID="InvisButton" runat="server" Style="display: none;" OnClick="InvisButton_Click" />
                        <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" class="col s12"
                            runat="server" AutoGenerateColumns="False" Height="174px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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

            <div id="formularioP" style="display: none" tabindex="-1">

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
                        <th>1-Enfermedades cardiacas</th>
                        <th>2-Presión arterial</th>
                        <th>3-Fiebre reumática</th>
                        <th>4-VIH+ ó SIDA</th>
                        <th>5-Accidente cerebrovascular (derrame)</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="cardiaco" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="presion" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group1" runat="server" type="radio" id="reumaticaS" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group1" runat="server" type="radio" id="reumaticaN" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>

                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group2" runat="server" type="radio" id="sidaS" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group2" runat="server" type="radio" id="sidaN" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>

                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group3" runat="server" type="radio" id="derrameS" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group3" runat="server" type="radio" id="derrameN" />
                                        <span>No</span>
                                    </label>
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
                                    <label>
                                        <input class="with-gap" name="group4" runat="server" type="radio" id="anemiaS" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group4" runat="server" type="radio" id="anemiaN" />
                                        <span>No</span>
                                    </label>

                                    </td>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <label>
                                            <input class="with-gap" name="group5" runat="server" type="radio" id="sangreS" onclick="" />
                                            <span>Sí</span>
                                        </label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <label>
                                            <input class="with-gap" name="group5" runat="server" type="radio" id="sangreN" onclick="" />
                                            <span>No</span>
                                        </label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group6" runat="server" type="radio" id="paisS" onclick="pais(1)" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group6" runat="server" type="radio" id="paisN" onclick="pais(0)" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="donde" runat="server" Style="display: none"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>

                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="tiempo" runat="server" Style="display: none"></asp:TextBox>
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
                                    <label>
                                        <input class="with-gap" name="group7" runat="server" type="radio" id="moretesS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group7" runat="server" type="radio" id="moretesN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="rinnon" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="gastro" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group8" runat="server" type="radio" id="visionS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group8" runat="server" type="radio" id="visionN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group22" runat="server" type="radio" id="corticoS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group22" runat="server" type="radio" id="corticoN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

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
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group9" runat="server" type="radio" id="diabetesS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group9" runat="server" type="radio" id="diabetesN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group10" runat="server" type="radio" id="epilepsiaS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group10" runat="server" type="radio" id="epilepsiaN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group11" runat="server" type="radio" id="respiratoriaS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group11" runat="server" type="radio" id="respiratoriaN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group12" runat="server" type="radio" id="quimioS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group12" runat="server" type="radio" id="quimioN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group13" runat="server" type="radio" id="reumatismoS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group13" runat="server" type="radio" id="reumatismoN" onclick="" />
                                        <span>No</span>
                                    </label>
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
                                    <asp:TextBox ID="hepatico" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group14" runat="server" type="radio" id="herpesS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group14" runat="server" type="radio" id="herpesN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="perdida_peso" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="aumento_peso" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group15" runat="server" type="radio" id="artritisS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group15" runat="server" type="radio" id="artritisN" onclick="" />
                                        <span>No</span>
                                    </label>
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
                                    <label>
                                        <input class="with-gap" name="group16" runat="server" type="radio" id="psiquiatricoS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group16" runat="server" type="radio" id="psiquiatricoN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="tiroides" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>

                                        <input class="with-gap" name="group17" runat="server" type="radio" id="transmisionS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group17" runat="server" type="radio" id="transmisionN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group18" runat="server" type="radio" id="osteoporosisS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group18" runat="server" type="radio" id="osteoporosisN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group19" runat="server" type="radio" id="migrannaS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group19" runat="server" type="radio" id="migrannaN" onclick="" />
                                        <span>No</span>
                                    </label>
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
                                    <asp:TextBox ID="bifos" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="drogas" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group32" runat="server" type="radio" id="fumaS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group32" runat="server" type="radio" id="fumaN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="cigarroDia" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="cigarroPeriodo" runat="server" MaxLength="44"></asp:TextBox>
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
                                    <label>
                                        <input class="with-gap" name="group20" runat="server" type="radio" id="alcoholS" onclick="bebidas(1)" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group20" runat="server" type="radio" id="alcoholN" onclick="bebidas(0)" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="frecuenciaAlcohol" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="cicatriz" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group21" runat="server" type="radio" id="shockS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group21" runat="server" type="radio" id="shockN" onclick="" />
                                        <span>No</span>
                                    </label>
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
                        <td class="auto-style1">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="arterialSignos" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td class="auto-style1">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="pulsoSignos" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td class="auto-style1">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="frecuenciaSignos" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
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
                                    <label>
                                        <input class="with-gap" name="group23" runat="server" type="radio" id="embarazadaS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group23" runat="server" type="radio" id="embarazadaN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="semanas" runat="server" MaxLength="10" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group24" runat="server" type="radio" id="anticoceptivosS" onclick="" />
                                        <span>Sí</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label>
                                        <input class="with-gap" name="group24" runat="server" type="radio" id="anticoceptivosN" onclick="" />
                                        <span>No</span>
                                    </label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="gineco" runat="server" onkeypress="return solonumeros(event)" MaxLength="14" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="abortos" runat="server" MaxLength="10" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
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
                                    <asp:TextBox ID="cesareas" runat="server" MaxLength="10" onkeypress="return solonumeros(event)" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td colspan="4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="observacionesMujer" runat="server" MaxLength="44"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row" id="botones" style="display: none">
                <div class="input-field col s4">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button class="waves-effect waves-light btn" ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="input-field col s4">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button class="waves-effect waves-light btn" ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
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

            <script>
                function pais(estado) {

                    if (estado == 1) {
                        document.getElementById('donde').style.display = 'block';
                        document.getElementById('tiempo').style.display = 'block';
                    } else {
                        document.getElementById('donde').style.display = 'none';
                        document.getElementById('tiempo').style.display = 'none';
                    }
                }

                function bebidas(estado) {
                    if (estado == 1) {
                        document.getElementById('frecuenciaAlcohol').style.display = 'block';
                    } else {
                        document.getElementById('frecuenciaAlcohol').style.display = 'none';
                    }
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
    </form>
    <script type="text/javascript">
                $(document).ready(function () {
                    document.getElementById("apellido1").required = false;
                    document.getElementById("apellido2").required = false;
                    $('#<%=txtSearch.ClientID%>').bind('keyup', function () {
                        $('#<%=InvisButton.ClientID%>').click();
                    });
                });
    </script>
</body>
</html>

