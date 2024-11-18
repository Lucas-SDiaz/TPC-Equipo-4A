<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_4A._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <html>
 <head>
  <title>
   Sanatorio Las Lomas
  </title>
  <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <script src="https://kit.fontawesome.com/25735b2c95.js" crossorigin="anonymous"></script>
  <style>
      body {
          font-family: Arial, sans-serif;
      }

      .header-contact {
          color: #007a3d;
          font-size: 1.2em;
      }

          .header-contact i {
              margin-right: 5px;
          }

      .main-image .centered {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          font-size: 2em;
          font-weight: bold;
      }

      .main-buttons .btn {
          width: 100%;
          margin-bottom: 10px;
          font-size: 1.2em;
      }

          .main-buttons .btn i {
              margin-right: 10px;
          }

      .footer-buttons .btn {
          width: 100%;
          margin-bottom: 10px;
          font-size: 1.2em;
      }

          .footer-buttons .btn i {
              margin-right: 10px;
          }

      .container-sm {
          max-width: 60%;
          color:darkgreen;
      }

  </style>
 </head>
 <body>

         <div class="container-sm">
                 <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
                     <div class="carousel-inner">
                         <div class="carousel-item active">
                             <img src="\Imagenes\2.jpg" class="img-fluid" height:100% alt="...">
                             <div class="carousel-caption d-none d-md-block">
                                 <h4>Sede Central</h4>
                             </div>
                         </div>
                         <div class="carousel-item">
                             <img src="\Imagenes\3.jpg" class="img-fluid" height: 100% alt="...">
                             <div class="carousel-caption d-none d-md-block">
                                 <h4>Sede Caballito</h4>
                             </div>
                         </div>
                         <div class="carousel-item">
                             <img src="\Imagenes\1.jpg" class="img-fluid" height: 100% alt="...">
                         </div>
                     </div>
                     <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
                         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                         <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
                         <span class="carousel-control-next-icon" aria-hidden="true"></span>
                         <span class="visually-hidden">Next</span>
                     </button>
                 </div>           
    </div>
   <div class="row mt-3 main-buttons">
    <div class="col-md-6">
     <a class="btn btn-success" href="Turnos.aspx">
      <i class="fas fa-calendar-alt">
      </i>
      TURNOS ONLINE
     </a>
    </div>
    <div class="col-md-6">
     <a class="btn btn-success" href="PacientesEmpleados.aspx">
     <i class="fa-solid fa-user-pen">
      </i>
      PACIENTES
     </a>
    </div>
   </div>
   <div class="row mt-3 footer-buttons">
    <div class="col-md-4">
     <a class="btn btn-success" href="MedicosABM.aspx">
      <i class="fas fa-user-md">
      </i>
      CUERPO MÉDICO
     </a>
    </div>
    <div class="col-md-4">
     <a class="btn btn-success">
      <i class="fas fa-credit-card">
      </i>
      CONSULTA DE COBERTURAS
     </a>
    </div>
    <div class="col-md-4">
     <a class="btn btn-success">
      <i class="fas fa-ambulance">
      </i>
      EMERGENCIAS
     </a>
    </div>
   </div>
 </body>

</asp:Content>
