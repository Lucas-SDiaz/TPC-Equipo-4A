﻿using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnCartilla_Click(object sender, EventArgs e)
        {
   
            Response.Redirect("Cartilla.aspx", false);
        }

        protected void btnSolTurno_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoTurno", false);
        }
    }
}