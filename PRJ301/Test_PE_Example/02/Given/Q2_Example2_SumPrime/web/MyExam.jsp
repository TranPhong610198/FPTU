<%-- 
    Document   : MyExam
    Created on : Oct 24, 2024, 2:18:18 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="sum" method="post">
            Enter an integer n: <input type="text" name="n" value="${requestScope.n}"><br>
            Result:<input type="text" name="rs" value="${requestScope.rs}" readonly><br>
            <button type="submit">SUM</button> ${requestScope.err}
        </form>
    </body>
</html>
