using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Restorapp_V2.Model;

namespace Restorapp_V2.Controller
{
    /// <summary>
    /// Descripción breve de RegistrarUsuarioHandler
    /// </summary>
    public class RegistrarUsuarioHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Usuario usu = new Usuario
            {
                Nombre = context.Request.Params["txtNombre"],
                Username = context.Request.Params["txtUser"],
                Pass = context.Request.Params["txtPass"],
                TipoUsuario = int.Parse(context.Request.Params["cboTiposUsuarios"])
            };

            Data d = new Data();
            d.AgregarUsuario(usu);
            context.Response.Redirect("../View/Registrarse.aspx");

        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}