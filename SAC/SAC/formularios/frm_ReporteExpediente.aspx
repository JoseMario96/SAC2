<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_ReporteExpediente.aspx.cs" Inherits="SAC.formularios.frm_ReporteExpediente" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 416px;
        }

        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Prueba"></asp:Label>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Estudiante: </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="254px" TabIndex="1" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <%--<asp:Button ID="Button1" runat="server" Text="submit" Width="137px" OnClick="Button1_Click"/>--%>
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />

            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <table class="auto-style1" border="2">
                    <tr>
                        <td class="auto-style4">wsdcfvgbhnjkm</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label2" runat="server" Text="descargas"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>

                </table>
            </asp:Panel>
                                <asp:Button ID="Button2" class="waves-effect waves-light btn" runat="server" Text="Descargas" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
