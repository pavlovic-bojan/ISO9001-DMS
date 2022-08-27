<%@ Page Title="Upravljanje Kvalitetom | Greška 404" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="greska404.aspx.cs" Inherits="greska404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Greška 404</h2>
      <p></p>
      <p>
      <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="idGreska" DataSourceID="SqlDataSourcegreska" Width="90%" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="Greska404" HeaderText="Greska404" ShowHeader="False" 
                                    SortExpression="Greska404" />
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourcegreska" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
            SelectCommand="SELECT * FROM [Greska]"></asp:SqlDataSource>
      </p>
      <p><asp:HyperLink ID="HyperLinkpovrataknapocetnu" runat="server" NavigateUrl="~/index.aspx">Povratak na Početnu stranu</asp:HyperLink></p>
      </asp:Content>