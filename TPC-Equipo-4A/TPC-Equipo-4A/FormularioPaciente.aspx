<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPaciente.aspx.cs" Inherits="TPC_Equipo_4A.AgregarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container mt-5">
    <%if (Request.QueryString["id_u"] == null && Request.QueryString["id_p"] == null)
     { %>
 <h2>Registrar Paciente</h2>
 <%}
 else
 { %>
 <h2>Editar Paciente</h2>
 <%}%>
    <form class="row g-3">
        <!-- Columna 1: Información Personal -->
        <div class="col-md-12">
            <h4 class="text-center">Información Personal</h4>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">DNI</label>
                    <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox ID="txtFNac" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-4">
    <div class="col-md-6">
        <label class="form-label">Contraseña</label>
        <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="col-md-6">
        <label class="form-label">ConfirmContraseña</label>
        <asp:TextBox ID="txtConfirmContraseña" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
</div>
        </div>
        <br />

        <!-- Columna 2: Dirección -->
        <div class="col-md-12">
            <h4 class="text-center">Dirección</h4>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Calle</label>
                    <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
               <br />
                <div class="col-md-6">
                    <label class="form-label">Número</label>
                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Piso</label>
                    <asp:TextBox ID="txtPiso" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Departamento</label>
                    <asp:TextBox ID="txtDepto" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Provincia</label>
                    <asp:TextBox ID="txtProvincia" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Ciudad</label>
                    <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Código Postal</label>
                <asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
        </div>

        <!-- Botón -->
        <div class="col-12 text-center">
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary mt-4" OnClick="btnEnviar_Click" />
        </div>
    </form>
</div>


</asp:Content>
