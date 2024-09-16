<%-- 
    Document   : bai1
    Created on : Sep 14, 2024, 4:46:06 PM
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
        <h1>Hello World!</h1>
        <form action="bai1" method="post">
            enter radius <input type="text" name="radius"/> <br>
            <button type="submit" value="submit">Submit</button>
        </form>
            ${requestScope.mm}
    </body>
</html>
