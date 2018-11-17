<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Odontograma.aspx.cs" EnableEventValidation="false" Inherits="SAC.formularios.frm_Odontograma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <link href="../css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.8.13.custom.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <br />
                <br />
                <asp:GridView ID="GridView_reporteOdontograma" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                    runat="server" AutoGenerateColumns="False" OnDataBound="OnDataBound" Height="174px" AllowPaging="true" PageSize="3" OnSelectedIndexChanged="GridView_reporteOdontograma_SelectedIndexChanged" OnPageIndexChanging="GridView_reporteOdontograma_PageIndexChanging" OnRowDataBound="GridView_reporteOdontograma_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="cedulaPaciente" HeaderText="Cédula" ItemStyle-Width="30" />
                        <asp:BoundField DataField="nombre1Paciente" HeaderText="Primer Nombre" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido1Paciente" HeaderText="Primer Apellido" ItemStyle-Width="100" />
                        <asp:BoundField DataField="apellido2Paciente" HeaderText="Segundo Apellido" ItemStyle-Width="100" />
                    </Columns>
                </asp:GridView>

                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>


            </div>
            <div id="dienteOdontograma" style="display: block" tabindex="1">
                <div class="row">
                    <div class="col s6">
                        <asp:ImageButton ID="ibOdontogramaG" runat="server" src="../images/diente.png" Height="60px" Width="125px" OnClick="ibOdontogramaG_Click" />
                    </div>

                    <div class="col s6">
                        <asp:ImageButton ID="ibOdontogramaN" runat="server" src="../images/diente.png" Height="60px" Width="125px" OnClick="ibOdontogramaN_Click" />
                    </div>
                </div>
            </div>

        </div>

    </form>
</body>
</html>
