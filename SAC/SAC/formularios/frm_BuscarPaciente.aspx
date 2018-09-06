﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_BuscarPaciente.aspx.cs" Inherits="SAC.formularios.frmBuscar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/materialize.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
</head>
<body>
    <header>
        <h1 style="text-align: center">Buscar pacientes</h1>
    </header>
    <div class="container">
        <div class="row">
            <form class="col s12" runat="server">
                <div class="row">
                    <div class="input-field col s4">
                        <asp:TextBox ID="txt_cedula" runat="server" class="validate" OnTextChanged="txt_cedula_TextChanged"></asp:TextBox>
                        <label class="active" for="txt_cedula">Cédula </label>
                    </div>
                </div>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </form>
        </div>
        
    </div>
    <script src="js/materialize.min.js"></script>
</body>
</html>
