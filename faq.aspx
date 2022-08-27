<%@ Page Title="Upravljanje Kvalitetom | FAQ" Language="C#" MasterPageFile="~/UpravljanjeKvalitetom.master" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <h2> Najčešće Postavljena pitanja</h2>
      <p></p>
      <p><asp:ListView ID="ListView1" runat="server">
    <LayoutTemplate>
        <asp:PlaceHolder ID="itemPlaceHolder" runat="server">
        </asp:PlaceHolder>
    </LayoutTemplate>
    <ItemTemplate>
            <div>
               <p><%# Eval("Pitanje").ToString()%><a href='faq.aspx?id3=<%# Eval("PitanjeID") %>' style="color: #000000"> Odgovor...</a></p>
            </div>   
    </ItemTemplate>
    </asp:ListView>
    <asp:DataList ID="DataListModel" runat="server" Visible="false" Width="100%">
       <ItemTemplate>
        <div>
          <p><%# Eval("Odgovor").ToString()%></p>
         </div>   
       </ItemTemplate>
    </asp:DataList>
      </p>
      </asp:Content>


