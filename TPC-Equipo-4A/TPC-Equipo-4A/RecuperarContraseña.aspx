<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="TPC_Equipo_4A.RecuperarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="container d-flex flex-column justify-content-center align-items-center vh-100">
        <h1 class="mb-4">Recuperar Contraseña</h1>
        <div class="login-card">
            <form id="form1" runat="server">
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" AutoPostBack="false" required="required"></asp:TextBox>
                </div>
                <asp:Button ID="btnRecuperar" runat="server" CssClass="btn btn-primary w-100 mt-3" OnClick="btnRecuperar_Click" Text="Recuperar Contraseña" />
            </form>
            <asp:Label ID="lblMensaje" runat="server" CssClass="mt-3 text-center d-block"></asp:Label>
        </div>
    </div>

</body>
</html>
