<%-- 
    Document   : error
    Created on : Feb 17, 2025, 5:11:03 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Trang không tồn tại | Fashion Store</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            text-align: center;
            max-width: 800px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .hanger {
            font-size: 120px;
            margin-bottom: 20px;
            animation: swing 2s infinite ease-in-out;
        }

        @keyframes swing {
            0%, 100% { transform: rotate(-10deg); }
            50% { transform: rotate(10deg); }
        }

        .shoes {
            font-size: 60px;
            margin: 20px 0;
            animation: bounce 1s infinite alternate;
        }

        @keyframes bounce {
            from { transform: translateY(0); }
            to { transform: translateY(-10px); }
        }

        h1 {
            font-size: 48px;
            color: #333;
            margin-bottom: 20px;
            font-weight: 700;
        }

        p {
            font-size: 18px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 15px 40px;
            background: #000;
            color: #fff;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            transition: transform 0.3s, box-shadow 0.3s;
            margin: 10px;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .fashion-items {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 30px 0;
        }

        .fashion-item {
            font-size: 40px;
            animation: float 3s infinite ease-in-out;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }

        .fashion-item:nth-child(2) {
            animation-delay: 0.2s;
        }

        .fashion-item:nth-child(3) {
            animation-delay: 0.4s;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="hanger">👕</div>
        <h1>Ồ không! Trang này đã đi mua sắm rồi</h1>
        <p>Có vẻ như trang bạn đang tìm kiếm đã rời khỏi cửa hàng. Đừng lo lắng, chúng tôi có rất nhiều items thời trang khác đang chờ bạn!</p>
        
        <div class="fashion-items">
            <div class="fashion-item">👗</div>
            <div class="fashion-item">👔</div>
            <div class="fashion-item">👖</div>
        </div>
        
        <div class="shoes">👠</div>
        
        <a href="/" class="btn">Quay về trang chủ</a>
        <a href="/collections" class="btn">Xem bộ sưu tập mới</a>
    </div>
</body>
</html>
