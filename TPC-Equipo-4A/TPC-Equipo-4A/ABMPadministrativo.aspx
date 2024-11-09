<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ABMPadministrativo.aspx.cs" Inherits="TPC_Equipo_4A.ABMPadministrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar ..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" OnClick="btnBuscar_Click1"/>
        </div>
        <div>
            <asp:Button runat="server" ID="btnAgregarAdmin" Text="Agregar Administartivo" CssClass="btn btn-outline-primary" OnClick="btnAgregarAdmin_Click1" />
        </div>
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
            <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
            <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <hr />
    <asp:GridView ID="dgvAdministrativos" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false" DataKeyNames="Id_PersonalAdministrativo" OnSelectedIndexChanged="dgvAdministrativos_SelectedIndexChanged1" >
        <columns>
            <asp:BoundField HeaderText="IDusuario" DataField="Usuario.Id_Usuario"/>
            <asp:BoundField HeaderText="Legajo" DataField="Legajo" />

            <asp:BoundField HeaderText="Nombre y apellido" DataField="NombreCompleto" />
          
            <asp:BoundField HeaderText="Email" DataField="Usuario.Email" />
            <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />
            <asp:CommandField HeaderText="Eliminar" ShowSelectButton="true" SelectText="🗑️❌" />
        </columns>
    </asp:GridView>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: #a5c1d4;
        }
    </style>
</asp:Content>
