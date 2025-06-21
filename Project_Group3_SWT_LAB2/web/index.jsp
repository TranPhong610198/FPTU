<%-- 
    Document   : index
    Created on : Jan 27, 2025, 4:12:56 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <div class="user-menu">
                <c:if test="${not empty sessionScope.acc}">
                    <div class="dropdown">
                        <button class="dropbtn">
                            <img src="${sessionScope.acc.avatar}" alt="avatar" class="avatar-img" 
                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                            <div class="user-info">
                                <span class="full-name">${sessionScope.acc.fullName}</span>
                                <span class="username">username: ${sessionScope.acc.username}</span>
                            </div>
                        </button>
                            
                        <div class="dropdown-content">
                            <a href="logout">Đăng xuất</a>
                            <a href="profile">Profile</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty sessionScope.acc}">
                    <a href="login" class="login-btn">Đăng nhập</a>
                </c:if>
            </div>

            <style>
                .user-menu {
                    position: relative;
                    display: inline-block;
                    margin-left: 20px;
                }

                .avatar-img {
                    width: 32px;
                    height: 32px;
                    border-radius: 50%;
                    margin-right: 8px;
                }

                .dropbtn {
                    background-color: transparent;
                    color: #333;
                    padding: 8px 16px;
                    border: none;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                }

                .user-info {
                    display: flex;
                    flex-direction: column;
                    align-items: flex-start;
                    margin-left: 8px;
                }

                .full-name {
                    font-weight: 500;
                    color: #333;
                    font-size: 14px;
                }

                .username {
                    font-size: 12px;
                    color: #666;
                }

                .dropdown-content {

                    background-color: #f9f9f9;
                    min-width: 160px;
                    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                    z-index: 1;
                    border-radius: 4px;
                    margin-top: 5px;
                }

                .dropdown-content a {
                    color: black;
                    padding: 12px 16px;
                    text-decoration: none;
                    display: block;
                }

                .login-btn {
                    color: #333;
                    text-decoration: none;
                    padding: 8px 16px;
                    border: 1px solid #333;
                    border-radius: 4px;
                }

                .login-btn:hover {
                    background-color: #333;
                    color: white;
                }
            </style>
        </header>
    </body>
</html>

