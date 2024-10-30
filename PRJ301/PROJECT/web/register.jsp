<%-- 
    Document   : register
    Created on : Oct 22, 2024, 3:25:41 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="dark">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Get started with a free and open-source admin dashboard layout built with Tailwind CSS and Flowbite featuring charts, widgets, CRUD layouts, authentication pages, and more">
        <meta name="author" content="Themesberg">
        <meta name="generator" content="Hugo 0.58.2">
        <title>Register Page</title>
        <link rel="canonical" href="https://flowbite-admin-dashboard.vercel.app/authentication/sign-in/">
        <link rel="stylesheet" href="https://flowbite-admin-dashboard.vercel.app//app.css">
        <!--        <script>
        
                    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
                        document.documentElement.classList.add('dark');
                    } else {
                        document.documentElement.classList.remove('dark')
                    }
                </script>-->
    </head>
    <body class="bg-gray-50 dark:bg-gray-900">
        <main class="bg-gray-50 dark:bg-gray-900">
            <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto md:h-screen pt:mt-0 dark:bg-gray-900">
                <a href="home" class="flex items-center justify-center mb-8 text-2xl font-semibold lg:mb-10 dark:text-white">
                    <img src="images/FondevJSLogoSmal.svg" class="mr-4 h-25" alt="Logo">
                </a>
                <!-- Card -->
                <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow dark:bg-gray-800">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
                        Register
                    </h2>
                    <form class="mt-8 space-y-6" action="register" method="post">
                        <div>
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
                            <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required>
                            <p style="color: red">${!(requestScope.errMail==null || requestScope.errMail.isEmpty())?requestScope.errMail:''}</p>
                        </div>
                        <div>
                            <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
                            <input type="text" name="username" id="username" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required>
                            <p style="color: red">${!(requestScope.errUser==null || requestScope.errUser.isEmpty())?requestScope.errUser:''}</p>
                            <c:if test="${errUser.equals('invalid')}">
                                <ul style="list-style-type: none; padding: 0; color: red;">
                                    <li id="length" >Độ dài từ 6 đến 20 ký tự</li>
                                    <li id="noSpaces" >Không có dấu cách</li>
                                    <li id="validChars" >Chỉ chứa chữ cái, số và dấu gạch dưới (_)</li>
                                    <li id="noConsecutiveUnderscores">Không có hai dấu gạch dưới liên tiếp</li>
                                    <li id="startEndWithLetterOrNumber">Bắt đầu và kết thúc bằng chữ cái hoặc số</li>
                                </ul> 
                            </c:if>
                        </div>

                        <div>
                            <label for="pass1" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                            <input type="password" name="pass1" id="pass1" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required>
                        </div>
                        <div>
                            <label for="pass2" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm password</label>
                            <input type="password" name="pass2" id="pass2" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required>
                            <p style="color: red">${!(requestScope.errPass==null || requestScope.errPass.isEmpty())?requestScope.errPass:''}</p>
                        </div>

                        <button type="submit" class="w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                            Create account
                        </button>
                        <p style="color: #00ff33">${!(requestScope.success==null || requestScope.success.isEmpty())?requestScope.success:''}</p>
                        <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
                            Already have an account? <a href="login" class="text-primary-700 hover:underline dark:text-primary-500">Login here</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/datepicker.min.js"></script>
    </body>
</html>