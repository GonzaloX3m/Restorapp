<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Restorapp.View.Default" %>
<%@ Import Namespace="Restorapp.Model" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--<script src="View/js/Funciones.js" type="text/javascript"></script>-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Seleccion De platos</title>
</head>
<body>
    <table style="width: 100%; height: 90px;">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Funciones</th>
        </tr>
     <%--       <%
                Data d = new Data();
                foreach (Plato p in d.GetPlatos())
                {
                    Response.Write("<tr>");
                    Response.Write("<td>"+p.Id+"</td>");
                    Response.Write("<td>"+p.Nombre+"</td>");
                    Response.Write("<td>"+p.Precio+"</td>");
                    Response.Write("</tr>");
                }
            %>
    --%></table>
</body>
</html>
