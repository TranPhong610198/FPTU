<%-- 
    Document   : getDetail
    Created on : Oct 17, 2024, 1:24:11 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h2>${product.name}</h2>
        <p><b>Price:</b> ${product.price}</p>
        <p><b>Description:</b> ${product.description}</p>
        <img src="${product.imageUrl}" alt="${product.name}" width="300" />

        <h3>Sub Images</h3>
        <c:forEach var="subImage" items="${subImages}">
            <img src="${subImage}" alt="Sub Image" width="150" />
        </c:forEach>
            
            
            
    </body>
</html>
