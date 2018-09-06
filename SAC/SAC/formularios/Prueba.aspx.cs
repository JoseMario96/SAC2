using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;


namespace SAC.formularios
{
    public partial class Prueba : System.Web.UI.Page
    {
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Pacientes("");
            }
            //Pacientes("");
            { }
            //if (!this.IsPostBack)
            //{
            //    string constr = ConfigurationManager.ConnectionStrings["bd_sacPaciente"].ConnectionString;
            //    using (MySqlConnection con = new MySqlConnection(constr))
            //    {
            //        using (MySqlCommand cmd = new MySqlCommand("SELECT cedulaPaciente, nombre1Paciente, apellido1Paciente, apellido2Paciente FROM tbl_paciente"))
            //        {
            //            using (MySqlDataAdapter da = new MySqlDataAdapter())
            //            {
            //                cmd.Connection = con;
            //                da.SelectCommand = cmd;
            //                using (DataTable dt = new DataTable())
            //                {
            //                    da.Fill(dt);
            //                    GridView1.DataSource = dt;
            //                    GridView1.DataBind();
            //                }
            //            }
            //        }
            //    }
            //}

        }
        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            GridView1.HeaderRow.Parent.Controls.AddAt(1, row);
        }
        private void Prueba_Load(object sender, EventArgs e)
        {
            Pacientes("");
        }
        public void Pacientes(String busqueda)
        {
            busqueda = txt_busqueda.Text;
            GridView1.DataSource = objeto.Paciente(busqueda);
            GridView1.DataBind();
        }
        protected void txt_busqueda_TextChanged(object sender, EventArgs e)
        {
            Pacientes(txt_busqueda.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //GridView1.DataSource = objeto.Paciente(txt_busqueda.Text, "cedulaPaciente");
            //GridView1.DataBind();
        }
    }
}