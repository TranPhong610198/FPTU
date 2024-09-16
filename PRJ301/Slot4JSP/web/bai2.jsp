<%-- 
    Document   : bai2
    Created on : Sep 14, 2024, 5:10:37 PM
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
        <h1>HE186443</h3>
        <form action="bai2" method="post">
            Get first <input type="text" name="radius"/> letters <br/>
            <button type ="submit">GET</button>
        </form>
        <h2 style = 'color: darkcyan'>
            ${requestScope.mm}
        </h2>
    </body>
</html>
