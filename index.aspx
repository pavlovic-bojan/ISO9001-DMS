<%@ Page Title="Upravljanje Kvalitetom | Početna" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Početna</h2>
      <p></p>
      <p>
      <asp:DetailsView ID="DetailsViewstrane" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="StranaID" DataSourceID="SqlDataSourcestranice" Width="90%" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="Pocetna" HeaderText="Pocetna" ShowHeader="False" 
                                    SortExpression="Pocetna" />
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourcestranice" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>"
            SelectCommand="SELECT * FROM [Strane]"></asp:SqlDataSource>
      </p>
        <h2>Naši paketi usluga</h2>
      <p>
                  <asp:DetailsView ID="DetailsViewusluge" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="UslugaID" DataSourceID="SqlDataSourceusluga" Width="90%" CellPadding="4" ForeColor="#333333" 
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
        <asp:SqlDataSource ID="SqlDataSourceusluga" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>"
            SelectCommand="SELECT * FROM [Usluga]"></asp:SqlDataSource>
      </p>
      <p>
          &nbsp;<asp:ListView ID="ListView1" runat="server">
    <LayoutTemplate>
        <asp:PlaceHolder ID="itemPlaceHolder" runat="server">
        </asp:PlaceHolder>
    </LayoutTemplate>
    <ItemTemplate>
            <div class="news">
               <p style="font-size: medium; font-weight: bold"><%# Eval("NazivPaketa").ToString()%><a href='index.aspx?id3=<%# Eval("PaketID") %>' style="color: #000000"> Detaljnije...</a></p>
            </div>   
    </ItemTemplate>
    </asp:ListView>
    <asp:DataList ID="DataListModel" runat="server" Visible="false" Width="90%">
       <ItemTemplate>
        <div>
          <p style="font-size: medium; font-weight: bold"><%# Eval("NazivPaketa").ToString()%></p>
               <asp:Image ID="Image1" runat="server" Width="94px" Height="94px" ImageUrl='<%# (string)MakeImageUrl((string)Eval("Slika")) %>' />
               <p>Opis Usluge:&nbsp;<%# Eval("Opis").ToString()%></p>
               <p>Cena:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# Eval("Cena").ToString()%>&nbsp;EUR</p>
            <p><asp:HyperLink ID="Naruci" runat="server" CssClass="button" NavigateUrl="~/naruci.aspx" Font-Bold="True">Naruči Uslugu</asp:HyperLink></p>
       </div>   
       </ItemTemplate>
    </asp:DataList>
      </p>
      </asp:Content>


