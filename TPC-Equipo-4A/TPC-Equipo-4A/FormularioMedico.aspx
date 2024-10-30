<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="FormularioMedico.aspx.cs" Inherits="TPC_Equipo_4A.FormularioMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <%if(Request.QueryString["id"] == null){ %>
            <h2>Registrar Médico</h2>
        <%}else{ %>
            <h2>Editar Médico</h2>
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
                <%if (Request.QueryString["id"]==null) { %>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Especialidad">Especialidad</label>
                            <asp:DropDownList ID="Especialidad" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Seleccione una especialidad" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                <%} %>
            </div>

            <div class="form-group mt-3">
                <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click" />
            </div>
        </form>
    </div>
</asp:Content>
