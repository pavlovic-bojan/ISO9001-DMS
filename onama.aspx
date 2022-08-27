<%@ Page Title="Upravljanje Kvalitetom | O nama" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="onama.aspx.cs" Inherits="onama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> O nama</h2>
      <p></p>
      <p>
      <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="StranaID" DataSourceID="SqlDataSourcestranice" Width="90%" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="O_nama" HeaderText="O_nama" ShowHeader="False" 
                                    SortExpression="O_nama" />
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
      </asp:Content>


