<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Restorapp_V2.View.Index" %>
<%@ Import Namespace="Restorapp_V2.Model" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <link href="css/Estilos.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
</head>
<body style="height: 545px">
    <div id="divBanner">
        <div id="divTitulo" style="float:left; width:70%"";>
            <a href="Index.aspx"><h1>Restorapp</h1></a>
        </div>        

        <div style="width:30%;">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/View/IniciarSesion.aspx">Iniciar Sesión</asp:HyperLink>
            &nbsp
            
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/View/Registrarse.aspx">Registrarse</asp:HyperLink>
            
        </div>
    </div><br />
        <br />
        <h2>Ingresar Pedido</h2>
        <form action="../Controller/BuscarComida.ashx" method="post">
            Seleccionar Alimento
            <select id="cboPlatos">
                <%
                    Data d = new Data();
                    foreach (Plato p in d.GetPlatos())
                    {
                        Response.Write("<option value="+p.Id+">"+p.Nombre+"</option>");
                    } %>
            </select>&nbsp
            Seleccionar Mesa
            <select id="cboMesas">
                <%
                    foreach (Mesa m in d.GetMesasDisponibles())
                    {
                        Response.Write("<option value="+m.Id+">"+m.Id+"</option>");
                    } 
                    %>
            </select>&nbsp
            Seleccionar un garzón
            <select id="cboMesero">
                <%
                    foreach (Usuario m in d.GetMeserosDisponibles())
                    {
                        Response.Write("<option value="+m.Id+">"+m+"</option>");
                    } 
                    %>
            </select>&nbsp
            <input type="submit" name="btnRegistrar" value="Aceptar" />
        </form>
    
    <br /><a href="VistaCocina.aspx">A la Cocina...</a>
    <footer><a href="VistaCaja.aspx">A Administración...</a></footer>
     
</body>

</html>
