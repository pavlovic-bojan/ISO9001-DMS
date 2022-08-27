using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Administratorkorisnik_upravljanjedoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonUnosKategorije_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = conn;
        komanda.CommandType = CommandType.StoredProcedure;
        komanda.CommandText = "UnesiKategorijuDokumenta";
        komanda.Parameters.AddWithValue("@Naziv", TextBoxNazivkat.Text);
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
    protected void ButtonUnesiDokument_Click(object sender, EventArgs e)
    {
        string Naziv = TextBoxNaziv.Text;
        string OznakaDoc = TextBoxOznaka.Text;
        string Broj = TextBoxBroj.Text;
        string VremeCuvanja = TextBoxCuvanje.Text;
        string DocIzradio = TextBoxIzradio.Text;
        string DocOdobrio = TextBoxOdobrio.Text;
        DateTime datum = DateTime.Now;
        Int32 DokumentID = Int32.Parse(DropDownListkategorija.SelectedValue);
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;



        SqlCommand komanda = new SqlCommand();
        komanda.Connection = conn;
        komanda.CommandType = CommandType.StoredProcedure;
        komanda.CommandText = "UnesiDokument";
        komanda.Parameters.AddWithValue("@Naziv", Naziv);
        komanda.Parameters.AddWithValue("@OznakaDoc", OznakaDoc);
        komanda.Parameters.AddWithValue("@Broj", Broj);
        komanda.Parameters.AddWithValue("@VremeCuvanja", VremeCuvanja);
        komanda.Parameters.AddWithValue("@DocIzradio", DocIzradio);
        komanda.Parameters.AddWithValue("@DocOdobrio", DocOdobrio);
        komanda.Parameters.AddWithValue("@DokumentID", DokumentID);
        if (FileUploadDokumenta.PostedFile.FileName != "")
        {
            string tipDatoteke = FileUploadDokumenta.PostedFile.ContentType;
            if (tipDatoteke == "document/doc" || tipDatoteke == "document/pdf")
            {
                string putanja = Server.MapPath("~/Dokument/");
                FileUploadDokumenta.SaveAs(putanja + FileUploadDokumenta.PostedFile.FileName);
                komanda.Parameters.AddWithValue("@AdresaDoc", FileUploadDokumenta.PostedFile.FileName);
            }
            else
            {
                komanda.Parameters.AddWithValue("@AdresaDoc", Convert.DBNull);
            }
        }
        else
        {
            komanda.Parameters.AddWithValue("@AdresaDoc", Convert.DBNull);
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