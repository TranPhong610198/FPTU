<%-- 
    Document   : productCRUD
    Created on : Oct 5, 2024, 2:08:32 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>product CRUD</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
        <script src="ckeditor/ckeditor.js"></script>

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
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700  bg-gray-100 dark:bg-gray-700 ">Products</a>
                                </li>
                                <li>
                                    <a href="listUser" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700 ">Users</a>
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
            <!-- Main content -->
            <main class="flex-1 p-6">
                <div class="flex justify-between items-center mb-6">
                    <div class="text-2xl font-bold text-white">All products</div>
                    <button id="createProductButton" class="text-white bg-blue-600 hover:bg-blue-800 font-medium rounded-lg text-sm px-5 py-2.5 type="button" data-drawer-target="drawer-create-product-default" data-drawer-show="drawer-create-product-default" aria-controls="drawer-create-product-default" data-drawer-placement="right">Add new product
                    </button>

                </div>
                <div class="bg-gray-800 p-4 rounded-lg">
                    <form >
                        <div class="flex justify-between items-center mb-4">
                            <input value="${requestScope.searchKey}" onchange="this.form.submit()" name="searchKey" type="text" placeholder="Search for products" class="bg-gray-700 text-gray-300 px-4 py-2 rounded w-full max-w-xs">
                        </div>
                    </form>
                    <table class="w-full text-center">
                        <thead>
                            <tr class="text-gray-400">
                                <th class="py-2">Name</th>
                                <th class="py-2">Description</th>
                                <th class="py-2">Price</th>
                                <th class="py-2">Stock</th>
                                <th class="py-2">Brand</th>
                                <th class="py-2">Category</th>
                                <th class="py-2">Ram Version</th>
                                <th class="py-2">Image</th>
                                <th class="py-2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Repeat for each product -->
                            <c:forEach items="${requestScope.listProduct}" var="c">
                                <c:set var="listSub" value="${c.listSubImages}"/>
                                <tr class="border-b border-gray-700">
                                    <td class="py-2 w-1/6">${c.name}</td>
                                    <td class="py-2 text-left w-1/4">${c.description}</td>
                                    <td class="py-2">${c.price}</td>
                                    <td class="py-2">${c.stock}</td>
                                    <td class="py-2">
                                        <c:forEach items="${c.listBrand}" var="lB">
                                            ${(lB.brandId==c.brandId)?lB.brandName:''}
                                        </c:forEach>
                                    </td>
                                    <td class="py-2">
                                        <c:forEach items="${c.listCategory}" var="lC">
                                            ${(lC.categoryId==c.categoryId)?lC.categoryName:''}
                                        </c:forEach>
                                    </td>
                                    <!--Ram Version_______________________________________________________________________________________-->
                                    <td class="py-2">
                                        ${c.ramVersions!=null&&!c.ramVersions.isEmpty()?c.ramVersions:'None options'}
                                    </td>
                                    <!--__________________________________________________________________________________________________-->
                                    <td class="py-2 grid justify-items-center">
                                        <img src="${c.imageUrl}" alt="${c.name}" width="150px"/>
                                    </td>
                                    <td class="py-2">
                                        <a href="listSubImages?id=${c.id}" class="text-gray-900 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-primary-300 border border-gray-200 font-medium inline-flex items-center rounded-lg text-sm px-3 py-2.5 text-center dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700 dark:focus:ring-gray-700">
                                            List Sub Images
                                        </a>
                                        <div id="productDescription${c.id}" style="display: none;">${c.description}</div>

                                        <button onclick="doUpdate('${c.id}', '${c.name}', '${c.price}', '${c.brandId}', '${c.stock}', '${c.imageUrl}', '${c.categoryId}', '${c.ramVersions}')"  type="button" id="updateProductButton" data-drawer-target="drawer-update-product-default" data-drawer-show="drawer-update-product-default" aria-controls="drawer-update-product-default" data-drawer-placement="right" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"></path>
                                            <path fill-rule="evenodd" d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z" clip-rule="evenodd"></path>
                                            </svg>
                                            Update
                                        </button>
                                        <button onclick="openDeleteDrawer(${c.id})" type="button" id="deleteProductButton" data-drawer-target="drawer-delete-product-default" data-drawer-show="drawer-delete-product-default" aria-controls="drawer-delete-product-default" data-drawer-placement="right" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:ring-red-300 dark:focus:ring-red-900">
                                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                            </svg>
                                            Delete item
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="inline-flex -space-x-px text-sm">
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <li>
                                        <span class="flex items-center justify-center px-3 h-8 text-blue-600 border border-gray-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white">
                                            ${i}</span> <!-- Trang hiện tại -->
                                    </li> 
                                </c:when>
                                <c:otherwise>
                                    <li>    
                                        <a href="${(link!=null && !link.isEmpty())?link:'listProduct?'}page=${i}" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                                            ${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </nav>
            </main>
        </div>

        <!-- Add Product Drawer -->
        <div id="drawer-create-product-default" class="fixed top-0 right-0 z-40 w-full h-screen max-w-2xl p-4 overflow-y-auto transition-transform translate-x-full bg-white dark:bg-gray-800" tabindex="-1" aria-labelledby="drawer-label" aria-hidden="true">
            <h5 id="drawer-label" class="inline-flex items-center mb-6 text-sm font-semibold text-gray-500 uppercase dark:text-gray-400">New Product</h5>
            <button type="button" data-drawer-dismiss="drawer-create-product-default" aria-controls="drawer-create-product-default" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 absolute top-2.5 right-2.5 inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd " d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                <span class="sr-only">Close menu</span>
            </button>
            <form action="addProduct" method="POST" enctype="multipart/form-data">
                <div class="space-y-4 ">
                    <div>
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Name</label>
                        <input type="text" name="name" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Type product name" required="">
                    </div>
                    <div>
                        <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                        <input type="text" name="price" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$" required="">
                    </div>
                    <div>
                        <label for="category-create" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Brand</label>
                        <select id="category-create" name="brandId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            <option selected="">Brand of Product</option>
                            <c:forEach var="oB" items="${requestScope.listProduct.get(0).getListBrand()}">
                                <option value="${oB.brandId}">${oB.brandName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                        <textarea type="text" name="description" id="description" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Description of Product is here" required=""></textarea>
                    </div>
                    <div>
                        <label for="type" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Type</label>
                        <select id="type" name="categoryId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 ">
                            <option selected="">Type of Product</option>

                            <c:forEach var="oCate" items="${requestScope.listProduct.get(0).getListCategory()}">
                                <option value="${oCate.categoryId}">${oCate.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="stock" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Stock</label>
                        <input type="text" name="stock" id="stock" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$" required="">
                    </div>
                    <div>
                        <div>
                            <label for="ram" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Ram versions</label>
                            <c:if test="${not empty requestScope.listRam}">
                                <div class="bg-gray-50 border border-gray-300 rounded-lg p-2.5 dark:bg-gray-700 dark:border-gray-600">
                                    <c:forEach var="lR" items="${requestScope.listRam}">
                                        <label class="flex items-center mb-1 hover:bg-gray-600">
                                            <input type="checkbox" name="ramId[]" value="${lR.ramId}" class="mr-2"> ${lR.ramSize}
                                        </label>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image">Main Image</label>
                        <input name="image" class="block w-full text-lg text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" type="file" id="image" required="">
                    </div>
                    <div class="form-group">
                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">Sub image 1</label>
                        <input name="subImage1" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                        <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                    </div>
                    <div class="form-group">
                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">Sub image 2</label>
                        <input name="subImage2" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                        <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                    </div>
                    <div class="form-group">
                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">Sub image 3</label>
                        <input name="subImage3" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                        <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                    </div>
                    <div class="form-group">
                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">Sub image 4</label>
                        <input name="subImage4" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                        <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                    </div>
                    <!--<div class="bottom-0 left-0 flex justify-center w-full pb-4 space-x-4 md:px-4 md:absolute">-->
                    <button type="submit" class="text-white w-full justify-center bg-blue-600 hover:bg-blue-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                        Add product
                    </button>
                    <button type="button" data-drawer-dismiss="drawer-create-product-default" aria-controls="drawer-create-product-default" class="inline-flex w-full justify-center text-gray-500 items-center bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-primary-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600 ">
                        Cancel
                    </button>
                    <!--</div>-->
                </div>
            </form>
        </div>

        <!-- Edit Product Drawer -->
        <div id="drawer-update-product-default" class="fixed top-0 right-0 z-40 w-full h-screen max-w-2xl p-4 overflow-y-auto transition-transform translate-x-full bg-white dark:bg-gray-800" tabindex="-1" aria-labelledby="drawer-label" aria-hidden="true">
            <h5 id="drawer-label" class="inline-flex items-center mb-6 text-sm font-semibold text-gray-500 uppercase dark:text-gray-400 ">Update Product</h5>
            <button type="button" data-drawer-dismiss="drawer-update-product-default" aria-controls="drawer-update-product-default" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 absolute top-2.5 right-2.5 inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd " d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                <span class="sr-only">Close menu</span>
            </button>
            <form action="updateProduct" method="post" enctype="multipart/form-data">
                <input type="hidden" id="oldId" name="id" value="">
                <input type="hidden" name="oldImageUrl" value="" id="oldImage">
                <div class="space-y-4">
                    <div>
                        <label for="oName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Name</label>
                        <input value="" type="text" name="name" id="oName" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Type product name">
                    </div>
                    <div>
                        <label for="oPrice" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                        <input value="" type="text" name="price" id="oPrice" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$" required="">
                    </div>
                    <div>
                        <label for="oBand" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Brand</label>
                        <select id="oBrand" name="brandId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            <option selected="">Brand of Product</option>
                            <c:forEach var="oB" items="${requestScope.listProduct.get(0).getListBrand()}">
                                <option value="${oB.brandId}">${oB.brandName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="oDescription" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                        <textarea type="text" name="description" id="oDescription" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$" required=""></textarea>
                    </div>
                    <div>
                        <label for="oType" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Type</label>
                        <select id="oType" name="categoryId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 ">
                            <option selected="">Type of Product</option>
                            <c:forEach var="oCate" items="${requestScope.listProduct.get(0).getListCategory()}">
                                <option value="${oCate.categoryId}">${oCate.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="oStock" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Stock</label>
                        <input type="text" name="stock" id="oStock" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$" required="">
                    </div>
                    <div>
                        <div>
                            <label for="oRam" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Ram versions</label>
                            <c:if test="${not empty requestScope.listRam}">
                                <div class="bg-gray-50 border border-gray-300 rounded-lg p-2.5 dark:bg-gray-700 dark:border-gray-600">
                                    <c:forEach var="lR" items="${requestScope.listRam}">
                                        <label class="flex items-center mb-1 hover:bg-gray-600">
                                            <input type="checkbox" name="oRamId[]" value="${lR.ramId}" class="mr-2"> ${lR.ramSize}
                                        </label>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image">Main Image</label>
                        <input name="image" class="block w-full text-lg text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" type="file" id="image">
                        <img src="" alt="alt" id="image-preview"/>
                    </div>

                    <button type="submit" class="w-full justify-center text-white bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800 ">
                        Update
                    </button>
                    <button type="button" data-drawer-dismiss="drawer-update-product-default" aria-controls="drawer-create-product-default" class="inline-flex w-full justify-center text-gray-500 items-center bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-primary-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600 ">
                        Cancel
                    </button>


                </div>
            </form>
        </div>


        <!-- Delete Product Drawer -->
        <div id="drawer-delete-product-default" class="fixed top-0 right-0 z-40 w-full h-screen max-w-xs p-4 overflow-y-auto transition-transform translate-x-full bg-white dark:bg-gray-800" tabindex="-1" aria-labelledby="drawer-label" aria-hidden="true">
            <h5 id="drawer-label" class="inline-flex items-center text-sm font-semibold text-gray-500 uppercase dark:text-gray-400">Delete item</h5>
            <button type="button" data-drawer-dismiss="drawer-delete-product-default" aria-controls="drawer-delete-product-default" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 absolute top-2.5 right-2.5 inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                <span class="sr-only ">Close menu</span>
            </button>
            <svg class="w-10 h-10 mt-8 mb-4 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <h3 class="mb-6 text-lg text-gray-500 dark:text-gray-400 ">Are you sure you want to delete this product?</h3>
            <a id="delete-link" href="#" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-3 py-2.5 text-center mr-2 dark:focus:ring-red-900 ">
                Yes, I'm sure
            </a>
            <a href="#" data-drawer-dismiss="drawer-delete-product-default" class="text-gray-900 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-primary-300 border border-gray-200 font-medium inline-flex items-center rounded-lg text-sm px-3 py-2.5 text-center dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700 dark:focus:ring-gray-700 " data-modal-toggle="delete-product-modal ">
                No, cancel
            </a>
        </div>


        <script type="text/javascript">
            CKEDITOR.versionCheck = function () {}; // Vô hiệu hóa kiểm tra phiên bản
            function doUpdate(id, name, price, brandId, stock, imageUrl, categoryId, ramVersions) {
                // Cập nhật các trường trong form Edit Product Drawer
                document.getElementById('oName').value = name;
                document.getElementById('oPrice').value = price;
//                document.getElementById('oDescription').value = description;
                CKEDITOR.replace('oDescription');
                const description = document.getElementById('productDescription' + id).innerHTML;
                document.getElementById('oDescription').value = description;
                CKEDITOR.instances['oDescription'].setData(description);



//                CKEDITOR.instances['oDescription'].setData(description);
                document.getElementById('oStock').value = stock;
                document.getElementById('oldImage').value = imageUrl;
                document.getElementById('oldId').value = id;
                // Cập nhật brand nếu cần 
                const brandSelect = document.getElementById('oBrand');
                Array.from(brandSelect.options).forEach(option => {
                    if (option.value === brandId) {
                        option.selected = true;
                    } else {
                        option.selected = false;
                    }
                });
                // Cập nhật trường image nếu cần, có thể hiển thị hình ảnh hiện tại
                const imagePreview = document.getElementById('image-preview'); // Tạo 1 thẻ img để hiển thị
                imagePreview.src = imageUrl; // Cập nhật đường dẫn hình ảnh

                const typeSelect = document.getElementById('oType');
                Array.from(typeSelect.options).forEach(option => {
                    if (option.value === categoryId) {
                        option.selected = true;
                    } else {
                        option.selected = false;
                    }
                });

                const ramSizes = ramVersions.split(' '); // Chuyển chuỗi ramVersions thành mảng các ramSize
                const checkboxes = document.querySelectorAll('input[name="oRamId[]"]');
                console.log(checkboxes.innerHTML);
                checkboxes.forEach(checkbox => {
                    const label = checkbox.parentElement.textContent.trim(); // Lấy nội dung (ramSize) kế tiếp của checkbox

                    // Nếu ramSize của checkbox nằm trong mảng ramSizes, đặt nó là checked
                    if (ramSizes.includes(label)) {
                        checkbox.checked = true;
                    } else {
                        checkbox.checked = false;
                    }
                });
            }

            CKEDITOR.replace('description');


            function openDeleteDrawer(productId) {
                document.getElementById('delete-link').href = 'deleteProduct?id=' + productId;
            }

        </script>

        <script async defer src="https://buttons.github.io/buttons.js "></script>
        <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js "></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/datepicker.min.js "></script>

    </body>
</html>
