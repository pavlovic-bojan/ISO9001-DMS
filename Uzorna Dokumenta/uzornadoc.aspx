<%@ Page Title="Upravljanje Kvalitetom | Uzorna Dokumenta" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="uzornadoc.aspx.cs" Inherits="Uzorna_Dokumenta_uzornadoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Baza sa Uzornim Dokumentima</h2>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="UzorID" DataSourceID="SqlDataSourceuzoropis" Width="90%" CellPadding="4" ForeColor="#333333" 
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
        <asp:SqlDataSource ID="SqlDataSourceuzoropis" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            SelectCommand="SELECT * FROM [UzornaDokumentaOpis]"></asp:SqlDataSource>
        <table style="width: 90%;">
              <tr>
                  <td colspan="3">
                      Forma za pretragu uzornih dokumenata
                  </td>
              </tr>
              <tr>
                  <td class="style1">
                      Pretraži po Nazivu:</td>
                  <td>

                      <asp:TextBox ID="TextBoxnaziv" runat="server"></asp:TextBox>

                  </td>
                  <td>

                      <asp:Button ID="Buttonpretraga" runat="server" Text="Pretraži" 
                          CssClass="button" />

                  </td>
              </tr>
              </table>
              <asp:GridView ID="GridViewnaziv" runat="server" AllowPaging="True" 
          AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
          DataSourceID="SqlDataSourcenaziv" ForeColor="#333333" GridLines="None">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="Broj" HeaderText="Broj" SortExpression="Broj" />
                  <asp:BoundField DataField="OznakaDoc" HeaderText="OznakaDoc" 
                      SortExpression="OznakaDoc" />
                  <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                  <asp:BoundField DataField="VremeCuvanja" HeaderText="VremeCuvanja" 
                      SortExpression="VremeCuvanja" />
                  <asp:BoundField DataField="DocIzradio" HeaderText="DocIzradio" 
                      SortExpression="DocIzradio" />
                  <asp:BoundField DataField="DocOdobrio" HeaderText="DocOdobrio" 
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
      </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourcenaziv" runat="server" 
          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          SelectCommand="SELECT [Broj], [OznakaDoc], [Naziv], [VremeCuvanja], [DocIzradio], [DocOdobrio], [Datum],[AdresaDoc] FROM [UzornaDokumenta] WHERE ([Naziv] LIKE '%' + @Naziv + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxnaziv" Name="Naziv" 
                PropertyName="Text" DefaultValue= "%" />
        </SelectParameters>
      </asp:SqlDataSource>
      </asp:Content>
