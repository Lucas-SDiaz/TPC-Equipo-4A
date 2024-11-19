<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaConsulta.aspx.cs" Inherits="TPC_Equipo_4A.NuevaConsulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 p-4 rounded shadow bg-light">
        <h2 class="text-center mb-4 text-primary">Nueva Consulta</h2>
        <form id="formConsulta">
            <div class="row">
                <div class="col-md-4">
                    <label for="txtPaciente" class="form-label fw-bold">Paciente</label>
                    <asp:TextBox ID="txtPaciente" CssClass="form-control border-primary" ReadOnly="True" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="txtFecha" class="form-label fw-bold">Fecha</label>
                    <asp:TextBox ID="txtFecha" CssClass="form-control border-primary" ReadOnly="True" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="txtMedico" class="form-label fw-bold">Médico</label>
                    <asp:TextBox ID="txtMedico" CssClass="form-control border-primary" ReadOnly="True" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <label for="txtDiagnostico" class="form-label fw-bold">Diagnóstico</label>
                    <asp:TextBox ID="txtDiagnostico" CssClass="form-control border-info" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="txtTratamiento" class="form-label fw-bold">Tratamiento</label>
                    <asp:TextBox ID="txtTratamiento" CssClass="form-control border-info" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <label for="txtComentarios" class="form-label fw-bold">Comentarios</label>
                    <asp:TextBox ID="txtComentarios" CssClass="form-control border-info" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
            </div>
        </form> <br /> <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Button runat="server" ID="btnGuardarConsulta" CssClass="btn btn-outline-primary" OnClick="btnGuardarConsulta_Click" Text="Guadar consulta" />
            </div>
        </div>
    </div>
</asp:Content>
