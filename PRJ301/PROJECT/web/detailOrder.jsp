<%-- 
    Document   : detailOrder
    Created on : Oct 29, 2024, 6:28:26 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
    <body>
        <div class="font-sans md:max-w-6xl max-md:max-w-2xl mx-auto bg-white py-4">
            <div class="grid md:grid-cols-3 gap-4">
                <div class="md:col-span-3 bg-gray-100 p-4 rounded-md">
                    <h2 class="text-2xl font-bold text-gray-800">Order Detail</h2>
                    <hr class="border-gray-300 mt-4 mb-8" />
                    <!--Process Checklist-->
                    <div class="flex justify-between items-center mb-6 p-4 rounded-lg">
                        <div class="flex items-center">
                            <div class="w-8 h-8 bg-blue-600 text-white rounded-full flex items-center justify-center">
                                1
                            </div>
                            <span class="ml-2 font-semibold">
                                Cart
                            </span>
                        </div>
                        <!--Kiểm tra payment_________________________________________________________________-->
                        <c:if test="${requestScope.status == 'Pending'}">
                            <div class="flex-1 h-1 bg-gray-300 mx-2">
                            </div>
                            <div class="flex items-center">
                                <div class="w-8 h-8 bg-gray-300 text-white rounded-full flex items-center justify-center">
                                    2
                                </div>
                                <span class="ml-2 text-gray-600">
                                    Payment
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.status == 'Processing' || requestScope.status == 'Completed'}">
                            <div class="flex-1 h-1 bg-blue-600 mx-2">
                            </div>
                            <div class="flex items-center">
                                <div class="w-8 h-8 bg-blue-600 text-white rounded-full flex items-center justify-center">
                                    2
                                </div>
                                <span class="ml-2 font-semibold">
                                    Payment
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.status == 'CancelledP' || requestScope.status == 'CancelledC'}">
                            <div class="flex-1 h-1 bg-red-600 mx-2">
                            </div>
                            <div class="flex items-center">
                                <div class="w-8 h-8 bg-red-600 text-white rounded-full flex items-center justify-center">
                                    2
                                </div>
                                <span class="ml-2 font-semibold">
                                    Payment
                                </span>
                            </div>
                        </c:if>

                        <!--_____________________________________________________________________________________-->
                        <!--Kiểm tra Confirmation______________________________________________________________-->
                        <c:if test="${requestScope.status == 'Pending' || requestScope.status == 'Processing'}">
                            <div class="flex-1 h-1 bg-gray-300 mx-2">
                            </div>
                            <div class="flex items-center">
                                <div class="w-8 h-8 bg-gray-300 text-white rounded-full flex items-center justify-center">
                                    3
                                </div>
                                <span class="ml-2 text-gray-600">
                                    Confirmation
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.status == 'Completed'}">
                            <div class="flex-1 h-1 bg-blue-600 mx-2">
                            </div>
                            <div class="flex items-center">
                                <div class="w-8 h-8 bg-blue-600 text-white rounded-full flex items-center justify-center">
                                    3
                                </div>
                                <span class="ml-2 font-semibold">
                                    Confirmation
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.status == 'CancelledC' || requestScope.status == 'CancelledP'}">
                            <div class="flex-1 h-1 bg-red-600 mx-2">
                            </div>
                            <div class="flex items-center">
                                <div class="w-8 h-8 bg-red-600 text-white rounded-full flex items-center justify-center">
                                    3
                                </div>
                                <span class="ml-2 font-semibold">
                                    Confirmation
                                </span>
                            </div>
                        </c:if>
                        <!--______________________________________________________________________________________________-->
                    </div>

                    <!--Sản Phẩm-->
                    <div class="space-y-4">
                        <c:if test="${not empty requestScope.items}">
                            <c:forEach items="${requestScope.items}" var="item">
                                <div class="grid grid-cols-3 items-center gap-4">
                                    <div class="col-span-2 flex items-center gap-4">
                                        <div class="w-24 h-24 shrink-0 bg-white p-2 rounded-md">
                                            <img src='${item.product.imageUrl}'class="w-full h-full object-contain" />
                                        </div>
                                        <h3 class="text-base font-bold text-gray-800">${item.product.name}</h3>
                                    </div>
                                    <div class=" col-span-1 flex justify-end items-center space-x-4">
                                        <div class="flex gap-4 mt-4">

                                            <div class="flex justify-center items-center mb-4">
                                                <input type="number" name="quantity" value="${item.quantity}" min="1" class="text-right w-10" readonly/>
                                            </div>
                                        </div>          

                                        <h4 class="text-base font-bold text-gray-800">$${item.price*item.quantity}</h4>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty requestScope.items}">
                            <p>Không có sản phẩm nào để hiển thị.</p>
                        </c:if>
                    </div>

                    <!--_________________________________________________________________________________________________________-->
                    <hr class="border-gray-300 mt-4 mb-8" />

                    <!--Tổng tiền-->
                    <div class="bg-gray-100 rounded-md p-4 md:sticky top-0">
                        <ul class="text-gray-800 mt-8 space-y-4">
                            <li class="flex flex-wrap gap-4 text-base font-bold">Total
                                <span class="ml-auto">$${requestScope.total}</span>
                            </li>
                        </ul>
                        <div class="mt-8 space-y-2">
                            <a href="javascript:history.back()" class="text-sm px-4 py-2.5 w-1/8 font-semibold tracking-wide bg-transparent text-gray-800 border border-gray-300 rounded-md hover:bg-gray-500 hover:text-white">Back To Profile</a>
                        </div>

                    </div>
                    <!--_______________________________________________________________________________________________________-->

                </div>
            </div>
        </div>
    </body>
</html>
