<%-- 
    Document   : sidebar
    Created on : Feb 9, 2025, 8:52:55 PM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="sidebar-header p-3 border-bottom">
        <h5 class="mt-2 mb-3">Admin Dashboard</h5>
    </div>

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu list-unstyled p-0 mt-3">
        <li class="menu-item p-2">
            <a href="dashboard" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-chart-bar me-2"></i>
                Dashboard
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="#productSubmenu" data-bs-toggle="collapse" class="text-decoration-none text-light d-flex align-items-center justify-content-between">
                <div>
                    <i class="fas fa-box me-2"></i>
                    Quản lý
                </div>
                <i class="fas fa-chevron-down ms-auto"></i>
            </a>
            <ul class="submenu collapse show list-unstyled ms-3 mt-1" id="productSubmenu">
                <li class="submenu-item py-1">
                    <a href="userlists" class="text-decoration-none text-light">Danh sách người dùng</a>
                </li>
                <li class="submenu-item py-1">
                    <a href="categorylists" class="text-decoration-none text-light">Danh sách danh mục</a>
                </li>
                <li class="submenu-item py-1">
                    <a href="footer-settings" class="text-decoration-none text-light">Những dấu ấn cuối trang</a>
                </li>
            </ul>
        </li>
<!--        <li class="menu-item p-2">
            <a href="campaignlist" class="text-decoration-none text-light d-flex align-items-center justify-content-between">
                <div>
                    <i class="fas fa-bullhorn me-2"></i>
                    Chiến dịch Marketing
                </div>
                <span class="badge bg-danger rounded-pill">3</span>
            </a>
        </li>-->

        <li class="menu-item p-2">
            <a href="../marketing/couponlist" class="text-decoration-none text-light d-flex align-items-center justify-content-between">
                <div>
                    <i class="fas fa-tags me-2"></i>
                    Mã giảm giá
                </div>
<!--                <span class="badge bg-danger rounded-pill">3</span>-->
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="analytics.jsp" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-chart-line me-2"></i>
                Phân tích dữ liệu
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="customer-feedback.jsp" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-comments me-2"></i>
                Phản hồi khách hàng
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="reports.jsp" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-file-alt me-2"></i>
                Báo cáo
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="settings.jsp" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-cog me-2"></i>
                Cài đặt
            </a>
        </li>
        
        <li class="menu-item p-2">
            <a href="../home" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-home me-2 "></i>
                Trang chủ
            </a>
        </li>
    </ul>
</div>

<style>
    /* Sidebar specific styles */
    .sidebar {
        position: fixed;
        left: 0;
        top: 0;
        bottom: 0;
        width: 250px;
        background: #2c3e50;
        color: #ecf0f1;
        transition: all 0.3s;
        z-index: 500;
        overflow-y: auto;
    }

    .sidebar-header {
        background-color: #1a2530;
    }

    .sidebar .menu-item {
        position: relative;
        transition: all 0.3s;
    }

    .sidebar .menu-item:hover {
        background: #34495e;
    }

    .sidebar .menu-item.active {
        background: #34495e;
    }

    .sidebar .submenu-item {
        padding-left: 10px;
    }

    .sidebar .submenu-item:hover {
        background: #34495e;
    }

    .notification-badge {
        background-color: #e74c3c;
        color: white;
        padding: 2px 6px;
        border-radius: 50%;
        font-size: 0.7rem;
    }

    @media (max-width: 768px) {
        .sidebar {
            margin-left: -250px;
        }
        .sidebar.active {
            margin-left: 0;
        }
    }
</style>