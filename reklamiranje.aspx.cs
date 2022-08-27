using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class reklamiranje : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Buttonreklamiranje_Click(object sender, EventArgs e)
    {
        string Naziv_Kompanije = TextBoxnaziv.Text;
        string mejl_za_kontakt = TextBoxmeil.Text;
        string Kontakt_Osoba = TextBoxkontaktosoba.Text;
        string Vremenski_Period = TextBoxvreme.Text;
        string Broj_za_kontakt = TextBoxtelefon.Text;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = conn;
        komanda.CommandType = CommandType.StoredProcedure;
        komanda.CommandText = "UnesiReklamu";
        komanda.Parameters.AddWithValue("@Naziv_Kompanije", Naziv_Kompanije);
        komanda.Parameters.AddWithValue("@mejl_za_kontakt", mejl_za_kontakt);
        komanda.Parameters.AddWithValue("@Kontakt_Osoba", Kontakt_Osoba);
        komanda.Parameters.AddWithValue("@Vremenski_Period", Vremenski_Period);
        komanda.Parameters.AddWithValue("@Broj_za_kontakt", Broj_za_kontakt);
        if (FileUploadbaner.PostedFile.FileName != "")
        {
            string tipSlike = FileUploadbaner.PostedFile.ContentType;
            if (tipSlike == "image/gif" || tipSlike == "image/jpeg")
            {
                string putanja = Server.MapPath("~/Reklame/");
                FileUploadbaner.SaveAs(putanja + FileUploadbaner.PostedFile.FileName);
                komanda.Parameters.AddWithValue("@Baner", FileUploadbaner.PostedFile.FileName);
            }
            else
            {
                komanda.Parameters.AddWithValue("@Baner", Convert.DBNull);
            }
        }
        else
        {
            komanda.Parameters.AddWithValue("@Baner", Convert.DBNull);
        }
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