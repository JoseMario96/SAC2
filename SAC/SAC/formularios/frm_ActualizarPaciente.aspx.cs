using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_ActualizarPaciente : System.Web.UI.Page
    {
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GridView1.DataSource = objeto.Paciente();
                GridView1.DataBind();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    String ced;
                    ced = row.Cells[0].Text;
                    String nom1;
                    nom1 = row.Cells[1].Text;
                    String nom2;
                    nom2 = row.Cells[2].Text;
                    String ape1;
                    ape1 = row.Cells[3].Text;
                    String ape2;
                    ape2 = row.Cells[4].Text;
                    String gen;
                    gen = row.Cells[5].Text;
                    String tel;
                    tel = row.Cells[6].Text;
                    String cel;
                    cel = row.Cells[7].Text;
                    String dir;
                    dir = row.Cells[8].Text;
                    String cedE;
                    cedE = row.Cells[9].Text;
                    String corr;
                    corr = row.Cells[10].Text;
                    String fechN;
                    fechN = row.Cells[11].Text;
                    String fechI;
                    fechI = row.Cells[12].Text;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
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
    }
}