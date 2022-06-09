﻿<%@ Page Title="Twoje przejazdy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="przejazdy.aspx.cs" Inherits="Projekt_autobus.przejazdy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Matrobusy %>" SelectCommand="SELECT [P_poczatkowy] AS Skąd, [P_koncowy] AS Dokąd, [Dzien] AS Dzień, [Godzina], [CzyZatwierdzony] AS Zgoda, [CzyOplacony] AS Płatność FROM [Przejazdy] WHERE (([Id_user] = @Id_user) AND ([Dzien] &gt; @Dzien))">
        <SelectParameters>
            <asp:SessionParameter Name="Id_user" SessionField="id_user" Type="Int32" />
            <asp:SessionParameter Name="Dzien" SessionField="aktualny_czas" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Matrobusy %>" SelectCommand="SELECT        dbo.Przystanki_p.P_poczatkowe AS Skąd, dbo.Przystanki_k.P_koncowe AS Dokąd, dbo.Przejazdy.Dzien AS Dzień, dbo.Przejazdy.Godzina, dbo.Przejazdy.CzyZatwierdzony AS Zgoda, 
                         dbo.Przejazdy.CzyOplacony AS Płatność
FROM            dbo.Przejazdy INNER JOIN
                         dbo.Przystanki_k ON dbo.Przejazdy.P_koncowy = dbo.Przystanki_k.Id_przystanku INNER JOIN
                         dbo.Przystanki_p ON dbo.Przejazdy.P_poczatkowy = dbo.Przystanki_p.Id_przystanku"></asp:SqlDataSource>

    <div class="container">
        <div class="row">
            <div class="col text-center">
                <h2>Twoje aktywne przejazdy</h2>
            </div>
        </div> 
        <div class="row">
            <div class="col text">
                <asp:GridView style="margin-left: auto; margin-right: auto; font-size: 12px;" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="Skąd" HeaderText="Skąd" SortExpression="Skąd" />
                        <asp:BoundField DataField="Dokąd" HeaderText="Dokąd" SortExpression="Dokąd" />
                        <asp:BoundField DataField="Dzień" HeaderText="Dzień" SortExpression="Dzień" />
                        <asp:BoundField DataField="Godzina" HeaderText="Godzina" SortExpression="Godzina" />
                        <asp:CheckBoxField DataField="Zgoda" HeaderText="Zgoda" SortExpression="Zgoda" />
                        <asp:CheckBoxField DataField="Płatność" HeaderText="Płatność" SortExpression="Płatność" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:Button style="margin-top: 20px;" class="btn btn-outline-secondary" ID="Button1" runat="server" Text="Powrót" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
