<%-- 
    Document   : home
    Created on : Oct 4, 2024, 10:30:03 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Shop</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    </head>
    <body class="font-sans">
        <header class="bg-gray-800 shadow-md">
            <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
                <div class="text-xl font-bold text-gray-800">
                    <img src="images/FondevJSLogo1.svg" alt="alt"/>
                </div>
                <div class="hidden md:flex space-x-4">
                    <a href="#" class="text-cyan-300 hover:text-white">Home</a>
                    <a href="listProduct" class="text-cyan-300 hover:text-white">Shop</a>
                    <a href="#" class="text-cyan-300 hover:text-white">About</a>
                    <a href="#" class="text-cyan-300 hover:text-white">Contact</a>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-search"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-shopping-cart"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-user"></i></a>

                </div>
                <button id="mobile-menu-button" class="md:hidden text-cyan-300">
                    <i class="fas fa-bars"></i>
                </button>
                <div id="mobile-menu" class="md:hidden hidden mt-4">
                    <a href="#" class="block py-2 text-cyan-300 hover:text-white">Home</a>
                    <a href="listProduct" class="block py-2 text-cyan-300 hover:text-white">Shop</a>
                    <a href="#" class="block py-2 text-cyan-300 hover:text-white">About</a>
                    <a href="#" class="block py-2 text-cyan-300 hover:text-white">Contact</a>
                </div>
            </nav>
        </header>

        <main>
            <section class="bg-gradient-to-r from-purple-500 to-teal-500 text-white py-20">
                <div class="container mx-auto px-6">
                    <h1 class="text-4xl font-bold mb-2">A new product.</h1>
                    <p class="mb-8">Discover amazing products and unbeatable deals.</p>
                    <button class="bg-white text-purple-500 px-6 py-2 rounded-full hover:bg-gray-100">Shop Now</button>
                </div>
            </section>

            <section class="container mx-auto px-6 py-8">
                <div class="grid md:grid-cols-2 gap-8">
                    <div class="bg-yellow-400 p-6 rounded-lg">
                        <h2 class="text-2xl font-bold mb-2">Sản phẩm bán chạy</h2>
                        <p class="mb-4">Get the latest smartphones at unbeatable prices.</p>
                        <span class="text-3xl font-bold">20% OFF</span>
                    </div>
                    <div class="bg-gray-800 text-white p-6 rounded-lg">
                        <h2 class="text-2xl font-bold mb-2">sản phẩm nổi bật</h2>
                        <p class="mb-4">Capture life's moments with crystal clarity.</p>
                        <button class="bg-white text-gray-800 px-4 py-2 rounded">Learn More</button>
                    </div>
                </div>
            </section>

            <section class="container mx-auto px-6 py-8">
                <h2 class="text-2xl font-bold mb-8">Featured Products</h2>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                    <c:if test="${not empty requestScope.data}">
                        <c:forEach var="product" items="${requestScope.data}">
                            <div class="border p-4 rounded-lg">
                                <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-40 object-cover mb-4">
                                <h3 class="font-semibold">${product.name}</h3>
                                <p class="text-gray-600">$${product.price}</p>
                            </div>  
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty requestScope.data}">
                        <p>Không có sản phẩm nào để hiển thị.</p>
                    </c:if>

                </div>
            </section>

            <section class="bg-gray-100 py-12">
                <div class="container mx-auto px-6">
                    <h2 class="text-2xl font-bold mb-8">Amazing Devices</h2>
                    <div class="grid md:grid-cols-2 gap-8">
                        <div>
                            <img src="/api/placeholder/500/300" alt="Amazing Devices" class="w-full h-64 object-cover rounded-lg">
                        </div>
                        <div class="flex flex-col justify-center">
                            <h3 class="text-xl font-semibold mb-4">Discover Our Latest Tech</h3>
                            <p class="mb-4">Experience cutting-edge technology with our amazing devices.</p>
                            <button class="bg-purple-500 text-white px-6 py-2 rounded-full hover:bg-purple-600 self-start">Learn More</button>
                        </div>
                    </div>
                </div>
            </section>

            <section class="container mx-auto px-6 py-12">
                <div class="grid md:grid-cols-3 gap-8 text-center">
                    <div>
                        <i class="fas fa-truck text-4xl mb-4 text-purple-500"></i>
                        <h3 class="font-semibold mb-2">Free Shipping Worldwide</h3>
                        <p class="text-gray-600">On orders over $50</p>
                    </div>
                    <div>
                        <i class="fas fa-undo text-4xl mb-4 text-purple-500"></i>
                        <h3 class="font-semibold mb-2">30 Days Return</h3>
                        <p class="text-gray-600">No questions asked</p>
                    </div>
                    <div>
                        <i class="fas fa-headset text-4xl mb-4 text-purple-500"></i>
                        <h3 class="font-semibold mb-2">24/7 Customer Support</h3>
                        <p class="text-gray-600">Always here to help</p>
                    </div>
                </div>
            </section>

            <section class="bg-gray-100 py-12">
                <div class="container mx-auto px-6">
                    <h2 class="text-2xl font-bold mb-8 text-center">Subscribe to our newsletter</h2>
                    <form class="max-w-md mx-auto">
                        <div class="flex">
                            <input type="email" placeholder="Your email address" class="flex-grow px-4 py-2 rounded-l-full focus:outline-none">
                            <button type="submit" class="bg-purple-500 text-white px-6 py-2 rounded-r-full hover:bg-purple-600">Subscribe</button>
                        </div>
                    </form>
                </div>
            </section>
        </main>

        <footer class="bg-gray-800 text-white py-8">
            <div class="container mx-auto px-6">
                <div class="flex justify-between items-center">
                    <div class="text-xl font-bold">
                        <a href="home"> <img src="./images/FondevJSLogo2.svg" alt="alt"/></a>
                    </div>
                    <div class="flex space-x-4">
                        <a href="https://www.facebook.com/Moriaty11" class="hover:text-gray-300"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="hover:text-gray-300"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="hover:text-gray-300"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="mt-4 text-center text-sm">
                    &copy; 2024 FondevJS . Reference from sublime.
                </div>
            </div>
        </footer>

        <script>
            const mobileMenuButton = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');

            mobileMenuButton.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });
        </script>
    </body>
</html>
