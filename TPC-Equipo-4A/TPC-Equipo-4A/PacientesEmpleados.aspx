<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PacientesEmpleados.aspx.cs" Inherits="TPC_Equipo_4A.PacientesEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex justify-content-between">
        <div class="d-flex">
            <asp:TextBox ID="txtBuscar" CssClass="form-control me-2" runat="server" Placeholder="Buscar paciente..." Width="200px"></asp:TextBox>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-outline-secondary" />
        </div>
        <% if (((Dominio.Usuario)Session["Usuario"]) != null)
           {
                if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.PersonalAdministrativo)
                { %>
                    <div>
                        <asp:Button runat="server" ID="btnAgregarPaciente" Text="Agregar Paciente" CssClass="btn btn-outline-primary" OnClick="btnAgregarPaciente_Click"/>
                    </div>
                    <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="btn btn-secondary btn-sm dropdown-toggle">
                        <asp:ListItem Text="Predeterminado" Value="Predeterminado"></asp:ListItem>
                        <asp:ListItem Text="Ordenar alfabéticamente" Value="Ordenar alfabéticamente"></asp:ListItem>
                    </asp:DropDownList>
              <%}
           } %>
        </div>
        <hr />
      <%if (((Dominio.Usuario)Session["Usuario"]) != null)
        {
            if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.PersonalAdministrativo)
            {%>
                <asp:GridView ID="dgvPacientes" runat="server" CssClass="table table-hover tableCustom" DataKeyNames="Id_Paciente" AutoGenerateColumns="false" OnRowCommand="dgvPacientes_RowCommand">

                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                    <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha de Nacimiento" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                    <asp:BoundField HeaderText="DNI" DataField="DNI" />
                    <asp:BoundField HeaderText="Email" DataField="Usuario.Email" />
                    <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                    <asp:ButtonField CommandName="Editar" Text="📝" ButtonType="Button" HeaderText="Editar" />
                    <asp:ButtonField CommandName="NuevoTurno" Text="📆" ButtonType="Button" HeaderText="Nuevo turno" />
<%--                    <asp:ButtonField CommandName="Eliminar" Text="🗑️❌" ButtonType="Button" HeaderText="Eliminar" />--%>

                </Columns>
            </asp:GridView>
            <%}
   
        }%>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: #a5c1d4;
        }
    </style>
</asp:Content>
