<%-- 
    Document   : index.jsp
    Created on : 01-06-2022, 11:34:52 PM
    Author     : miguel
--%>

<%@page import="com.miguel.filmproject.model.User"%>
<%@page import="com.miguel.filmproject.dao.moviedao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.miguel.filmproject.model.Movie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Movie> allmovies = (List<Movie>) request.getAttribute("allmovies");
    List<Movie> action = (List<Movie>) request.getAttribute("action");
    List<Movie> horror = (List<Movie>) request.getAttribute("horror");
    List<Movie> drama = (List<Movie>) request.getAttribute("drama");
    List<Movie> comedy = (List<Movie>) request.getAttribute("comedy");
    List<Movie> history = (List<Movie>) request.getAttribute("history");

    User user = null;
    if (request.getAttribute("user") != null) {
        user = (User) request.getAttribute("user");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/homestyles.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Home</title>
    </head>
    <body>
        <header class="position-sticky px-0 mx-0" style="top:0; z-index: 100; background-color: #2b2b31;
                box-shadow: 0px 0px 30px black">

            <div class="navbar-main container">
                <nav class="navbar navbar-expand-lg position-relative d-flex align-items-center">
                    <a class="navbar-brand" href="/"><img style="width: 6em;" src="assets/static/logo_multicine.png"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i style="color: #0AC;
                           font-size: 2.5em" class="large material-icons">menu</i>
                    </button>

                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto ">
                            <li class="nav-item active">
                                <a class="nav-link mx-2" href="/">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-2" href="movies">Movies</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-2" href="#">About</a>
                            </li>
                        </ul>
                        <c:choose>
                            <c:when test="<%= user == null%>">
                                <a href="login"
                                   style="width: 150px"
                                   class="btn btn-custom d-block" 
                                   >LOGIN
                                </a>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <h4 style="
                                        font-size: 1em;
                                        color: #BBB;
                                        cursor: pointer;"
                                        class="d-flex align-items-center px-0 mx-0">
                                        <i class="large material-icons custom-icon mx-0 px-0">person</i>
                                        <%= user.getName()%>
                                    </h4> 
                                    <div class="dropdown-content">
                                        <c:choose>
                                            <c:when test="${user.isAdmin()==true}">
                                                <a href="dashboard">Dashboard</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="user">My account</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <a href="home?out=true">Log out</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </nav>
            </div>
        </header>
        <main>
            <div class="position-relative">
                <div class="img-background bg-dark">
                    <div id="carouselExampleSlidesOnly" class="carousel slide h-100" data-ride="carousel">
                        <div class="carousel-inner h-100">
                            <div class="carousel-item active thumb"
                                 style="background-image: url('https://www.gndiario.com/sites/default/files/styles/noticia_detalle_noticia_2_1/public/noticias/mejores-peliculas-2022%20%281%29.jpg?h=bf005dea&itok=nNcL1zx7') !important;
                                 ">
                            </div>
                            <div class="carousel-item thumb"
                                 style="background-image: url('https://cdn.forbes.com.mx/2021/09/Jumanji-hbo-max-640x360.jpg') !important;"
                                 >
                            </div>
                            <div class="carousel-item thumb"
                                 style="background-image: url('https://www.lavanguardia.com/files/og_thumbnail/uploads/2019/12/20/5fa53034cd854.jpeg') !important;"
                                 >
                            </div>
                        </div>
                    </div>
                </div>
                <section class="pt-5 w-100" >
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators" style="bottom: -50px">
                                        <% for (int i = 0; i < allmovies.size(); i++) {
                                        %>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="<c:out value="${i}"/>"></li>
                                            <%
                                                }
                                            %>
                                    </ol>
                                    <div class="carousel-inner mb-5" id="main-carousel">
                                        <c:forEach var="movie" items="${allmovies}" >
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-3 offset-2 position-relative img-card ">
                                                        <img class="d-block w-100 rounded" src="<c:out value="${movie.getPoster()}" />"
                                                             style="height: 350px"
                                                             alt=" slide">
                                                        <div class="img-back d-flex justify-content-center align-items-center">
                                                            <i class="custom-icon large material-icons mx-auto"
                                                               style="
                                                               font-size: 5em !important;
                                                               user-select:none">local_movies</i>
                                                        </div>
                                                    </div>
                                                    <div class="col-4 offset-1 ">
                                                        <div class="card card-item">
                                                            <div class="card-body">
                                                                <h5 class="card-title">
                                                                    <a href="movie?id=<c:out value="${movie.getId()}"/>">
                                                                        <c:out value="${movie.getTitle()}" />
                                                                    </a>
                                                                </h5>
                                                                <h6 class="card-subtitle mb-2 text-muted">
                                                                    <ul class="d-flex flex-wrap">
                                                                        <c:forEach var="genre" items="${movie.getGenres()}">
                                                                            <li class="mx-1 mx-md-4">
                                                                                <a href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965"><c:out value="${genre}"/></a>
                                                                            </li>
                                                                        </c:forEach></ul>
                                                                </h6>
                                                                <p class="card-text"
                                                                   style="color: #AAA"><c:out value="${movie.getPlot()}" /></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="w-100 position-relative mt-5 ">
                        <div class="container">
                            <h2 class="my-0" style="color:#fdfdfd;
                                font-size: 2em;
                                font-weight: 100;
                                margin-left: 1em;
                                padding: 1em 0">Explore our best categories</h2>
                        </div>
                    </div>

                </section>
            </div>
            <div class="line "></div>

            <div class="container-fluid " style="
                 background-color:#28282d;
                 position: relative;"
                 >
                <ul  class="nav nav-pills container">
                    <li class="active tabs-style mx-2">
                        <a  href="#1a" data-toggle="tab">
                            Action
                        </a>
                    </li>
                    <li class="tabs-style mx-2">
                        <a   href="#2a" data-toggle="tab" >
                            Horror
                        </a>
                    </li>
                    <li class="tabs-style mx-2">
                        <a   href="#3a" data-toggle="tab" >
                            History
                        </a>
                    </li>
                    <li class="tabs-style mx-2">
                        <a   href="#4a" data-toggle="tab" >
                            Comedy
                        </a>
                    </li>
                    <li class="tabs-style mx-2">
                        <a   href="#5a" data-toggle="tab" >
                            Drama
                        </a>
                    </li>
                </ul>

            </div>
            <div class="container-fluid" style="
                 background-color:#2b2b31;
                 position: relative
                 ">
                <div class="container py-5">
                    <div class="tab-content">
                        <div class="tab-pane active" id="1a">
                            <div class="row">
                                <c:forEach var="movie" items="${action}">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4 my-3 position-relative img-card">

                                                <img class="img-fluid " src=<c:out value="${movie.getPoster()}" />  />
                                                <a href="movie?id=<c:out value="${movie.getId()}" />">
                                                    <div class="img-back d-flex justify-content-center align-items-center">
                                                        <i class="custom-icon large material-icons mx-auto"
                                                           style="
                                                           font-size: 5em !important;
                                                           user-select:none">local_movies</i>
                                                    </div>

                                                </a>
                                            </div>
                                            <div class="col-8">
                                                <h4>
                                                    <a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" />
                                                    </a>
                                                </h4>
                                                <p >
                                                    <c:forEach var="genre" items="${movie.getGenres()}">
                                                        <a href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965" style="color: #069 !important;">
                                                            <c:out value=" ${genre}" />
                                                        </a>
                                                    </c:forEach>
                                                </p>

                                                <div class="d-flex align-items-center">
                                                    <i style="color: #058;
                                                       user-select:none" class="large material-icons">star</i><span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getComments()} reseñas"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                                </div>
                                                <p   style="color: #AAA">

                                                    <c:out value="${movie.getPlot()}"/>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane active" id="2a">
                            <div class="row">
                                <c:forEach var="movie" items="${horror}">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4 my-3 position-relative img-card">

                                                <img class="img-fluid " src=<c:out value="${movie.getPoster()}" />  />
                                                <a href="movie?id=<c:out value="${movie.getId()}" />">
                                                    <div class="img-back d-flex justify-content-center align-items-center">
                                                        <i class="custom-icon large material-icons mx-auto"
                                                           style="
                                                           font-size: 5em !important;
                                                           user-select:none">local_movies</i>
                                                    </div>

                                                </a>
                                            </div>
                                            <div class="col-8">
                                                <h4>
                                                    <a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" />
                                                    </a>
                                                </h4>
                                                <p >
                                                    <c:forEach var="genre" items="${movie.getGenres()}">
                                                        <a href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965" style="color: #069 !important;">
                                                            <c:out value=" ${genre}" />
                                                        </a>
                                                    </c:forEach>
                                                </p>

                                                <div class="d-flex align-items-center">
                                                    <i style="color: #058;
                                                       user-select:none" class="large material-icons">star</i><span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getComments()} reseñas"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                                </div>
                                                <p   style="color: #AAA">

                                                    <c:out value="${movie.getPlot()}"/>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane active" id="3a">
                            <div class="row">
                                <c:forEach var="movie" items="${history}">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4 my-3 position-relative img-card">

                                                <img class="img-fluid " src=<c:out value="${movie.getPoster()}" />  />
                                                <a href="movie?id=<c:out value="${movie.getId()}" />">
                                                    <div class="img-back d-flex justify-content-center align-items-center">
                                                        <i class="custom-icon large material-icons mx-auto"
                                                           style="
                                                           font-size: 5em !important;
                                                           user-select:none">local_movies</i>
                                                    </div>

                                                </a>
                                            </div>
                                            <div class="col-8">
                                                <h4>
                                                    <a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" />
                                                    </a>
                                                </h4>
                                                <p >
                                                    <c:forEach var="genre" items="${movie.getGenres()}">
                                                        <a href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965" style="color: #069 !important;">
                                                            <c:out value=" ${genre}" />
                                                        </a>
                                                    </c:forEach>
                                                </p>

                                                <div class="d-flex align-items-center">
                                                    <i style="color: #058;
                                                       user-select:none" class="large material-icons">star</i><span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getComments()} reseñas"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                                </div>
                                                <p   style="color: #AAA">

                                                    <c:out value="${movie.getPlot()}"/>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="tab-pane active" id="4a">
                            <div class="row">
                                <c:forEach var="movie" items="${comedy}">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4 my-3 position-relative img-card">

                                                <img class="img-fluid " src=<c:out value="${movie.getPoster()}" />  />
                                                <a href="movie?id=<c:out value="${movie.getId()}" />">
                                                    <div class="img-back d-flex justify-content-center align-items-center">
                                                        <i class="custom-icon large material-icons mx-auto"
                                                           style="
                                                           font-size: 5em !important;
                                                           user-select:none">local_movies</i>
                                                    </div>

                                                </a>
                                            </div>
                                            <div class="col-8">
                                                <h4>
                                                    <a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" />
                                                    </a>
                                                </h4>
                                                <p >
                                                    <c:forEach var="genre" items="${movie.getGenres()}">
                                                        <a href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965" style="color: #069 !important;">
                                                            <c:out value=" ${genre}" />
                                                        </a>
                                                    </c:forEach>
                                                </p>

                                                <div class="d-flex align-items-center">
                                                    <i style="color: #058;
                                                       user-select:none" class="large material-icons">star</i><span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getComments()} reseñas"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                                </div>
                                                <p   style="color: #AAA">

                                                    <c:out value="${movie.getPlot()}"/>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane active" id="5a">
                            <div class="row">
                                <c:forEach var="movie" items="${drama}">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4 my-3 position-relative img-card">

                                                <img class="img-fluid " src=<c:out value="${movie.getPoster()}" />  />
                                                <a href="movie?id=<c:out value="${movie.getId()}" />">
                                                    <div class="img-back d-flex justify-content-center align-items-center">
                                                        <i class="custom-icon large material-icons mx-auto"
                                                           style="
                                                           font-size: 5em !important;
                                                           user-select:none">local_movies</i>
                                                    </div>

                                                </a>
                                            </div>
                                            <div class="col-8">
                                                <h4>
                                                    <a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" />
                                                    </a>
                                                </h4>
                                                <p >
                                                    <c:forEach var="genre" items="${movie.getGenres()}">
                                                        <a href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965" style="color: #069 !important;">
                                                            <c:out value=" ${genre}" />
                                                        </a>
                                                    </c:forEach>
                                                </p>

                                                <div class="d-flex align-items-center">
                                                    <i style="color: #058;
                                                       user-select:none" class="large material-icons">star</i><span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getComments()} reseñas"/></span>
                                                    <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                                </div>
                                                <p   style="color: #AAA">

                                                    <c:out value="${movie.getPlot()}"/>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid position-relative"
                     style=";
                     ">
                    <div style="position: absolute;
                         top: 0;
                         right:0;
                         background-image:url('https://i.pinimg.com/originals/1b/d3/7d/1bd37d166881820aef36e9bd7e5ca0f6.jpg');
                         background-repeat: no-repeat;
                         background-size: 100% 100%;
                         width:100%;
                         height:100%;
                         opacity: .1;
                         ">
                    </div>
                    <div class='container'>
                        <div class="row">
                            <div class="col-12">

                                <h3 class="my-0" style="color:#fdfdfd;
                                    font-size: 2em;
                                    font-weight: 100;
                                    margin-left: 1em;
                                    padding: 1em 0">More Movies</h3>
                            </div>
                            <c:forEach items="${allmovies}" var="movie">
                                <div class="col-2  ">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 img-card">
                                                <img class="img-fluid" alt="100%x280" src=<c:out value="${movie.getPoster()}"/>>
                                                <a href="movie?id=<c:out value="${movie.getId()}" />">
                                                    <div class="img-back d-flex justify-content-center align-items-center">
                                                        <i class="custom-icon large material-icons mx-auto"
                                                           style="
                                                           font-size: 5em !important;
                                                           user-select:none">local_movies</i>
                                                    </div>

                                                </a>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-flex flex-wrap">
                                                    <i style="color: #0AC;
                                                       user-select:none" class="large material-icons">star</i><span style="color: #0AC;"><c:out value="${movie.getRating()}"/></span>
                                                    <p class="d-flex flex-wrap">
                                                        <c:forEach var="genre" items="${movie.getGenres()}">
                                                            <a class="mx-2" style="color: #0BD !important;">
                                                                <c:out value=" ${genre}" />
                                                            </a>
                                                        </c:forEach>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>  
                </div>
            </div>
        </main>
        <footer>

        </footer>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            var carousel = document.getElementById("main-carousel");
            carousel.firstElementChild.classList.add('active');

        </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </body>
</html>
