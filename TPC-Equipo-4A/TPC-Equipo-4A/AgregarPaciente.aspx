<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarPaciente.aspx.cs" Inherits="TPC_Equipo_4A.AgregarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center">
        <form class="row g-3">
         <div class="row align-items-center">
   <div class="col">
       <!-- Información Personal -->
<div class="col-md-6">
    <h4>Información Personal</h4>
    <div class="mb-3 text-start">
        <label for="lblNombre" class="form-label">Nombre</label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="lblApellido" class="form-label">Apellido</label>
        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="lblDNI" class="form-label">DNI</label>
        <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="lblFNac" class="form-label">Fecha de Nacimiento</label>
        <asp:TextBox ID="txtFNac" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="lblTelefono" class="form-label">Teléfono</label>
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
    <label for="lblEmail" class="form-label">Email</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
</div>
    <div class="mb-3 text-start">
    <label for="lblPassword" class="form-label">Contraseña</label>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required placeholder="Ingrese una contraseña"></asp:TextBox>
</div>
<div class="mb-3 text-start">
    <label for="lblConfirmPassword" class="form-label">Confirmar Contraseña</label>
    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" required placeholder="Confirme su contraseña"></asp:TextBox>
</div>
</div>

   </div>  
 
    <div class="col">
       <!-- Domicilio -->
 <div class="col-md-6">
     <h4>Domicilio</h4>
     <div class="mb-3 text-start">
         <label for="lblCalle" class="form-label">Calle</label>
         <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="lblNumero" class="form-label">Número</label>
         <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="lblPiso" class="form-label">Piso</label>
         <asp:TextBox ID="txtPiso" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="lblDepto" class="form-label">Departamento</label>
         <asp:TextBox ID="txtDepto" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="lblCiudad" class="form-label">Ciudad</label>
         <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="lblProvincia" class="form-label">Provincia</label>
         <asp:TextBox ID="txtProvincia" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="lblCodigoPostal" class="form-label">Código Postal</label>
         <asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
 </div>
    </div>
  </div>
</div>
        
            <!-- Botón de envío -->
            <div class="col-12 text-center">
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary mt-4" OnClick="btnEnviar_Click" />
            </div>
        </form>
    </div>
</asp:Content>