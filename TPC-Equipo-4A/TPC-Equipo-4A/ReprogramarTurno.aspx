<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReprogramarTurno.aspx.cs" Inherits="TPC_Equipo_4A.ReprogramarTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-center">
        <div class="row align-items-center">
            <div class="col">

                <h4>Reprogramar turno</h4>
<%--                <div class="col-md-6">
                    <div class="mb-3 text-start">
                        <label for="lblPaciente" class="form-label">Paciente</label>
                        <asp:TextBox ID="txtPaciente" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="lblEspecialidad" class="form-label">Especialidad</label>
                        <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control" ReadOnly="true" AutoPostBack="true"></asp:TextBox>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="lblMedico" class="form-label">Medico</label>
                        <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
                    </div>
                </div>--%>
            </div>
            <div class="col">
                <div class="col-md-6">
                    <h4></h4>
                    <div class="mb-3 text-start">
                        <label for="lblFechaTurno" class="form-label">Fecha</label>
                        <asp:TextBox ID="txtFechaTurno" runat="server" CssClass="form-control" TextMode="Date" required="true" AutoPostBack="true"></asp:TextBox>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="lblHorario" class="form-label">Horario</label>
                        <asp:DropDownList ID="ddlHorario" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 text-center">
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary mt-4" OnClick="btnAceptar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary mt-4" OnClick="btnCancelar_Click" />
    </div>
</asp:Content>
