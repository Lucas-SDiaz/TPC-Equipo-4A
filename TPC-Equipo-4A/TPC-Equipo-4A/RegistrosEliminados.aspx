<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="RegistrosEliminados.aspx.cs" Inherits="TPC_Equipo_4A.RegistrosEliminados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <meta charset="utf-8" />
    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar médico..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" OnClick="btnBuscar_Click"/>
        </div>
        <%--<asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
            <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
            <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
            <asp:ListItem Text="Ordenar por especialidad" Value="Ordenar por especialidad"></asp:ListItem>
        </asp:DropDownList>--%>
    </div>
    <hr />

    <%  string urlAnterior = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
        if (urlAnterior == "ABMPadministrativo")
        {%>
            <asp:GridView ID="dgvEmpleados" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false" DataKeyNames="Id_PersonalAdministrativo" OnRowCommand="dgvEmpleados_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="IDusuario" DataField="Usuario.Id_Usuario" />
                <asp:BoundField HeaderText="Legajo" DataField="Legajo" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:BoundField HeaderText="Email" DataField="Usuario.Email" />
                <asp:BoundField HeaderText="DNI" DataField="DNI" />
                <asp:ButtonField CommandName="Restaurar" Text="Restaurar" ButtonType="Button" HeaderText="🔙" />
            </Columns>
        </asp:GridView>
     <% }       
        else if (urlAnterior == "MedicosABM")
        { %>
            <asp:GridView ID="dgvMedicos" runat="server" CssClass="table table-hover tableCustom" AutoGenerateColumns="false" DataKeyNames="Id_Medico" OnRowCommand="dgvMedicos_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText="IDusuario" DataField="Usuario.Id_Usuario" />
                    <asp:BoundField HeaderText="Legajo" DataField="Legajo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                    <asp:BoundField HeaderText="Email" DataField="Usuario.Email" />
                    <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                    <asp:BoundField HeaderText="ID_Especialidad" DataField="Especialidad.Id_Especialidad" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Especialidad.Descripcion" />
                    <asp:BoundField HeaderText="DNI" DataField="DNI" />
                    <asp:ButtonField CommandName="Restaurar" Text="Restaurar" ButtonType="Button" HeaderText="🔙" />
                </Columns>
            </asp:GridView>
    <%} %>

    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: #a5c1d4;
        }
    </style>
</asp:Content>
