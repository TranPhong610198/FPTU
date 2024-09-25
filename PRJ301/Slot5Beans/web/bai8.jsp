<%-- 
    Document   : bai8
    Created on : Sep 17, 2024, 4:43:03 PM
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
        <h1>Calculating with EL</h1>
        <form method="post">
            Enter number 1:
            <input type="text" name="num1" value="${param.num1}"/><br/>
            Enter number 2:
            <input type="text" name="num2" value="${param.num2}"/><br/>
            Enter number 3:
            <input type="text" name="num3" value="${param.num3}"/><br/>
            <h3 style="color: blue">Sum: ${param.num1 + param.num2 + param.num3}</h3>
            <h3 style="color: blue">Avg: ${(param["num1"] + param["num2"] + param["num3"])/3}</h3>
            <input type="submit" value="Calculate"/>
        </form>
    </body>
</html>
