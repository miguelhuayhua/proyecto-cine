<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : movieprofile
    Created on : 27-06-2022, 06:28:34 PM
    Author     : miguel
--%>
<%@page import="com.miguel.filmproject.model.Movie"%>
<%
    Movie movie = (Movie) request.getAttribute("movie");
    String writers = "";
    String directors = "";
    String cast = "";
    String genres = "";

    for (String writer : movie.getWriters()) {
        writers = writers + writer + ", ";
    }
    for (String director : movie.getDirectors()) {
        directors = directors + director + ", ";
    }
    for (String actor : movie.getCast()) {
        cast = cast + actor + ", ";
    }
    for (String genre : movie.getGenres()) {
        genres = genres + genre + ", ";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/moviestyles.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../styles/dashboardstyles.css">
        <link rel="stylesheet" href="../styles/loginstyles.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Movie</title>
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
                        margin: 0em 2em">MOVIE
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
                                <a href="/" style="font-weight: 100;
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
                <div class ="row">
                    <div class="col-6">
                        <h3 style="font-weight: 200;
                            color: #BBB;
                            font-size: 1.5em;">UPDATE O CREATE MOVIE</h3>
                    </div>
                    <%if (!movie.getId().equals("")) {
                    %>
                    <form method="post" action="movieprofile" class="col-2">
                        <input hidden name="id" value="<%=movie.getId()%>">
                        <input hidden name="method" value="delete">
                        <button type="submit" class="btn bg-transparent d-flex align-items-center"
                                style="height: 60px;
                                color:#BBB">
                            <i class="custom-icon large material-icons"
                               style="font-size: 2em !important">delete
                            </i> Delete Movie
                        </button>
                    </form>
                    <form method="post" action="movieprofile" class="col-2">
                        <input hidden name="id" value="<%=movie.getId()%>">
                        <input hidden name="method" value="release">
                        <button type="submit" class="btn bg-transparent d-flex align-items-center"
                                style="height: 60px;
                                color:#BBB">
                            <i class="custom-icon large material-icons"
                               style="font-size: 2em !important">update
                            </i>Release Movie
                        </button>
                    </form>
                    <div class="col-12">
                        <h6 style="color: #171;
                            font-size:.9em">
                            Movie ID: 
                            <%=movie.getId()%>
                        </h6>
                    </div>
                    <%}%>
                </div>

                <form class="row p-4 rounded"
                      style="background-color: #28282d"
                      method="post"
                      action="movieprofile">
                    <input hidden value="<%=movie.getId()%>" name="id">
                    <input hidden value="add" name="method">
                    <div class="col-3">
                        <label style="color:#BBB;
                               font-size: 1em;" for="url">Poster:</label>
                        <img class="img-fluid" id="img" src="<%=movie.getPoster()%>" alt="Insert the poster">
                        <input id="url" type="text" name="poster" 
                               value="<%=movie.getPoster()%>"
                               class="form-control d-block custom-input mb-4 w-100 y-100"
                               placeholder="https://domain.com/image.jpg">
                    </div>
                    <div class="col-9">
                        <div class="row">
                            <div class="col-12">
                                <label style="color:#BBB;
                                       font-size: 1em;">Title:</label>
                                <input type="text" name="title" 
                                       value="<%=movie.getTitle()%>"
                                       class="form-control custom-input mb-4 w-100" placeholder="Enter title...">
                            </div>
                            <div class="col-12">
                                <label style="color:#BBB;
                                       font-size: 1em;">Full Plot:</label>
                                <textarea type="text" name="fullplot" 
                                          class="form-control custom-input mb-4 w-100" placeholder="Enter Full Plot..."><%=movie.getFullplot()%></textarea>
                            </div>
                            <div class="col-12">
                                <label style="color:#BBB;
                                       font-size: 1em;">Short Plot:</label>
                                <textarea type="text" name="plot" class="form-control custom-input mb-4 w-100"
                                          placeholder="Enter short Plot..."><%=movie.getPlot()%></textarea>
                            </div>
                            <div class="col-6">
                                <label style="color:#BBB;
                                       font-size: 1em;">Writers:</label>
                                <input type="text" name="writers" 
                                       value="<%=writers%>"
                                       class="form-control custom-input mb-4 w-100" placeholder="Example: Writer1, Writer2, Writer3...">
                            </div>
                            <div class="col-6">
                                <label style="color:#BBB;
                                       font-size: 1em;">Directors:</label>
                                <input type="text" name="directors" 
                                       value="<%=directors%>"
                                       class="form-control custom-input mb-4 w-100" placeholder="Example: Director1, Director2, Director3...">
                            </div>
                            <div class="col-6">
                                <label style="color:#BBB;
                                       font-size: 1em;">Cast:</label>
                                <input type="text" name="cast" 
                                       value="<%=cast%>"
                                       class="form-control custom-input mb-4 w-100" placeholder="Example: Actor1, Actor2, Actor3...">
                            </div>
                            <div class="col-6">
                                <label style="color:#BBB;
                                       font-size: 1em;">Year:</label>
                                <input type="number" name="year" 
                                       value="<%=movie.getYear()%>"
                                       class="form-control custom-input mb-4 w-100" placeholder="Movie Year">
                            </div>
                            <div class="col-6">
                                <label class="d-block text-center">Genre:</label>
                                <div class="select mx-auto">
                                    <select id="genre">
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
                            <div class="col-6">
                                <label style="color:#BBB;
                                       font-size: 1em;"
                                       for="genres">Selected Genres:</label>
                                <input type="text" name="genres"
                                       id="genres"
                                       value="<%=genres%>"
                                       class="form-control custom-input mb-4 w-100"
                                       placeholder = "genre1, genre2, genre3 ...">
                            </div>
                            <div class="col-6">
                                <label style="color:#BBB;
                                       font-size: 1em;">Run Time:</label>
                                <input type="number" name="runtime" 
                                       value="<%=movie.getRuntime()%>"
                                       class="form-control custom-input mb-4 w-100"
                                       placelholder="Enter movie runtime in minutes...">
                            </div>
                            <div class="col-6">
                                <label for="customRange" class="d-block text-center">Puntuación arriba de: <span id="range0"><%=movie.getRating()%></span></label>
                                <input name="rating" min="0" max="10" step="0.1"
                                       value="<%=movie.getRating()%>" type="range" 
                                       class="form-range d-block mx-auto w-100" id="customRange">
                            </div>
                            <div class="col-4 offset-4">
                                <button type="submit" class="btn bg-transparent custom-btn d-flex align-items-center w-100 my-4"
                                        style="height: 40px;
                                        color:#BBB">
                                    Save
                                </button>
                            </div>
                        </div>

                    </div>
                </form>

            </main>

        </div>
        <script>
            let toggle = document.getElementById("toggle");
            let slideBar = document.getElementById("slideBar");
            toggle.addEventListener("click", () => {
                slideBar.classList.add("start-slide");
                slideBar.classList.toggle("slide-bar-active");
            })
        </script>
        <script>
            let img = document.getElementById("img");
            let url = document.getElementById("url");
            url.addEventListener("change", (e) => {
                console.log(e)
                img.src = e.target.value;
            })
        </script>
        <script>
            let genre = document.getElementById("genre");
            let genres = document.getElementById("genres");
            genre.addEventListener("change", (e) => {
                genres.value = genres.value + genre.options[genre.selectedIndex].value + ", ";
            })
        </script>
        <script>
            let customRange = document.getElementById("customRange");
            let range = document.getElementById("range0");
            customRange.addEventListener("change", (e) => {
                range.innerText = e.target.value
            })
        </script>
    </body>
</html>
