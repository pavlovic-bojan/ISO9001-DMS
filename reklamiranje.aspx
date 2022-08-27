<%@ Page Title="Upravljanje Kvalitetom | Reklamiranje" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="reklamiranje.aspx.cs" Inherits="reklamiranje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Reklamiranje</h2>
      <p></p>
        <p>      <asp:DetailsView ID="DetailsView1" runat="server" Width="90%"
           DataKeyNames="ReklamiranjeID" AutoGenerateRows="False" 
            DataSourceID="SqlDataSourcereklamiranje" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                           <Fields>
                                <asp:BoundField DataField="Opis" HeaderText="Opis" ShowHeader="False" 
                                    SortExpression="Opis" />
                                <asp:BoundField DataField="Cena_po_verovatnoci" HeaderText="Cena po verovatnoći" 
                                    SortExpression="Cena_po_verovatnoci" />
                                <asp:BoundField DataField="Cena_samostalnog_zakupa" HeaderText="Cena samostalnog zakupa" 
                                    SortExpression="Cena_samostalnog_zakupa" />
                            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourcereklamiranje" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            SelectCommand="SELECT * FROM [Reklame]"></asp:SqlDataSource></p>
            <table>
                            <tr>
                                <td colspan="3">
                                    FORMA ZA ZAKUP REKLAMNOG PROSTORA</td>
                            </tr>
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
                                    Kontakt Osoba</td>
                                <td>
                                    <asp:TextBox ID="TextBoxkontaktosoba" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBoxkontaktosoba" 
                                        ErrorMessage="Unesite osobu za kontakt." ValidationGroup="Grupa1" 
                                        ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Vremenski period u danima brojčano-primer(5)</td>
                                <td>
                                    <asp:TextBox ID="TextBoxvreme" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBoxvreme" ErrorMessage="Unesite vremenski period." 
                                        ValidationGroup="Grupa1" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                        ErrorMessage="Unesite broj telefona za kontakt." ValidationGroup="Grupa1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Unesite Baner</td>
                                <td>
                                    <asp:FileUpload ID="FileUploadbaner" runat="server" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ValidationGroup="Grupa1" ForeColor="Red" />
                                </td>
                                <td >
                                    <asp:Button ID="Buttonreklamiranje" runat="server" Text="Naruči Reklamiranje" Font-Bold="False" 
                                        ValidationGroup="Grupa1" CssClass="button" 
                                        onclick="Buttonreklamiranje_Click" Width="138px"/>
                                </td>
                            </tr>
                        </table>
      </asp:Content>


