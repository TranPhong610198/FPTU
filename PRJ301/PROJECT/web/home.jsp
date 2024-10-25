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
        <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css"  rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    </head>
    <body class="font-sans">
        <header class="bg-gray-800 shadow-md text-gray-300">
            <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
                <div class="text-xl font-bold text-gray-800">
                    <img src="images/FondevJSLogo1.svg" alt="alt"/>
                </div>
                <div class="hidden md:flex space-x-4 justify-center flex-grow mr-20">
                    <a href="home" class="text-cyan-300 hover:text-white">Home</a>
                    <!-- Brands -->
                    <button id="dropBrandsHoverButton" data-dropdown-toggle="dropBrandsHover" data-dropdown-trigger="hover" class="text-cyan-300 hover:text-white type="button">Brands
                    </button>
                    <div id="dropBrandsHover" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                        <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                            <c:set var="brands" value="${requestScope.data.get(0).getListBrand()}"/>
                            <c:forEach var="brand" items="${brands}">
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">${brand.brandName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!------------------------------------------------------------->        
                    <a href="${(sessionScope.account.role=='admin')?'admin.jsp':'404pages.html'}" class="text-cyan-300 hover:text-white">Admin</a>
                    <!-- Category -->
                    <button id="dropdownHoverButton" data-dropdown-toggle="dropdownHover" data-dropdown-trigger="hover" class="text-cyan-300 hover:text-white type="button">Categories
                    </button>
                    <div id="dropdownHover" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                        <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                            <c:set var="cates" value="${requestScope.data.get(0).getListCategory()}"/>
                            <c:forEach var="cate" items="${cates}">
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">${cate.categoryName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!------------------------------------------------------------->   
                </div>

                <div class="flex items-center space-x-4 ml-auto mr-10">
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-search"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-shopping-cart"></i></a>
                        <c:if test="${sessionScope.account == null}">
                        <!--User dropdawn if notLogin-->
                        <button id="dropdownUserAvatarButton" data-dropdown-toggle="dropdownAvatar" class="flex text-sm bg-gray-800 rounded-full md:me-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" type="button">
                            <i class="fas fa-user text-cyan-300 hover:text-white"></i>
                        </button>
                        <div id="dropdownAvatar" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                            <div class="px-4 py-3 text-sm text-gray-900 dark:text-white">
                                <div>Not Logged In</div>
                            </div>
                            <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownUserAvatarButton">
                                <li>
                                    <a href="login" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Login</a>
                                </li>
                                <li>
                                    <a href="register" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Register</a>
                                </li>
                            </ul>
                        </div>
                        <!------------------------------------------------------------------------------------>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <c:set value="${sessionScope.account}" var="acc"/>
                        <c:if test="${acc.getRole().equals('admin')}">
                            <!--User dropdawn with admin-->
                            <button id="dropdownUserAvatarButton" data-dropdown-toggle="dropdownAvatar" class="flex text-sm bg-gray-800 rounded-full md:me-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" type="button">
                                <img class="w-8 h-8 rounded-full" src="${(acc.getAvtUrl()==null||acc.getAvtUrl().isEmpty())?'images/avatar-trang-4.jpg':acc.getAvtUrl()}" alt="user photo">
                            </button>
                            <div id="dropdownAvatar" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                                <div class="px-4 py-3 text-sm text-gray-900 dark:text-white">
                                    <div>${acc.getUsername()}</div>
                                    <div class="font-medium truncate">${acc.getEmail()}</div>
                                </div>
                                <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownUserAvatarButton">
                                    <li>
                                        <a href="admin.jsp" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a>
                                    </li>
                                    <li>
                                        <form action="profile" method="post">
                                            <button type="submit" class="text-left w-full block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Setting</button>
                                            <input type="hidden" value="${acc.id}" name="id"/>
                                        </form>
                                    </li>
                                </ul>
                                <div class="py-2">
                                    <a href="logout" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Logout</a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </c:if>
                        <c:if test="${!acc.getRole().equals('admin')}">
                            <!--User dropdawn with customer-->
                            <button id="dropdownUserAvatarButton" data-dropdown-toggle="dropdownAvatar" class="flex text-sm bg-gray-800 rounded-full md:me-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" type="button">
                                <img class="w-8 h-8 rounded-full" src="${(acc.getAvtUrl()==null||acc.getAvtUrl().isEmpty())?'images/avatar-trang-4.jpg':acc.getAvtUrl()}" alt="user photo">
                            </button>
                            <div id="dropdownAvatar" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                                <div class="px-4 py-3 text-sm text-gray-900 dark:text-white">
                                    <div>${acc.getUsername()}</div>
                                    <div class="font-medium truncate">${acc.getEmail()}</div>
                                </div>
                                <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownUserAvatarButton">
                                    <li>
                                        <form action="profile" method="post">
                                            <button type="submit" class="text-left w-full block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Profile</button>
                                            <input type="hidden" value="${acc.id}" name="id"/>
                                        </form>
                                    </li>
                                </ul>
                                <div class="py-2">
                                    <a href="logout" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Logout</a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </c:if>    
                    </c:if>
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

            <section class="container mx-auto px-20 py-8">
                <h2 class="text-2xl font-bold mb-8">All Products</h2>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                    <c:if test="${not empty requestScope.data}">
                        <c:forEach var="product" items="${requestScope.data}">
                            <div class="border p-4 rounded-lg">
                                <a href="home?action=view&id=${product.id}">
                                    <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-40 object-cover mb-4">
                                    <h3 class="font-semibold">${product.name}</h3>
                                    <p class="text-gray-600">$${product.price}</p>
                                </a>
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
                    &copy; 2024 FondevJS . Reference from Sublime.
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
        <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    </body>
</html>
