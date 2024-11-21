<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="TPC_Equipo_4A.RecuperarContraseña" %>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña - Clínica FRGP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #e0f2ff;
            font-family: 'Poppins', sans-serif;
        }

        .login-card {
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background-color: #f7f9fc;
            padding: 20px;
            width: 20rem;
        }

        .login-card h3 {
            color: #2c3e50;
        }

        .login-card .form-label {
            color: #34495e;
        }

        .login-card .form-control {
            border-radius: 10px;
            border: 1px solid #b0c4de;
        }

        .login-card .btn-primary {
            background-color: #3498db;
            border: none;
            border-radius: 10px;
        }

        .login-card .btn-primary:hover {
            background-color: #2980b9;
        }

        .login-card a {
            color: #2980b9;
        }

        .login-card a:hover {
            color: #1f618d;
        }

        .login-card .form-control:focus {
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            border-color: #3498db;
        }

        .titulo-clinica {
            color: #2980b9;
            font-weight: 600;
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <div class="container d-flex flex-column justify-content-center align-items-center vh-100">
        <h1 class="titulo-clinica mb-4">Clínica FRGP</h1>
        <div class="login-card">
            <div class="text-center mb-4">
                <img src="iconoClinica.ico" alt="Clinicsystem" style="width: 130px;">
            </div>
            <h3 class="text-center mb-4">Recuperar Contraseña</h3>
            <form id="form1" runat="server">
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" required="required"></asp:TextBox>
                </div>
                <asp:Button ID="btnRecuperar" runat="server" CssClass="btn btn-primary w-100 mt-3" OnClick="btnRecuperar_Click" Text="Recuperar Contraseña" />
                <asp:Button ID="btnVolverLogin" runat="server" CssClass="btn btn-primary w-100 mt-3" OnClick="btnVolverLogin_Click" Text="Volve a intentar" />
            </form>
            <asp:Label ID="lblMensaje" runat="server" CssClass="mt-3 text-center d-block"></asp:Label>
       </div>
               </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
