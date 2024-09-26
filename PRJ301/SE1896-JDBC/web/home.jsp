

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List of categories</h1>
        <a href="new.jsp">Add new</a>
        <br/><br/>
        <table border="1px" width="40%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Describe</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <c:set var="id" value="${c.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${c.name}</td>
                    <td>${c.describe}</td>
                    <td>
                        <a onclick="doDelete('${id}')" href="#">Delete</a>&nbsp;&nbsp;&nbsp;
                        <a href="update?id=${id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <script type="text/javascript">
            function doDelete(id){
                if(confirm('Are U sure to delete id '+id+' ?')){
                    window.location='delete?id='+id;
                }
            }
        </script>
    </body>
</html>
