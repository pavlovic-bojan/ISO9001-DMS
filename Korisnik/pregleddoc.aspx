<%@ Page Title= "Upravljanje Kvalitetom | Pregled Dokumenata" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="pregleddoc.aspx.cs" Inherits="Korisnik_pregleddoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 168px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Pregled Dokumenata</h2>
          <table style="width: 90%;">
              <tr>
                  <td colspan="3">
                      Forma za pretragu dokumenata
                  </td>
              </tr>
              <tr>
                  <td class="style1">
                      Pretraži po Broju:</td>
                  <td>
                      <asp:TextBox ID="TextBoxbroj" runat="server"></asp:TextBox>
                  </td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style1">
                      Pretraži po Oznaci:</td>
                  <td>

                      <asp:TextBox ID="TextBoxoznaka" runat="server"></asp:TextBox>

                  </td>
                  <td>
                      &nbsp;
                  </td>
              </tr>
              <tr>
                  <td class="style1">
                      Pretraži po Nazivu:</td>
                  <td>

                      <asp:TextBox ID="TextBoxnaziv" runat="server"></asp:TextBox>

                  </td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style1">
                      Pretraži po Datumu:</td>
                  <td>

                      <asp:TextBox ID="TextBoxdatum" runat="server"></asp:TextBox>

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
          SelectCommand="SELECT [Broj], [OznakaDoc], [Naziv], [VremeCuvanja], [DocIzradio], [DocOdobrio], [Datum],[AdresaDoc] FROM [Dokumenta] WHERE ([Naziv] LIKE '%' + @Naziv + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxnaziv" Name="Naziv" 
                PropertyName="Text" />
        </SelectParameters>
      </asp:SqlDataSource>
    <asp:GridView ID="GridViewbroj" runat="server" AllowPaging="True" 
          AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
          DataSourceID="SqlDataSourcebroj" GridLines="Vertical" BackColor="White" 
          BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
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
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSourcebroj" runat="server" 
          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          SelectCommand="SELECT [Broj], [OznakaDoc], [Naziv], [VremeCuvanja], [DocIzradio], [DocOdobrio], [Datum],[AdresaDoc] FROM [Dokumenta] WHERE ([Broj] LIKE '%' + @Broj + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxbroj" Name="Broj" 
                PropertyName="Text" />
        </SelectParameters>
      </asp:SqlDataSource>
    <asp:GridView ID="GridViewoznaka" runat="server" AllowPaging="True" 
          AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
          DataSourceID="SqlDataSourceoznaka" BackColor="#DEBA84" 
          BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
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
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView> 
    <asp:SqlDataSource ID="SqlDataSourceoznaka" runat="server"          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          SelectCommand="SELECT [Broj], [OznakaDoc], [Naziv], [VremeCuvanja], [DocIzradio], [DocOdobrio], [Datum],[AdresaDoc] FROM [Dokumenta] WHERE ([OznakaDoc] LIKE '%' + @OznakaDoc + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxoznaka" Name="OznakaDoc" 
                PropertyName="Text" />
        </SelectParameters></asp:SqlDataSource>  
    <asp:GridView ID="GridViewdatum" runat="server" AllowPaging="True" 
          AllowSorting="True" AutoGenerateColumns="False" CellPadding="2" 
          DataSourceID="SqlDataSourcedatum" ForeColor="Black" GridLines="None" 
          BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
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
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView> 
          <asp:SqlDataSource ID="SqlDataSourcedatum" runat="server"          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          SelectCommand="SELECT [Broj], [OznakaDoc], [Naziv], [VremeCuvanja], [DocIzradio], [DocOdobrio], [Datum],[AdresaDoc] FROM [Dokumenta] WHERE ([Datum] LIKE '%' + @Datum + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxdatum" Name="Datum" 
                PropertyName="Text" />
        </SelectParameters></asp:SqlDataSource>  
          </asp:Content>