<%@ Page Title= "Upravljanje Kvalitetom | Upravljanje e-dokumentima" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="upravljanjedoc.aspx.cs" Inherits="Administratorkorisnik_upravljanjedoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Upravljanje e-dokumentima</h2>
        <p></p>
        <table style="width:90%;">
        <tr>
            <td colspan="3">
                Forma za unos novog naziva za Kategoriju Dokumenta</td>
        </tr>
        <tr>
            <td class="style3">
                Naziv Kategorije Dokumenta:</td>
            <td class="style2">
                <asp:TextBox ID="TextBoxNazivkat" runat="server" 
                    style="margin-right: 28px" Width="203px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxNazivkat" 
                    ErrorMessage="Niste uneli naziv kategorije dokumenta." ValidationGroup="Grupa1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ValidationGroup="Grupa1" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="ButtonUnosKategorije" runat="server" Text="Unos" 
                    onclick="ButtonUnosKategorije_Click" ValidationGroup="Grupa1" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridViewkategorije" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DokumentID" 
            DataSourceID="SqlDataSourcekategorije" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                ShowEditButton="True" UpdateText="Ažuriraj" />
            <asp:BoundField DataField="DokumentID" HeaderText="Kategorija Dokumenta" 
                InsertVisible="False" ReadOnly="True" SortExpression="DokumentID" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv Kategorije" 
                SortExpression="Naziv" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcekategorije" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [DocKategorija] WHERE [DokumentID] = @original_DokumentID AND [Naziv] = @original_Naziv" 
            InsertCommand="INSERT INTO [DocKategorija] ([Naziv]) VALUES (@Naziv)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [DocKategorija]" 
            UpdateCommand="UPDATE [DocKategorija] SET [Naziv] = @Naziv WHERE [DokumentID] = @original_DokumentID AND [Naziv] = @original_Naziv">
            <DeleteParameters>
                <asp:Parameter Name="original_DokumentID" Type="Int32" />
                <asp:Parameter Name="original_Naziv" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Naziv" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Naziv" Type="String" />
                <asp:Parameter Name="original_DokumentID" Type="Int32" />
                <asp:Parameter Name="original_Naziv" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table style="width:90%;">
        <tr>
            <td colspan="3">
                Forma za unos novog Dokumenta</td>
        </tr>
        <tr>
            <td>
                Naziv:</td>
            <td class="style5">
                <asp:TextBox ID="TextBoxNaziv" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBoxNaziv" ErrorMessage="Niste uneli naziv dokumenta." 
                    ValidationGroup="Grupa2">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style4">
                Oznaka:</td>
            <td class="style6">
                <asp:TextBox ID="TextBoxOznaka" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBoxOznaka" ErrorMessage="Niste uneli oznaku dokumenta." 
                    ValidationGroup="Grupa2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Broj:</td>
            <td class="style6">
                <asp:TextBox ID="TextBoxBroj" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBoxBroj" ErrorMessage="Niste uneli broj dokumenta." 
                    ValidationGroup="Grupa2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Vreme Čuvanja:</td>
            <td class="style6">
                <asp:TextBox ID="TextBoxCuvanje" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBoxCuvanje" 
                    ErrorMessage="Niste odredili vremenski rok čuvanja dokumenta." 
                    ValidationGroup="Grupa2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Dokument Izradio:</td>
            <td class="style6">
                <asp:TextBox ID="TextBoxIzradio" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBoxIzradio" 
                    ErrorMessage="Niste uneli ko je izradio dokument." ValidationGroup="Grupa2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Dokument Odobrio:</td>
            <td class="style6">
                <asp:TextBox ID="TextBoxOdobrio" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextBoxOdobrio" 
                    ErrorMessage="Niste uneli ko je odobrio izradu dokumenta." 
                    ValidationGroup="Grupa2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Kategorija Dokumenta:</td>
            <td class="style6">
                <asp:DropDownList ID="DropDownListkategorija" runat="server" 
                    DataSourceID="SqlDataSourcekategorija" DataTextField="Naziv" 
                    DataValueField="DokumentID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcekategorija" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
                    SelectCommand="SELECT * FROM [DocKategorija]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                Dokument:</td>
            <td class="style6">
                <asp:FileUpload ID="FileUploadDokumenta" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style6">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                    ValidationGroup="Grupa2" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style6">
                <asp:Button ID="ButtonUnesiDokument" runat="server" Text="Unesi" 
                    ValidationGroup="Grupa2" onclick="ButtonUnesiDokument_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridViewdokumenta" runat="server" AllowPaging="True" 
          AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DokumentaID" 
          DataSourceID="SqlDataSourcedokumenta" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                ShowEditButton="True" UpdateText="Ažuriraj" />
            <asp:BoundField DataField="DokumentID" HeaderText="Kategorija" 
                SortExpression="DokumentID" />
            <asp:BoundField DataField="Broj" HeaderText="Broj" SortExpression="Broj" />
            <asp:BoundField DataField="OznakaDoc" HeaderText="Oznaka" 
                SortExpression="OznakaDoc" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
            <asp:BoundField DataField="VremeCuvanja" HeaderText="Vreme Čuvanja" 
                SortExpression="VremeCuvanja" />
            <asp:BoundField DataField="DocIzradio" HeaderText="Izradio" 
                SortExpression="DocIzradio" />
            <asp:BoundField DataField="DocOdobrio" HeaderText="Odobrio" 
                SortExpression="DocOdobrio" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                 <asp:TemplateField HeaderText="Dokument">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("AdresaDoc") %>'>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AdresaDoc") %>'>Dokument</asp:HyperLink>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView><asp:SqlDataSource ID="SqlDataSourcedokumenta" runat="server" 
          ConflictDetection="CompareAllValues" 
          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          DeleteCommand="DELETE FROM [Dokumenta] WHERE [DokumentaID] = @original_DokumentaID AND (([DokumentID] = @original_DokumentID) OR ([DokumentID] IS NULL AND @original_DokumentID IS NULL)) AND (([Broj] = @original_Broj) OR ([Broj] IS NULL AND @original_Broj IS NULL)) AND (([OznakaDoc] = @original_OznakaDoc) OR ([OznakaDoc] IS NULL AND @original_OznakaDoc IS NULL)) AND (([Naziv] = @original_Naziv) OR ([Naziv] IS NULL AND @original_Naziv IS NULL)) AND (([VremeCuvanja] = @original_VremeCuvanja) OR ([VremeCuvanja] IS NULL AND @original_VremeCuvanja IS NULL)) AND (([DocIzradio] = @original_DocIzradio) OR ([DocIzradio] IS NULL AND @original_DocIzradio IS NULL)) AND (([DocOdobrio] = @original_DocOdobrio) OR ([DocOdobrio] IS NULL AND @original_DocOdobrio IS NULL)) AND (([Datum] = @original_Datum) OR ([Datum] IS NULL AND @original_Datum IS NULL)) AND (([AdresaDoc] = @original_AdresaDoc) OR ([AdresaDoc] IS NULL AND @original_AdresaDoc IS NULL))" 
          InsertCommand="INSERT INTO [Dokumenta] ([DokumentID], [Broj], [OznakaDoc], [Naziv], [VremeCuvanja], [DocIzradio], [DocOdobrio], [Datum], [AdresaDoc]) VALUES (@DokumentID, @Broj, @OznakaDoc, @Naziv, @VremeCuvanja, @DocIzradio, @DocOdobrio, @Datum, @AdresaDoc)" 
          OldValuesParameterFormatString="original_{0}" 
          SelectCommand="SELECT * FROM [Dokumenta]" 
          UpdateCommand="UPDATE [Dokumenta] SET [DokumentID] = @DokumentID, [Broj] = @Broj, [OznakaDoc] = @OznakaDoc, [Naziv] = @Naziv, [VremeCuvanja] = @VremeCuvanja, [DocIzradio] = @DocIzradio, [DocOdobrio] = @DocOdobrio, [Datum] = @Datum, [AdresaDoc] = @AdresaDoc WHERE [DokumentaID] = @original_DokumentaID AND (([DokumentID] = @original_DokumentID) OR ([DokumentID] IS NULL AND @original_DokumentID IS NULL)) AND (([Broj] = @original_Broj) OR ([Broj] IS NULL AND @original_Broj IS NULL)) AND (([OznakaDoc] = @original_OznakaDoc) OR ([OznakaDoc] IS NULL AND @original_OznakaDoc IS NULL)) AND (([Naziv] = @original_Naziv) OR ([Naziv] IS NULL AND @original_Naziv IS NULL)) AND (([VremeCuvanja] = @original_VremeCuvanja) OR ([VremeCuvanja] IS NULL AND @original_VremeCuvanja IS NULL)) AND (([DocIzradio] = @original_DocIzradio) OR ([DocIzradio] IS NULL AND @original_DocIzradio IS NULL)) AND (([DocOdobrio] = @original_DocOdobrio) OR ([DocOdobrio] IS NULL AND @original_DocOdobrio IS NULL)) AND (([Datum] = @original_Datum) OR ([Datum] IS NULL AND @original_Datum IS NULL)) AND (([AdresaDoc] = @original_AdresaDoc) OR ([AdresaDoc] IS NULL AND @original_AdresaDoc IS NULL))">
          <DeleteParameters>
              <asp:Parameter Name="original_DokumentaID" Type="Int32" />
              <asp:Parameter Name="original_DokumentID" Type="Int32" />
              <asp:Parameter Name="original_Broj" Type="Int32" />
              <asp:Parameter Name="original_OznakaDoc" Type="String" />
              <asp:Parameter Name="original_Naziv" Type="String" />
              <asp:Parameter Name="original_VremeCuvanja" Type="String" />
              <asp:Parameter Name="original_DocIzradio" Type="String" />
              <asp:Parameter Name="original_DocOdobrio" Type="String" />
              <asp:Parameter Name="original_Datum" Type="DateTime" />
              <asp:Parameter Name="original_AdresaDoc" Type="String" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="DokumentID" Type="Int32" />
              <asp:Parameter Name="Broj" Type="Int32" />
              <asp:Parameter Name="OznakaDoc" Type="String" />
              <asp:Parameter Name="Naziv" Type="String" />
              <asp:Parameter Name="VremeCuvanja" Type="String" />
              <asp:Parameter Name="DocIzradio" Type="String" />
              <asp:Parameter Name="DocOdobrio" Type="String" />
              <asp:Parameter Name="Datum" Type="DateTime" />
              <asp:Parameter Name="AdresaDoc" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="DokumentID" Type="Int32" />
              <asp:Parameter Name="Broj" Type="Int32" />
              <asp:Parameter Name="OznakaDoc" Type="String" />
              <asp:Parameter Name="Naziv" Type="String" />
              <asp:Parameter Name="VremeCuvanja" Type="String" />
              <asp:Parameter Name="DocIzradio" Type="String" />
              <asp:Parameter Name="DocOdobrio" Type="String" />
              <asp:Parameter Name="Datum" Type="DateTime" />
              <asp:Parameter Name="AdresaDoc" Type="String" />
              <asp:Parameter Name="original_DokumentaID" Type="Int32" />
              <asp:Parameter Name="original_DokumentID" Type="Int32" />
              <asp:Parameter Name="original_Broj" Type="Int32" />
              <asp:Parameter Name="original_OznakaDoc" Type="String" />
              <asp:Parameter Name="original_Naziv" Type="String" />
              <asp:Parameter Name="original_VremeCuvanja" Type="String" />
              <asp:Parameter Name="original_DocIzradio" Type="String" />
              <asp:Parameter Name="original_DocOdobrio" Type="String" />
              <asp:Parameter Name="original_Datum" Type="DateTime" />
              <asp:Parameter Name="original_AdresaDoc" Type="String" />
          </UpdateParameters>
      </asp:SqlDataSource>
      </asp:Content>