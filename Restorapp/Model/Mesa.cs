using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restorapp.Model
{
    public class Mesa
    {
        private int id;

        public int Id { get => id; set => id = value; }

        public override string ToString() => id.ToString();
    }
}