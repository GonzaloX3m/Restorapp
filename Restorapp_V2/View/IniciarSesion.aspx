<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Restorapp_V2.View.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 86px;
        }
        .auto-style3 {
            width: 259px;
        }
        .auto-style4 {
            width: 86px;
        }
    </style>
</head>
<body style="height: 80px">

    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Usuario:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtUsuario" runat="server" Width="244px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*Debe llenar este campo." ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Contraseña:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="246px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="*Debe llenar este campo" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnIniciar" runat="server" Text="Entrar" Width="139px" OnClick="BtnIniciar_Click" />
                </td>
                
            </tr>
        </table>
    </form>

</body>
</html>
