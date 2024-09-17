<%-- 
    Document   : home
    Created on : Sep 17, 2024, 9:59:09 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="header">
            <%@include file="header.jsp" %>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 bg-dark text-white p-3">
                    <%@ include file="tableft.jsp" %>
                </div>

                <div class="col-md-10">
                    <h3 class="mt-3">List of Employees</h3>
                    <table class="table table-bordered mt-3">
                        <thead class="thead-light">
                            <tr>
                                <th>CODE</th>
                                <th>FULLNAME</th>
                                <th>AGE</th>
                                <th>IMAGE</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>HE186443</td>
                                <td>Tran Hoai Phong</td>
                                <td>20</td>
                                <td><img src="images/img1.png" class="rounded-circle"  alt="Employee Image"></td>
                                <td>
                                    <button class="btn btn-danger btn-sm">Delete</button>
                                    <button class="btn btn-success btn-sm">Update</button>
                                </td>
                            </tr>
                            <tr>
                                <td>HE186443</td>
                                <td>Tran Hoai Phong</td>
                                <td>20</td>
                                <td><img src="images/img2.png" class="rounded-circle" alt="Employee Image"></td>
                                <td>
                                    <button class="btn btn-danger btn-sm">Delete</button>
                                    <button class="btn btn-success btn-sm">Update</button>
                                </td>
                            </tr>
                            <tr>
                                <td>HE186443</td>
                                <td>Tran Hoai Phong</td>
                                <td>20</td>
                                <td><img src="images/img3.png" class="rounded-circle" alt="Employee Image"></td>
                                <td>
                                    <button class="btn btn-danger btn-sm">Delete</button>
                                    <button class="btn btn-success btn-sm">Update</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
