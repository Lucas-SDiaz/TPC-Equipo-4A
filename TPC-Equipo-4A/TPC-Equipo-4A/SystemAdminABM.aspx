<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="SystemAdminABM.aspx.cs" Inherits="TPC_Equipo_4A.SystemAdminABM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" class="form-container p-5">
        <div class="container d-flex flex-column align-items-center">
            <h2 class="mb-4 text-center">Ingresar perfil de administrador</h2>

            <div class="mb-3 w-100">
                <label for="txtEmail" class="form-label">Correo Electrónico</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control shadow-sm" placeholder="Introduce correo" required="required"></asp:TextBox>
            </div>

            <div class="mb-3 w-100">
                <label for="txtPassword" class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control shadow-sm" TextMode="Password" placeholder="Introduce contraseña" required="required"></asp:TextBox>
            </div>
            <div class="mb-3 w-20">
                <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary btn-lg w-100" OnClick="btnAgregar_Click" Text="Agregar" />
            </div>

            <div class="mb-3 w-20">
                <asp:Button ID="btnVerUsuarios" runat="server" CssClass="btn btn-primary btn-lg w-100" OnClick="btnVerUsuarios_Click" Text="Ver usuarios con permisos" />
            </div>
            <div class="mb-3 w-100">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                    <asp:Label ID="lblMensajeEmail" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
<%--                <label id="lblMensaje" for="txtPassword" class="form-label"></label>--%>
            </div>
        </div>
    </form>
</asp:Content>
