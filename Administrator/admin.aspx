<%@ Page Title="Upravljanje Kvalitetom | Administriranje" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="Administrator_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Stranica za administriranje</h2>
        <p></p>
        <table style="width:100%;">
            <tr><td colspan="3">FORMA ZA UNOS PITANJA I DOGOVORA ZA STRANICU FAQ</td></tr>
                            <tr>
                                <td>
                                    Pitanje
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxpitanje" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxpitanje" ErrorMessage="Unesite Pitanje." 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Odgovor
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxodgovor" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBoxodgovor" ErrorMessage="Unesite Odgovor." 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ValidationGroup="Grupa1" ForeColor="Red" />
                                </td>
                                <td >
                                    <asp:Button ID="unospitanja" runat="server" Text="Unesi FAQ" Font-Bold="False" 
                                        ValidationGroup="Grupa1" CssClass="button"/>
                                </td>
                            </tr>
                        </table>
        <asp:GridView ID="GridViewfaq" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PitanjeID" 
            DataSourceID="SqlDataSourcefaq" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriraj" />
                <asp:BoundField DataField="PitanjeID" HeaderText="PitanjeID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="PitanjeID" />
                <asp:BoundField DataField="Pitanje" HeaderText="Pitanje" 
                    SortExpression="Pitanje" />
                <asp:BoundField DataField="Odgovor" HeaderText="Odgovor" 
                    SortExpression="Odgovor" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcefaq" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [FAQ] WHERE [PitanjeID] = @original_PitanjeID AND (([Pitanje] = @original_Pitanje) OR ([Pitanje] IS NULL AND @original_Pitanje IS NULL)) AND (([Odgovor] = @original_Odgovor) OR ([Odgovor] IS NULL AND @original_Odgovor IS NULL))" 
            InsertCommand="INSERT INTO [FAQ] ([Pitanje], [Odgovor]) VALUES (@Pitanje, @Odgovor)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [FAQ]" 
            UpdateCommand="UPDATE [FAQ] SET [Pitanje] = @Pitanje, [Odgovor] = @Odgovor WHERE [PitanjeID] = @original_PitanjeID AND (([Pitanje] = @original_Pitanje) OR ([Pitanje] IS NULL AND @original_Pitanje IS NULL)) AND (([Odgovor] = @original_Odgovor) OR ([Odgovor] IS NULL AND @original_Odgovor IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_PitanjeID" Type="Int32" />
                <asp:Parameter Name="original_Pitanje" Type="String" />
                <asp:Parameter Name="original_Odgovor" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Pitanje" Type="String" />
                <asp:Parameter Name="Odgovor" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Pitanje" Type="String" />
                <asp:Parameter Name="Odgovor" Type="String" />
                <asp:Parameter Name="original_PitanjeID" Type="Int32" />
                <asp:Parameter Name="original_Pitanje" Type="String" />
                <asp:Parameter Name="original_Odgovor" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewgreske" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idGreska" 
            DataSourceID="SqlDataSourcegreske" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odaberi" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriranje" />
                <asp:BoundField DataField="idGreska" HeaderText="idGreska" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idGreska" />
                <asp:BoundField DataField="Greska" HeaderText="Greska" 
                    SortExpression="Greska" />
                <asp:BoundField DataField="Greska403" HeaderText="Greska403" 
                    SortExpression="Greska403" />
                <asp:BoundField DataField="Greska404" HeaderText="Greska404" 
                    SortExpression="Greska404" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcegreske" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [Greska] WHERE [idGreska] = @original_idGreska AND [Greska] = @original_Greska AND [Greska403] = @original_Greska403 AND [Greska404] = @original_Greska404" 
            InsertCommand="INSERT INTO [Greska] ([Greska], [Greska403], [Greska404]) VALUES (@Greska, @Greska403, @Greska404)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Greska]" 
            UpdateCommand="UPDATE [Greska] SET [Greska] = @Greska, [Greska403] = @Greska403, [Greska404] = @Greska404 WHERE [idGreska] = @original_idGreska AND [Greska] = @original_Greska AND [Greska403] = @original_Greska403 AND [Greska404] = @original_Greska404">
            <DeleteParameters>
                <asp:Parameter Name="original_idGreska" Type="Int32" />
                <asp:Parameter Name="original_Greska" Type="String" />
                <asp:Parameter Name="original_Greska403" Type="String" />
                <asp:Parameter Name="original_Greska404" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Greska" Type="String" />
                <asp:Parameter Name="Greska403" Type="String" />
                <asp:Parameter Name="Greska404" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Greska" Type="String" />
                <asp:Parameter Name="Greska403" Type="String" />
                <asp:Parameter Name="Greska404" Type="String" />
                <asp:Parameter Name="original_idGreska" Type="Int32" />
                <asp:Parameter Name="original_Greska" Type="String" />
                <asp:Parameter Name="original_Greska403" Type="String" />
                <asp:Parameter Name="original_Greska404" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewstrane" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StranaID" 
            DataSourceID="SqlDataSourcestrane" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odaberi" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriranje" />
                <asp:BoundField DataField="StranaID" HeaderText="StranaID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="StranaID" />
                <asp:BoundField DataField="Pocetna" HeaderText="Pocetna" 
                    SortExpression="Pocetna" />
                <asp:BoundField DataField="O_nama" HeaderText="O_nama" 
                    SortExpression="O_nama" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcestrane" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [Strane] WHERE [StranaID] = @original_StranaID AND [Pocetna] = @original_Pocetna AND [O_nama] = @original_O_nama" 
            InsertCommand="INSERT INTO [Strane] ([Pocetna], [O_nama]) VALUES (@Pocetna, @O_nama)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Strane]" 
            UpdateCommand="UPDATE [Strane] SET [Pocetna] = @Pocetna, [O_nama] = @O_nama WHERE [StranaID] = @original_StranaID AND [Pocetna] = @original_Pocetna AND [O_nama] = @original_O_nama">
            <DeleteParameters>
                <asp:Parameter Name="original_StranaID" Type="Int32" />
                <asp:Parameter Name="original_Pocetna" Type="String" />
                <asp:Parameter Name="original_O_nama" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Pocetna" Type="String" />
                <asp:Parameter Name="O_nama" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Pocetna" Type="String" />
                <asp:Parameter Name="O_nama" Type="String" />
                <asp:Parameter Name="original_StranaID" Type="Int32" />
                <asp:Parameter Name="original_Pocetna" Type="String" />
                <asp:Parameter Name="original_O_nama" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
<asp:GridView ID="GridViewusluge" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UslugaID" 
            DataSourceID="SqlDataSourceusluge" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField CancelText="Odaberi" DeleteText="Obriši" EditText="Uredi" 
            InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
            ShowEditButton="True" UpdateText="Ažuriranje" />
        <asp:BoundField DataField="UslugaID" HeaderText="UslugaID" ReadOnly="True" 
            SortExpression="UslugaID" />
        <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
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
</asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceusluge" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [Usluga] WHERE [UslugaID] = @original_UslugaID AND [Opis] = @original_Opis" 
            InsertCommand="INSERT INTO [Usluga] ([UslugaID], [Opis]) VALUES (@UslugaID, @Opis)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Usluga]" 
            UpdateCommand="UPDATE [Usluga] SET [Opis] = @Opis WHERE [UslugaID] = @original_UslugaID AND [Opis] = @original_Opis">
            <DeleteParameters>
                <asp:Parameter Name="original_UslugaID" Type="Int32" />
                <asp:Parameter Name="original_Opis" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UslugaID" Type="Int32" />
                <asp:Parameter Name="Opis" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="original_UslugaID" Type="Int32" />
                <asp:Parameter Name="original_Opis" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewreklamiranje" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ReklamiranjeID" 
            DataSourceID="SqlDataSourcereklamiranje" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriranje" />
                <asp:BoundField DataField="ReklamiranjeID" HeaderText="ReklamiranjeID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ReklamiranjeID" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="Cena_po_verovatnoci" 
                    HeaderText="Cena_po_verovatnoci" SortExpression="Cena_po_verovatnoci" />
                <asp:BoundField DataField="Cena_samostalnog_zakupa" 
                    HeaderText="Cena_samostalnog_zakupa" SortExpression="Cena_samostalnog_zakupa" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcereklamiranje" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [Reklame] WHERE [ReklamiranjeID] = @original_ReklamiranjeID AND (([Opis] = @original_Opis) OR ([Opis] IS NULL AND @original_Opis IS NULL)) AND (([Cena_po_verovatnoci] = @original_Cena_po_verovatnoci) OR ([Cena_po_verovatnoci] IS NULL AND @original_Cena_po_verovatnoci IS NULL)) AND (([Cena_samostalnog_zakupa] = @original_Cena_samostalnog_zakupa) OR ([Cena_samostalnog_zakupa] IS NULL AND @original_Cena_samostalnog_zakupa IS NULL)) AND (([Baner] = @original_Baner) OR ([Baner] IS NULL AND @original_Baner IS NULL)) AND (([Naziv_Kompanije] = @original_Naziv_Kompanije) OR ([Naziv_Kompanije] IS NULL AND @original_Naziv_Kompanije IS NULL)) AND (([Vremenski_Period] = @original_Vremenski_Period) OR ([Vremenski_Period] IS NULL AND @original_Vremenski_Period IS NULL)) AND (([Kontakt_Osoba] = @original_Kontakt_Osoba) OR ([Kontakt_Osoba] IS NULL AND @original_Kontakt_Osoba IS NULL)) AND (([Broj_za_kontakt] = @original_Broj_za_kontakt) OR ([Broj_za_kontakt] IS NULL AND @original_Broj_za_kontakt IS NULL)) AND (([mejl_za_kontakt] = @original_mejl_za_kontakt) OR ([mejl_za_kontakt] IS NULL AND @original_mejl_za_kontakt IS NULL))" 
            InsertCommand="INSERT INTO [Reklame] ([Opis], [Cena_po_verovatnoci], [Cena_samostalnog_zakupa], [Baner], [Naziv_Kompanije], [Vremenski_Period], [Kontakt_Osoba], [Broj_za_kontakt], [mejl_za_kontakt]) VALUES (@Opis, @Cena_po_verovatnoci, @Cena_samostalnog_zakupa, @Baner, @Naziv_Kompanije, @Vremenski_Period, @Kontakt_Osoba, @Broj_za_kontakt, @mejl_za_kontakt)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Reklame]" 
            UpdateCommand="UPDATE [Reklame] SET [Opis] = @Opis, [Cena_po_verovatnoci] = @Cena_po_verovatnoci, [Cena_samostalnog_zakupa] = @Cena_samostalnog_zakupa, [Baner] = @Baner, [Naziv_Kompanije] = @Naziv_Kompanije, [Vremenski_Period] = @Vremenski_Period, [Kontakt_Osoba] = @Kontakt_Osoba, [Broj_za_kontakt] = @Broj_za_kontakt, [mejl_za_kontakt] = @mejl_za_kontakt WHERE [ReklamiranjeID] = @original_ReklamiranjeID AND (([Opis] = @original_Opis) OR ([Opis] IS NULL AND @original_Opis IS NULL)) AND (([Cena_po_verovatnoci] = @original_Cena_po_verovatnoci) OR ([Cena_po_verovatnoci] IS NULL AND @original_Cena_po_verovatnoci IS NULL)) AND (([Cena_samostalnog_zakupa] = @original_Cena_samostalnog_zakupa) OR ([Cena_samostalnog_zakupa] IS NULL AND @original_Cena_samostalnog_zakupa IS NULL)) AND (([Baner] = @original_Baner) OR ([Baner] IS NULL AND @original_Baner IS NULL)) AND (([Naziv_Kompanije] = @original_Naziv_Kompanije) OR ([Naziv_Kompanije] IS NULL AND @original_Naziv_Kompanije IS NULL)) AND (([Vremenski_Period] = @original_Vremenski_Period) OR ([Vremenski_Period] IS NULL AND @original_Vremenski_Period IS NULL)) AND (([Kontakt_Osoba] = @original_Kontakt_Osoba) OR ([Kontakt_Osoba] IS NULL AND @original_Kontakt_Osoba IS NULL)) AND (([Broj_za_kontakt] = @original_Broj_za_kontakt) OR ([Broj_za_kontakt] IS NULL AND @original_Broj_za_kontakt IS NULL)) AND (([mejl_za_kontakt] = @original_mejl_za_kontakt) OR ([mejl_za_kontakt] IS NULL AND @original_mejl_za_kontakt IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ReklamiranjeID" Type="Int32" />
                <asp:Parameter Name="original_Opis" Type="String" />
                <asp:Parameter Name="original_Cena_po_verovatnoci" Type="Int32" />
                <asp:Parameter Name="original_Cena_samostalnog_zakupa" Type="Int32" />
                <asp:Parameter Name="original_Baner" Type="String" />
                <asp:Parameter Name="original_Naziv_Kompanije" Type="String" />
                <asp:Parameter Name="original_Vremenski_Period" Type="String" />
                <asp:Parameter Name="original_Kontakt_Osoba" Type="String" />
                <asp:Parameter Name="original_Broj_za_kontakt" Type="String" />
                <asp:Parameter Name="original_mejl_za_kontakt" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="Cena_po_verovatnoci" Type="Int32" />
                <asp:Parameter Name="Cena_samostalnog_zakupa" Type="Int32" />
                <asp:Parameter Name="Baner" Type="String" />
                <asp:Parameter Name="Naziv_Kompanije" Type="String" />
                <asp:Parameter Name="Vremenski_Period" Type="String" />
                <asp:Parameter Name="Kontakt_Osoba" Type="String" />
                <asp:Parameter Name="Broj_za_kontakt" Type="String" />
                <asp:Parameter Name="mejl_za_kontakt" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="Cena_po_verovatnoci" Type="Int32" />
                <asp:Parameter Name="Cena_samostalnog_zakupa" Type="Int32" />
                <asp:Parameter Name="Baner" Type="String" />
                <asp:Parameter Name="Naziv_Kompanije" Type="String" />
                <asp:Parameter Name="Vremenski_Period" Type="String" />
                <asp:Parameter Name="Kontakt_Osoba" Type="String" />
                <asp:Parameter Name="Broj_za_kontakt" Type="String" />
                <asp:Parameter Name="mejl_za_kontakt" Type="String" />
                <asp:Parameter Name="original_ReklamiranjeID" Type="Int32" />
                <asp:Parameter Name="original_Opis" Type="String" />
                <asp:Parameter Name="original_Cena_po_verovatnoci" Type="Int32" />
                <asp:Parameter Name="original_Cena_samostalnog_zakupa" Type="Int32" />
                <asp:Parameter Name="original_Baner" Type="String" />
                <asp:Parameter Name="original_Naziv_Kompanije" Type="String" />
                <asp:Parameter Name="original_Vremenski_Period" Type="String" />
                <asp:Parameter Name="original_Kontakt_Osoba" Type="String" />
                <asp:Parameter Name="original_Broj_za_kontakt" Type="String" />
                <asp:Parameter Name="original_mejl_za_kontakt" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewpaketi" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PaketID" 
            DataSourceID="SqlDataSourcepaketi" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriranje" />
                <asp:BoundField DataField="PaketID" HeaderText="PaketID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="PaketID" />
                <asp:BoundField DataField="NazivPaketa" HeaderText="NazivPaketa" 
                    SortExpression="NazivPaketa" />
                <asp:BoundField DataField="Slika" HeaderText="Slika" SortExpression="Slika" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcepaketi" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [Paketi] WHERE [PaketID] = @original_PaketID AND (([NazivPaketa] = @original_NazivPaketa) OR ([NazivPaketa] IS NULL AND @original_NazivPaketa IS NULL)) AND (([Slika] = @original_Slika) OR ([Slika] IS NULL AND @original_Slika IS NULL)) AND (([Opis] = @original_Opis) OR ([Opis] IS NULL AND @original_Opis IS NULL)) AND (([Cena] = @original_Cena) OR ([Cena] IS NULL AND @original_Cena IS NULL))" 
            InsertCommand="INSERT INTO [Paketi] ([NazivPaketa], [Slika], [Opis], [Cena]) VALUES (@NazivPaketa, @Slika, @Opis, @Cena)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Paketi]" 
            UpdateCommand="UPDATE [Paketi] SET [NazivPaketa] = @NazivPaketa, [Slika] = @Slika, [Opis] = @Opis, [Cena] = @Cena WHERE [PaketID] = @original_PaketID AND (([NazivPaketa] = @original_NazivPaketa) OR ([NazivPaketa] IS NULL AND @original_NazivPaketa IS NULL)) AND (([Slika] = @original_Slika) OR ([Slika] IS NULL AND @original_Slika IS NULL)) AND (([Opis] = @original_Opis) OR ([Opis] IS NULL AND @original_Opis IS NULL)) AND (([Cena] = @original_Cena) OR ([Cena] IS NULL AND @original_Cena IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_PaketID" Type="Int32" />
                <asp:Parameter Name="original_NazivPaketa" Type="String" />
                <asp:Parameter Name="original_Slika" Type="String" />
                <asp:Parameter Name="original_Opis" Type="String" />
                <asp:Parameter Name="original_Cena" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NazivPaketa" Type="String" />
                <asp:Parameter Name="Slika" Type="String" />
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="Cena" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NazivPaketa" Type="String" />
                <asp:Parameter Name="Slika" Type="String" />
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="Cena" Type="Int32" />
                <asp:Parameter Name="original_PaketID" Type="Int32" />
                <asp:Parameter Name="original_NazivPaketa" Type="String" />
                <asp:Parameter Name="original_Slika" Type="String" />
                <asp:Parameter Name="original_Opis" Type="String" />
                <asp:Parameter Name="original_Cena" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewkontakt" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idKontakt" 
            DataSourceID="SqlDataSourcekontakt" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriraj" />
                <asp:BoundField DataField="idKontakt" HeaderText="idKontakt" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idKontakt" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="Adresa" HeaderText="Adresa" 
                    SortExpression="Adresa" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:BoundField DataField="Broj_telefona" HeaderText="Broj_telefona" 
                    SortExpression="Broj_telefona" />
                <asp:BoundField DataField="Broj_mob_telefona" HeaderText="Broj_mob_telefona" 
                    SortExpression="Broj_mob_telefona" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcekontakt" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [Kontakt] WHERE [idKontakt] = @original_idKontakt AND [Opis] = @original_Opis AND [Adresa] = @original_Adresa AND [mail] = @original_mail AND [Broj_telefona] = @original_Broj_telefona AND [Broj_mob_telefona] = @original_Broj_mob_telefona" 
            InsertCommand="INSERT INTO [Kontakt] ([Opis], [Adresa], [mail], [Broj_telefona], [Broj_mob_telefona]) VALUES (@Opis, @Adresa, @mail, @Broj_telefona, @Broj_mob_telefona)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Kontakt]" 
            UpdateCommand="UPDATE [Kontakt] SET [Opis] = @Opis, [Adresa] = @Adresa, [mail] = @mail, [Broj_telefona] = @Broj_telefona, [Broj_mob_telefona] = @Broj_mob_telefona WHERE [idKontakt] = @original_idKontakt AND [Opis] = @original_Opis AND [Adresa] = @original_Adresa AND [mail] = @original_mail AND [Broj_telefona] = @original_Broj_telefona AND [Broj_mob_telefona] = @original_Broj_mob_telefona">
            <DeleteParameters>
                <asp:Parameter Name="original_idKontakt" Type="Int32" />
                <asp:Parameter Name="original_Opis" Type="String" />
                <asp:Parameter Name="original_Adresa" Type="String" />
                <asp:Parameter Name="original_mail" Type="String" />
                <asp:Parameter Name="original_Broj_telefona" Type="String" />
                <asp:Parameter Name="original_Broj_mob_telefona" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="Adresa" Type="String" />
                <asp:Parameter Name="mail" Type="String" />
                <asp:Parameter Name="Broj_telefona" Type="String" />
                <asp:Parameter Name="Broj_mob_telefona" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Opis" Type="String" />
                <asp:Parameter Name="Adresa" Type="String" />
                <asp:Parameter Name="mail" Type="String" />
                <asp:Parameter Name="Broj_telefona" Type="String" />
                <asp:Parameter Name="Broj_mob_telefona" Type="String" />
                <asp:Parameter Name="original_idKontakt" Type="Int32" />
                <asp:Parameter Name="original_Opis" Type="String" />
                <asp:Parameter Name="original_Adresa" Type="String" />
                <asp:Parameter Name="original_mail" Type="String" />
                <asp:Parameter Name="original_Broj_telefona" Type="String" />
                <asp:Parameter Name="original_Broj_mob_telefona" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewkontaktkoga" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="idKoga" DataSourceID="SqlDataSourcekontaktkoga" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" 
                    InsertText="Ubaci" NewText="Novi" SelectText="Odaberi" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="Ažuriranje" />
                <asp:BoundField DataField="idKoga" HeaderText="idKoga" InsertVisible="False" 
                    ReadOnly="True" SortExpression="idKoga" />
                <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcekontaktkoga" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            DeleteCommand="DELETE FROM [KontaktKoga] WHERE [idKoga] = @original_idKoga AND (([Naziv] = @original_Naziv) OR ([Naziv] IS NULL AND @original_Naziv IS NULL)) AND (([mail] = @original_mail) OR ([mail] IS NULL AND @original_mail IS NULL))" 
            InsertCommand="INSERT INTO [KontaktKoga] ([Naziv], [mail]) VALUES (@Naziv, @mail)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [KontaktKoga]" 
            UpdateCommand="UPDATE [KontaktKoga] SET [Naziv] = @Naziv, [mail] = @mail WHERE [idKoga] = @original_idKoga AND (([Naziv] = @original_Naziv) OR ([Naziv] IS NULL AND @original_Naziv IS NULL)) AND (([mail] = @original_mail) OR ([mail] IS NULL AND @original_mail IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_idKoga" Type="Int32" />
                <asp:Parameter Name="original_Naziv" Type="String" />
                <asp:Parameter Name="original_mail" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Naziv" Type="String" />
                <asp:Parameter Name="mail" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Naziv" Type="String" />
                <asp:Parameter Name="mail" Type="String" />
                <asp:Parameter Name="original_idKoga" Type="Int32" />
                <asp:Parameter Name="original_Naziv" Type="String" />
                <asp:Parameter Name="original_mail" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table style="width:100%;">
            <tr><td colspan="3">FORMA ZA KOGA ŽELE KLIJENTI KONTAKTIRATI</td></tr>
                            <tr>
                                <td>
                                    Naziv
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxnaziv" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBoxnaziv" ErrorMessage="Unesite Naziv." 
                                        ValidationGroup="Grupa2" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    mail
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxmail" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBoxmail" ErrorMessage="Unesite mail." 
                                        ValidationGroup="Grupa2" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBoxmail" ErrorMessage="Mail nije u dobroj formi." 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="Grupa2">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                        ValidationGroup="Grupa2" ForeColor="Red" />
                                </td>
                                <td >
                                    <asp:Button ID="Buttonkontaktkoga" runat="server" Text="Kontakt koga unos" Font-Bold="False" 
                                        ValidationGroup="Grupa2" CssClass="button" 
                                        onclick="Buttonkontaktkoga_Click"/>
                                </td>
                            </tr>
                        </table>
      </asp:Content>