<%-- 
    Document   : list
    Created on : Sep 17, 2024, 11:21:31 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #7393a7;
            }
            .employee-list {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }
            .employee-item {
                
                background-color: white;
                border-radius: 10px;
                padding: 15px;
                margin: 15px;
                width: 30%;
                text-align: center;
            }
            .employee-item img {
                border-radius: 50%;
                width: 100%;
                height: auto;
            }
            .employee-item .detail-btn {
                margin-top: 10px;
            }
        </style>

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

                <div class="col-lg-10">
                    <div class="employee-list">
                        <div class="employee-item">
                            <img src="images/img1.png" alt="Image 1">
                            <h5>Image 1</h5>
                            <p>Chàng trai đẹp đẽ, với thân thái rạng rỡ!</p>
                            <button class="btn btn-primary detail-btn">Detail</button>
                        </div>
                        <div class="employee-item">
                            <img src="images/img2.png" alt="Image 2">
                            <h5>Image 2</h5>
                            <p>Cô gái xinh xắn dễ thương nhất quả đất!</p>
                            <button class="btn btn-primary detail-btn">Detail</button>
                        </div>
                        <div class="employee-item">
                            <img src="images/img3.png" alt="Image 3">
                            <h5>Image 3</h5>
                            <p>Chàng trai đẹp đẽ, với nụ cười toả nắng!</p>
                            <button class="btn btn-primary detail-btn">Detail</button>
                        </div>
                        <div class="employee-item">
                            <img src="images/img1.png" alt="Image 1">
                            <h5>Image 1</h5>
                            <p>Chàng trai đẹp đẽ, với thân thái rạng rỡ!</p>
                            <button class="btn btn-primary detail-btn">Detail</button>
                        </div>
                        <div class="employee-item">
                            <img src="images/img2.png" alt="Image 2">
                            <h5>Image 2</h5>
                            <p>Cô gái xinh xắn dễ thương nhất quả đất!</p>
                            <button class="btn btn-primary detail-btn">Detail</button>
                        </div>
                        <div class="employee-item">
                            <img src="images/img3.png" alt="Image 3">
                            <h5>Image 3</h5>
                            <p>Chàng trai đẹp đẽ, với nụ cười toả nắng!</p>
                            <button class="btn btn-primary detail-btn">Detail</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
