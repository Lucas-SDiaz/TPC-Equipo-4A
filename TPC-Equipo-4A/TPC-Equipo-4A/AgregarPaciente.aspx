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
        <label for="inputNombre" class="form-label">Nombre</label>
        <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="inputApellido" class="form-label">Apellido</label>
        <asp:TextBox ID="inputApellido" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="inputDNI" class="form-label">DNI</label>
        <asp:TextBox ID="inputDNI" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="inputEmail" class="form-label">Email</label>
        <asp:TextBox ID="inputEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="inputFNac" class="form-label">Fecha de Nacimiento</label>
        <asp:TextBox ID="inputFNac" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="inputCelular" class="form-label">Celular</label>
        <asp:TextBox ID="inputCelular" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="inputTel" class="form-label">Teléfono</label>
        <asp:TextBox ID="inputTel" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>
</div>

   </div>  
 
    <div class="col">
       <!-- Domicilio -->
 <div class="col-md-6">
     <h4>Domicilio</h4>
     <div class="mb-3 text-start">
         <label for="inputCalle" class="form-label">Calle</label>
         <asp:TextBox ID="inputCalle" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="inputNumero" class="form-label">Número</label>
         <asp:TextBox ID="inputNumero" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="inputPiso" class="form-label">Piso</label>
         <asp:TextBox ID="inputPiso" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="inputDepto" class="form-label">Departamento</label>
         <asp:TextBox ID="inputDepto" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="inputCiudad" class="form-label">Ciudad</label>
         <asp:TextBox ID="inputCiudad" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="inputProvincia" class="form-label">Provincia</label>
         <asp:TextBox ID="inputProvincia" runat="server" CssClass="form-control" required></asp:TextBox>
     </div>
     <div class="mb-3 text-start">
         <label for="inputCodigoPostal" class="form-label">Código Postal</label>
         <asp:TextBox ID="inputCodigoPostal" runat="server" CssClass="form-control" required></asp:TextBox>
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
