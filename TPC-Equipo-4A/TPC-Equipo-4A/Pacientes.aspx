<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="TPC_Equipo_4A.Pacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between">
        <asp:Button runat="server" ID="btnAgregarPaciente" Text="Agregar paciente" OnClick="btnAgregarPaciente_Click" CssClass="btn btn-secondary" />
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar paciente..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" />
        </div>
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
            <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
            <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <hr />
    <asp:GridView ID="dgvPacientes" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Nombre Y Apellido" DataField="NombreYApellido" />
            <asp:BoundField HeaderText="DNI" DataField="DNI" />
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Celular" DataField="Celular" />
            <asp:BoundField HeaderText="Fecha de nacimiento" DataField="FechaNacimiento" />
            <asp:CommandField HeaderText="Modificar" ShowSelectButton="true" SelectText="📝" />
            <asp:CommandField HeaderText="Eliminar" ShowSelectButton="true" SelectText="🗑️❌" />
        </Columns>
    </asp:GridView>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: dimgray;
        }
    </style>
</asp:Content>
