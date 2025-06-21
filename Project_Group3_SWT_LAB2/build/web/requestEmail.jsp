<%--
    Document   : resetPassword
    Created on : Feb 9, 2025, 11:40:15 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên Mật Khẩu</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Apply the same background and font styles as other pages */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 20px;
                font-family: 'Poppins', sans-serif;
                background: url('assests/css/requestEmail.jpg') no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }

            .forgot-password-container {
                width: 100%;
                max-width: 500px;
                margin: 0 auto;
            }

            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.08);
                background: rgba(255, 255, 255, 0.9); /* Keep the semi-transparent background */
            }

            .card-header {
                background: none;
                border-bottom: none;
                padding: 20px;
                text-align: center;
            }

            .form-icon {
                font-size: 3rem;
                color: #34495e; /* Dark grayish-blue - Consistent with the main theme */
                margin-bottom: 1rem;
            }

            .card-body {
                padding: 20px;
            }

            .form-control {
                border-radius: 8px;
                padding: 12px;
                margin-bottom: 20px;
                border: 1px solid #bdc3c7; /* Light silver */
                color: #34495e; /* Dark grayish-blue */
                background: rgba(255, 255, 255, 0.7); /* Semi-transparent input fields */
                transition: border-color 0.3s ease;
            }

            .form-control:focus {
                border-color: #2c3e50; /* Dark blue-gray - Consistent with the main theme */
                box-shadow: 0 0 5px rgba(44, 62, 80, 0.3);
                outline: none;
            }

            .btn-primary {
                border-radius: 50px;
                padding: 12px 30px;
                background: #34495e; /* Dark grayish-blue - Consistent with the main theme */
                border: none;
                font-weight: 600;
                color: #ecf0f1; /* Off-white */
                box-shadow: 0 5px 15px rgba(52, 73, 94, 0.4);
                transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            }

            .btn-primary:hover {
                background: #2c3e50; /* Dark blue-gray - Consistent with the main theme */
                transform: translateY(-2px);
                box-shadow: 0 7px 20px rgba(52, 73, 94, 0.5);
            }

            .text-muted {
                color: #546e7a !important; /* Slate gray */
            }

            a {
                color: #2c3e50; /* Dark blue-gray - Consistent with the main theme */
                text-decoration: none;
                transition: color 0.3s ease;
            }

            a:hover {
                color: #34495e; /* Dark grayish-blue */
            }

            /* Error and Success Messages */
            .error-message {
                background-color: #fdeaea;
                color: #c0392b; /* Dark red */
                padding: 10px 15px;
                border-radius: 8px;
                margin-bottom: 15px;
                text-align: center;
                border: 1px solid #e57373;
            }

            .success-message {
                background-color: #e8f5e9;
                color: #2e7d32; /* Dark green */
                padding: 10px 15px;
                border-radius: 8px;
                margin-bottom: 15px;
                text-align: center;
                border: 1px solid #66bb6a;
            }
        </style>
    </head>
    <body>
        <div class="forgot-password-container">
            <div class="card">
                <div class="card-header text-center pt-4">
                    <i class="fas fa-envelope form-icon"></i>
                    <h3 class="fw-bold">Xác Nhận Email</h3>
                    <p class="text-muted">Nhập email của bạn để nhận mã xác nhận</p>
                    <c:if test="${!mess.isEmpty()}">
                        <c:if test="${mess.equals('Hệ thống đã gửi email xác nhận, vui lòng kiểm tra hộp thư.')}">
                            <p style="color: green; margin-bottom: 10px;">
                                ${mess}
                            </p>
                        </c:if>
                        <c:if test="${!(mess.equals('Hệ thống đã gửi email xác nhận, vui lòng kiểm tra hộp thư.'))}">
                            <p style="color: red; margin-bottom: 10px;">
                                ${mess}
                            </p>
                        </c:if>
                    </c:if>
                </div>
                <div class="card-body p-4">
                    <form action="forgotpassword" method="POST">
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email"
                                   placeholder="Nhập địa chỉ email" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">
                            Gửi Mã Xác Nhận
                        </button>
                    </form>
                    <div class="text-center mt-3">
                        <!--<a href="login" class="text-decoration-none">Quay lại đăng nhập</a>-->
                        <a href="#" onclick="window.history.back();">Quay lại</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
