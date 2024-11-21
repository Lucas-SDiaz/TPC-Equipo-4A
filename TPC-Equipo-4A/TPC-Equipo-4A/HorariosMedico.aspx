<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HorariosMedico.aspx.cs" Inherits="TPC_Equipo_4A.HorariosMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Información del Médico</h2>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label class="form-label"><strong>Nombre del Médico:</strong></label>
                    <asp:Label ID="lblNombreMedico" runat="server" CssClass="form-control bg-light"></asp:Label>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Horarios:</strong></label>
                    <asp:Label ID="lblHorarios" runat="server" CssClass="form-control bg-light"></asp:Label>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Correo Electrónico:</strong></label>
                    <asp:Label ID="lblMail" runat="server" CssClass="form-control bg-light"></asp:Label>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Teléfono:</strong></label>
                    <asp:Label ID="lblTelefono" runat="server" CssClass="form-control bg-light"></asp:Label>
                </div>
            </div>
            <div class="card-footer text-center">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
            </div>
        </div>
    </div>
</asp:Content>
