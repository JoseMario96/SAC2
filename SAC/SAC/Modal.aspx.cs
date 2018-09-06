using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC
{
    public partial class Modal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void AgreeSubmit_Click(object sender, EventArgs e)
        //{
        //    TextBox1.Text = DateTime.Now.ToString();

        //    // get the form data 

        //    // do other things
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
                lblModalTitle.Text = "Validation Errors List for HP7 Citation";
                lblModalBody.Text = "This is modal body";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            
        }
    }
}