<%@page import="com.miguel.filmproject.model.User"%>
<%@page import="com.miguel.filmproject.model.Movie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : home
    Created on : 14-06-2022, 02:19:19 PM
    Author     : miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%List<Movie> allmovies = (List<Movie>) request.getAttribute("allmovies");
    String genre = request.getAttribute("genre").toString();
    String year = request.getAttribute("year").toString();
    String rating = request.getAttribute("rating").toString();
    int i = Math.round(Integer.parseInt(request.getAttribute("skip").toString()) / 10) * 10;
    int size = i + 10;
    User user = null;
    if (request.getAttribute("user") != null) {
        user = (User) request.getAttribute("user");
    }%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/moviestyles.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Movies</title>
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
                                           font-size: 2.5em" class="large material-icons">search</i>
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
        <main>
            <div class="position-relative px-0 mx-0 container-fluid">
                <div 
                    class="line-after d-flex align-items-center justify-content-around">
                    <h2 
                        style="color:#999
                        ">Find your favorite movie...!</h2>
                    <h2 
                        style="color:#999
                        ">Movies</h2>
                </div>
                <div class="line"></div>
                <div class="container-fluid position-relative"
                     style="background-color:#28282d;
                     box-shadow: 0px 0px 40px rgba(0,0,0,.8)">
                    <div class="container">
                        <div class="row pb-3">
                            <div class="col-12">
                                <form class="row" method="GET" action="movies">
                                    <div class="col-12 col-md-4 col-lg-3">
                                        <label class="d-block text-center">Tipo:</label>
                                        <div class="select mx-auto">
                                            <select name="genre" id="format">
                                                <option value="<c:out value="${genre}"/>" selected>
                                                    <c:out value="${genre}"/>
                                                </option>
                                                <option value="Action">
                                                    Action
                                                </option>

                                                <option value="Adventure">
                                                    Adventure
                                                </option>
                                                <option value="Animation">
                                                    Animation
                                                </option>

                                                <option value="Biography">
                                                    Biography
                                                </option>

                                                <option value="Comedy">
                                                    Comedy
                                                </option>

                                                <option value="Crime">
                                                    Crime
                                                </option>

                                                <option value="Documentary">
                                                    Documentary
                                                </option>

                                                <option value="Drama">
                                                    Drama
                                                </option>

                                                <option value="Family">
                                                    Family
                                                </option>

                                                <option value="Fantasy">
                                                    Fantasy
                                                </option>

                                                <option value="Film-Noir">
                                                    Film-Noir
                                                </option>

                                                <option value="History">
                                                    History
                                                </option>

                                                <option value="Horror">
                                                    Horror
                                                </option>

                                                <option value="Music">
                                                    Music
                                                </option>

                                                <option value="Musical">
                                                    Musical
                                                </option>

                                                <option value="Mystery">
                                                    Mystery
                                                </option>

                                                <option value="News">
                                                    News
                                                </option>

                                                <option value="Romance">
                                                    Romance
                                                </option>

                                                <option value="Sci-Fi">
                                                    Sci-Fi
                                                </option>

                                                <option value="Short">
                                                    Short
                                                </option>

                                                <option value="Sport">
                                                    Sport
                                                </option>

                                                <option value="Talk-Show">
                                                    Talk-Show
                                                </option>

                                                <option value="Thriller">
                                                    Thriller
                                                </option>

                                                <option value="War">
                                                    War
                                                </option>

                                                <option value="Western">
                                                    Western
                                                </option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 col-lg-3">
                                        <label for="customRange1" class="d-block text-center">Puntuación arriba de: <span id="range0"></span></label>
                                        <input name="rating" min="0" max="10" step="0.1"
                                               value=<c:out value="${rating}" /> type="range" 
                                               class="form-range d-block mx-auto" id="customRange1">
                                    </div>
                                    <div class="col-12 col-md-4 col-lg-3">
                                        <label for="customRange2" class="d-block text-center">Año de lanzamiento arriba de: <span id="range1"></span></label>
                                        <input name="year" min="1900" max="2022" 
                                               value=<c:out value="${year}"/> type="range" 
                                               class="form-range d-block mx-auto" id="customRange2">
                                    </div>
                                    <div class="col-12 col-md-4 offset-md-4 offset-lg-0 col-lg-3 d-flex align-items-center mt-3">
                                        <input  class="d-block mx-auto w-50 my-auto btn btn-custom mx-auto" type="submit" value="Aplicar filtro">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid"
                     style="background-color:#2b2b31;">
                    <div class="container " >
                        <div class="row pt-5">
                            <c:forEach var="movie" items="${allmovies}">

                                <div class="col-12 col-md-6">
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
                                            <h4><a href="movie?id=<c:out value="${movie.getId()}" />"><c:out value="${movie.getTitle()}" /></a></h4>
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
                <nav  style="background-color:#2b2b31;"
                      class="pb-5">
                    <ul  class="pagination justify-content-center my-0 py-0"
                         accesskey="<%=request.getAttribute("skip")%>" id="pagination">
                        <li class="page-item disabled">
                            <a
                                style="background-color:#2b2b31;"
                                class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <%for (int s = i; s < size; s++) {%>
                        <li 

                            class="page-item" id="<%=s%>">
                            <a style="background-color:#2b2b31;"accesskey=""class="page-link" href="movies?skip=<%=s%>&genre=<%=request.getAttribute("genre")%>&year=<%=request.getAttribute("year")%>&rating=<%=request.getAttribute("rating")%>"><%=s + 1%></a></li>
                            <%}%>
                        <li class="page-item">
                            <a 
                                style="background-color:#2b2b31;"
                                class="page-link" 
                                href="movies?skip=<%=Integer.parseInt(request.getAttribute("skip").toString()) + 1%>&genre=<%=request.getAttribute("genre")%>&year=<%=request.getAttribute("year")%>&rating=<%=request.getAttribute("rating")%>" >
                                Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </main>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>

            let range1 = document.getElementById("customRange1");
            let range2 = document.getElementById("customRange2");

            let ranvalue1 = document.getElementById("range0")
            let ranvalue2 = document.getElementById("range1")
            ranvalue1.innerText = range1.value;
            range1.addEventListener('change', (e) => {
                ranvalue1.innerText = e.target.value;
            })

            ranvalue2.innerText = range2.value;
            range2.addEventListener('change', (e) => {
                ranvalue2.innerText = e.target.value;
            })

            let pagination = document.getElementById('pagination');
            for (let child of pagination.children) {
                if (pagination.accessKey == child.id) {
                    child.classList.add("active");
                    break;
                }
            }
        </script>
    </body>
</html>
