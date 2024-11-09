<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ConfirmarAccion.aspx.cs" Inherits="TPC_Equipo_4A.ConfirmarAccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Desea confirmar?</h2>
    <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
    <asp:Button  ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar"/>
</asp:Content>
