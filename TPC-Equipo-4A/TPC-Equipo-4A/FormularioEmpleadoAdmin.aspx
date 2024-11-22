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
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtNombre" runat="server" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="txtNombre"
                            ErrorMessage="Solo se permiten letras"
                            ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"
                            Display="Dynamic"
                            CssClass="text-danger" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Apellido">Apellido</label>
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
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Email">Email</label>
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
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="DNI">DNI</label>

                        <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" required></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtDNI" runat="server" />
                        <asp:RegularExpressionValidator ErrorMessage="Solo números" ControlToValidate="txtDNI" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>
            </div>
    </div>
    <div class="form-group mt-3">
        <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click" />
    </div>
    </form>
</div>
</asp:Content>


