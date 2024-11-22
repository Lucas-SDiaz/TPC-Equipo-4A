<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminSistemaAMB.aspx.cs" Inherits="TPC_Equipo_4A.AdminSistemaAMB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="btnAgregarAdmin" runat="server" CssClass="btn btn-primary" OnClick="btnAgregarAdmin_Click" Text="Agregar" />
    </div>
    <asp:GridView ID="dgvAdminSistema" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false" DataKeyNames="Id_Usuario" OnRowCommand="dgvAdministrativos_RowCommand" >
    <columns>
        <asp:BoundField HeaderText="Email" DataField="Email" />
        <asp:ButtonField CommandName="Eliminar" Text="🗑️❌" ButtonType="Button" HeaderText="Eliminar"/>
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

 