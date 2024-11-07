<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="FormularioAdministartivos.aspx.cs" Inherits="TPC_Equipo_4A.FormularioAdministartivos" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <%if (Request.QueryString["id_u"] == null && Request.QueryString["id_m"] == null)
            { %>
        <h2>Registrar nuevo empleado</h2>
        <%}
        else
        { %>
        <h2>Editar </h2>
        <%}%>
        <form>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Nombre">Nombre</label>
                        <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Apellido">Apellido</label>
                        <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Email">Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="DNI">DNI</label>
                        <asp:TextBox ID="txtDNI" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Telefono">Teléfono</label>
                        <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
<%--                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Especialidad">Especialidad</label>
                        <asp:DropDownList runat="server" ID="ddlEspecialidad" CssClass="form-control" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>--%>
            </div>

            <div class="form-group mt-3">
                <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click"/>
            </div>
        </form>
    </div>
</asp:Content>
