<%-- 
    Document   : index
    Created on : Oct 10, 2024, 10:28:57 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Register Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="./css/style.css">

    </head>

    <body class="img js-fullheight" style="background-image: url(images/fuji-bg.jpg); background-color: #000116">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <!--<h2 class="heading-section">Login #10</h2>-->
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Register</h3>
                            <form action="../register" class="signin-form" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field1" type="password" class="form-control" placeholder="Password"
                                           required>
                                    <span toggle="#password-field1"
                                          class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input id="password-field2" type="password" class="form-control" placeholder="Confirm Password"
                                           required>
                                    <span toggle="#password-field2"
                                          class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Phone" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Address" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                
                            </form>
                            <div class="text-center">
                                <p>Already have account?<a href="../login/"> Login</a></p>
                            </div>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span>
                                    Facebook</a>
                                <a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span>
                                    Google</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>
