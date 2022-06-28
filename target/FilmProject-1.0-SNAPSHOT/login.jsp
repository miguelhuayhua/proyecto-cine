<%-- 
    Document   : login
    Created on : 22-06-2022, 12:01:44 PM
    Author     : miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/loginstyles.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Login</title>
    </head>
    <body>
        <section class="container-fluid position-relative mx-0 px-0" >
            <div class="container-fluid position-relative after d-flex justify-content-center align-items-center my-0 py-0" style="height: 100vh;width: 100wh">
                <form class="mx-auto h-75 position-relative form-decoration d-flex flex-column align-items-center" style="background-color: #28282d"
                      action="login" method="post">

                    <a href="/" class="my-5"><img class="w-50 d-block mx-auto" src="assets/static/logo_multicine.png"></a>
                    <label style="color:#BBB;
                           font-size: 1.3em;">Username:</label>
                    <input type="text" name="name" class="form-control my-0 custom-input mb-4" placeholder="Enter your username">
                    <label style="color:#BBB;
                           font-size: 1.3em;">Password:</label>
                    <input type="password" name="password" class="form-control my-0 custom-input mb-4" placeholder="Password">
                    <button type="submit" class="btn custom-btn w-75 mx-auto ">Log in</button>

                    <p class="mt-4" style="color:#BBB">Don´t have an account? <a href="signup" class="text-primary">Register here!</a> </p>
                </form>
            </div>
        </section>



        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
