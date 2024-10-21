<%-- 
    Document   : header
    Created on : Sep 16, 2024, 11:29:07 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Header</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css"  rel="stylesheet" />

    </head>
    <body class="font-sans">
        <header class="bg-gray-800 shadow-md text-gray-300">
            <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
                <div class="text-xl font-bold text-gray-800">
                    <img src="images/FondevJSLogo1.svg" alt="alt"/>
                </div>
                <div class="hidden md:flex space-x-4 justify-center flex-grow mr-20">
                    <a href="home" class="text-cyan-300 hover:text-white">Home</a>
                    <!-- Dropdown Brands -->
                    <button id="dropBrandsHoverButton" data-dropdown-toggle="dropBrandsHover" data-dropdown-trigger="hover" class="text-cyan-300 hover:text-white type="button">Brands
                    </button>
                    <div id="dropBrandsHover" class="z-10 hidden divide-y divide-gray-100 rounded-lg shadow w-44 bg-gray-700">
                        <ul class="py-2 text-sm text-gray-200" aria-labelledby="dropdownHoverButton">
                            <c:set var="brands" value="${requestScope.data.get(0).getListBrand()}"/>
                            <c:forEach var="brand" items="${brands}">
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-600 hover:text-white">${brand.brandName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!------------------------------------------------------------->        
                    <a href="./admin.jsp" class="text-cyan-300 hover:text-white">Admin</a>
                    <!-- Dropdown Category -->
                    <button id="dropdownHoverButton" data-dropdown-toggle="dropdownHover" data-dropdown-trigger="hover" class="text-cyan-300 hover:text-white type="button">Categories
                    </button>
                    <div id="dropdownHover" class="z-10 hidden divide-y divide-gray-100 rounded-lg shadow w-44 bg-gray-700">
                        <ul class="py-2 text-sm text-gray-200" aria-labelledby="dropdownHoverButton">
                            <c:set var="cates" value="${requestScope.data.get(0).getListCategory()}"/>
                            <c:forEach var="cate" items="${cates}">
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-600 hover:text-white">${cate.categoryName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!------------------------------------------------------------->   
                </div>

                <div class="flex items-center space-x-4 ml-auto mr-10">
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-search"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-shopping-cart"></i></a>
                    <!--<a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-user"></i></a>-->

                    <!-- Dropdown User -->
                    <button id="dropdownUserAvatarButton" data-dropdown-toggle="dropdownAvatar" class="flex text-sm bg-gray-800 rounded-full md:me-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" type="button">
                        <span class="sr-only">Open user menu</span>
                        <img class="w-8 h-8 rounded-full" src="/docs/images/people/profile-picture-3.jpg" alt="user photo">
                    </button>
                    <div id="dropdownAvatar" class="z-10 hidden divide-y rounded-lg shadow w-44 bg-gray-700 divide-gray-600">
                        <div class="px-4 py-3 text-sm text-white">
                            <div>Bonnie Green</div>
                            <div class="font-medium truncate">name@flowbite.com</div>
                        </div>
                        <ul class="py-2 text-sm text-gray-200" aria-labelledby="dropdownUserAvatarButton">
                            <li>
                                <a href="#" class="block px-4 py-2 hover:bg-gray-600 hover:text-white">Dashboard</a>
                            </li>
                            <li>
                                <a href="#" class="block px-4 py-2 hover:bg-gray-600 hover:text-white">Settings</a>
                            </li>
                            <li>
                                <a href="#" class="block px-4 py-2 hover:bg-gray-600 hover:text-white">Earnings</a>
                            </li>
                        </ul>
                        <div class="py-2">
                            <a href="#" class="block px-4 py-2 text-sm hover:bg-gray-600 text-gray-200 hover:text-white">Sign out</a>
                        </div>
                    </div>
                    <!------------------------------------------------------------------------------------>

                </div>
                <button id="mobile-menu-button" class="md:hidden text-cyan-300">
                    <i class="fas fa-bars"></i>
                </button>
                <div id="mobile-menu" class="md:hidden hidden mt-4">
                    <a href="home" class="block py-2 text-cyan-300 hover:text-white">Home</a>
                    <a href="listProduct" class="block py-2 text-cyan-300 hover:text-white">Shop</a>
                    <a href="./admin.jsp" class="block py-2 text-cyan-300 hover:text-white">Admin</a>
                    <a href="#" class="block py-2 text-cyan-300 hover:text-white">Contact</a>
                </div>
            </nav>
        </header>

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
