﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPC_Equipo_4A.Turnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%if (Session["Usuario"] != null)
        { %>

    <%    if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.PersonalAdministrativo)
        {%>
    <div class="row">
        <div class="col">
            <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged">
                <asp:ListItem Text="Todos" Value="0" />
                <asp:ListItem Text="Pendiente" Value="1" />
                <asp:ListItem Text="Cancelado" Value="2" />
                <asp:ListItem Text="Reprogramado" Value="3" />
                <asp:ListItem Text="Asistió" Value="3" />
                <asp:ListItem Text="No Asistió" Value="3" />
            </asp:DropDownList>
        </div>
        <div class="col">
            <asp:TextBox ID="TxtFecha" runat="server" CssClass="form-control" TextMode="Date" required="true" AutoPostBack="true"></asp:TextBox>
        </div>
        <div>
            <br />
        <%}  %>
        <%} %>
        <%if (Session["Usuario"] != null)
            { %>

        <%    if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.Medico)
            {%>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-9">
                    <asp:GridView ID="dgvTurnosMedico" runat="server" CssClass="table table-hover tableCustom" DataKeyNames="ID_Turno" AutoGenerateColumns="false" OnRowCommand="dgvTurnosMedico_RowCommand" OnRowDatabound="dgvTurnosMedico_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="Paciente" DataField="Paciente.NombreCompleto" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="HoraFormateada" HeaderText="Hora" DataFormatString="{0:hh:mm}" HtmlEncode="false" />
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="Consulta" Text="📝" ButtonType="Button" HeaderText="Ir consulta" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <h5>Seleccione Fecha</h5>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="datePicker">Fecha:</label>
                                <input name="datePicker" type="date" id="datePicker" class="form-control" />
                            </div>
                            <div class="text-center mt-3">
                                <asp:Button ID="btnSeleccionar" runat="server" CssClass="btn btn-primary" Text="Seleccionar" OnClick="btnSeleccionar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}
            else
            { %>
          <asp:GridView ID="GvTurnos" runat="server" CssClass="table table-hover tableCustom" DataKeyNames="ID_Turno" AutoGenerateColumns="false" OnRowCommand="GvTurnos_RowCommand1" OnRowDataBound="GvTurnos_RowDataBound">

              <Columns>
                  <asp:BoundField HeaderText="Paciente" DataField="Paciente.NombreCompleto" />
                  <asp:BoundField HeaderText="Médico" DataField="Medico.NombreCompleto" />
                  <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                  <asp:BoundField DataField="HoraFormateada" HeaderText="Hora" DataFormatString="{0:hh:mm}" HtmlEncode="false" />
                  <asp:TemplateField HeaderText="Estado">
                      <ItemTemplate>
                          <asp:Label ID="lblEstado" runat="server"></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:ButtonField CommandName="Reprogramar" Text="📝" ButtonType="Button" HeaderText="Reprogramar" />
                  <asp:ButtonField CommandName="Cancelar" Text="❌" ButtonType="Button" HeaderText="Cancelar" />
              </Columns>
          </asp:GridView>
                   <div class="card">
<%--       <div class="card-header text-center">
           <h5>Seleccione Fecha</h5>
       </div>--%>
<%--       <div class="card-body">--%>
                                   

<%--           <div class="form-group">
               <label for="datePicker">Fecha:</label>
               <input name="datePicker" type="date" id="datePickerAdmin" class="form-control"    />
           </div>
           <div class="text-center mt-3">
               <asp:Button ID="BtnFecha" runat="server" CssClass="btn btn-primary" Text="Seleccionar" OnClick="btnSeleccionar_Click" />
           </div>--%>
     <%--  </div>--%>
   </div>
        <%}  %>
        <%} %>
    </div>
    <style>
        .tableCustom {
            border-radius: 9px;
            overflow: hidden;
            background-color: #a5c1d4;
        }
    </style>
</asp:Content>
