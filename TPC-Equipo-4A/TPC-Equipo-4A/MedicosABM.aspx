<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="MedicosABM.aspx.cs" Inherits="TPC_Equipo_4A.MedicosABM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar médico..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" OnClick="btnBuscar_Click" />
        </div>
        <div>
            <asp:Button runat="server" ID="btnAgregarMedico" Text="Agregar Médico" CssClass="btn btn-outline-primary" OnClick="btnAgregarMedico_Click" />
        </div>
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
            <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
            <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
            <asp:ListItem Text="Ordenar por especialidad" Value="Ordenar por especialidad"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <hr />
    <asp:GridView ID="dgvMedicos" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false" DataKeyNames="Id_Medico" OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged">
        <columns>
            <asp:BoundField HeaderText="IDusuario" DataField="Usuario.Id_Usuario"/>
            <asp:BoundField HeaderText="Legajo" DataField="Legajo" />
            <asp:BoundField HeaderText="Nombre Y Apellido" DataField="NombreYApellido" />
            <asp:BoundField HeaderText="Email" DataField="Usuario.Email" />
            <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
            <asp:BoundField HeaderText="Especialidad" DataField="Especialidad.Descripcion" />
            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />
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
