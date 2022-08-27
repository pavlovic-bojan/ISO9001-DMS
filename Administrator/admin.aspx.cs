using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Administrator_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }  
    protected void Buttonkontaktkoga_Click(object sender, EventArgs e)
    {
        string Naziv = TextBoxnaziv.Text;
        string mail = TextBoxmail.Text;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = conn;
        komanda.CommandType = CommandType.StoredProcedure;
        komanda.CommandText = "Unoskoga";
        komanda.Parameters.AddWithValue("@Naziv", Naziv);
        komanda.Parameters.AddWithValue("@mail", mail);
        try
        {
            komanda.Connection.Open();
            komanda.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            komanda.Connection.Close();
        }
    }
    protected void unospitanja_Click(object sender, EventArgs e)
    {
            string Pitanje = TextBoxpitanje.Text;
            string Odgovor = TextBoxodgovor.Text;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

            SqlCommand komanda = new SqlCommand();
            komanda.Connection = conn;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "UnosFAQ";
            komanda.Parameters.AddWithValue("@Pitanje", Pitanje);
            komanda.Parameters.AddWithValue("@Odgovor", Odgovor);
            try
            {
                komanda.Connection.Open();
                komanda.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                komanda.Connection.Close();
            }
    }
}