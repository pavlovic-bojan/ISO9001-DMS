<%@ Page Title="Upravljanje Kvalitetom | Kontakt" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="kontakt.aspx.cs" Inherits="kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Kontakt</h2>
      <p></p>
      <p>
      <asp:DetailsView ID="DetailsView1" runat="server" Width="90%"
           DataKeyNames="idKontakt" AutoGenerateRows="False" 
            DataSourceID="SqlDataSourcekontakt" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
                                <asp:BoundField DataField="Opis" HeaderText="Opis" ShowHeader="False" 
                                    SortExpression="Opis" />
                                <asp:BoundField DataField="Broj_telefona" HeaderText="Broj Telefona" 
                                    SortExpression="Broj_telefona" />
                                <asp:BoundField DataField="Broj_mob_telefona" HeaderText="Broj Mob. Telefona" 
                                    SortExpression="Broj_mob_telefona" />
                                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                                <asp:BoundField DataField="Adresa" HeaderText="Adresa" 
                                    SortExpression="Adresa" />
                            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourcekontakt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            SelectCommand="SELECT * FROM [Kontakt]"></asp:SqlDataSource>
      </p>
      <table style=Width="90%">
                            <tr>
                                <td colspan="3">
                                    FORMA ZA KONTAKT</td>
                            </tr>
                            <tr>
                                <td>
                                    Ime i prezime
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxime" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxime" ErrorMessage="Unesite ime i prezime." 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Meil
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxmeil" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBoxmeil" ErrorMessage="Unesite meil." 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBoxmeil" ErrorMessage="Meil je u pogrešnoj formi." 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Koga želite kontaktirati:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="Naziv" DataValueField="mail">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
                                        SelectCommand="SELECT * FROM [KontaktKoga]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                        ControlToValidate="DropDownList1" 
                                        ErrorMessage="Niste odabrali koga želite da kontaktirate." 
                                        onservervalidate="CustomValidator1_ServerValidate" 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Naslov poruke</td>
                                <td>
                                    <asp:TextBox ID="TextBoxnaslovporuke" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBoxnaslovporuke" 
                                        ErrorMessage="Unesite naslov poruke." ValidationGroup="Grupa1" 
                                        ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Poruka</td>
                                <td>
                                    <asp:TextBox ID="TextBoxporuka" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBoxporuka" ErrorMessage="Unesite poruku." 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ValidationGroup="Grupa1" ForeColor="Red" />
                                </td>
                                <td >
                                    <asp:Button ID="Buttonposalji" runat="server" Text="Pošalji" Font-Bold="False" 
                                        ValidationGroup="Grupa1" CssClass="button"/>
                                </td>
                            </tr>
                        </table>
      </asp:Content>


