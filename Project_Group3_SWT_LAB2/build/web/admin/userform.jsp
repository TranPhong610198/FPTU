<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create New User</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
            }

            .card {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .card-header {
                background-color: #1a2530;
                color: #ecf0f1;
                border-radius: 8px 8px 0 0;
            }

            .form-control:focus {
                border-color: #2c3e50;
                box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
            }

            .btn-primary {
                background-color: #2c3e50;
                border-color: #2c3e50;
            }

            .btn-primary:hover {
                background-color: #34495e;
                border-color: #34495e;
            }

            .btn-secondary {
                background-color: #95a5a6;
                border-color: #95a5a6;
            }

            .btn-secondary:hover {
                background-color: #7f8c8d;
                border-color: #7f8c8d;
            }

            .required::after {
                content: " *";
                color: #e74c3c;
            }

            .alert {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/admin/adminsidebar.jsp" />
        
        <div class="main-content">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title mb-0">Tạo người dùng mới</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        <c:if test="${not empty param.message}">
                            <div class="alert alert-success" role="alert">
                                ${param.message}
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/admin/addUser" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Họ và tên</label>
                                    <input type="text" class="form-control" name="fullname" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Tên đăng nhập</label>
                                    <input type="text" class="form-control" name="username" 
                                           placeholder="" required 
                                           minlength="4" maxlength="20" 
                                           pattern="[A-Za-z0-9]+" 
                                           title="Tên người dùng phải dài từ 4-20 ký tự và không được chứa ký tự đặc biệt."
                                           value="${username != null ? username : ''}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Mật khẩu</label>
                                    <input type="password" class="form-control" name="password" 
                                           placeholder="" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Nhập lại mật khẩu</label>
                                    <input type="password" class="form-control" name="repassword" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Email</label>
                                    <input type="email" class="form-control" name="email" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Số điện thoại</label>
                                    <input type="tel" class="form-control" name="phone" 
                                           required pattern="[0-9]{10}"
                                           title="Số điện thoại phải có 10 chữ số">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Giới tính</label>
                                    <select class="form-select" name="gender" required>
                                        <option value="Male">Nam</option>
                                        <option value="Female">Nữ</option>
                                        <option value="other">Khác</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Vai trò</label>
                                    <select class="form-select" name="role" required>
                                        <option value="">Chọn vai trò</option>
                                        <option value="customer">Customer</option>
                                        <option value="admin">Admin</option>
                                        <option value="sale">Sale</option>
                                        <option value="marketing">Marketing</option>
                                    </select>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end mt-4">
                                <a href="${pageContext.request.contextPath}/admin/userlists" 
                                   class="btn btn-secondary me-2">Quay lại</a>
                                <button type="submit" class="btn btn-primary">Tạo</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>