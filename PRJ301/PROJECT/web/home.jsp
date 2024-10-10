<%-- 
    Document   : home
    Created on : Oct 4, 2024, 10:30:03 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/home_css.css"/>
    </head>
    <body>
        <%@include file="./header.jsp" %>
<!--
        <div class="row content">
            <div class="col-md-3 category">
                <table border="1" width="100%">
                    <tr>
                        <th>Categories</th>
                    </tr>
                    <tr>
                        <td>Dell</td>
                    </tr>
                    <tr>
                        <td>Asus</td>
                    </tr>
                </table>

            </div>-->
            <div class="row list product">
                <h2>Toàn bộ sản phẩm</h2>
                <div class="container mt-4">
                    <div class="row">
                        <c:if test="${not empty requestScope.data}">
                            <c:forEach var="product" items="${requestScope.data}">
                                <div class="col-md-3">
                                    <div class="card mb-3 shadow-sm">
                                        <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}" height="350px" width="auto">
                                        <div class="card-body">
                                            <h5 class="card-title">${product.name}</h5>
                                            <p class="card-text">$${product.price}</p>
                                            <p class="card-text">${product.description}</p>
                                            <a href="product-details.jsp?id=${product.id}" class="btn btn-primary">Chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty requestScope.data}">
                            <p>Không có sản phẩm nào để hiển thị.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!--<a href="listProduct" >productCRUD</a>-->

        <%@include file="./footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
