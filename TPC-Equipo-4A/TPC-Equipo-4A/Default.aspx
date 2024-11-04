<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_4A._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
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
                            <%--    <div class="carousel-caption d-none d-md-block">
                                    <h5>First slide label</h5>
                                    <p>Some representative placeholder content for the first slide.</p>
                                </div--%>>
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <img src="\Imagenes\2.jpeg" class="d-block w-100" alt="...">
                            <%--    <div class="carousel-caption d-none d-md-block">
                                    <h5>Second slide label</h5>
                                    <p>Some representative placeholder content for the second slide.</p>
                                </div>--%>
                            </div>
                            <div class="carousel-item">
                                <img src="\Imagenes\3.jpeg" class="d-block w-100" alt="...">
                                <%--<div class="carousel-caption d-none d-md-block">
                                    <h5>Third slide label</h5>
                                    <p>Some representative placeholder content for the third slide.</p>
                                </div>--%>
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
    </main>

</asp:Content>
