﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ABMPadministrativo.aspx.cs" Inherits="TPC_Equipo_4A.ABMPadministrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar ..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" OnClick="btnBuscar_Click1"/>
        </div>
        <div>
            <asp:Button runat="server" ID="btnAgregarAdmin" Text="Agregar Administartivo" CssClass="btn btn-outline-primary" OnClick="btnAgregarAdmin_Click"/>
        </div>
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
            <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
            <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <hr />
    <asp:GridView ID="dgvAdministrativos" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false" DataKeyNames="Id_PersonalAdministrativo" OnRowCommand="dgvAdministrativos_RowCommand" >
        <columns>
            <asp:BoundField HeaderText="Legajo" DataField="Legajo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="DNI" DataField="DNI" />
            <asp:BoundField HeaderText="Email" DataField="Usuario.Email" />
            <asp:ButtonField CommandName="Editar" Text="📝" ButtonType="Button" HeaderText="Editar"/>
            <asp:ButtonField CommandName="Eliminar" Text="🗑️❌" ButtonType="Button" HeaderText="Eliminar"/>
        </columns>
    </asp:GridView>
    <div>
        <asp:Button runat="server" ID="VerRegistrosEliminados" OnClick="VerRegistrosEliminados_Click" Text="Ver registros eliminados"/>
    </div>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: #a5c1d4;
        }
    </style>
</asp:Content>
