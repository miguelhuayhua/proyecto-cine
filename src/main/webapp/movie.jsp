<%@page import="com.miguel.filmproject.model.User"%>
<%@page import="com.miguel.filmproject.model.Comment"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : movie
    Created on : 21-06-2022, 04:51:31 PM
    Author     : miguel
--%>
<%@page import="com.miguel.filmproject.model.Movie"%>
<%Movie movie = (Movie) request.getAttribute("movie");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    User user = null;
    if (request.getAttribute("user") != null) {
        user = (User) request.getAttribute("user");
    }
%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta lang="es">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/onemoviestyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Movie</title>
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
                        <ul class="navbar-nav mr-auto  w-100 ">
                            <li class="nav-item active">
                                <a class="nav-link mx-2" href="/">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-2" href="movies">Movies</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-2" href="#">About</a>
                            </li>
                            <li class="nav-item w-100">
                                <form class="d-flex align-items-center w-75 mx-auto" action="movies" method="GET">
                                    <input name="title" type="text" class="input-custom w-100" />
                                    <button type="submit" class="btn submit-custom">
                                        <i style="color: #0AC;
                                           font-size: 2.5em" class="large material-icons custom-icon">search</i>
                                    </button>
                                </form>
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
        <main > 
            <div class="container-fluid position-relative after">
                <div class="container">
                    <div class="row py-5">
                        <div class="col-12 col-md-6">
                            <div class="row">
                                <div class="col-12">
                                    <h1 class="mb-4"><a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" /></a></h1>
                                </div>
                                <div class="col-4 my-3">
                                    <img class="img-fluid" src=<c:out value="${movie.getPoster()}" />  />
                                </div>
                                <div class="col-8">
                                    <p ><c:forEach var="genre" items="${movie.getGenres()}">
                                            <a style="color: #069 !important;"
                                               href="movies?genre=<c:out value="${genre}"/>&rating=5&year=1965">
                                                <c:out value="${genre}"/>
                                            </a>
                                        </c:forEach>
                                    </p>
                                    <div class="d-flex align-items-center flex-wrap">
                                        <i style="color: #058;
                                           user-select:none;" class="large material-icons">star</i><span style="color: #07A;"><c:out value="${movie.getRating()}"/></span>
                                        <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getComments()} reseñas"/></span>
                                        <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRuntime()} minutos"/></span>
                                        <span style="color:#888" class="badge bg-dark mx-1"><c:out value="${movie.getRated()}"/></span>

                                    </div>
                                    <p   style="color: #AAA">
                                        <%if (movie.getFullplot() == null) {
                                        %>
                                        <c:out value="${movie.getPlot()}"></c:out>
                                        <%
                                        } else {
                                        %>       
                                        <c:out value="${movie.getFullplot()}"></c:out>
                                        <%
                                            }
                                        %> 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="row">
                                <div class="col-12">
                                    <h3 style="color:#bbbbbd;" class="mb-4">Información Adicional</h3>
                                </div>
                                <div class="col-12">
                                    <p style="color: #AAA">
                                        <span style="color: #07A"> Directors:</span> 
                                        <c:forEach items="${movie.getDirectors()}" var="director">
                                            <c:out value="${director}, "/>
                                        </c:forEach>
                                        <br>
                                        <span style="color: #07A"> Writers:</span>
                                        <c:forEach items="${movie.getWriters()}" var="writer">
                                            <c:out value="${writer}, "/>
                                        </c:forEach>
                                        <br>
                                        <span style="color: #07A"> Cast:</span>
                                        <c:forEach items="${movie.getCast()}" var="actor">
                                            <c:out value="${actor}, "/>
                                        </c:forEach>
                                        <br>
                                        <span style="color: #07A"> Languages:</span>
                                        <c:forEach items="${movie.getLanguages()}" var="language">
                                            <c:out value="${language}, "/>
                                        </c:forEach>
                                        <br>
                                        <br>
                                        <%=movie.getAwards().getString("text")%>
                                    </p>
                                    <h4 style="color:#bbbbbd;
                                        font-size: 1.2em"
                                        class="d-flex align-items-center flex-wrap">
                                        <i  class="large material-icons custom-icon">movie_filter</i>
                                        <%=movie.getAwards().getInteger("nominations")%> Nominations
                                        <i  class="large material-icons custom-icon">whatshot</i>
                                        <%=movie.getAwards().getInteger("wins")%> Wins
                                        <br>
                                    </h4>
                                </div>
                            </div>
                            <a href="reserve?id=<%=movie.getId()%>" class="btn btn-custom mt-3">
                                <i class="large material-icons mr-3 ">featured_play_list</i>Reserve Movie
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="container-fluid position-relative d-flex justify-content-around flex-wrap" 
                 style="background-color:#28282d;
                 box-shadow: 0px 0px 30px 0px rgba(0,0,0,.5)">
                <h3 class="text-center py-3 my-0" style="color:#bbbbbd;">
                    Comentarios
                </h3>
                <!-- Button trigger modal -->
                <!-- Large modal -->
                <button type="button" class="btn bg-transparent text-white d-flex align-items-center" data-toggle="modal" data-target=".bd-example-modal-lg">
                    Leave a comment<i class="large material-icons custom-icon">comment</i>
                </button>

                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" style="background-color:#27272c;">
                            <div class="row">
                                <div class="col-2 offset-10">
                                    <button type="button" class="close d-flex justify-content-center" data-dismiss="modal" aria-label="Close">
                                        <i class="large material-icons custom-icon">close</i>
                                    </button>
                                </div>
                                <form class="col-12" method="post" action="movie">
                                    <div class="container row mx-auto">
                                        <div class="form-group col-9">
                                            <label for="exampleFormControlTextarea1"
                                                   style="font-size: 1em;
                                                   color:#888">Comment:</label>
                                            <br>
                                            <textarea 
                                                class="input-custom w-100 mx-auto"
                                                name="text" 
                                                id="exampleFormControlTextarea1"
                                                placeholder="Enter your comment..."
                                                ></textarea>
                                            <input name="movieid" value="<%=request.getParameter("id")%>" hidden>
                                        </div>
                                        <div class="form-group col-3 d-flex align-items-center justify-content-center">
                                            <button class="btn btn-custom-hover my-auto" type="submit">Comentar</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="col-4 offset-4">
                                    <h6 style="font-size: 10px;
                                        color:#888">Remenber be logged to leave a comment...</h6> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid"
                 style="background-color: #2b2b31;">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${comments}" var="comment">
                            <div class="mt-3 col-10 offset-1 d-flex">
                                <span style="
                                      display: flex;
                                      width: 3em;
                                      height: 3em;
                                      background-color: white;
                                      align-items: center;
                                      justify-content: center;
                                      border-radius: 50%;
                                      margin-right: 1em;
                                      " >
                                    <i class="custom-icon mx-0 large material-icons d-inline-block bg-info">person</i> 
                                </span>
                                <div>
                                    <h5 style="color:#bbbbbd;">
                                        <c:out value="${comment.getName()}"/>
                                    </h5>

                                    <h6 style="color:#888;">
                                        <c:out value="${comment.toStringDate()}"/>
                                    </h6>
                                </div>
                            </div>
                            <div class="col-10 offset-1">
                                <p class="p-3 rounded" style="background-color:#28282d;
                                   color:#AAA">
                                    <c:out value="${comment.getText()}"/>
                                </p>
                            </div> 
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
