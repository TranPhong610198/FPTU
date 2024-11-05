<%-- 
    Document   : admin
    Created on : Oct 13, 2024, 3:50:35 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Admin Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>
    <body class="bg-gray-900 text-gray-300">
        <div class="flex">
            <!-- Sidebar -->
            <div class="w-64 bg-gray-800 h-screen p-4  sticky top-0">
                <div class="mb-4">
                    <a href="home"><img src="images/FondevJSLogoSmal.svg" alt="alt" height="10px" /></a>
                </div>
                <nav>
                    <ul>
                        <li class="mb-2">
                            <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="admin">
                                <i class="fas fa-tachometer-alt mr-2">
                                </i>
                                Dashboard
                            </a>
                        </li>
                        <li class="mb-2">
                            <button type="button" class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700" aria-controls="dropdown-crud" data-collapse-toggle="dropdown-crud" aria-expanded="false">

                                <i class="fas fa-database mr-2"></i>
                                <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item>CRUD</span>
                                <i class=" fa-exclamation"></i>
                            </button>
                            <ul id="dropdown-crud" class="space-y-2 py-2 hidden">
                                <li>
                                    <a href="listProduct" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Products</a>
                                </li>
                                <li>
                                    <a href="listUser" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Users</a>
                                </li>
                                <li>
                                    <!--categories-->
                                    <a href="listCategories" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Categories</a>
                                </li>
                                <li>
                                    <!--brand-->
                                    <a href="listBrand" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Brand</a>
                                </li>
                                <li>
                                    <!--ram-->
                                    <a href="listRam" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Ram</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- Main Content chưa dùng đến -->
            <div class="flex-1 p-6">
                <!--Doanh thu--------------------------------------------------------------->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Total Revenue
                        </div>
                        <div class="h-28 bg-gray-700 rounded-lg text-green-500 text-6xl text-center font-semibold pt-6">
                            $${requestScope.totalRevenue}
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Top 3 Best User 
                        </div>
                        <div class="h-32 bg-gray-700 rounded-lg text-white font-semibold pt-6 px-4">
                            <table border="0" class="w-full">
                                <tbody>
                                    <c:forEach items="${requestScope.top3spent}" var="item">
                                        <tr>
                                            <td class="text-left">${item.username}</td>
                                            <td class="text-center">${item.phone}</td>
                                            <td class="text-right">${item.totalSpent}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Top 5 Best Sale Products
                        </div>
                        <div class="h-32 bg-gray-700 rounded-lg text-white font-semibold pt-6 px-4">
                            <table border="0">
                                <tbody>
                                    <c:forEach items="${requestScope.top5sale}" var="item">
                                        <tr>
                                            <td class="text-left">${item.name}</td>
                                            <td class="text-right w-1/2">${item.totalSale}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <!----------------------------------------------------------------------------------->
                <!--Chart------------------------------------------------------------------------->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="col-span-2 bg-gray-800 p-4 rounded-lg">
                        <div class="flex justify-between items-center mb-4">
                            <div class="text-xl font-semibold text-white">
                                Statistics Revenue By Day
                            </div>
                            <!--<div class="text-green-500">
                                12.5%
                                <i class="fas fa-arrow-up">
                                </i>
                            </div>-->
                        </div>
                        <div class="h-96 bg-gray-100 rounded-lg text-center text-white p-4">
                            <canvas id="revenueChart" class="text-white"></canvas>
                            <script>
                                // Lấy dữ liệu từ Servlet (chuyển từ các đối tượng Java sang chuỗi JSON)

                                const dates = <%= request.getAttribute("datesJson") %>;
                                const revenues = <%= request.getAttribute("revenuesJson") %>;
                                // Khởi tạo biểu đồ
                                const ctx1 = document.getElementById('revenueChart').getContext('2d');
                                const revenueChart = new Chart(ctx1, {
                                    type: 'line',
                                    data: {
                                        labels: dates, // Các ngày trong dữ liệu
                                        datasets: [{
                                                label: 'Doanh thu (USD)',
                                                data: revenues, // Doanh thu theo từng ngày
                                                borderColor: 'rgba(75, 192, 192, 1)',
                                                backgroundColor: 'rgba(75, 192, 192, 0.4)',
                                                fill: true
                                            }]
                                    },
                                    options: {
                                        scales: {
                                            x: {
                                                title: {
                                                    display: true,
                                                    text: 'Ngày'
                                                }
                                            },
                                            y: {
                                                title: {
                                                    display: true,
                                                    text: 'Doanh thu (USD)'
                                                },
                                                beginAtZero: true
                                            }
                                        }
                                    }
                                });
                            </script>
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Statistics Order
                        </div>
                        <div class="h-96 bg-gray-100 rounded-lg text-center text-white p-4">
                            <canvas id="statusChart"></canvas>
                            <script>
                                // Lấy dữ liệu từ Servlet (chuyển từ các đối tượng Java sang chuỗi JSON)
                                const labels = ${requestScope.labelsJson};
                                const counts = ${requestScope.countsJson};

                                // Khởi tạo biểu đồ
                                const ctx2 = document.getElementById('statusChart').getContext('2d');
                                const statusChart = new Chart(ctx2, {
                                    type: 'pie',
                                    data: {
                                        labels: labels, // Các trạng thái đơn hàng
                                        datasets: [{
                                                label: 'Số lượng đơn hàng',
                                                data: counts, // Số lượng đơn hàng theo từng trạng thái
                                                backgroundColor: [
                                                    'rgba(75, 192, 192, 0.4)', // Màu cho Processing
                                                    'rgba(54, 162, 235, 0.4)', // Màu cho Completed
                                                    'rgba(255, 99, 132, 0.4)', // Màu cho CancelledP
                                                    'rgba(255, 159, 64, 0.4)', // Màu cho CancelledC
                                                    'rgba(153, 102, 255, 0.4)'  // Màu cho Pending
                                                ],
                                                borderColor: [
                                                    'rgba(75, 192, 192, 1)',
                                                    'rgba(54, 162, 235, 1)',
                                                    'rgba(255, 99, 132, 1)',
                                                    'rgba(255, 159, 64, 1)',
                                                    'rgba(153, 102, 255, 1)'
                                                ],
                                                borderWidth: 1
                                            }]
                                    },
                                    options: {
                                        responsive: true,
                                        plugins: {
                                            legend: {
                                                position: 'top',
                                            },
                                            tooltip: {
                                                enabled: true
                                            }
                                        }
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <!--______________________________________________________________________________________-->
                <!--List Order-->
                <div class="bg-gray-800 p-4 rounded-lg mb-8 w-full">
                    <div class="text-lg font-semibold text-white mb-4">
                        Transactions
                    </div>
                    <table class="w-full text-left">
                        <thead>
                            <tr class="text-gray-400">
                                <th class="py-2">
                                    USER
                                </th>
                                <th class="py-2">
                                    DATE &amp; TIME
                                </th>
                                <th class="py-2">
                                    AMOUNT
                                </th>
                                <th class="py-2">
                                    NUMBER
                                </th>
                                <th class="py-2">
                                    STATUS
                                </th>
                                <th class="py-2">
                                    ACTION
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty requestScope.listOrder}">
                                <c:forEach items="${requestScope.listOrder}" var="order">
                                    <tr class="border-t border-gray-700  text-gray-200">
                                        <!--User Name___________________________________________________-->
                                        <c:forEach items="${requestScope.listUser}" var="user">
                                            <c:if test="${user.id == order.userId}">
                                                <td class="py-2">
                                                    ${user.username}
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                        <!--_______________________________________________________________-->        
                                        <td class="py-2">
                                            ${order.getDate()}
                                        </td>
                                        <td class="py-2">
                                            $${order.getTotal()}
                                        </td>
                                        <!--Phone Number_______________________________________________________-->
                                        <c:forEach items="${requestScope.listUser}" var="user">
                                            <c:if test="${user.id == order.userId}">
                                                <td class="py-2">
                                                    ${user.phone}
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                        <!--_________________________________________________________________________-->
                                        <!--Status___________________________________________________________________-->
                                        <c:if test="${order.getOrderStatus()=='Pending'}">
                                            <td class="py-2 text-yellow-500">
                                                ${order.getOrderStatus()}
                                            </td>
                                        </c:if>
                                        <c:if test="${order.getOrderStatus()=='Completed'}">
                                            <td class="py-2 text-green-500">
                                                ${order.getOrderStatus()}
                                            </td>
                                        </c:if>
                                        <c:if test="${order.getOrderStatus()=='CancelledP' || order.getOrderStatus()=='CancelledC'}">
                                            <td class="py-2 text-red-500">
                                                ${order.getOrderStatus()}
                                            </td>
                                        </c:if>
                                        <c:if test="${order.getOrderStatus()=='Processing'}">
                                            <td class="py-2 text-purple-500">
                                                ${order.getOrderStatus()}
                                            </td>
                                        </c:if>
                                        <!--____________________________________________________________________________-->
                                        <!--ACTION__________________________________________________________________________-->
                                        <td class="text-left">
                                            <a href="orderDetail?orderId=${order.getOrderId()}&total=${order.getTotal()}"
                                               class="text-gray-400 bg-gray-800 bg-gray-700 hover:text-white focus:ring-4 focus:ring-gray-700 border border-gray-600 font-medium inline-flex items-center rounded-lg text-base px-3 py-2.5 text-center">Detail</a>
                                        </td>
                                        <!--____________________________________________________________________________________-->

                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty requestScope.listOrder}">
                            <p class="text-gray-200">Không có đơn hàng nào để hiển thị.</p>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <!--_______________________________________________________________________________________________________-->
            </div>
        </div>

        <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js "></script>


    </body>
</html>
