﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt_autobus
{
    public partial class robocza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idusera = Convert.ToInt32(Session["id_user"]);
            Label2.Text = idusera.ToString();
        }
    }
}