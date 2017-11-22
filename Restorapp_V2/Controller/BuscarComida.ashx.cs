using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restorapp_V2.Controller
{
    /// <summary>
    /// Descripción breve de BuscarComida
    /// </summary>
    public class BuscarComida : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}