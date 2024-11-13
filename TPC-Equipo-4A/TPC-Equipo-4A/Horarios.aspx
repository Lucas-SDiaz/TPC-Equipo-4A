<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="TPC_Equipo_4A.Horarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h4 class="text-center">Configuración de Horarios de Médico</h4>
        <form class="mt-4">
            <div class="row mb-3 align-items-center">
                <div class="col-2 text-end">
                    <asp:CheckBox ID="chkLunes" runat="server" Text="Lunes" CssClass="form-check-input" OnCheckedChanged="chkLunes_CheckedChanged" AutoPostBack="True" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlEntradaLunes" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Entrada" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlSalidaLunes" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Salida" Value="" />
                    </asp:DropDownList>
                </div>
            </div><br />
            <div class="row mb-3 align-items-center">
                <div class="col-2 text-end">
                    <asp:CheckBox ID="chkMartes" runat="server" Text="Martes" CssClass="form-check-input" OnCheckedChanged="chkLunes_CheckedChanged" AutoPostBack="True" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlEntradaMartes" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Entrada" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlSalidaMartes" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Salida" Value="" />
                    </asp:DropDownList>
                </div>
            </div><br />
            <div class="row mb-3 align-items-center">
                <div class="col-2 text-end">
                    <asp:CheckBox ID="chkMiercoles" runat="server" Text="Miercoles" CssClass="form-check-input" OnCheckedChanged="chkLunes_CheckedChanged" AutoPostBack="True" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlEntradaMiercoles" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Entrada" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlSalidaMiercoles" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Salida" Value="" />
                    </asp:DropDownList>
                </div>
            </div><br />
            <div class="row mb-3 align-items-center">
                <div class="col-2 text-end">
                    <asp:CheckBox ID="chkJueves" runat="server" Text="Jueves" CssClass="form-check-input" OnCheckedChanged="chkLunes_CheckedChanged" AutoPostBack="True" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlEntradaJueves" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Entrada" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlSalidaJueves" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Salida" Value="" />
                    </asp:DropDownList>
                </div>
            </div><br />
            <div class="row mb-3 align-items-center">
                <div class="col-2 text-end">
                    <asp:CheckBox ID="chkViernes" runat="server" Text="Viernes" CssClass="form-check-input" OnCheckedChanged="chkLunes_CheckedChanged" AutoPostBack="True" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlEntradaViernes" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Entrada" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlSalidaViernes" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Salida" Value="" />
                    </asp:DropDownList>
                </div>
            </div><br />
            <div class="row mb-3 align-items-center">
                <div class="col-2 text-end">
                    <asp:CheckBox ID="chkSabado" runat="server" Text="Sabado" CssClass="form-check-input" OnCheckedChanged="chkLunes_CheckedChanged" AutoPostBack="True" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlEntradaSabado" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Entrada" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="ddlSalidaSabado" runat="server" CssClass="form-select" Enabled="false">
                        <asp:ListItem Text="Hora de Salida" Value="" />
                    </asp:DropDownList>
                </div>
            </div><br />


            <div class="text-center mt-4">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
            </div>
        </form>
    </div>
</asp:Content>
