<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="insertExitoso.aspx.cs" Inherits="TPC_Equipo_4A.insertExitoso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if(Session["accionExitosa"].ToString() == "Registro ingresado exitosamente!")
      { %>
         <h2>Registro ingresado exitosamente!</h2>  
    <%}
      else if(Session["accionExitosa"].ToString() == "Registro modificado exitosamente!")
      { %>
         <h2>Registro modificado exitosamente!</h2>
    <%} %>
</asp:Content>
