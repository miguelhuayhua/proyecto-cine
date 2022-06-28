<%@page import="com.miguel.filmproject.model.User"%>
<%@page import="com.miguel.filmproject.model.Movie"%>
<%@page import="com.miguel.filmproject.model.Comment"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : dashboard
    Created on : 24-06-2022, 11:40:52 PM
    Author     : miguel
--%>
<%
    int commentSize = Integer.parseInt(request.getAttribute("commentSize").toString());
    int movieSize = Integer.parseInt(request.getAttribute("movieSize").toString());
    int usersSize = Integer.parseInt(request.getAttribute("usersSize").toString());
    User admin = (User) request.getAttribute("admin");
    List<Comment> tenTodayComments = (List<Comment>) request.getAttribute("tenTodayComments");
    List<Movie> lastMovies = (List<Movie>) request.getAttribute("lastMovies");
    List<User> lastUser = (List<User>) request.getAttribute("lastUsers");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/dashboardstyles.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Dashboard</title>
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
                        <img style="width:100px;" src="assets/static/logo_multicine.png">
                    </a>
                    <h2 style="color: #DDD;
                        font-size: 2em;
                        font-weight: 100;
                        display: inline-block;
                        margin: 0em 2em">DASHBOARD
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
                             margin: 20px 0px 0 20px;" src="assets/static/logo_multicine.png">
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
                                <a href="dashboard/user" style="font-weight: 100;
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
                                <a href="dashboard/movie" style="font-weight: 100;
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
            <main class="container-fluid mt-4 position-relative">
                <div class="row d-flex justify-content-around">
                    <div class="col-2 info-dash">
                        <h3 style="color:#AAA;
                            font-size: 1em;
                            margin-top: .5em;">
                            Total users
                        </h3>
                        <div class="w-100 d-flex justify-content-around">
                            <span style="color:#DDD;
                                  font-size: 2em;"><c:out value="${usersSize}" />

                            </span>
                            <i class="custom-icon large material-icons"
                               style="
                               user-select:none">group
                            </i>
                        </div>
                    </div>
                    <div class="col-2 info-dash">

                        <h3 style="color:#AAA;
                            font-size: 1em;
                            margin-top: .5em;">
                            Total movies
                        </h3>
                        <div class="w-100 d-flex justify-content-around">
                            <span style="color:#DDD;
                                  font-size: 2em;">
                                <c:out value="${movieSize}" />
                            </span>
                            <i class="custom-icon large material-icons"
                               style="
                               user-select:none">local_movies
                            </i>
                        </div>
                    </div>
                    <div class="col-2 info-dash">

                        <h3 style="color:#AAA;
                            font-size: 1em;
                            margin-top: .5em;">
                            Total comments
                        </h3>
                        <div class="w-100 d-flex justify-content-around">
                            <span style="color:#DDD;
                                  font-size: 2em;">
                                <c:out value="${commentSize}" />
                            </span>
                            <i class="custom-icon large material-icons"
                               style="
                               user-select:none">chat_bubble
                            </i>
                        </div>
                    </div>
                    <div class="col-2 info-dash">

                        <h3 style="color:#AAA;
                            font-size: 1em;
                            margin-top: .5em;">
                            Total movies
                        </h3>
                        <div class="w-100 d-flex justify-content-around">
                            <span style="color:#DDD;
                                  font-size: 2em;">555
                            </span>
                            <i class="custom-icon large material-icons"
                               style="
                               user-select:none">attach_money
                            </i>
                        </div>
                    </div>
                </div>
                <div class="line my-4"></div>
                <section class="row">
                    <div class="col-2 offset-5 pb-4">
                        <a href="dashboard" class="mx-auto d-flex align-items-center">
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
                    </div>
                    <div class="col-12 col-md-6 rounded"
                         style="background-color: #28282d">
                        <div class="d-flex justify-content-around">
                            <span class="d-flex align-items-center">
                                <i class="custom-icon large material-icons "
                                   style="
                                   user-select:none">dvr
                                </i>
                                <h4 style="color:#AAA;
                                    font-size: 1em;
                                    margin-top: .5em;
                                    display: inline">
                                    Latest 10 movies
                                </h4>
                            </span>
                            <span class="d-flex align-items-center">
                                <a class="custom-btn">
                                    View all
                                </a>
                            </span>
                        </div>
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">Title</th>
                                    <th scope="col">Last Updated</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach  var="movie" items="${lastMovies}">
                                    <tr>
                                        <td><c:out  value ="${movie.getTitle()}"/></td>
                                        <td><c:out  value ="${movie.getLastupdated()}"/></td>
                                        <td>
                                            <a href="movie?id=<c:out value ="${movie.getId()}"/>">
                                                <i class="custom-icon large material-icons"
                                                   style="font-size: 1.6em !important">find_in_page
                                                </i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12 col-md-6 rounded"
                         style="background-color: #28282d">
                        <div class="d-flex justify-content-around">
                            <span class="d-flex align-items-center">
                                <i class="custom-icon large material-icons "
                                   style="
                                   user-select:none">insert_comment
                                </i>
                                <h4 style="color:#AAA;
                                    font-size: 1em;
                                    margin-top: .5em;
                                    display: inline">
                                    Today first 10 movie comments
                                </h4>
                            </span>
                            <span class="d-flex align-items-center">
                                <a class="custom-btn">
                                    View all
                                </a>
                            </span>
                        </div>
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">Email</th>
                                    <th scope="col">Movie ID</th>
                                    <th scope="col">Text</th>
                                    <th scope="col"></th>

                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach  var="comment" items="${tenTodayComments}">
                                    <tr>
                                        <td><c:out  value ="${comment.getEmail()}"/></td>
                                        <td><c:out  value ="${comment.getMovie_id()}"/></td>
                                        <td><c:out  value ="${comment.getText()}"/></td>
                                        <td>
                                            <a href="movie?id=<c:out value ="${comment.getMovie_id()}"/>">
                                                <i class="custom-icon large material-icons"
                                                   style="font-size: 1.6em !important">find_in_page
                                                </i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12 col-md-6 rounded"
                         style="background-color: #28282d">
                        <div class="d-flex justify-content-around">
                            <span class="d-flex align-items-center">
                                <i class="custom-icon large material-icons "
                                   style="
                                   user-select:none">person
                                </i>
                                <h4 style="color:#AAA;
                                    font-size: 1em;
                                    margin-top: .5em;
                                    display: inline">
                                    Latest 10 new users
                                </h4>
                            </span>
                            <span class="d-flex align-items-center">
                                <a class="custom-btn">
                                    View all
                                </a>
                            </span>
                        </div>
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach  var="user" items="${lastUsers}">
                                    <tr>
                                        <td><c:out  value ="${user.getName()}"/></td>
                                        <td><c:out  value ="${user.getEmail()}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-6"
                         style="background-color: #28282d">

                    </div>
                </section>
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
    </body>
</html>
