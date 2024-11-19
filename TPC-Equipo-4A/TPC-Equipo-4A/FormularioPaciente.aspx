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
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtNombre" runat="server" />
                    <asp:RegularExpressionValidator 
    ID="revNombre" 
    runat="server" 
    ControlToValidate="txtNombre" 
    ErrorMessage="Solo se permiten letras" 
    ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" 
    Display="Dynamic" 
    CssClass="text-danger" />

                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" Required=""></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtApellido" runat="server" />
                                    <asp:RegularExpressionValidator 
ID="revApellido" 
runat="server" 
ControlToValidate="txtApellido" 
ErrorMessage="Solo se permiten letras" 
ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" 
Display="Dynamic" 
CssClass="text-danger" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">DNI</label>
                    <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" required></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtDNI" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo números" ControlToValidate="txtDNI" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox ID="txtFNac" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtFNac" runat="server" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" required></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtTelefono" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo números" ControlToValidate="txtTelefono" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator 
    ErrorMessage="Solo formato email" 
    ControlToValidate="txtEmail" 
    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" 
    runat="server" 
    Display="Dynamic" 
    CssClass="text-danger" />
                </div>
            </div>
            <div class="row mb-4">
    <div class="col-md-6">
        <label class="form-label">Contraseña</label>
        <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
        <asp:RegularExpressionValidator 
            ID="revContraseña" 
            runat="server" 
            ControlToValidate="txtContraseña" 
            ErrorMessage="La contraseña debe tener al menos 8 caracteres y un número" 
            ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z]).{8,}$" 
            Display="Dynamic" 
            CssClass="text-danger" />
    </div>
    <div class="col-md-6">
        <label class="form-label">ConfirmContraseña</label>
        <asp:TextBox ID="txtConfirmContraseña" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
        <asp:CompareValidator 
            ID="cvConfirmContraseña" 
            runat="server" 
            ControlToValidate="txtConfirmContraseña" 
            ControlToCompare="txtContraseña" 
            ErrorMessage="Las contraseñas no coinciden" 
            Display="Dynamic" 
            CssClass="text-danger" />
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
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtCalle" runat="server" />
                </div>
               <br />
                <div class="col-md-6">
                    <label class="form-label">Número</label>
                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" required></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtNumero" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo números" ControlToValidate="txtNumero" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" CssClass="text-danger" />
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
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtProvincia" runat="server" />
                                                        <asp:RegularExpressionValidator 
ID="revProvincia" 
runat="server" 
ControlToValidate="txtProvincia" 
ErrorMessage="Solo se permiten letras" 
ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" 
Display="Dynamic" 
CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Ciudad</label>
                    <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" required></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtCiudad" runat="server" />
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Código Postal</label>
                <asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="form-control" required></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtCodigoPostal" runat="server" />
            </div>
        </div>

        <!-- Botón -->
        <div class="col-12 text-center">
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary mt-4" OnClick="btnEnviar_Click" />
        </div>
    </form>
</div>


</asp:Content>
