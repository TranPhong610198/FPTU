<%-- 
    Document   : bai9
    Created on : Sep 17, 2024, 4:57:44 PM
    Author     : tphon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="n" value="20"/>
        <jsp:useBean id="c" class="model.Calculator"/>
        ${c.setNum1(5)}
        ${c.setNum2(10)}
        <c:set var="area" value="${c.area}"/>
        
        <h3>
            n:  ${n}<br>
            Area: ${area}
        </h3>
        
        <h4>
            <c:forEach begin="1" end="${n}" var="i">
                ${i} &nbsp;
                
            </c:forEach><br>
            <c:forEach begin="2" end="${n}" var="i" step="2">
                ${i} &nbsp;
                
            </c:forEach><br>
        </h4>
    </body>
</html>
