<%@page import="com.miguel.filmproject.model.Comment"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : userprofile
    Created on : 27-06-2022, 06:26:50 PM
    Author     : miguel
--%>
<%@page import="com.miguel.filmproject.model.User"%>
<%
    User admin = (User) request.getAttribute("admin");
    User user = (User) request.getAttribute("user");
    List<Comment> usercomments = (List<Comment>) request.getAttribute("usercomments");
    String username = "", firstname = "", lastname = "", email = "";
    int ci = 0;
    if (user != null) {
        username = user.getName();
        firstname = user.getFirstname();
        lastname = user.getLastname();
        ci = user.getCi();
        email = user.getEmail();
    }
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
        <title>User</title>
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
                <div class="row">
                    <div class="col-12">
                        <div class="row" style="background-color:#28282d;
                             height: 60px">
                            <div class="col-4 d-flex justify-content-start">
                                <span class="profile-icon" style="height: 60px;
                                      width: 60px;">
                                    <i class="custom-icon mx-0 large material-icons d-inline-block"
                                       style="font-size: 1em">person</i> 
                                </span>
                                <div>
                                    <h6 style="color: #171;
                                        font-size:.9em">
                                        <c:out value="${user.getId()} "/>
                                    </h6>
                                    <h5 style="color:#DDD;
                                        font-size:.9em;">
                                        <c:out value="${user.getFirstname()} "/><c:out value="${user.getLastname()}"/>
                                    </h5>
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="container-fluid " style="
                                     background-color:#28282d;
                                     position: relative;"
                                     >
                                    <ul  class="nav nav-pills container">
                                        <li class=" mx-2">
                                            <a class="active tabs-style"  href="#1a" data-toggle="tab">
                                                PROFILE
                                            </a>
                                        </li>
                                        <li class=" mx-2">
                                            <a class="tabs-style"  href="#2a" data-toggle="tab" >
                                                COMMENTS
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-1">
                                <form method="post" action="userprofile" >
                                    <input hidden name="userid" value="<%=user.getId()%>">
                                    <input hidden name="method" value="delete">
                                    <button type="submit" class="btn bg-transparent"
                                            style="height: 60px">
                                        <i class="custom-icon large material-icons"
                                           style="font-size: 1.6em !important">delete
                                        </i>
                                    </button>
                                </form>
                            </div>
                            <div class="col-12">
                                <div class="tab-content row">
                                    <div class="tab-pane active container-fluid" id="1a">
                                        <div class="row mt-4">
                                            <div class="col-12 col-md-6">
                                                <h3 style="color:#BBB;
                                                    font-size: 1.5em;
                                                    margin-bottom: 1em;">User Profile</h3>
                                                <form class="w-100 mx-auto row p-4 rounded"
                                                      style="
                                                      background-color:#28282d;
                                                      position: relative;"
                                                      method="post"
                                                      action="userprofile">
                                                    <input hidden name="method" value="put">
                                                    <input hidden name="userid" value="<%=user.getId()%>">
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">Username:</label>
                                                        <input type="text" name="username" 
                                                               value="<%=username%>"
                                                               class="form-control custom-input mb-4 w-100" placeholder="Enter your username">
                                                    </div>
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">Email:</label>
                                                        <input type="email" name="email" 
                                                               value="<%=email%>"
                                                               class="form-control my-0 custom-input mb-4 w-100" placeholder="alias@business.com">
                                                    </div>
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">First Name:</label>
                                                        <input type="text" name="firstname"
                                                               value="<%=firstname%>"
                                                               class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your first name">
                                                    </div>
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">Last Name:</label>
                                                        <input type="text" name="lastname"
                                                               value="<%=lastname%>"
                                                               class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your last name">
                                                    </div>
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">C.I.:</label>
                                                        <input type="number" name="ci"
                                                               value="<%=ci%>"
                                                               class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your C.I.">
                                                    </div>
                                                    <button type="submit" 
                                                            class="btn custom-btn w-25 mx-auto my-4"
                                                            style="height: 2em">Save All
                                                    </button>
                                                </form>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <h3 style="color:#BBB;
                                                    font-size: 1.5em;
                                                    margin-bottom: 1em;">Change Password</h3>
                                                <form class="w-100 mx-auto row p-4 rounded"
                                                      style="
                                                      background-color:#28282d;
                                                      position: relative;">
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">Old Password:</label>
                                                        <input type="password" name="oldpassword" class="form-control custom-input mb-4 w-100" placeholder="Enter your username">
                                                    </div>
                                                    <div class="col-6">
                                                        <label style="color:#BBB;
                                                               font-size: 1em;">New Password:</label>
                                                        <input type="password" name="password" class="form-control my-0 custom-input mb-4 w-100" placeholder="alias@business.com">
                                                    </div>

                                                    <button type="submit" 
                                                            class="btn custom-btn w-25 mx-auto"
                                                            style="height: 2em">Save
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container-fluid" id="2a">
                                        <div class="row">


                                            <table class="table table-dark">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">MOVIE TITLE</th>
                                                        <th scope="col">DATE</th>
                                                        <th scope="col">TEXT</th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="comment" items="${usercomments}">
                                                        <tr>
                                                            <td><c:out  value ="${comment.getMovieTitle()}"/></td>
                                                            <td><c:out  value ="${comment.getDate()}"/></td>
                                                            <td><c:out  value ="${comment.getText()}"/></td>
                                                            <td>
                                                                <a href="/comment?id=<c:out value ="${comment.getMovie_id()}"/>&commentid=<c:out value ="${comment.getId()}"/>">
                                                                    <i class="custom-icon large material-icons"
                                                                       style="font-size: 1.6em !important">delete
                                                                    </i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <c:forEach var="comment" items="usercomments">
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </main>

        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
