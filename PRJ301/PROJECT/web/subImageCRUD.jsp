<%-- 
    Document   : subImageCRUD
    Created on : Oct 22, 2024, 2:22:20 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://flowbite-admin-dashboard.vercel.app//app.css">
        <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css"  rel="stylesheet" />

    </head>
    <body class="bg-gray-900">
        <main class="bg-gray-900">
            <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto md:h-screen pt:mt-0 bg-gray-900">
                <!-- Card -->
                <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 rounded-lg shadow bg-gray-800">
                    <h2 class="text-2xl font-bold text-white text-center">
                        Sub Images For ${requestScope.mainName}
                    </h2>
                    <form class="mt-8 space-y-6" action="listSubImages" method="post" enctype="multipart/form-data">
                        <input hidden="" type="text" value="${requestScope.prdId}" name="pId" readonly="">
                        <c:if test="${not empty requestScope.listSub}">
                            <div class="flex">
                                <c:set value="${requestScope.listSub}" var="c"></c:set>
                                <img src="${c[0]}" alt="alt" width="25%"/>
                                <img src="${c[1]}" alt="alt" width="25%"/>
                                <img src="${c[2]}" alt="alt" width="25%"/>
                                <img src="${c[3]}" alt="alt" width="25%"/>
                            </div>
                                <input hidden="" type="text" value="${c[0]}" name="oldIMG" readonly="">
                                <input hidden="" type="text" value="${c[1]}" name="oldIMG" readonly="">
                                <input hidden="" type="text" value="${c[2]}" name="oldIMG" readonly="">
                                <input hidden="" type="text" value="${c[3]}" name="oldIMG" readonly="">
                        </c:if>
                        <c:if test="${empty requestScope.listSub}">
                            <p class="text-red-500">Không có ảnh nào để hiển thị.</p>
                        </c:if>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-white" for="file_input">Sub image 1</label>
                            <input name="subImage1" class="block w-full text-sm border rounded-lg cursor-pointer text-gray-400 focus:outline-none bg-gray-700 border-gray-600 placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                            <p class="mt-1 text-sm text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-white" for="file_input">Sub image 2</label>
                            <input name="subImage2" class="block w-full text-sm border rounded-lg cursor-pointer text-gray-400 focus:outline-none bg-gray-700 border-gray-600 placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                            <p class="mt-1 text-sm text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-white" for="file_input">Sub image 3</label>
                            <input name="subImage3" class="block w-full text-sm border rounded-lg cursor-pointer text-gray-400 focus:outline-none bg-gray-700 border-gray-600 placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                            <p class="mt-1 text-sm text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                        </div>
                        <div class="form-group">
                            <label class="block mb-2 text-sm font-medium text-white" for="file_input">Sub image 4</label>
                            <input name="subImage4" class="block w-full text-sm border rounded-lg cursor-pointer text-gray-400 focus:outline-none bg-gray-700 border-gray-600 placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">
                            <p class="mt-1 text-sm text-gray-300" id="file_input_help">SVG, PNG, JPG</p>
                        </div>
                        <button type="submit" class="w-full px-5 py-3 text-base font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                            Save
                        </button>
                        <a href="listProduct" class="focus:ring-4 border font-medium inline-flex items-center rounded-lg text-sm px-3 py-2.5 text-center text-gray-400 border-gray-600 hover:text-white  hover:bg-red-600  focus:ring-gray-700">
                            Cancel
                        </a>
                    </form>
                </div>
            </div>
        </main>

        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/datepicker.min.js"></script>
    </body>
</html>
