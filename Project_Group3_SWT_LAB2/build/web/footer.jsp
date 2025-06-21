<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>

            /* Liên kết nhanh */
            .social-icons {
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
                max-width: 100%;
            }

            .social-icons a {
                color: white;
                background-color: rgba(255,255,255,0.1);
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.3s;
                font-size: 18px;
                margin-bottom: 10px;
            }

            /* Để hiển thị tối đa 6 icon trên mỗi hàng */
            @media (min-width: 768px) {
                .social-icons {
                    width: 100%;
                }

                .social-icons a {
                    flex: 0 0 calc(16.666% - 13px);
                    max-width: calc(16.666% - 13px);
                }
            }

            /* Điều chỉnh cho màn hình nhỏ hơn */
            @media (max-width: 767px) {
                .social-icons a {
                    flex: 0 0 calc(33.333% - 10px);
                    max-width: calc(33.333% - 10px);
                }
            }
            /*-------------------------------------------*/
            .footer-container {
                background-color: #252A37;
                color: white;
                padding: 50px 0;
                font-family: Arial, sans-serif;
            }
            .footer-content {
                display: flex;
                justify-content: space-between;
                max-width: 1200px;
                margin: 0 auto;
                flex-wrap: wrap;
            }
            .footer-section {
                width: 23%;
                margin-bottom: 20px;
            }
            .footer-section h3 {
                color: white;
                margin-bottom: 20px;
                position: relative;
                padding-bottom: 10px;
            }
            .footer-section h3:after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 50px;
                height: 2px;
                background-color: #1E88E5;
            }
            .footer-section ul {
                list-style: none;
                padding: 0;
            }
            .footer-section ul li {
                margin-bottom: 10px;
            }
            .footer-section ul li a {
                color: #aaa;
                text-decoration: none;
                transition: color 0.3s;
            }
            .footer-section ul li a:hover {
                color: white;
            }
            .social-icons {
                display: flex;
                gap: 15px;
            }
            .social-icons a {
                color: white;
                background-color: rgba(255,255,255,0.1);
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.3s;
                font-size: 18px;
            }
            .social-icons a:hover {
                background-color: #1E88E5;
            }
            .footer-map {
                width: 100%;
                border-radius: 8px;
                overflow: hidden;
                margin-top: 15px;
            }
            @media (max-width: 768px) {
                .footer-section {
                    width: 48%;
                    margin-bottom: 30px;
                }
                .footer-content {
                    flex-direction: column;
                    padding: 0 20px;
                }
            }
        </style>
    </head>
    <body>
        <footer class="footer-container">
            <div class="footer-content">
                <!-- Thông tin công ty -->
                <div class="footer-section">
                    <h3>Thông tin công ty</h3>
                    <ul>
                        <c:forEach items="${companyInfo}" var="info">
                            <li>
                                <c:if test="${not empty info.image}">
                                    <img src="${info.image}" alt="${info.fieldName}" style="max-width: 120px; margin-bottom: 15px;">
                                </c:if>
                                <c:if test="${info.fieldName eq 'logo'}">
                                    <img src="${info.value}" alt="Company Logo" style="max-width: 120px; margin-bottom: 15px;">
                                </c:if>
                                <c:if test="${info.fieldName ne 'logo'}">
                                    <strong>${info.fieldName}:</strong> ${info.value}
                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <!-- Thông tin liên hệ -->
                <div class="footer-section">
                    <h3>Thông tin liên hệ</h3>
                    <ul>
                        <c:forEach items="${contactInfo}" var="contact">
                            <li>
                                <c:choose>
                                    <c:when test="${contact.fieldName eq 'Địa chỉ'}">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </c:when>
                                    <c:when test="${contact.fieldName eq 'Điện thoại'}">
                                        <i class="fas fa-phone"></i>
                                    </c:when>
                                    <c:when test="${contact.fieldName eq 'Email'}">
                                        <i class="fas fa-envelope"></i>
                                    </c:when>
                                    <c:when test="${contact.fieldName eq 'Giờ làm việc'}">
                                        <i class="fas fa-clock"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-info-circle"></i>
                                    </c:otherwise>
                                </c:choose>
                                <span>${contact.fieldName}: ${contact.value}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <!-- Liên kết nhanh và mạng xã hội -->
                <div class="footer-section">
                    <h3>Mạng xã hội</h3>
                    <div class="social-icons">
                        <c:forEach items="${socialLinks}" var="social">
                            <c:choose>
                                <c:when test="${social.fieldName eq 'Facebook'}">
                                    <a href="${social.value}" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    </c:when>
                                    <c:when test="${social.fieldName eq 'Instagram'}">
                                    <a href="${social.value}" target="_blank"><i class="fab fa-instagram"></i></a>
                                    </c:when>
                                    <c:when test="${social.fieldName eq 'Twitter'}">
                                    <a href="${social.value}" target="_blank"><i class="fab fa-twitter"></i></a>
                                    </c:when>
                                    <c:when test="${social.fieldName eq 'Youtube'}">
                                    <a href="${social.value}" target="_blank"><i class="fab fa-youtube"></i></a>
                                    </c:when>
                                    <c:when test="${social.fieldName eq 'LinkedIn'}">
                                    <a href="${social.value}" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${not empty social.image}">
                                            <a href="${social.value}" target="_blank">
                                                <img src="${social.image}" alt="${social.fieldName}" style="width: 22px; height: 22px; object-fit: contain;">
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${social.value}" target="_blank"><i class="fas fa-link"></i></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                    </div>
                </div>

                <div class="footer-section">
                    <h3>Địa chỉ shop</h3>
                    <div class="footer-map">
                        <iframe 
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3131.5658496875026!2d105.53028539866351!3d21.02946918218991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134598cba855fa3%3A0xa996e7fddd39b07f!2zTmjDoCB0cuG7jSBNaW5oIFF1w6Ju!5e0!3m2!1sen!2s!4v1740045314800!5m2!1sen!2s"
                            width="100%" 
                            height="200" 
                            style="border:0;" 
                            allowfullscreen 
                            loading="lazy" 
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>