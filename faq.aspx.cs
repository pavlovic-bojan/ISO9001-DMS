using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

public partial class faq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                DataSet Pitanje = this.ListaPitanja(Int32.Parse(Request.QueryString["id"].ToString()));
                // ListView1.Visible = false;
                ListView1.DataSource = Pitanje.Tables["FAQ"];
                ListView1.DataBind();
                // ListView1.Visible = true;
            }
            else
            {
                DataSet Pitanje = this.ListaPitanja(0);
                ListView1.DataSource = Pitanje.Tables["FAQ"];
                ListView1.DataBind();
            }
        }



        if (Request.QueryString["id3"] != null)
        {
            DataSet Paketi1 = this.ListaPitanja1(Int32.Parse(Request.QueryString["id3"].ToString()));
            ListView1.Visible = false;
            DataListModel.DataSource = Paketi1.Tables["FAQ"];
            DataListModel.DataBind();
            DataListModel.Visible = true;
        }
        else
        {

        }
    }

    protected DataSet ListaPitanja(int id)
    {
        SqlConnection veza = new SqlConnection();
        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = veza;
        komanda.CommandType = CommandType.Text;
        komanda.CommandText = "SELECT * FROM FAQ";
        if (id != 0)
        {
            komanda.CommandText += " WHERE PitanjeID=@PitanjeID";
            komanda.Parameters.AddWithValue("@PitanjeID", id);
        }
        SqlDataAdapter da1 = new SqlDataAdapter(komanda);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1, "FAQ");
        return ds1;
    }

    protected DataSet ListaPitanja1(int id3)
    {
        SqlConnection veza = new SqlConnection();
        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = veza;
        komanda.CommandType = CommandType.Text;
        komanda.CommandText = "SELECT * FROM FAQ";
        if (id3 != 0)
        {
            komanda.CommandText += " WHERE PitanjeID=@PitanjeID";
            komanda.Parameters.AddWithValue("@PitanjeID", id3);
        }
        SqlDataAdapter da = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        da.Fill(ds, "FAQ");
        return ds;
    }
}