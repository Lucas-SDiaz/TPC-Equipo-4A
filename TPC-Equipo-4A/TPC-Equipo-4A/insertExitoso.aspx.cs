﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class insertExitoso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void brnHorarios_Click(object sender, EventArgs e)
        {
            if(Session["id_medico"] != null)
            {
                Response.Redirect("Horarios.aspx", false);
            }
        }

        protected void btnMedicosABM_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicosABM.aspx", false);
        }
    }
}