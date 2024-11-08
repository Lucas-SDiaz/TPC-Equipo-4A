<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="EspecialidadesABM.aspx.cs" Inherits="TPC_Equipo_4A.EspecialidadesABM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar especialidad" Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" OnClick="btnBuscar_Click" />
        </div>
        <div>
            <asp:Button runat="server" ID="btnAgregarEspecialidad" Text="Agregar Especialidad" CssClass="btn btn-outline-primary" OnClick="btnAgregarEspecialidad_Click"/>
        </div>
    </div>
    <hr />
    <asp:GridView ID="dgvEspecialidades" runat="server" CssClass="table table-hover tableCustom" OnRowCreated="dgvEspecialidades_RowCreated" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvEspecialidades_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="Id_Especialidad" OnSelectedIndexChanged="dgvEspecialidades_SelectedIndexChanged">
        <columns>
            <asp:BoundField HeaderText="Especialidad" DataField="Descripcion" />
            <asp:CommandField HeaderText="Eliminar" ShowSelectButton="true" SelectText="🗑️❌" />
        </columns>
    </asp:GridView>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: #a5c1d4;
        }
        .gridview-pagination .pagination {
            display: flex;
            justify-content: center;
        }
    </style>
</asp:Content>
