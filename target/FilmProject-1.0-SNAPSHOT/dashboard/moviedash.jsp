<%-- 
    Document   : moviedash
    Created on : 27-06-2022, 02:14:00 PM
    Author     : miguel
--%>
<%@page import="com.miguel.filmproject.model.Movie"%>
<%@page import="com.miguel.filmproject.model.User"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    User admin = (User) request.getAttribute("admin");
    int i = Math.round(Integer.parseInt(request.getAttribute("skip").toString()) / 10) * 10;
    int size = i + 10;
    String show_num = request.getAttribute("show_num").toString();
    String genre = request.getAttribute("genre").toString();
    String year = request.getAttribute("year").toString();
    String rating = request.getAttribute("rating").toString();
    List<Movie> movies = (List<Movie>) request.getAttribute("allmovies");


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../styles/moviestyles.css">

        <link rel="stylesheet" href="../styles/dashboardstyles.css">
        <link rel="stylesheet" href="../styles/loginstyles.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Movies</title>
    </head>
    <body>
        <div class="container-fluid mx-0 px-0 position-relative"
             style="background-color:#2b2b31;">
            <header style="top:0; z-index: 100;
                    background-color: #2b2b31;
                    box-shadow: 0px 0px 30px black;
                    position: sticky;
                    ">
                <div class="container-fluid d-flex align-items-center"
                     style="background-color: #28282d;
                     height: 80px;">
                    <a href="/" class="my-5">
                        <img style="width:100px;" src="../assets/static/logo_multicine.png">
                    </a>
                    <h2 style="color: #DDD;
                        font-size: 2em;
                        font-weight: 100;
                        display: inline-block;
                        margin: 0em 2em">MOVIES
                    </h2>
                    <button class="btn bg-transparent" 
                            style=" position: absolute;
                            right: 3em;
                            top:10px;"
                            id="toggle">
                        <i class="large material-icons"
                           style="
                           color: #01739a;
                           font-size: 3em;
                           ">menu
                        </i>
                    </button>
                </div>
            </header>
            <aside class="slide-bar" id="slideBar">
                <div class="row">
                    <div class="col-12">
                        <img style="width:100px;
                             margin: 20px 0px 0 20px;" src="../assets/static/logo_multicine.png">
                    </div>
                    <div class="col-12 mt-3">
                        <div class="line w-100">
                        </div>
                        <div class="container-fluid d-flex mt-3 position-relative"
                             style="border-bottom: 1px solid #444">
                            <span class="profile-icon" >
                                <i class="custom-icon mx-0 large material-icons d-inline-block"
                                   style="font-size: 1em">person</i> 
                            </span>
                            <div>
                                <h6 style="color: #777;
                                    font-size:.75em">Admin</h6>
                                <h5 style="color:#DDD;
                                    font-size:.9em;">
                                    <c:out value="${admin.getFirstname()} "/><c:out value="${admin.getLastname()}"/>
                                </h5>
                            </div>
                            <a href="/home?out=true" style="
                               position: absolute;
                               right:10px">
                                <i class="custom-icon mx-0 large material-icons d-inline-block"
                                   >exit_to_app</i> 
                            </a>
                        </div>
                    </div>
                    <div class="col-12 mt-4">
                        <ul class="d-flex flex-column">
                            <li>
                                <a href="#" style="font-weight: 100;
                                   text-align: center;
                                   color:#AAA;
                                   display: flex;
                                   align-items: center;">
                                    <i class="custom-icon mx-0 large material-icons icon-slide">dashboard</i> 
                                    DASHBOARD
                                </a>    
                            </li>

                            <li>
                                <a href="user" style="font-weight: 100;
                                   text-align: center;
                                   color:#AAA;
                                   display: flex;
                                   align-items: center;">
                                    <i class="custom-icon mx-0 large material-icons icon-slide"
                                       >group</i> 
                                    USERS
                                </a>    
                            </li>
                            <li>
                                <a href="movie" style="font-weight: 100;
                                   text-align: center;
                                   color:#AAA;
                                   display: flex;
                                   align-items: center;">
                                    <i class="custom-icon mx-0 large material-icons icon-slide">local_movies</i> 
                                    MOVIES
                                </a>    
                            </li>
                            <li>
                                <a href="#" style="font-weight: 100;
                                   text-align: center;
                                   color:#AAA;
                                   display: flex;
                                   align-items: center;">
                                    <i class="custom-icon mx-0 large material-icons icon-slide">attach_money</i> 
                                    SALES
                                </a>    
                            </li>

                        </ul>
                    </div>

                </div>
            </aside>
            <div class="line my-4"></div>

            <main class="container mt-4 position-relative">
                <a href="" class="mx-auto d-flex align-items-center">
                    <i class="custom-icon large material-icons "
                       style="
                       ">refresh
                    </i>
                    <h4 style="color:#AAA;
                        font-size: 1em;
                        margin-top: .5em;
                        display: inline">Refresh
                    </h4>
                </a>
                <section class="row">
                    <div class="col-12 rounded"
                         style="background-color: #28282d">
                        <div class="row position-relative">
                            <div class="col-12">
                                <form class="row" method="GET" action="movie">
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
                            <form class="d-flex align-items-center w-100 col-5" action="movie" method="GET">
                                <input name="title" type="text" class="custom-input w-100" 
                                       placeholder="Find by Movie Title"/>
                                <button type="submit" class="btn bg-transparent ">
                                    <i style="color: #0AC;
                                       font-size: 2.5em" class="large material-icons custom-icon mx-0 px-0">search</i>
                                </button>
                            </form>
                            <a class="btn bg-transparent text-center text-white d-flex align-items-center"
                               style="color: #BBB;
                               position: absolute;
                               right: 20px;
                               bottom:0;"
                               href="movieprofile">
                                <i class="large material-icons custom-icon"
                                   style="
                                   color: #01739a;
                                   font-size: 3em;
                                   ">movie
                                </i>Add movie
                            </a>
                        </div>
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">MOVIE TITLE</th>
                                    <th scope="col">YEAR</th>
                                    <th scope="col">COMMENTS</th>
                                    <th scope="col">RUNTIME</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Movie movie : movies) {


                                %>
                                <tr>
                                    <td><%=movie.getId()%></td>
                                    <td><%=movie.getTitle()%></td>
                                    <td><%=movie.getYear()%></td>
                                    <td><%=movie.getComments()%></td>
                                    <td><%=movie.getRuntime()%>mins.</td>
                                    <td><a
                                            href="movieprofile?id=<%=movie.getId()%>"
                                            class="btn btn-transparent"> 
                                            <i class="large material-icons custom-icon"
                                               style="
                                               color: #01739a;
                                               font-size: 2em !important;
                                               ">edit
                                            </i>
                                        </a></td>
                                </tr>

                                <%
                                    }%>

                            </tbody>
                        </table>
                    </div>

                </section>
                <% if (show_num.equals("1")) {%>
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
                            <a style="background-color:#2b2b31;"accesskey=""class="page-link" 
                               href="movie?skip=<%=s%>"><%=s + 1%></a></li>
                            <%}%>
                        <li class="page-item">
                            <a 
                                style="background-color:#2b2b31;"
                                class="page-link" 
                                href="movie?skip=<%=Integer.parseInt(request.getAttribute("skip").toString()) + 1%>">
                                Next</a>
                        </li>
                    </ul>
                </nav>
                <% } else if (show_num.equals("2")) {%>
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
                            <a style="background-color:#2b2b31;"accesskey=""class="page-link" 
                               href="movie?skip=<%=s%>&genre=${genre}&rating=${rating}&year=${year}"><%=s + 1%></a></li>
                            <%}%>
                        <li class="page-item">
                            <a 
                                style="background-color:#2b2b31;"
                                class="page-link" 
                                href="movie?skip=<%=Integer.parseInt(request.getAttribute("skip").toString()) + 1%>&genre=${genre}&rating=${rating}&year=${year}">
                                Next</a>
                        </li>
                    </ul>
                </nav>
                <%}%>
            </main>

        </div>
        <script>
            let toggle = document.getElementById("toggle");
            let slideBar = document.getElementById("slideBar");
            toggle.addEventListener("click", () => {
                slideBar.classList.add("start-slide");
                slideBar.classList.toggle("slide-bar-active");
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
