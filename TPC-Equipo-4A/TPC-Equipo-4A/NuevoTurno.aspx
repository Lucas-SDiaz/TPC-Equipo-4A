<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoTurno.aspx.cs" Inherits="TPC_Equipo_4A.NuevoTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center">
        <form class="row g-3">
         <div class="row align-items-center">
   <div class="col">
       <!-- Información Personal -->
<div class="col-md-6">
    <h4>Información Personal</h4>
    <div class="mb-3 text-start">
        <label for="lblPaciente" class="form-label">Paciente</label>
        <asp:DropDownList id="ddlPaciente" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
    </div>
    <div class="mb-3 text-start">
        <label for="lblEspecialidad" class="form-label">Especialidad</label>
        <asp:DropDownList id="ddlEspecialidad" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
    </div>
    <div class="mb-3 text-start">
        <label for="lblMedico" class="form-label">Medico</label>
        <asp:DropDownList  id="ddlMedico" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
    </div>

</div>
   </div>  

    <div class="col">
       <!-- Domicilio -->
 <div class="col-md-6">
     <h4>Domicilio</h4>
    <div class="mb-3 text-start">
        <label for="lblFNac" class="form-label">Fecha</label>
        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
    </div>
    <div class="mb-3 text-start">
        <label for="lblFNac" class="form-label">Horario</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" required="true"></asp:TextBox>
    </div>
 </div>
    </div>
  </div>
</div>
        
            <!-- Botón de envío -->
            <div class="col-12 text-center">
                <asp:Button ID="btnAceptar" runat="server" Text="Solicitar Turno" CssClass="btn btn-primary mt-4" />
            </div>
        </form>
    </div>
</asp:Content>
