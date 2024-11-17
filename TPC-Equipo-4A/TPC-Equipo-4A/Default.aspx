<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_4A._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <%--   <main>
        <div class="row">
            <section class="col-md-6" aria-labelledby="gettingStartedTitle">
                <div class="container-md">
                    <div id="carouselExampleDark" class="carousel carousel-dark slide">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <img src="\Imagenes\1.jpeg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <img src="\Imagenes\2.jpeg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="\Imagenes\3.jpeg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <div class="d-grid gap-2 col-6 mx-auto">
                    <asp:Button ID="btnSolTurno" runat="server" Text="Solicitar Turno" CssClass="btn btn-primary btn-lg" OnClick="btnSolTurno_Click" />
                    <asp:Button ID="btnCartilla" runat="server" Text="Ver Cartilla" CssClass="btn btn-primary btn-lg" OnClick="btnCartilla_Click"/>
                </div>
            </section>  
        </div>
    </main>--%>
    <html>
 <head>
  <title>
   Sanatorio Las Lomas
  </title>
  <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
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
  </style>
 </head>
 <body>

   <%--  <div class="container mt-3">--%>
         <div class="container-sm">
             <%--<div class="container-md">--%>
                 <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
                     <div class="carousel-inner">
                         <div class="carousel-item active">
                             <img src="\Imagenes\2.jpg" class="img-fluid" height:80% alt="...">
                             <div class="carousel-caption d-none d-md-block">
                                 <h5>Sede Central</h5>
                             </div>
                         </div>
                         <div class="carousel-item">
                             <img src="\Imagenes\3.jpg" class="img-fluid" height: 80% alt="...">
                             <div class="carousel-caption d-none d-md-block">
                                 <h5>Sede Caballito</h5>
                             </div>
                         </div>
                         <div class="carousel-item">
                             <img src="\Imagenes\1.jpg" class="img-fluid" height: 80% alt="...">
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
             <%--</div>--%>
<%--<section class="col-md-4" aria-labelledby="librariesTitle">--%>
<%--    <div class="d-grid gap-2 col-6 mx-auto">
        <asp:Button ID="btnSolTurno" runat="server" Text="Solicitar Turno" class="fas fa-calendar-alt" OnClick="btnSolTurno_Click" />
        <asp:Button ID="btnCartilla" runat="server" Text="Ver Cartilla" CssClass="btn btn-primary btn-lg" OnClick="btnCartilla_Click"/>
    </div>--%>
<%--</section> --%>
    </div>
 <%--  </div>--%>
   <div class="row mt-3 main-buttons">
    <div class="col-md-6">
     <a class="btn btn-success" href="Turnos.aspx">
      <i class="fas fa-calendar-alt">
      </i>
      TURNOS ONLINE
     </a>
    </div>
    <div class="col-md-6">
     <a class="btn btn-success">
      <i class="fas fa-file-medical-alt">
      </i>
      RESULTADO DE ESTUDIO
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
