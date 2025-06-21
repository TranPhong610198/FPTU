<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user = (User) session.getAttribute("acc");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    boolean isGoogleAccount = user.getPasswordHash() != null && user.getPasswordHash().startsWith("accGoogle");
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đổi Mật Khẩu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assests/css/changepassword.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        
        <div class="container-changepassword mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2 class="card-title">Đổi Mật Khẩu</h2>
                        </div>
                        <div class="card-body p-4">

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <c:if test="${not empty success}">
                                <div class="alert alert-success">${success}</div>
                            </c:if>
                            
                            <% if (isGoogleAccount) { %>
                                <div class="alert alert-info">
                                    <p>Tài khoản của bạn đăng nhập bằng Google. Nếu bạn muốn đổi mật khẩu, vui lòng sử dụng chức năng "Quên mật khẩu".</p>
                                    <div class="mt-3">
                                        <a href="forgotpassword" class="btn btn-primary">Đi đến Quên mật khẩu</a>
                                    </div>
                                </div>
                            <% } else { %>
                                <form action="changepassword" method="post">
                                    <input type="hidden" name="action" value="change">

                                    <div class="mb-3">
                                        <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                                        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                    </div>
                                    <div><a href="forgotpassword">Quên mật khẩu?</a></div>

                                    <div class="row mt-3 gx-2">
                                        <div class="col-6">
                                            <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
                                        </div>
                                        <div class="col-6">
                                            <a href="profile" class="btn btn-secondary w-100">Hủy</a>
                                        </div>
                                    </div>
                                </form>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>