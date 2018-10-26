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
                $(this).quicksearch("[id*=GridView1] tr:not(:has(th))", {
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
        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <asp:TextBox ID="BudquedaExp" runat="server" OnTextChanged="BudquedaExp_TextChanged" AutoPostBack="true"></asp:TextBox>

        <br />
        <br />
        <h5>Tratamientos Efectuados</h5>


        <br />

        <div style="margin-left: auto; margin-right: auto;">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" aligne="center" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="black" class="col s12"
                        runat="server" AutoGenerateColumns="False" Height="174px" Width="70%" HorizontalAlign="Center" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="fechaExpedienteTratamiento" HeaderText="Fecha" ItemStyle-Width="30" />
                            <asp:BoundField DataField="tratamientoExpedienteTratamiento" HeaderText="Tratamiento" ItemStyle-Width="100" />
                            <asp:BoundField DataField="piezaExpedienteTratamiento" HeaderText="Diente" ItemStyle-Width="100" />
                            <asp:BoundField DataField="descripcionExpedienteTratamiento" HeaderText="Descripción" ItemStyle-Width="100" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
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
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label class="active" for="Fecha">Fecha </label>
                            <asp:Label ID="fecha" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="col s3">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label class="active" for="Tratamiento">Tipo de tratamiento </label>
                            <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTipoTratamiento" DataValueField="nombreTipoTratamiento" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="col s3">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label class="active" for="Tipotratamiento">Tratamiento</label>
                            <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" class="browser-default" runat="server" DataTextField="nombreTratamiento" DataValueField="nombreTratamiento" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="col s3">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <label class="active" for="Diente">Diente</label>
                            <input type='text' name='dient' id="diente" runat="server" maxlength="44" onkeypress="return solonumeros (event)" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

            <div class="row">
                <label class="active" for="Descripcion">Descripción</label>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="col s12">
                            <input type='text' name='debe' id="descrip" runat="server" maxlength="244" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="row">
            <div class="col s3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <label class="active" for="Debe">Debe </label>
                        <label id="preciost" runat="server" class="active" for="Debe">₡</label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="col s3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <label class="active" for="Debe">Extra </label>
                        <input type='text' id="extra" runat="server" name='abono' onkeypress="return solonumeros (event)" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="col s3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <label class="active" for="Abono">Abono</label>
                        <asp:TextBox ID="abono" runat="server" required OnTextChanged="abono_TextChanged" AutoPostBack="true" onkeypress="return solonumeros (event)"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col s3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <label class="active" for="Saldo">Saldo</label>
                        <label class="active" id="saldo" runat="server" for="Saldo"></label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Button ID="AgregarDetalle" runat="server" Text="+" class="waves-effect waves-light btn" OnClick="AgregarDetalle_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
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
        </script>
    </form>
</body>
</html>
