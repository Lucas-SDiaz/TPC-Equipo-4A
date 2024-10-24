<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarPaciente.aspx.cs" Inherits="TPC_Equipo_4A.AgregarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container mt-5">
    <form class="row g-3">
        <div class="col-md-6">
            <label for="inputNombre" class="form-label">Nombre</label>
            <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="inputApellido" class="form-label">Apellido</label>
            <asp:TextBox ID="inputApellido" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="inputDNI" class="form-label">DNI</label>
            <asp:TextBox ID="inputDNI" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="inputEmail" class="form-label">Email</label>
            <asp:TextBox ID="inputEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="inputFNac" class="form-label">Fecha de Nacimiento</label>
            <asp:TextBox ID="inputFNac" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="inputCelular" class="form-label">Celular</label>
            <asp:TextBox ID="inputCelular" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="inputTel" class="form-label">Teléfono</label>
            <asp:TextBox ID="inputTel" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
        <div class="col-12">
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />
        </div>
    </form>
</div>
</asp:Content>
