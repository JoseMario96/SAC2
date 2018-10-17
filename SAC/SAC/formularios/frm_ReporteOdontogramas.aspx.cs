using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using MySql.Data.MySqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using iTextSharp.text.html;
using System.Drawing;


namespace SAC.formularios
{
    public partial class frm_ReporteOdontogramas : System.Web.UI.Page
    {
        metodos.metodosOdontograma objeto = new metodos.metodosOdontograma();
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cedula.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "dibuja_seccion('" + contextoO + "','5','5','red')", true);

        }

        protected void Cedula_TextChanged(object sender, EventArgs e)
        {
            string mycon = "server=127.0.0.1;user=root;database=bd_sac;password=sac;SslMode=none;";
            String myquery = "SELECT * FROM bd_sac.tbl_paciente where cedulaPaciente=" + Cedula.Text;
            MySqlConnection con = new MySqlConnection(mycon);
            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string script = @"<script type='text/javascript'>
                document.getElementById('Panel1').scrollIntoView();              
            </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                Panel1.Visible = true;
                Label5.Visible = false;
                Cedula.Visible = false;
                cedulaP.Text = ds.Tables[0].Rows[0]["cedulaPaciente"].ToString();
                nombre1.Text = ds.Tables[0].Rows[0]["nombre1Paciente"].ToString() + " " + ds.Tables[0].Rows[0]["nombre2Paciente"].ToString() + " " + ds.Tables[0].Rows[0]["apellido1Paciente"].ToString() + " " + ds.Tables[0].Rows[0]["apellido2Paciente"].ToString();
                correo.Text = ds.Tables[0].Rows[0]["correoPaciente"].ToString();
                telefono.Text = ds.Tables[0].Rows[0]["telefonoPaciente"].ToString();
            }
            else
            {
                string insertar = @"<script type='text/javascript'>
                alert('No existe el paciente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", insertar, false);
                Panel1.Visible = false;
                Cedula.Text = "";
                Cedula.Focus();

            }
            con.Close();
        }
    }
}
