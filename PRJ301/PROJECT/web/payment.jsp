<%-- 
    Document   : payment
    Created on : Oct 28, 2024, 12:56:37 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body class="bg-gray-50">
        <div class="max-w-7xl mx-auto p-6">
            <!-- Brand Logo -->
            <div class="flex justify-start mx-4">
                <a href="home"><img alt="Brand Logo" class="h-30" src="images/FondevJSLogoDark.svg"></a>
            </div>
            <!-- Main Content -->
            <form action="payment" method="post">
                <input type="hidden" name="orderId" value="${requestScope.orderId}"/>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Payment and Delivery Methods -->
                    <div class="lg:col-span-2">
                        <!-- Payment -->
                        <h2 class="text-xl font-semibold mt-8 mb-4">Payment</h2>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                            <div class="border border-gray-300 rounded-md p-4">
                                <div class="flex items-center mb-2">
                                    <input onclick="updatePaymentFee(0)" id="creditCard" type="radio" name="payment" class="mr-2">
                                    <span class="font-medium">Credit Card</span>
                                </div>
                                <p class="text-sm text-gray-500">Pay with your credit card</p>
                            </div>
                            <div class="border border-gray-300 rounded-md p-4">
                                <div class="flex items-center mb-2">
                                    <input onclick="updatePaymentFee(15)" id="paymentOnDelivery" type="radio" name="payment" class="mr-2">
                                    <span class="font-medium">Payment on delivery</span>
                                </div>
                                <p class="text-sm text-gray-500">+ $15 payment processing fee</p>
                            </div>
                            <div class="border border-gray-300 rounded-md p-4">
                                <div class="flex items-center mb-2">
                                    <input onclick="updatePaymentFee(0)" id="paypal" type="radio" name="payment" class="mr-2">
                                    <span class="font-medium">Paypal account</span>
                                </div>
                                <p class="text-sm text-gray-500">Connect to your account</p>
                            </div>
                        </div>

                        <!-- Delivery Methods -->
                        <h2 class="text-xl font-semibold mt-8 mb-4">Delivery Methods</h2>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                            <div class="border border-gray-300 rounded-md p-4">
                                <div class="flex items-center mb-2">
                                    <input onclick="updateDeliveryFee(15)" id="dhl" type="radio" name="delivery" class="mr-2">
                                    <span class="font-medium">$15 - DHL Fast Delivery</span>
                                </div>
                                <p class="text-sm text-gray-500">Get it by Tomorrow</p>
                            </div>
                            <div class="border border-gray-300 rounded-md p-4">
                                <div class="flex items-center mb-2">
                                    <input onclick="updateDeliveryFee(0)" id="fedex" type="radio" name="delivery" class="mr-2">
                                    <span class="font-medium">Free Delivery - FedEx</span>
                                </div>
                                <p class="text-sm text-gray-500">Please wait a few days</p>
                            </div>
                            <div class="border border-gray-300 rounded-md p-4">
                                <div class="flex items-center mb-2">
                                    <input onclick="updateDeliveryFee(49)" id="express" type="radio" name="delivery" class="mr-2">
                                    <span class="font-medium">$49 - Express Delivery</span>
                                </div>
                                <p class="text-sm text-gray-500">Get it today</p>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div>
                        <div class="bg-white p-6 rounded-md shadow-md">
                            <h2 class="text-xl font-semibold mb-4">Order Summary</h2>
                            <div class="flex justify-between mb-2">
                                <span>Subtotal</span>
                                <!--<span></span>-->
                                <input type="text" id="subTotal" name="paymentFee" value="${requestScope.total}" readonly class="text-right w-20">
                            </div>
                            <div class="flex justify-between mb-2">
                                <span>Savings</span>
                                <span class="text-green-500">0</span>
                            </div>
                            <div class="flex justify-between mb-2">
                                <span>Payment Fee</span>
                                <!--<span>$99</span>-->
                                <input type="text" id="paymentFee" name="paymentFee" value="" readonly class="text-right w-20">
                            </div>
                            <div class="flex justify-between mb-2">
                                <span>Delivery Fee</span>
                                <!--<span>$199</span>-->
                                <input type="text" id="deliveryFee" name="deliveryFee" value="" readonly class="text-right w-20">
                            </div>
                            <div class="flex justify-between font-semibold text-lg mb-4">
                                <span>Total</span>
                                <!--<span>$8,392.00</span>-->
                                <input type="text" id="totalAmount" name="totalAmount" value="" readonly class="text-right w-20">
                            </div>
                            <button class="bg-blue-600 text-white w-full py-2 rounded-md">Proceed to Payment</button>
                            <p class="text-sm text-gray-500 mt-4">One or more items in your cart require an account. <a href="#" class="text-blue-600">Sign in or create an account now.</a></p>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script>
            function updatePaymentFee(fee) {
                paymentFee = fee;
                document.getElementById("paymentFee").value = fee;
                updateTotal();
            }

            function updateDeliveryFee(fee) {
                deliveryFee = fee;
                document.getElementById("deliveryFee").value = fee;
                updateTotal();
            }

            function updateTotal() {
                let subtotal = parseFloat(document.getElementById("subTotal").value)||0;
                let paymentFee = parseFloat(document.getElementById("paymentFee").value)||0;
                let deliveryFee = parseFloat(document.getElementById("deliveryFee").value)||0;
                let total = subtotal + paymentFee + deliveryFee;
                document.getElementById("totalAmount").value = total.toFixed(2);
            }
        </script>
    </body>
</html>
