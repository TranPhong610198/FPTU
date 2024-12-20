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
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        fontFamily: {
                            inter: ['Inter', 'sans-serif'],
                        },
                        animation: {
                            'infinite-scroll': 'infinite-scroll 25s linear infinite',
                        },
                        keyframes: {
                            'infinite-scroll': {
                                from: {transform: 'translateX(0)'},
                                to: {transform: 'translateX(-100%)'},
                            }
                        }
                    },
                },
            };
        </script>
    </head>
    <body class="font-sans">
        <header class="bg-gray-800 shadow-md text-gray-300">
            <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
                <div class="text-xl font-bold text-gray-800">
                    <img src="images/FondevJSLogoSmal.svg" alt="alt"/>
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
                    <a href="${(sessionScope.account.role=='admin')?'admin':'404pages.html'}" class="text-cyan-300 hover:text-white">Admin</a>
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
                    <!--Searching-->
                    <form class="max-w-md mx-auto" action="search">
                        <div class="flex">
                            <label for="location-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"></label>
                            <div class="relative w-full">
                                <input value="${searchKeyword}" name="searchKey" type="search" id="location-search" class="block p-2 w-full z-20 text-sm rounded-lg border-s-2 border focus:ring-blue-500 focus:border-blue-500 bg-gray-700 border-s-gray-700  border-gray-600 placeholder-gray-400 text-white focus:border-blue-500" placeholder="Search" required />
                                <button type="submit" class="absolute top-0 end-0 h-full p-2 text-cyan-300 hover:text-white">
                                    <i class="w-4 h-4 fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!--_____________________________________________________________________________________________________________-->

                    <!--Cart-->
                    <a href="cart" class="text-cyan-300 hover:text-white"><i class="fas fa-shopping-cart"></i></a>
                    <!--__________________________________________________________________________________________________________________________-->

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
                                        <a href="admin" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a>
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
        <!--__________________________________________________________________________________________________________________________________________________________________________________________________________________-->
        <main>
            <section class="bg-gradient-to-r from-purple-500 to-teal-500 text-white py-6">
                <div class="container mx-auto px-4">
                    <h1 class="text-4xl font-bold mb-6">Outstanding Product</h1>
                    <div class="flex">
                        <div class="w-1/3 flex justify-center">
                            <img alt="Main product image" class="w-96 h-auto mb-4 rounded-lg" height="200" src="${outstandP.imageUrl}" width="200"/>
                        </div>
                        <div class="w-2/3 pl-6">
                            <div class="grid content-center grid-cols-4 gap-2 justify-items-center">
                                <c:forEach items="${outstandP.subImages}" var="image">
                                    <div>
                                        <img alt="Sub Image 1" class="w-full h-auto rounded-lg" height="75" src="${image}" width="75"/>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="flex justify-center mt-8">
                                <a  href="home?action=view&id=${outstandP.id}" class="cursor-pointer px-4 py-2 bg-gray-700 hover:bg-gray-800 text-white rounded-full">View DeTail</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="container mx-auto px-8 py-8 ">
                <h2 class="text-2xl font-bold mb-8 border-gray-300">Top 5 Best Sales:</h2>
                <div class="grid grid-cols-2 md:grid-cols-5 gap-6">
                    <c:if test="${not empty requestScope.top5sale}">
                        <c:forEach var="product" items="${requestScope.top5sale}">
                            <div class="border p-4 rounded-lg">
                                <a href="home?action=view&id=${product.id}">
                                    <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-40 object-cover mb-4">
                                    <h3 class="font-semibold">${product.name}</h3>
                                    <p class="text-gray-600">$${product.price}</p>
                                </a>
                            </div>  
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty requestScope.top5sale}">
                        <p>Không có sản phẩm nào để hiển thị.</p>
                    </c:if>

                </div>
            </section>

            <section class="container mx-auto px-8 py-8 ">
                <h2 class="text-2xl font-bold mb-8 border-gray-300">Top 5 New Products:</h2>
                <div class="grid grid-cols-2 md:grid-cols-5 gap-6">
                    <c:if test="${not empty requestScope.top5new}">
                        <c:forEach var="product" items="${requestScope.top5new}">
                            <div class="border p-4 rounded-lg">
                                <a href="home?action=view&id=${product.id}">
                                    <img src="${product.imageUrl}" alt="${product.name}" class="w-full h-40 object-cover mb-4">
                                    <h3 class="font-semibold">${product.name}</h3>
                                    <p class="text-gray-600">$${product.price}</p>
                                </a>
                            </div>  
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty requestScope.top5new}">
                        <p>Không có sản phẩm nào để hiển thị.</p>
                    </c:if>

                </div>
            </section>

            <section class="container mx-auto px-20 py-8">
                <h2 class="text-2xl font-bold mb-8">All Products ${searchKeyword} ${(nameOfList.isEmpty())?'':nameOfList}:</h2>

                <form action="search" method="get">
                    <input type="text" name="searchKey" value="${searchKeyword}" hidden=""/>
                    <div class="grid grid-cols-3 gap-6 w-2/4 justify-items-start">
                        <select name="priceRange" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 ">
                            <option value="">Tất cả</option>
                            <option value="under1000" ${priceRange == "under1000" ? "selected" : ""}>Dưới 1000$</option>
                            <option value="1000to2000" ${priceRange == "1000to2000" ? "selected" : ""}>1000$ - 2000$</option>
                            <option value="2000to2500" ${priceRange == "2000to2500" ? "selected" : ""}>2000$ - 2500$</option>
                            <option value="above2500" ${priceRange == "above2500" ? "selected" : ""}>Trên 2500$</option>
                        </select>
                        <select name="sortOrder" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 ">
                            <option value="">Giá ngẫu nhiên</option>
                            <option value="asc" ${sortOrder == "asc" ? "selected" : ""}>Giá tăng dần</option>
                            <option value="desc" ${sortOrder == "desc" ? "selected" : ""}>Giá giảm dần</option>
                        </select>
                        <button type="submit" class="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py- me-2 mb-2 w-1/2">
                            Filter</button>
                    </div>

                </form>
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
                <nav aria-label="Page navigation example">
                    <ul class="inline-flex -space-x-px text-sm">
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <li>
                                        <span class="flex items-center justify-center px-3 h-8 text-blue-600 border border-gray-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700">
                                            ${i}</span> <!-- Trang hiện tại -->
                                    </li> 
                                </c:when>
                                <c:otherwise>
                                    <li>    
                                        <a href="${(typeServlet!=null && !typeServlet.isEmpty())?typeServlet:'home?'}page=${i}" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                                            ${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </nav>
            </section>

            <main class="relative h-[300px] flex flex-col justify-center bg-gray-100 overflow-hidden">
                <div class="w-full max-w-5xl mx-auto px-4 md:px-6 py-24">
                    <div class="text-center">

                        <!-- Logo Carousel animation -->
                        <div
                            x-data="{}"
                            x-init="$nextTick(() => {
                            let ul = $refs.logos;
                            ul.insertAdjacentHTML('afterend', ul.outerHTML);
                            ul.nextSibling.setAttribute('aria-hidden', 'true');
                            })"
                            class="w-full inline-flex flex-nowrap overflow-hidden [mask-image:_linear-gradient(to_right,transparent_0,_black_128px,_black_calc(100%-128px),transparent_100%)]"
                            >
                            <ul x-ref="logos" class="flex items-center justify-center md:justify-start [&_li]:mx-8 [&_img]:max-w-none animate-infinite-scroll">
                                <li>
                                    <img src="images/logoMSI.png" alt="MSI" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoASUS.png" alt="ASUS" class="h-40" />
                                </li>
                                <li>
                                    <img src="images/logoACER.png" alt="ACER" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoDell.png" alt="DELL" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoHP.png" alt="HP" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoLenovo.png" alt="LENOVO" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoPredator.png" alt="PREDATOR" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoROG.png" alt="ROG" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/logoThinkPad.png" alt="ThinkPad" class="h-40"/>
                                </li>
                                <li>
                                    <img src="images/FondevJSLogoDark.svg" alt="FondevJs" class="h-40"/>
                                </li>
                            </ul>                
                        </div>
                        <!-- End: Logo Carousel animation -->

                    </div>

                </div>
            </main>
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
                    <a href="home"> <img src="./images/FondevJSLogoBig.svg" alt="alt"/></a>
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
