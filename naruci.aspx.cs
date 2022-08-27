using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class naruci : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Buttonreklamiranje_Click(object sender, EventArgs e)
    {
        string Naziv_Kompanije = TextBoxnaziv.Text;
        string mejl_za_kontakt = TextBoxmeil.Text;
        string Kontakt_Osoba = TextBoxkontaktosoba.Text;
        string Broj_za_kontakt = TextBoxtelefon.Text;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = conn;
        komanda.CommandType = CommandType.StoredProcedure;
        komanda.CommandText = "NarucivanjeUsluga";
        komanda.Parameters.AddWithValue("@Naziv_Kompanije", Naziv_Kompanije);
        komanda.Parameters.AddWithValue("@mejl_za_kontakt", mejl_za_kontakt);
        komanda.Parameters.AddWithValue("@Kontakt_Osoba", Kontakt_Osoba);
        komanda.Parameters.AddWithValue("@Broj_za_kontakt", Broj_za_kontakt);
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