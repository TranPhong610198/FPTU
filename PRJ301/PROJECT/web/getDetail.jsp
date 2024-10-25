<%-- 
    Document   : getDetail
    Created on : Oct 17, 2024, 1:24:11 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css"  rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    </head>
    <!--    <style>
            @tailwind base;
            @tailwind components;
            @tailwind utilities;
    
            @layer components {
                /* .btn-primary {
                    @apply py-1.5 px-3 text-center bg-blue-700 rounded-md text-white;
                } */
            }
        </style>-->
    <body>
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
                            <c:set var="brands" value="${requestScope.product.getListBrand()}"/>
                            <c:forEach var="brand" items="${brands}">
                                <li>
                                    <a href="showBrand?brand=${brand.brandId}&productId=${product.id}" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">${brand.brandName}</a>
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
                            <c:set var="cates" value="${requestScope.product.getListCategory()}"/>
                            <c:forEach var="cate" items="${cates}">
                                <li>
                                    <a href="showCate?cate=${cate.categoryId}&productId=${product.id}" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">${cate.categoryName}</a>
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
        <div class="bg-gray-100">
            <div class="container mx-auto px-4 py-8">
                <div class="flex flex-wrap -mx-4">
                    <!-- Product Images -->
                    <div class="flex flex-col items-center w-full md:w-1/2 px-4 mb-8">
                        <img src="${product.imageUrl}" alt="${product.name}"
                             class="rounded-lg shadow-md mb-4 left-50 h-[400px]" id="mainImage">
                        <div class="flex gap-4 py-4 justify-center overflow-x-auto">
                            <img src="${product.imageUrl}" alt="${product.name}" width="150"
                                 class="size-16 sm:size-20 object-cover rounded-md cursor-pointer opacity-60 hover:opacity-100 transition duration-300"
                                 onclick="changeImage(this.src)">

                            <c:forEach var="subImage" items="${subImages}">
                                <img src="${subImage}" alt="Sub Image" width="150" 
                                     class="size-16 sm:size-20 object-cover rounded-md cursor-pointer opacity-60 hover:opacity-100 transition duration-300"
                                     onclick="changeImage(this.src)">
                            </c:forEach>

                        </div>
                    </div>

                    <!-- Product Details -->
                    <div class="flex flex-col justify-around w-full md:w-1/2 px-4">
                        <div>
                            <h2 class="text-3xl font-bold mb-2">${product.name}</h2>
                            <div class="mb-4">
                                <span class="text-2xl font-bold mr-2">$${product.price}</span>
                            </div>
                        </div>
                        <div>
                            <div class="mb-6">
                                <label for="quantity" class="block text-sm font-medium text-gray-700 mb-1">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="1" value="1"
                                       class="w-12 text-center rounded-md border-gray-300  shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                            </div>
                            <div class="flex space-x-4 mb-6">
                                <button
                                    class="bg-indigo-600 flex gap-2 items-center text-white px-6 py-2 rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                         stroke-width="1.5" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                                    </svg>
                                    Add to Cart
                                </button>
                                <button
                                    class="bg-gray-200 flex gap-2 items-center  text-gray-800 px-6 py-2 rounded-md hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2">
                                    Buy now
                                </button>
                            </div>
                            <div>
                                <h3 class="text-lg font-semibold mb-2">Detail: </h3>
                                <p class="text-gray-700 mb-6 w-25" >${product.description}</p>
                            </div>
                        </div>
                    </div>
                </div> 
                <section class="container mx-auto px-20 py-8">
                    <h2 class="text-2xl font-bold mb-8">Same Products</h2>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                        <c:if test="${not empty requestScope.samelist}">
                            <c:forEach var="product" items="${requestScope.samelist}">
                                <div class="border p-4 rounded-lg">
                                    <a href="home?action=view&id=${product.id}">
                                        <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-40 object-cover mb-4">
                                        <h3 class="font-semibold">${product.name}</h3>
                                        <p class="text-gray-600">$${product.price}</p>
                                    </a>
                                </div>  
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty requestScope.samelist}">
                            <p>Không có sản phẩm nào để hiển thị.</p>
                        </c:if>
                    </div>
                </section>
            </div>
        </div>

        <script>
            function changeImage(src) {
                document.getElementById('mainImage').src = src;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

    </body>
</html>

