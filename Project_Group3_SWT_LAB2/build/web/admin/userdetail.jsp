<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa thông tin người dùng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
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
                padding: 15px 20px;
            }

            .card-header h2 {
                margin: 0;
                font-size: 1.5rem;
            }

            .avatar-container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                padding: 20px;
            }

            .avatar-container img {
                width: 180px;
                height: 180px;
                object-fit: cover;
                border-radius: 50%;
                border: 4px solid #2c3e50;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease-in-out;
            }

            .avatar-container img:hover {
                transform: scale(1.05);
            }

            .form-label {
                font-weight: 600;
                color: #2c3e50;
            }

            .form-control:disabled,
            .form-control[readonly] {
                background-color: #f8f9fa;
                border-color: #e9ecef;
            }

            .timestamp-info {
                color: #2c3e50;
                font-size: 0.9em;
                background: #f8f9fa;
                padding: 15px;
                border-radius: 5px;
                margin: 20px 0;
                border-left: 4px solid #2c3e50;
            }

            .status-radio {
                display: none;
            }

            .status-label {
                display: inline-block;
                padding: 0.5em 1em;
                margin: 0 0.5em;
                border-radius: 0.25rem;
                cursor: pointer;
                transition: all 0.3s ease;
                opacity: 0.7;
                font-size: 0.875rem;
            }

            .status-radio:checked + .status-label {
                opacity: 1;
                transform: scale(1.05);
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .status-label-active {
                background-color: #2ecc71;
                color: white;
            }

            .status-label-inactive {
                background-color: #e74c3c;
                color: white;
            }

            .status-container {
                display: flex;
                align-items: center;
                gap: 10px;
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

            .form-select:focus {
                border-color: #2c3e50;
                box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
            }
        </style>
    </head>

    <body>
        <jsp:include page="/admin/adminsidebar.jsp" />
        <div class="main-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10 offset-md-1">
                        <div class="card">
                            <div class="card-header">
                                <h2><i class="fas fa-user-edit me-2"></i>Chỉnh sửa thông tin người dùng</h2>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/admin/userdetail/edit" method="post">
                                    <input type="hidden" name="id" value="${user.id}">

                                    <div class="row">
                                        <div class="col-md-4 avatar-container">
                                            <img src="${(user.avatar.contains('https')) ? user.avatar : pageContext.request.contextPath.concat('/').concat(user.avatar)}" 
                                                 alt="avatar" id="avatar-preview"
                                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                                        </div>

                                        <div class="col-md-8">
                                            <div class="mb-3">
                                                <label class="form-label">Username:</label>
                                                <input type="text" class="form-control" name="username" value="${user.username}" readonly>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Họ và tên:</label>
                                                <input type="text" class="form-control" name="fullName" value="${user.fullName}" readonly>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Email:</label>
                                                <input type="email" class="form-control" name="email" value="${user.email}" readonly>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Số điện thoại:</label>
                                                <input type="tel" class="form-control" name="mobile" value="${user.mobile}" readonly>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Giới tính:</label>
                                                <input type="text" class="form-control" name="gender1" 
                                                       value="${!user.gender.equals('other') ? (user.gender.equals('male') ? 'Nam' : 'Nữ') : 'Khác'}" readonly>
                                                <input hidden type="text" class="form-control" name="gender" value="${user.gender}" readonly>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Vai trò:</label>
                                                <select class="form-select" id="role" name="role">
                                                    <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                                    <option value="customer" ${user.role == 'customer' ? 'selected' : ''}>Customer</option>
                                                    <option value="sale" ${user.role == 'Sale' ? 'selected' : ''}>Sale</option>
                                                    <option value="marketing" ${user.role == 'Marketing' ? 'selected' : ''}>Marketing</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Trạng thái:</label>
                                                <div class="status-container mt-2">
                                                    <input type="radio" class="status-radio" name="status" id="status-active" 
                                                           value="active" ${user.status == 'active' ? 'checked' : ''}>
                                                    <label for="status-active" class="status-label status-label-active">
                                                        <i class="fas fa-check-circle me-1"></i>Hoạt động
                                                    </label>
                                                    <input type="radio" class="status-radio" name="status" id="status-inactive" 
                                                           value="inactive" ${user.status == 'inactive' ? 'checked' : ''}>
                                                    <label for="status-inactive" class="status-label status-label-inactive">
                                                        <i class="fas fa-times-circle me-1"></i>Không hoạt động
                                                    </label>
                                                    <input type="radio" class="status-radio" name="status" id="status-pending" 
                                                           value="pending" ${user.status == 'pending' ? 'checked' : ''} 
                                                           onclick="return false;" style="pointer-events: none;">
                                                    <label for="status-pending" class="status-label status-label-pending" style="pointer-events: none;">
                                                        <i class="fas fa-clock me-1"></i>Đang chờ
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="timestamp-info">
                                            <p><i class="fas fa-clock me-2"></i><strong>Ngày tạo:</strong> 
                                                    <c:choose>
                                                        <c:when test="${not empty user.createdAt}">
                                                            ${fn:substringBefore(user.createdAt, '.')}
                                                        </c:when>
                                                        <c:otherwise>Không có dữ liệu</c:otherwise>
                                                </c:choose>
                                            </p>
                                            <p><i class="fas fa-history me-2"></i><strong>Cập nhật lần cuối:</strong> 
                                                    <c:choose>
                                                        <c:when test="${not empty user.updatedAt}">
                                                            ${fn:substringBefore(user.updatedAt, '.')}
                                                        </c:when>
                                                        <c:otherwise>Không có dữ liệu</c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>

                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fas fa-save me-2"></i>Lưu thay đổi
                                            </button>
                                            <a href="../userlists" class="btn btn-secondary ms-2">
                                                <i class="fas fa-times me-2"></i>Hủy
                                            </a>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>