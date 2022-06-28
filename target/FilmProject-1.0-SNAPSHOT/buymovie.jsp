<%@page import="com.miguel.filmproject.model.Movie"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : buymovie
    Created on : 24-06-2022, 08:38:27 PM
    Author     : miguel
--%>
<%@page import="com.miguel.filmproject.model.User"%>
<%
    Movie movie = (Movie) request.getAttribute("movie");
    User user = null;
    if (request.getAttribute("user") != null) {
        user = (User) request.getAttribute("user");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/moviestyles.css">
        <link rel="stylesheet" href="styles/buystyles.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Buy Movie</title>
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
                                <a class="nav-link mx-2" href="movies">Películas</a>
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
            <div class="position-relative px-0 mx-0 container-fluid"
                 style="background-color: #2b2b31;
                 ">
                <div 
                    class="line-after d-flex align-items-center justify-content-around">
                    <h2 
                        style="color:#999
                        ">Compre su película</h2>
                    <h2 
                        style="color:#999
                        ">Encuentre su película...</h2>
                </div>
                <div class="line"></div>
                <div class="container pt-5">
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <div class="col-6">
                                    <img class="img-fluid" src=<c:out value="${movie.getPoster()}" />  />
                                </div>
                                <div class="col-6">
                                    <h2 class="mb-4"
                                        style="color:#BBB;"><c:out value="${movie.getTitle()}" /></h2>
                                    <div class="d-flex align-items-center flex-wrap">
                                        <i style="color: #058;
                                           user-select:none;" class="large material-icons">star</i>
                                        <span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                        <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                        <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRated()}"/></span>
                                    </div>
                                    <h4 class= "text-center" style="color: #AAA">Total:</h4>

                                    <div class="card card-item">
                                        <div class="card-body d-flex align-items-center">
                                            <i style="color: #058;
                                               user-select:none;" class="large material-icons custom-icon">local_play</i>
                                            <span class="custom-icon">20 Bs.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-6">
                            <form class="mx-auto position-relative form-decoration w-100 my-0 py-0 rounded "
                                  style="background-color: #28282d"
                                  action="signup" method="post">
                                <div class="container pt-1">
                                    <div class="row">

                                        <div class="col-6 offset-3">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">Branch Offices:</label>
                                            <select class="w-100" name="location" id="format">
                                                <option value="El Alto">
                                                    El Alto
                                                </option>  
                                                <option value="La Paz">
                                                    La Paz
                                                </option> 
                                                <option value="Cochabamba">
                                                    Cochabamba
                                                </option> 
                                                <option value="Santa Cruz">
                                                    Santa Cruz
                                                </option> 
                                            </select>
                                        </div>
                                        <div class="col-12 d-flex flex-wrap" id="seating">
                                            <%for (int i = 1; i <= 20; i++) {
                                            %>
                                            <div style="width: 55px;
                                                 cursor: pointer;" class="d-flex flex-column align-items-center mx-2">
                                                <span style="color:#BBB"><%=i%></span>
                                                <img style="width:50px" src="assets/static/chair.png" />
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            
            var seating = document.getElementById("seating");
            seating.addEventListener('click', (e) => {
                let img = e.target;
                if (img.localName == "img") {
                    img.classList.toggle("seat-active");
                    console.log(img.classList)
                }
            })
        </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </body>
</html>
