<%-- 
    Document   : Show
    Created on : Jul 9, 2024, 8:13:51 PM
    Author     : TomTit
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
        List of Subjects:
        <form action="show" method="get">
            <select onchange="this.form.submit()" name="subID">
                <option value="">All subjecs</option>
                <c:forEach items="${data1}" var="s">
                    <option value="${s.getId()}" ${(requestScope.subID==s.getId())?'selected':''}>${s.getName()}</option>
                </c:forEach>
            </select>
        </form>
        <br>
        List of Students:
        <table border="1">
            <tr>
                <td>Code</td>
                <td>Name</td>
                <td>Date of birth</td>
                <td>Gender</td>
                <td>Subject</td>
                <td>Select</td>
            </tr>
            <c:forEach items="${data2}" var="i">
                <tr>
                    <td>${i.getCode()}</td>
                    <td>${i.getName()}</td>
                    <td>${i.getDob()}</td>
                    <td>${i.getGender()?'Male':'Female'}</td>
                    <td>${i.getSubject()}</td>
                    <td>
                        <a href="getDetail?code=${i.getCode()}&subID=${requestScope.subID}">Select</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        Detail information:
        <c:set value="${requestScope.data3}" var="stud"/>
        <table>
            <tr>
                <td>Code:</td>
                <td><input type="text" name="code" value="${stud.code}"></td>
                <td>Name:</td>
                <td><input type="text" name="name" value="${stud.name}"></td>
            </tr>
            <tr>
                <td>Date of birth:</td>
                <td><input type="text" name="dob" value="${stud.dob}"></td>
                <td>Gender:</td>
                <td>
                    <input type="radio" name="gender" ${stud.gender?'checked':''}>Male
                    <input type="radio" name="gender" ${stud.gender?'':'checked'}>Female
                </td>
            </tr>
            <tr>
                <td>Subject:</td>
                <td><input type="text" name="subject" value="${stud.subject}"></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </body>
</html>
