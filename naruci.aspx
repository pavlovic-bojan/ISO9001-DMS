<%@ Page Title="Upravljanje Kvalitetom | Naručivanje" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="naruci.aspx.cs" Inherits="naruci" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Strana za naručivanje paketa usluge</h2>
        <p></p>
        <p>
         <asp:DetailsView ID="DetailsView1" runat="server" Width="90%"
           DataKeyNames="NarucivanjeID" AutoGenerateRows="False" 
            DataSourceID="SqlDataSourcenarucivanje" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
                                <asp:BoundField DataField="Opis" HeaderText="Opis" ShowHeader="False" 
                                    SortExpression="Opis" />
                            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourcenarucivanje" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            SelectCommand="SELECT * FROM [Naruci]"></asp:SqlDataSource></p>

            <table style="width:90%;">
            <tr><td colspan="3">FORMA ZA NARUČIVANJE USLUGA</td></tr>
                            <tr>
                                <td>
                                    Naziv Kompanije
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxnaziv" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxnaziv" ErrorMessage="Unesite naziv kompanije." 
                                        ValidationGroup="Grupa" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                        ValidationGroup="Grupa" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBoxmeil" ErrorMessage="Meil je u pogrešnoj formi." 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="Grupa" ForeColor="Red">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Kontakt Osoba</td>
                                <td>
                                    <asp:TextBox ID="TextBoxkontaktosoba" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBoxkontaktosoba" 
                                        ErrorMessage="Unesite osobu za kontakt." ValidationGroup="Grupa" 
                                        ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Unesite broj telefona u formi (0603434794)</td>
                                <td>
                                    <asp:TextBox ID="TextBoxtelefon" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="TextBoxtelefon" 
                                        ErrorMessage="Unesite broj telefona za kontakt." ValidationGroup="Grupa">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ValidationGroup="Grupa" ForeColor="Red" />
                                </td>
                                <td >
                                    <asp:Button ID="narucivanjeusluge" runat="server" Text="Naruči Uslugu" Font-Bold="False" 
                                        ValidationGroup="Grupa" CssClass="button" 
                                        onclick="Buttonreklamiranje_Click"/>
                                </td>
                            </tr>
                        </table>
      </asp:Content>


