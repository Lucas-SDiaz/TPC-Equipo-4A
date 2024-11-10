<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="DetallePaciente.aspx.cs" Inherits="TPC_Equipo_4A.DetallePaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-5">
    <div class="row">
        <!-- Card de información del paciente -->
        <div class="col-lg-8 col-md-10 col-sm-12 mx-auto">
            <div class="card">
                <div class="card-header bg-info text-white">
                    <h4>Información del Paciente</h4>
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <strong>Nombre y Apellido:</strong>
                            <asp:Label ID="lblNombreApellido" runat="server" CssClass="form-control-plaintext"></asp:Label>
                        </div>
                        <div class="mb-3">
                            <strong>Fecha de Nacimiento:</strong>
                            <asp:Label ID="lblFechaNacimiento" runat="server" CssClass="form-control-plaintext"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <strong>Email:</strong>
                            <asp:Label ID="lblEmail" runat="server" CssClass="form-control-plaintext"></asp:Label>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <strong>Teléfono:</strong>
                            <asp:Label ID="lblTelefono" runat="server" CssClass="form-control-plaintext"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <strong>Fecha de Registro:</strong>
                            <asp:Label ID="lblFechaRegistro" runat="server" CssClass="form-control-plaintext"></asp:Label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <strong>Dirección:</strong>
                        <asp:Label ID="lblDireccion" runat="server" CssClass="form-control-plaintext"></asp:Label>
                    </div>
                    <!-- Botón para Historial de Turnos -->
                    <a href="#" class="btn btn-primary">Historial de Turnos</a>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
