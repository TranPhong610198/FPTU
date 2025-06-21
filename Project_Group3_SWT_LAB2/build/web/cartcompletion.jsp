<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
        }
        .completion-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 30px;
            text-align: center;
        }
        .success-icon {
            color: #28a745;
            font-size: 64px;
            margin-bottom: 20px;
        }
        .order-info {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            text-align: left;
        }
        .delivery-status {
            margin: 30px 0;
            position: relative;
        }
        .status-line {
            height: 3px;
            background: #e9ecef;
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            z-index: 1;
        }
        .status-steps {
            position: relative;
            z-index: 2;
            display: flex;
            justify-content: space-between;
        }
        .status-step {
            background: white;
            padding: 0 10px;
        }
        .status-step.active {
            color: #28a745;
        }
        .status-step i {
            font-size: 24px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="completion-card">
            <!-- Icon thành công -->
            <i class="fas fa-check-circle success-icon"></i>
            <h1 class="mb-3">Đặt hàng thành công!</h1>
            <p class="text-muted">Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đang được xử lý.</p>

            <!-- Thông tin đơn hàng -->
            <div class="order-info">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Thông tin đơn hàng</h5>
                        <p><strong>Mã đơn hàng:</strong> #ORD123456</p>
                        <p><strong>Ngày đặt:</strong> 19/02/2024</p>
                        <p><strong>Tổng tiền:</strong> 530.000₫</p>
                        <p><strong>Phương thức thanh toán:</strong> COD</p>
                    </div>
                    <div class="col-md-6">
                        <h5>Thông tin giao hàng</h5>
                        <p><strong>Người nhận:</strong> Nguyễn Văn A</p>
                        <p><strong>Số điện thoại:</strong> 0987654321</p>
                        <p><strong>Địa chỉ:</strong> 123 Đường ABC, Phường XYZ, Quận 1, TP.HCM</p>
                    </div>
                </div>
            </div>

            <!-- Trạng thái đơn hàng -->
            <div class="delivery-status">
                <div class="status-line"></div>
                <div class="status-steps">
                    <div class="status-step active text-center">
                        <i class="fas fa-shopping-cart"></i>
                        <div>Đặt hàng</div>
                        <small>19/02 10:30</small>
                    </div>
                    <div class="status-step text-center">
                        <i class="fas fa-box"></i>
                        <div>Xác nhận</div>
                        <small>Đang chờ</small>
                    </div>
                    <div class="status-step text-center">
                        <i class="fas fa-truck"></i>
                        <div>Vận chuyển</div>
                        <small>-</small>
                    </div>
                    <div class="status-step text-center">
                        <i class="fas fa-home"></i>
                        <div>Giao hàng</div>
                        <small>-</small>
                    </div>
                </div>
            </div>

            <!-- Chi tiết sản phẩm -->
            <div class="order-info">
                <h5>Chi tiết sản phẩm</h5>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Tổng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Áo thun nam - Đen, Size L</td>
                                <td>2</td>
                                <td>250.000₫</td>
                                <td>500.000₫</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Thông tin thêm -->
            <div class="alert alert-info mt-4" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                Chúng tôi sẽ gửi email xác nhận đơn hàng và thông tin cập nhật về việc giao hàng.
            </div>

            <!-- Nút điều hướng -->
            <div class="mt-4">
                <a href="cartdetails" class="btn btn-primary me-2">
                    <i class="fas fa-list me-2"></i>Xem đơn hàng của tôi
                </a>
                <a href="homepage.jsp" class="btn btn-outline-secondary">
                    <i class="fas fa-home me-2"></i>Về trang chủ
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>