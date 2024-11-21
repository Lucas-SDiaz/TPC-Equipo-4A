<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="insertExitoso.aspx.cs" Inherits="TPC_Equipo_4A.insertExitoso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (Session["accionExitosa"].ToString() == "Registro ingresado exitosamente!")
        { %>
            <div>
                <h2>Registro ingresado exitosamente!</h2>
            </div>
            <div>
                <asp:Button ID="brnHorarios" Text="Cargar Horarios" CssClass="btn btn-primary" runat="server" OnClick="brnHorarios_Click"/>
            </div>
    <%}
        else if (Session["accionExitosa"].ToString() == "Registro modificado exitosamente!")
        { %>
    <div>
         <h2>Registro modificado exitosamente!</h2>
    </div>
        <div>
              <asp:Button ID="btnMedicosABM" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnMedicosABM_Click" />
        </div>
            <%}
        else if (Session["HorarioExitoso"].ToString() == "Carga de horarios exitosa!")
        {%>
            <h2>Carga de horarios exitosa!</h2>
     <% }%>
</asp:Content>
