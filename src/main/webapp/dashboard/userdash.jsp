<%@page import="com.miguel.filmproject.model.User"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : userdash
    Created on : 27-06-2022, 12:40:46 PM
    Author     : miguel
--%>
<%
    int usersSize = Integer.parseInt(request.getAttribute("usersSize").toString());
    User admin = (User) request.getAttribute("admin");
    List<User> users = (List<User>) request.getAttribute("users");
    int i = Math.round(Integer.parseInt(request.getAttribute("skip").toString()) / 10) * 10;
    int size = i + 10;
    String show_num = request.getAttribute("show_num").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../styles/dashboardstyles.css">
        <link rel="stylesheet" href="../styles/loginstyles.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Users</title>
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
                        margin: 0em 2em">USERS
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
                                <a href="/dashboard" style="font-weight: 100;
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
                        <div class="row">
                            <form class="d-flex align-items-center w-75 mx-auto col-4" action="user" method="GET">
                                <input name="username" type="text" class="custom-input w-100" 
                                       placeholder="Find by User Name"/>
                                <button type="submit" class="btn bg-transparent">
                                    <i style="color: #0AC;
                                       font-size: 2.5em" class="large material-icons custom-icon">search</i>
                                </button>
                            </form>
                            <form class="d-flex align-items-center w-75 mx-auto col-4" action="user" method="GET">
                                <input name="ci" type="text" class="custom-input w-100" 
                                       placeholder="Find by CI"/>
                                <button type="submit" class="btn bg-transparent ">
                                    <i style="color: #0AC;
                                       font-size: 2.5em" class="large material-icons custom-icon">search</i>
                                </button>
                            </form>
                            <div class="col-4">
                                <button class="btn bg-transparent text-center text-white d-flex align-items-center"
                                        style="color: #BBB">
                                    <i class="large material-icons custom-icon"
                                       style="
                                       color: #01739a;
                                       font-size: 3em;
                                       ">person_add
                                    </i>Add User
                                </button>
                            </div>
                        </div>
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">CI</th>
                                    <th scope="col">BASIC INFO</th>
                                    <th scope="col">USERNAME</th>
                                    <th scope="col">FIRSTNAME</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach  var="user" items="${users}">
                                    <tr>
                                        <td><c:out  value ="${user.getId()}"/></td>
                                        <td>
                                            <c:out  value ="${user.getCi()}"/>                                              
                                        </td>
                                        <td>
                                            <div class="container-fluid d-flex mt-3 position-relative">
                                                <span class="profile-icon" >
                                                    <i class="custom-icon mx-0 large material-icons d-inline-block"
                                                       style="font-size: 1em">person</i> 
                                                </span>
                                                <div>
                                                    <h6 style="color: #BBB;
                                                        font-size:.9em"> <c:out  value ="${user.getName()}"/>  </h6>
                                                    <h5 style="color:#888;
                                                        font-size:.75em;">
                                                        <c:out  value ="${user.getEmail()}"/>                                              
                                                    </h5>
                                                </div>

                                            </div>
                                        </td>
                                        <td>
                                            <c:out  value ="${user.getFirstname()}"/>                                              
                                        </td>
                                        <td>
                                            <c:out  value ="${user.getLastname()}"/>                                              
                                        </td>
                                        <td>
                                            <a href="userprofile?id=<c:out value ="${user.getId()}"/>">
                                                <i class="custom-icon large material-icons"
                                                   style="font-size: 2em !important">edit
                                                </i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
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
                               href="user?skip=<%=s%>"><%=s + 1%></a></li>
                            <%}%>
                        <li class="page-item">
                            <a 
                                style="background-color:#2b2b31;"
                                class="page-link" 
                                href="user?skip=<%=Integer.parseInt(request.getAttribute("skip").toString()) + 1%>">
                                Next</a>
                        </li>
                    </ul>
                </nav>
                <% }%>
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
