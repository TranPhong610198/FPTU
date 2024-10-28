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
            <div class="flex justify-start mb-8">
                <img alt="Brand Logo" class="h-12" src="images/FondevJS (2).png">
            </div>
            <!-- Main Content -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Payment and Delivery Methods -->
                <div class="lg:col-span-2">
                    <!-- Payment -->
                    <h2 class="text-xl font-semibold mt-8 mb-4">Payment</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                        <div class="border border-gray-300 rounded-md p-4">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="payment" class="mr-2">
                                <span class="font-medium">Credit Card</span>
                            </div>
                            <p class="text-sm text-gray-500">Pay with your credit card</p>
                            <div class="flex justify-between mt-4">
                                <button class="text-blue-600 text-sm">Delete</button>
                                <button class="text-blue-600 text-sm">Edit</button>
                            </div>
                        </div>
                        <div class="border border-gray-300 rounded-md p-4">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="payment" class="mr-2">
                                <span class="font-medium">Payment on delivery</span>
                            </div>
                            <p class="text-sm text-gray-500">+ $15 payment processing fee</p>
                            <div class="flex justify-between mt-4">
                                <button class="text-blue-600 text-sm">Delete</button>
                                <button class="text-blue-600 text-sm">Edit</button>
                            </div>
                        </div>
                        <div class="border border-gray-300 rounded-md p-4">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="payment" class="mr-2">
                                <span class="font-medium">Paypal account</span>
                            </div>
                            <p class="text-sm text-gray-500">Connect to your account</p>
                            <div class="flex justify-between mt-4">
                                <button class="text-blue-600 text-sm">Delete</button>
                                <button class="text-blue-600 text-sm">Edit</button>
                            </div>
                        </div>
                    </div>

                    <!-- Delivery Methods -->
                    <h2 class="text-xl font-semibold mt-8 mb-4">Delivery Methods</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                        <div class="border border-gray-300 rounded-md p-4">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="delivery" class="mr-2">
                                <span class="font-medium">$15 - DHL Fast Delivery</span>
                            </div>
                            <p class="text-sm text-gray-500">Get it by Tomorrow</p>
                        </div>
                        <div class="border border-gray-300 rounded-md p-4">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="delivery" class="mr-2">
                                <span class="font-medium">Free Delivery - FedEx</span>
                            </div>
                            <p class="text-sm text-gray-500">Get it by Friday, 13 Dec 2023</p>
                        </div>
                        <div class="border border-gray-300 rounded-md p-4">
                            <div class="flex items-center mb-2">
                                <input type="radio" name="delivery" class="mr-2">
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
                            <span>$8,094.00</span>
                        </div>
                        <div class="flex justify-between mb-2">
                            <span>Savings</span>
                            <span class="text-green-500">0</span>
                        </div>
                        <div class="flex justify-between mb-2">
                            <span>Store Pickup</span>
                            <span>$99</span>
                        </div>
                        <div class="flex justify-between mb-2">
                            <span>Tax</span>
                            <span>$199</span>
                        </div>
                        <div class="flex justify-between font-semibold text-lg mb-4">
                            <span>Total</span>
                            <span>$8,392.00</span>
                        </div>
                        <button class="bg-blue-600 text-white w-full py-2 rounded-md">Proceed to Payment</button>
                        <p class="text-sm text-gray-500 mt-4">One or more items in your cart require an account. <a href="#" class="text-blue-600">Sign in or create an account now.</a></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
