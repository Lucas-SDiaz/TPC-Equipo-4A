<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TPC_Equipo_4A.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Administrador</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f7f9fc;">
    <div class="container my-5">
        <div class="row mb-4">
            <div class="col-md-6 mb-4">
                <div class="card shadow" style="height: 250px;">
                    <div class="card-body text-center">
                        <img src="iconoMedicos.ico" alt="Imagen" style="width: 100px; height: 100px;">
                        <h5 class="card-title mt-3">Médicos</h5>
                        <a href="MedicosABM.aspx" class="btn btn-primary">Ver más</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="card shadow" style="height: 250px;">
                    <div class="card-body text-center">
                        <img src="iconoPacientes.ico" alt="Imagen" style="width: 100px; height: 100px;">
                        <h5 class="card-title mt-3">Empleados</h5>
                        <a href="ABMPadministrativo.aspx" class="btn btn-primary">Ver más</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-3 mb-4">
                <div class="card text-white bg-info shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">Pacientes</h5>
                        <a href="Pacientes.aspx" class="btn btn-light">Ver más</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card text-white bg-info shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">Especialidades</h5>
                        <a href="#" class="btn btn-light">Ver más</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card text-white bg-info shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">????????</h5>
                        <a href="#" class="btn btn-light">Ver más</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card text-white bg-info shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">Admins del Sistema</h5>
                        <a href="#" class="btn btn-light">Ver más</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
</asp:Content>
