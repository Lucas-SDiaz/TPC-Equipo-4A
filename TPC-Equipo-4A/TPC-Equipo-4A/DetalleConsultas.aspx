﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleConsultas.aspx.cs" Inherits="TPC_Equipo_4A.DetalleConsultas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
  
    </asp:DropDownList>
    <div class="container mt-5">
        <div class="accordion" id="consultaAccordion" runat="server">

        </div>
    </div>
</asp:Content>
