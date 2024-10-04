<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add new a category</h1>
        <h3 style="color:red">${requestScope.error}</h3>
        <form action="add">
            enter ID: <input type="text" name="id"/><br/>
            enter name: <input type="text" name="name"/><br/>
            enter describe: <input type="text" name="describe"/><br/>
            <input type="submit" value="UPDATE"/>
        </form>
    </body>
</html>
