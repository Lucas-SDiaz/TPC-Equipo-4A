<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPC_Equipo_4A.Error" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error de Inicio de Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e0f2ff;
            font-family: 'Poppins', sans-serif;
        }

        .error-card {
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background-color: #f7f9fc;
            padding: 20px;
            width: 22rem;
            text-align: center;
        }

        .error-card h3 {
            color: #2c3e50;
        }

        .error-card .message {
            color: #c0392b;
            font-size: 1.2rem;
        }

        .error-card .btn-primary {
            background-color: #3498db;
            border: none;
            border-radius: 10px;
        }

        .error-card .btn-primary:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="error-card">
            <h3>Error</h3>
            <p class="message">Usuario o Contraseña Incorrectos</p>
            <a href="Login.aspx" class="btn btn-primary mt-3">Volver al Login</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>