using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace SAC.formularios
{
    public partial class frm_cita : System.Web.UI.Page
    {
        private Hashtable _sheduleData;

        protected void Page_Load(object sender, EventArgs e)
        {
            _sheduleData = GetSchedule();
        }

        private Hashtable GetSchedule()
        {
            Hashtable schedule = new Hashtable();
            schedule["4/10/2018"] = "Hola probando <br/> código";
            schedule["10/10/2018"] = "Hola probando código";
            schedule["15/10/2018"] = "Hola probando código";
            return schedule;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (_sheduleData[e.Day.Date.ToShortDateString()] != null)
            {
                Literal lit = new Literal();
                lit.Text = "<br/>";
                e.Cell.Controls.Add(lit);

                Label lbl = new Label();
                lbl.Text = (string)_sheduleData[e.Day.Date.ToShortDateString()];
                lbl.Font.Size = new FontUnit(FontSize.Small);
                lbl.ForeColor = System.Drawing.Color.Blue;
                e.Cell.Controls.Add(lbl);
            }
        }
    }
}