<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPC_Equipo_4A.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged">
            <asp:ListItem Text="Todos" Value="0" />
            <asp:ListItem Text="Pendiente" Value="1" />
            <asp:ListItem Text="Confirmado" Value="2" />
            <asp:ListItem Text="Cancelado" Value="3" />
    </asp:DropDownList>
    </div>
    <div>
        <asp:GridView ID="dgvTurnos" runat="server"  CssClass="table table-hover tableCustom" AutoGenerateColumns="False" OnRowDataBound="dgvTurnos_RowDataBound" >
            <Columns>
                <asp:BoundField HeaderText="Paciente" DataField="Paciente.NombreCompleto" />
                <asp:BoundField HeaderText="Médico" DataField="Medico.NombreCompleto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="HoraFormateada" HeaderText="Hora" DataFormatString="{0:hh:mm}" HtmlEncode="false"  />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
            </Columns>
        </asp:GridView>
    </div>
    <style>
    .tableCustom {
        border-radius: 9px;
        overflow: hidden;
        background-color: #a5c1d4;
    }
</style>
</asp:Content>
