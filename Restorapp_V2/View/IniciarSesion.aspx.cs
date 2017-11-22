using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Restorapp_V2.Model;

namespace Restorapp_V2.View
{
    public partial class IniciarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIniciar_Click(object sender, EventArgs e)
        {
            Data d = new Data();
            if (d.VerificarUsuario(txtUsuario.Text,txtPass.Text) == 1)
            {
                Response.Redirect("");
            }
            else
            {
                Response.Redirect("View/Error.aspx?m=3");
            }
        }

        
    }
}