<%-- 
    Document   : homepage
    Created on : Feb 18, 2025, 12:13:18 AM
    Author     : VuxD4t
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fashion Shop</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Thêm vào phần head, sau Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.3.2/swiper-bundle.min.css">
        <!-- Custom CSS -->
        <style>
            .productSwiper {
                padding: 2rem 1rem;
                position: relative;
            }

            .swiper-button-next,
            .swiper-button-prev {
                color: #0984e3;
                background: white;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .swiper-button-next:after,
            .swiper-button-prev:after {
                font-size: 1.2rem;
            }

            .swiper-pagination-bullet {
                width: 10px;
                height: 10px;
            }

            .swiper-pagination-bullet-active {
                background: #0984e3;
            }

            .swiper-slide {
                height: auto;
            }
            .featured-products {
                position: relative;
                padding: 2rem 0;
            }

            .product-card {
                border: none;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
                transition: all 0.3s ease;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            }

            .product-card .thumbnail-img {
                height: 350px;
                object-fit: cover;
                transition: all 0.5s ease;
            }

            .product-card:hover .thumbnail-img {
                transform: scale(1.05);
            }

            .product-card .card-body {
                padding: 1.5rem;
                background: white;
            }

            .product-title {
                font-size: 1.1rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: #2d3436;
            }

            .product-description {
                font-size: 0.9rem;
                color: #636e72;
                margin-bottom: 1rem;
            }

            .product-price {
                font-size: 1.2rem;
                color: #0984e3;
                font-weight: 700;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .product-badge {
                position: absolute;
                top: 1rem;
                right: 1rem;
                background: red;
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 500;
            }

            /* Optional: Add a gradient overlay to section title */
            .section-title {
                font-size: 2rem;
                font-weight: 700;
                margin-bottom: 2rem;
                padding-bottom: 1rem;
                position: relative;
            }

            .section-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100px;
                height: 4px;
                background: linear-gradient(to right, #0984e3, #00b894);
                border-radius: 2px;
            }
            /* For Bài đăng nổi bật - equal height cards */
            .post-card {
                height: 100%;
                display: flex;
                flex-direction: column;
            }

            .post-card .card-body {
                flex: 1; /* This makes all card bodies take up equal space */
            }

            /* For Sản phẩm nổi bật & Bài đăng mới nhất - larger images */
            .product-card .thumbnail-img,
            .post-card .thumbnail-img {
                height: 400px; /* Increased from 200px */
                object-fit: cover;
                width: 100%;
            }

            /* Optional: Make cards slightly larger overall */
            .product-card,
            .post-card {
                margin-bottom: 20px;
            }

            /* Ensure text content doesn't overflow */
            .card-title {
                font-size: 1.1rem;
                margin-bottom: 0.75rem;
            }

            .card-text {
                font-size: 0.9rem;
            }
            .product-card, .post-card {
                transition: transform 0.3s;
                height: 100%;
            }
            .product-card:hover, .post-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            .carousel-item img {
                height: 500px; /* Tăng từ 500px lên 700px */
                object-fit: cover;
                width: 100%;
            }
            #mainCarousel {
                margin-bottom: 50px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }

            .carousel-caption {
                background: rgba(0,0,0,0.5);
                padding: 20px;
                border-radius: 5px;
            }
            .thumbnail-img {
                height: 200px;
                object-fit: cover;
            }
            .section-title {
                position: relative;
                margin-bottom: 30px;
                padding-bottom: 10px;
            }
            .section-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 50px;
                height: 3px;
                background-color: #007bff;
            }
            /*....................*/

            /*.............................................*/

            .ai-chat-widget {
                position: fixed;
                bottom: 80px;
                right: 20px;
                width: 350px;
                height: 450px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.2);
                display: none;
                flex-direction: column;
                overflow: hidden;
                z-index: 999;
            }

            .ai-chat-header {
                background: #4285F4;
                color: white;
                padding: 15px;
                font-weight: bold;
                display: flex;
                justify-content: space-between;
            }

            .ai-chat-close {
                cursor: pointer;
            }

            .ai-chat-messages {
                flex-grow: 1;
                overflow-y: auto;
                padding: 15px;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .ai-message {
                padding: 10px;
                border-radius: 10px;
                max-width: 80%;
                word-break: break-word;
            }

            .ai-message.user {
                background: #E9EAEC;
                align-self: flex-end;
            }

            .ai-message.bot {
                background: #F1F3F4;
                align-self: flex-start;
            }

            .ai-chat-input {
                display: flex;
                padding: 10px;
                border-top: 1px solid #eee;
            }

            .ai-chat-input input {
                flex-grow: 1;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 20px;
                margin-right: 10px;
            }

            .ai-chat-input button {
                background: #4285F4;
                color: white;
                border: none;
                border-radius: 20px;
                padding: 10px 15px;
                cursor: pointer;
            }

            .ai-chat-button {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 500;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #4285F4;
                border: none;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .ai-chat-button:hover {
                transform: scale(1.1);
            }
        </style>


    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="header.jsp" />
        <!-- Thanh trượt (Carousel) -->
        <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-indicators">
                <c:forEach items="${sliders}" var="slider" varStatus="loop">
                    <button type="button" data-bs-target="#mainCarousel" 
                            data-bs-slide-to="${loop.index}" 
                            class="${loop.index == 0 ? 'active' : ''}">
                    </button>
                </c:forEach>
            </div>
            <div class="carousel-inner">
                <c:forEach items="${sliders}" var="slider" varStatus="loop">
                    <div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
                        <a href="${slider.link}">
                            <img src="${slider.image_url}" 
                                 class="d-block w-100" 
                                 alt="${slider.title}">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>${slider.title}</h5>
                            <p>${slider.notes}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Khởi tạo carousel với tùy chọn tương tự như Swiper
                const carousel = document.getElementById('mainCarousel');
                const carouselInstance = new bootstrap.Carousel(carousel, {
                    interval: 3000, // Thời gian chuyển slide - 3 giây
                    pause: 'hover', // Tạm dừng khi di chuột qua
                    wrap: true, // Quay vòng khi đến slide cuối cùng
                    keyboard: true, // Cho phép điều khiển bằng bàn phím
                    touch: true        // Cho phép điều khiển bằng cảm ứng
                });

                // Lấy chỉ số slide đã lưu (nếu có)
                const savedSlideIndex = localStorage.getItem('mainCarouselIndex');
                if (savedSlideIndex !== null) {
                    carouselInstance.to(parseInt(savedSlideIndex));
                }

                // Lưu chỉ số slide khi người dùng chuyển slide
                carousel.addEventListener('slide.bs.carousel', function (event) {
                    localStorage.setItem('mainCarouselIndex', event.to);
                });
            });
        </script>

        <div class="container">           

            <!-- Sản phẩm mới nhất -->
            <section class="featured-products mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Sản phẩm mới nhất</h2>
                        <a href="listproduct?sortBy=newest" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="swiper productSwiper">
                        <div class="swiper-wrapper">
                            <c:forEach items="${featuredProducts}" var="product">
                                <div class="swiper-slide">
                                    <a href="productdetail?id=${product.id}" class="text-decoration-none">
                                        <div class="card product-card">
                                            <div class="position-relative">
                                                <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                                <span class="product-badge">Mới</span>
                                            </div>
                                            <div class="card-body">
                                                <h5 class="product-title">${product.title}</h5>
                                                
                                                <div class="product-price">
                                                    <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </section>

            <!-- Quần áo nam -->
            <section class="mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Quần áo nam</h2>
                        <a href="listproduct?category=1" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="row g-4">
                        <c:forEach items="${menClothingProducts}" var="product">
                            <div class="col-md-3 col-6">
                                <a href="productdetail?id=${product.id}" class="text-decoration-none">
                                    <div class="card product-card h-100">
                                        <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                        <div class="card-body">
                                            <h5 class="product-title">${product.title}</h5>
                                            <div class="product-price">
                                                <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <!-- Quần áo nữ -->
            <section class="mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Quần áo nữ</h2>
                        <a href="listproduct?category=2" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="row g-4">
                        <c:forEach items="${womanClothingProducts}" var="product">
                            <div class="col-md-3 col-6">
                                <a href="productdetail?id=${product.id}" class="text-decoration-none">
                                    <div class="card product-card h-100">
                                        <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                        <div class="card-body">
                                            <h5 class="product-title">${product.title}</h5>
                                            <div class="product-price">
                                                <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <!-- Quần áo trẻ em -->
            <section class="mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Quần áo trẻ em</h2>
                        <a href="listproduct?category=3" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="row g-4">
                        <c:forEach items="${babyClothingProducts}" var="product">
                            <div class="col-md-3 col-6">
                                <a href="productdetail?id=${product.id}" class="text-decoration-none">
                                    <div class="card product-card h-100">
                                        <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                        <div class="card-body">
                                            <h5 class="product-title">${product.title}</h5>
                                            <div class="product-price">
                                                <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            
            <!-- Phụ kiện -->
            <section class="mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Phụ kiện</h2>
                        <a href="listproduct?category=4" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="row g-4">
                        <c:forEach items="${accessoryProducts}" var="product">
                            <div class="col-md-3 col-6">
                                <a href="productdetail?id=${product.id}" class="text-decoration-none">
                                    <div class="card product-card h-100">
                                        <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                        <div class="card-body">
                                            <h5 class="product-title">${product.title}</h5>
                                            <div class="product-price">
                                                <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            
            <!-- Giày dép -->
            <section class="mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Giày dép</h2>
                        <a href="listproduct?category=5" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="row g-4">
                        <c:forEach items="${shoesProducts}" var="product">
                            <div class="col-md-3 col-6">
                                <a href="productdetail?id=${product.id}" class="text-decoration-none">
                                    <div class="card product-card h-100">
                                        <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                        <div class="card-body">
                                            <h5 class="product-title">${product.title}</h5>
                                            <div class="product-price">
                                                <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            
            <!-- Bài đăng mới nhất -->
            <section class="mb-5">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title mb-0">Bài đăng mới nhất</h2>
                    <a href="posts" class="btn btn-outline-primary">
                        Xem tất cả
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                        </svg>
                    </a>
                </div>
                <div class="row g-4">
                    <c:forEach items="${latestPosts}" var="post">
                        <div class="col-md-6">
                            <a href="post?id=${post.id}" class="text-decoration-none text-dark">
                                <div class="card post-card">
                                    <img src="${post.thumbnail}" class="card-img-top thumbnail-img" alt="${post.title}">
                                    <div class="card-body">
                                        <h5 class="card-title">${post.title}</h5>
                                        <p class="card-text">
                                            <c:choose>
                                                <c:when test="${fn:length(post.summary) > 78}">
                                                    ${fn:substring(post.summary, 0, 78)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${post.summary}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </section>

        </div>



        <!-- Chat Button -->
        <div class="ai-chat-button" onclick="toggleChatWidget()">
            <img src="https://cdn-icons-png.flaticon.com/512/5962/5962463.png" alt="Chat AI" width="35" height="35">
        </div>

        <!-- Chat Widget -->
        <div class="ai-chat-widget" id="aiChatWidget">
            <div class="ai-chat-header">
                <div>Góc hỏi đáp</div>
                <div class="ai-chat-close" onclick="toggleChatWidget()">✕</div>
            </div>
            <div class="ai-chat-messages" id="aiChatMessages">
                <div class="ai-message bot">Chào bạn! Tôi là trợ lý của Fashion Shop. Tôi có thể giúp gì cho bạn?</div>
            </div>
            <div class="ai-chat-input">
                <input type="text" id="userInput" placeholder="Nhập câu hỏi của bạn..." onkeypress="if (event.key === 'Enter')
                            sendMessage()">
                <button onclick="sendMessage()">Gửi</button>
            </div>
        </div>
        <script>
            // Hiển thị/ẩn chat widget
            function toggleChatWidget() {
                const widget = document.getElementById('aiChatWidget');
                if (widget.style.display === 'flex') {
                    widget.style.display = 'none';
                } else {
                    widget.style.display = 'flex';
                }
            }

            // Gửi tin nhắn đến API và hiển thị phản hồi
            async function sendMessage() {
                const input = document.getElementById('userInput');
                const message = input.value.trim();

                if (!message)
                    return;

                // Hiển thị tin nhắn của người dùng
                addMessage('user', message);
                input.value = '';

                // Hiển thị đang nhập
                const tempId = addMessage('bot', 'Đang nhập...');

                try {
                    // Gọi API Gemini
                    const response = await callGeminiAPI(message);

                    // Cập nhật tin nhắn bot
                    updateMessage(tempId, response);
                } catch (error) {
                    updateMessage(tempId, "Xin lỗi, câu hỏi của bạn khó quá. Tôi không thể xử lý được. Hãy hỏi Trần Phong :>");
                    console.error("Error calling Gemini API:", error);
                }
            }

            // Thêm tin nhắn vào khung chat
            function addMessage(type, content) {
                const messagesContainer = document.getElementById('aiChatMessages');
                const messageElement = document.createElement('div');
                messageElement.classList.add('ai-message', type);
                messageElement.textContent = content;

                const id = 'msg-' + Date.now();
                messageElement.id = id;

                messagesContainer.appendChild(messageElement);
                messagesContainer.scrollTop = messagesContainer.scrollHeight;

                return id;
            }

            // Cập nhật nội dung tin nhắn
            function updateMessage(id, content) {
                const messageElement = document.getElementById(id);
                if (messageElement) {
                    messageElement.textContent = content;
                }
            }

            // Gọi Gemini API (cần thay API_KEY thực tế của bạn)
            async function callGeminiAPI(prompt) {
                const API_KEY = 'AIzaSyA12flOEGLDWppjXlvurjzZVwC2ug9rA-o'; // Thay bằng API key thực của bạn
                const API_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

                const requestBody = {
                    contents: [{
                            parts: [{
                                    text: `Bạn là trợ lý AI của Fashion Shop, một cửa hàng thời trang. Hãy trả lời câu hỏi sau một cách ngắn gọn, hữu ích: ${prompt}`
                                }]
                        }],
                    generationConfig: {
                        temperature: 0.7,
                        maxOutputTokens: 800
                    }
                };

                const response = await fetch(`${API_URL}?key=${API_KEY}`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(requestBody)
                        });

                        const data = await response.json();

                        if (data.candidates && data.candidates[0].content.parts[0].text) {
                            return data.candidates[0].content.parts[0].text;
                        } else {
                            throw new Error('Không nhận được phản hồi hợp lệ');
                        }
                    }
        </script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="footer.jsp" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.3.2/swiper-bundle.min.js"></script>
        <script>
                    var swiper = new Swiper(".productSwiper", {
                        slidesPerView: 1,
                        spaceBetween: 20,
                        loop: true,
                        pagination: {
                            el: ".swiper-pagination",
                            clickable: true,
                        },
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                        autoplay: {
                            delay: 3000,
                            disableOnInteraction: false,
                        },
                        breakpoints: {
                            640: {
                                slidesPerView: 2,
                            },
                            768: {
                                slidesPerView: 3,
                            },
                            1024: {
                                slidesPerView: 4,
                            },
                        },
                    });
        </script>
    </body>
</html>
