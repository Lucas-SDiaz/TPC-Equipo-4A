<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="FormularioEmpleadoAdmin.aspx.cs" Inherits="TPC_Equipo_4A.FormularioEmpleadoAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <%if (Request.QueryString["id_u"] == null)
        { %>
    <h2>Registrar empleado</h2>
    <%}
    else
    { %>
    <h2>Editar empleado</h2>
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
        <div class="form-group mt-3">
            <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click"/>
        </div>
    </form>
</div>
</asp:Content>
