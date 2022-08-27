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

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                DataSet Paketi = this.ListaPaketa(Int32.Parse(Request.QueryString["id"].ToString()));
                // ListView1.Visible = false;
                ListView1.DataSource = Paketi.Tables["Paketi"];
                ListView1.DataBind();
                // ListView1.Visible = true;
            }
            else
            {
                DataSet Paketi = this.ListaPaketa(0);
                ListView1.DataSource = Paketi.Tables["Paketi"];
                ListView1.DataBind();
            }
        }



        if (Request.QueryString["id3"] != null)
        {
            DataSet Paketi1 = this.ListaPaketa1(Int32.Parse(Request.QueryString["id3"].ToString()));
            ListView1.Visible = false;
            DataListModel.DataSource = Paketi1.Tables["Paketi"];
            DataListModel.DataBind();
            DataListModel.Visible = true;
        }
        else
        {

        }
    }

    protected DataSet ListaPaketa(int id)
    {
        SqlConnection veza = new SqlConnection();
        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = veza;
        komanda.CommandType = CommandType.Text;
        komanda.CommandText = "SELECT * FROM Paketi";
        if (id != 0)
        {
            komanda.CommandText += " WHERE PaketID=@PaketID";
            komanda.Parameters.AddWithValue("@PaketID", id);
        }
        SqlDataAdapter da1 = new SqlDataAdapter(komanda);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1, "Paketi");
        return ds1;
    }

    protected DataSet ListaPaketa1(int id3)
    {
        SqlConnection veza = new SqlConnection();
        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = veza;
        komanda.CommandType = CommandType.Text;
        komanda.CommandText = "SELECT * FROM Paketi";
        if (id3 != 0)
        {
            komanda.CommandText += " WHERE PaketID=@PaketID";
            komanda.Parameters.AddWithValue("@PaketID", id3);
        }
        SqlDataAdapter da = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        da.Fill(ds, "Paketi");
        return ds;
    }

    public string MakeImageUrl(string url)
    {
        if (url != null && url.Length > 0)
        {
            return "~/images/" + url;
        }
        else
        {
            return null;
        }
    }
}