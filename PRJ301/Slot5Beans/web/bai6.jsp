<%-- 
    Document   : bai6
    Created on : Sep 17, 2024, 3:58:44 PM
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
        <form>
            Number 1 : <input type="text" name="num1" value="${param.num1}"/><br/>
            Number 2 : <input type="text" name="num2" value="${param.num2}"/><br/>
            
            Op: <select name="op">
                <option ${(param.op eq '+'?'selected':'')} value="+">+</option>
                <option ${(param.op eq '-'?'selected':'')} value="-">-</option>
                <option ${(param.op eq 'x'?'selected':'')} value="x">x</option>
                <option ${(param.op eq ':'?'selected':'')} value=":">:</option>

            </select> <br> <br>
            <input type="submit" value="Calculate"/>
        </form>
        <hr>
        <jsp:useBean id="c" class="model.Calculator"/>

        <jsp:setProperty name="c" property="*"/>

        <h3>
            <jsp:getProperty name="c" property="result" />    

        </h3>
            
            <h4>
                ${c.result}
            </h4>    
    </body>
</html>
