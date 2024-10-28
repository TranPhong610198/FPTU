<%-- Document : cart Created on : Oct 27, 2024, 1:56:46 PM Author : tphon --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            function updateQuantity(cartItemId, actionQ) {
                const form = document.getElementById('update-form-' + cartItemId);
                if (actionQ === 'increment') {
                    let quantityInput = form.querySelector('input[name="quantity"]');
                    quantityInput.value = parseInt(quantityInput.value) + 1;
                } else if (actionQ === 'decrement') {
                    let quantityInput = form.querySelector('input[name="quantity"]');
                    if (parseInt(quantityInput.value) > 1) {
                        quantityInput.value = parseInt(quantityInput.value) - 1;
                    }
                }
                form.submit();
            }
        </script>
    </head>

    <body>
        <div class="font-sans md:max-w-6xl max-md:max-w-2xl mx-auto bg-white py-4">
            <div class="grid md:grid-cols-3 gap-4">
                <div class="md:col-span-3 bg-gray-100 p-4 rounded-md">
                    <h2 class="text-2xl font-bold text-gray-800">Cart</h2>
                    <hr class="border-gray-300 mt-4 mb-8" />
                    <!--Sản Phẩm-->
                    <div class="space-y-4">
                        <c:if test="${not empty requestScope.cartItems}">
                            <c:forEach items="${requestScope.cartItems}" var="item">
                                <div class="grid grid-cols-3 items-center gap-4">
                                    <div class="col-span-2 flex items-center gap-4">
                                        <div class="w-24 h-24 shrink-0 bg-white p-2 rounded-md">
                                            <img src='${item.productImage}'class="w-full h-full object-contain" />
                                        </div>
                                        <h3 class="text-base font-bold text-gray-800">${item.productName}</h3>
                                    </div>
                                    <div class=" col-span-1 flex justify-end items-center space-x-4">
                                        <div class="flex gap-4 mt-4">
                                            <form id="update-form-${item.cartItemId}" method="post" action="cart">
                                                <input type="hidden" name="action" value="update"/>
                                                <input type="hidden" name="cartItemId" value="${item.cartItemId}"/>
                                                <div class="flex justify-center items-center mb-4">
                                                    <button type="button" onclick="updateQuantity(${item.cartItemId}, 'decrement')" class="flex items-center px-2.5 py-1.5 border border-gray-300 text-gray-800 text-xs outline-none bg-transparent rounded-md">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-2.5 fill-current" viewBox="0 0 124 124">
                                                        <path d="M112 50H12C5.4 50 0 55.4 0 62s5.4 12 12 12h100c6.6 0 12-5.4 12-12s-5.4-12-12-12z" data-original="#000000"></path>
                                                        </svg>
                                                    </button>
                                                    <input type="number" name="quantity" value="${item.quantity}" min="1" class="text-right w-10" readonly/>
                                                    <button type="button" onclick="updateQuantity(${item.cartItemId}, 'increment')" class="flex items-center px-2.5 py-1.5 border border-gray-300 text-gray-800 text-xs outline-none bg-transparent rounded-md">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                             class="w-2.5 fill-current" viewBox="0 0 42 42">
                                                        <path
                                                            d="M37.059 16H26V4.941C26 2.224 23.718 0 21 0s-5 2.224-5 4.941V16H4.941C2.224 16 0 18.282 0 21s2.224 5 4.941 5H16v11.059C16 39.776 18.282 42 21 42s5-2.224 5-4.941V26h11.059C39.776 26 42 23.718 42 21s-2.224-5-4.941-5z"
                                                            data-original="#000000"></path>
                                                        </svg>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>          
                                        <button type="submit" name="action" value="remove" class="text-sm px-4 font-semibold tracking-wide bg-red-700 hover:bg-red-800 text-white rounded-md" form="remove-form-${item.cartItemId}">Remove</button>
                                        <form id="remove-form-${item.cartItemId}" method="post" action="cart">
                                            <input type="hidden" name="cartItemId" value="${item.cartItemId}" />
                                            <input type="hidden" name="action" value="remove" />
                                        </form>
                                        <h4 class="text-base font-bold text-gray-800">$${item.price*item.quantity}</h4>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty requestScope.cartItems}">
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
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="checkout" />
                                <input type="hidden" name="total" value="${requestScope.total}" />
                                <button type="submit" class="text-sm px-4 py-2.5 w-1/8 font-semibold tracking-wide bg-blue-600 hover:bg-blue-700 text-white rounded-md">Checkout</button>
                                <a href="home" class="text-sm px-4 py-2.5 w-1/8 font-semibold tracking-wide bg-transparent text-gray-800 border border-gray-300 rounded-md">Continue Shopping</a>

                            </form>
                        </div>

                    </div>
                    <!--_______________________________________________________________________________________________________-->

                </div>
            </div>
        </div>

        <section class="container mx-auto px-20 py-8">

            <h2 class="text-2xl font-bold mb-8">Recently Viewed Products</h2>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                <c:if test="${not empty recentList}">
                    <c:forEach var="product" items="${recentList}">
                        <div class="border p-4 rounded-lg">
                            <a href="home?action=view&id=${product.id}">
                                <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-40 object-cover mb-4">
                                <h3 class="font-semibold">${product.name}</h3>
                                <p class="text-gray-600">$${product.price}</p>
                            </a>
                        </div>  
                    </c:forEach>
                </c:if>

            </div>
            <c:if test="${empty recentList}">
                <p>Bạn chưa xem sản phẩm nào trong phiên đăng nhập này.</p>
            </c:if>
        </section>



    </body>

</html>