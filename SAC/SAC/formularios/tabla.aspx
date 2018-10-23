<%@ Page Language="C#" CodeBehind="tabla.aspx.cs" Inherits="SAC.formularios.tabla" AutoEventWireup="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/materialize.min.css" rel="stylesheet" />

    <style>
        table thead {
            color: #000;
            background-color: #3AC0F2;
        }

        table {
            width: 70%;
            margin: auto;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=GridView2] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="BudquedaExp" runat="server" OnTextChanged="BudquedaExp_TextChanged" AutoPostBack="true"></asp:TextBox>

        <br />
        <br />
        <h5>Tratamientos Efectuados</h5>


        <br />

        <div style="margin-left: auto; margin-right: auto;">
            <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                runat="server" AutoGenerateColumns="False" Height="174px" Width="70%" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="fechaExpedienteTratamiento" HeaderText="Fecha" ItemStyle-Width="30" />
                    <asp:BoundField DataField="tratamientoExpedienteTratamiento" HeaderText="Tratamiento" ItemStyle-Width="100" />
                    <asp:BoundField DataField="piezaExpedienteTratamiento" HeaderText="Diente" ItemStyle-Width="100" />
                    <asp:BoundField DataField="descripcionExpedienteTratamiento" HeaderText="Descripción" ItemStyle-Width="100" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="row">
            <div class="col s10">
            </div>
            <div class="col s1">
            </div>
        </div>

        <div id="tablaDetalle" style="display: block" tabindex="-1">
            <div class="row">
                <div class="col s3">
                    <label class="active" for="Fecha">Fecha </label>
                    <asp:Label ID="fecha" runat="server"></asp:Label>
                </div>
                <div class="col s3">
                    <label class="active" for="Tratamiento">Tipo de tratamiento </label>
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>

                <div class="col s3">
                    <label class="active" for="Tipotratamiento">Tratamiento</label>
                    <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTratamiento" DataValueField="nombreTratamiento" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col s3">
                    <label class="active" for="Diente">Diente</label>
                    <input type='text' name='dient' id="diente" runat="server" />
                </div>

            </div>

            <div class="row">
                <label class="active" for="Descripcion">Descripción</label>

                <div class="col s12">
                    <input type='text' name='debe' id="descrip" runat="server" />
                </div>
            </div>

            <div class="row">
                <div class="col s3">
                    <label class="active" for="Debe">Debe </label>
                    <label id="preciost" runat="server" class="active" for="Debe">₡</label>
                </div>

                <div class="col s3">
                    <label class="active" for="Debe">Extra </label>
                    <input type='text' id="extra" runat="server" name='abono' />
                </div>

                <div class="col s3">
                    <label class="active" for="Abono">Abono</label>
                    <asp:TextBox ID="abono" runat="server" required OnTextChanged="abono_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
                <div class="col s3">
                    <label class="active" for="Saldo">Saldo</label>
                    <label class="active" id="saldo" runat="server" for="Saldo"></label>
                </div>
                <asp:Button ID="AgregarDetalle" runat="server" Text="+" class="waves-effect waves-light btn" OnClick="AgregarDetalle_Click" />
            </div>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <%-- <script>
            var f = new Date();
            document.getElementById('fecha').innerHTML = f.toISOString().substr(0, 10);;
        </script>--%>
    </form>
</body>
</html>
