﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cartilla.aspx.cs" Inherits="TPC_Equipo_4A.Cartilla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar médico..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" OnClick="btnBuscar_Click" />
        </div>
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
            <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
            <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
            <asp:ListItem Text="Ordenar por especialidad" Value="Ordenar por especialidad"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <hr />
        <asp:GridView ID="dgvMedicos" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false">
            <columns>
                <asp:BoundField HeaderText="Nombre Y Apellido" DataField="NombreYApellido" />
                <asp:BoundField HeaderText="Email" DataField="Email" />
                <asp:BoundField HeaderText="Especialidad" DataField="Especialidades" />
                <asp:CommandField ShowSelectButton="true" SelectText="Ver turnos" />
                <%--            <asp:CommandField HeaderText="Eliminar" ShowSelectButton="true" SelectText="🗑️❌" />--%>
            </columns>
        </asp:GridView>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: dimgray;
        }
    </style>
</asp:Content>
