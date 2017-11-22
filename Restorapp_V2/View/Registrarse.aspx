<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Restorapp_V2.View.Registrarse" %>

<%@ Import Namespace="Restorapp_V2.Model" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <div id="divBanner">
        <div id="divTitulo" style="float:left; width:70%"";>
            <a href="Index.aspx"><h1>Restorapp</h1></a>
        </div>        

        <div style="width:30%;">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/View/IniciarSesion.aspx">Iniciar Sesión</asp:HyperLink>
            &nbsp;
        </div>
    </div><br />
    <form id="form1" runat="server" method="post" action="~/Controller/RegistrarUsuarioHandler.ashx">
        Nombre:
        <input type="text" name="txtNombre" required="required" /><br />
        Usuario:
        <input type="text" name="txtUser" placeholder="Usuario:" required="required" /><br />
        Contraseña:
        <input type="password" name="txtPass" required="required" />
        Tipo de usuario: 
        <select name="cboTiposUsuarios">
            <%
                Data d = new Data();
                foreach (TipoUsuario tu in d.GetTipoUsuario())
                {
                    Response.Write("<option value=" + tu.Id + ">" + tu.Descripcion + "</option>");
                }
            %>
        </select>&nbsp;
        <input type="submit" name="btnRegistrar" value="Registrar" />


    </form>
</body>
</html>
