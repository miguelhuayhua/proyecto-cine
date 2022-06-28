<%-- 
    Document   : signup
    Created on : 22-06-2022, 11:06:30 PM
    Author     : miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/signupstyles.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
        <title>Register</title>
        
    </head>
    <body class="py-0 my-0">
        <section class="container-fluid position-relative mx-0 px-0 py-0 my-0" >
            <div class="container-fluid position-relative after  my-0 py-0" style="height: 100vh;width: 100%">
                <div class="container  py-0 pt-5 my-0">
                    <div class="row py-0 my-0"
                         style="
                         box-shadow: 0 5px 45px 0 rgba(50,100,150,.8);
                         border-radius: 10px;
                         overflow: hidden">
                        <div class="col-5 position-relative back">
                            <a href="/" class="position-relative" style="z-index: 10">
                                <img class="w-50 d-block mx-auto mt-5 mb-4"  src="assets/static/logo_multicine.png"></a>
                            <h2 style="color:#BBB; z-index: 10;position: relative;font-size:1.2em;
                                font-variant: small-caps">Register now to choose the movies you want!
                            </h2>
                        </div>
                        <div class="col-7 mx-0 px-0">
                            <form class="mx-auto position-relative form-decoration w-100 my-0 py-0 " style="background-color: #28282d"
                                  action="signup" method="post">
                                <div class="container pt-4">
                                    <div class="row">
                                        <div class="col-6">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">First Name:</label>
                                            <input type="text" name="firstname" class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your First Name">
                                        </div>
                                        <div class="col-6">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">Last Name:</label>
                                            <input type="text" name="lastname" class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your Last Name">
                                        </div>
                                        <div class="col-6">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">User Name:</label>
                                            <input type="text" name="username" class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your User Name">
                                        </div>
                                        <div class="col-6">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">C.I.:</label>
                                            <input type="number" name="ci" class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your C.I.">
                                        </div>
                                        <div class="col-12">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">Email:</label>
                                            <input type="email" name="email" class="form-control my-0 custom-input mb-4 w-100" placeholder="example@etc.com">
                                        </div>
                                        <div class="col-6 offset-3">
                                            <label style="color:#BBB;
                                                   font-size: 1.3em;">Password:</label>
                                            <input type="password" name="password" class="form-control my-0 custom-input mb-4 w-100" placeholder="Enter your new password">
                                        </div>
                                        <div class="col-6 offset-3">
                                            <button type="submit" class="btn custom-btn w-100 mx-auto ">Register Now</button>
                                        </div>
                                        <p class="mt-4 d-block mx-auto" style="color:#BBB">Already have an account?
                                            <a href="login" class="text-primary">Login here!
                                            </a> </p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
