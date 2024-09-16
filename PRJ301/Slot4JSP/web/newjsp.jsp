<%-- 
    Document   : newjsp
    Created on : Sep 14, 2024, 3:35:39 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            //Javacode Here
            String name = "TheMoriarty";
            out.print("Hello "+ name+ " !<br>");
            double r = 1, area= Math.PI*r*r;
            out.print("Area: "+ area +"<br>");
        %>
        
        <%
            
        %>
        
        <h2 Style="color: darkcyan">
            Hello <%= name%>!<br>
            Area <%= Math.PI*r*r%><br>
            
        </h2>
            
            <hr>
            <%@include  file="index.html"%>
            <hr><!-- comment -->
            <%@include file="n1.jsp" %>
                
    </body>
</html>
