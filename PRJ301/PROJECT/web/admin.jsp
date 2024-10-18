<%-- 
    Document   : admin
    Created on : Oct 13, 2024, 3:50:35 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>
            Admin Page
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>
    <body class="bg-gray-900 text-gray-300">
        <header class="bg-gray-800 shadow-md ">
            <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
                <div class="text-xl font-bold text-gray-800">
                    <img src="images/FondevJSLogo1.svg" alt="alt" height="10px" />
                </div>
                <div class="hidden md:flex space-x-4 mr-20">
                    <a href="home" class="text-cyan-300 hover:text-white">Home</a>
                    <a href="listProduct" class="text-cyan-300 hover:text-white">Shop</a>
                    <a href="./admin.jsp" class="text-cyan-300 hover:text-white">Admin</a>
                    <a href="#" class="text-cyan-300 hover:text-white">Contact</a>
                </div>
                <div class="flex items-center space-x-4 mr-10">
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-search"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-shopping-cart"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-user"></i></a>

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

        <div class="flex">
            <!-- Sidebar -->
            <div class="w-64 bg-gray-800 h-screen p-4  sticky top-0">
                <div class="flex items-center mb-6">

                </div>
                <div class="mb-4">
                    <input class="w-full p-2 bg-gray-700 text-gray-300 rounded" placeholder="Search" type="text"/>
                </div>
                <nav>
                    <ul>
                        <li class="mb-2">
                            <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="./admin.jsp">
                                <i class="fas fa-tachometer-alt mr-2">
                                </i>
                                Dashboard
                            </a>
                        </li>
                        <!--
                        <li class="mb-2">
                        <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                        <i class="fas fa-layer-group mr-2">
                        </i>
                        Layouts
                        </a>
                        </li>-->
                        <li class="mb-2">
                            <!--       
                            <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                            <i class="fas fa-database mr-2">
                            </i>
                            CRUD
                            </a>-->
                            <button type="button" class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700" aria-controls="dropdown-crud" data-collapse-toggle="dropdown-crud" aria-expanded="false">

                                <i class="fas fa-database mr-2"></i>
                                <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item>CRUD</span>
                                <i class=" fa-exclamation"></i>
                            </button>
                            <ul id="dropdown-crud" class="space-y-2 py-2 hidden">
                                <li>
                                    <a href="listProduct" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Products</a>
                                </li>
                                <li>
                                    <a href="listUser" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Users</a>
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
                                    <!--sub Images-->
                                    <a href="listSubImages" 
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700">Sub Images</a>
                                </li>
                            </ul>
                        </li>
                        <!--                        <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-cogs mr-2">
                                                        </i>
                                                        Settings
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-file-alt mr-2">
                                                        </i>
                                                        Pages
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-lock mr-2">
                                                        </i>
                                                        Authentication
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-play-circle mr-2">
                                                        </i>
                                                        Playground
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fab fa-github mr-2">
                                                        </i>
                                                        GitHub Repository
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-book mr-2">
                                                        </i>
                                                        Flowbite Docs
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-cubes mr-2">
                                                        </i>
                                                        Components
                                                    </a>
                                                </li>
                                                <li class="mb-2">
                                                    <a class="flex items-center p-2 text-gray-300 hover:bg-gray-700 rounded" href="#">
                                                        <i class="fas fa-life-ring mr-2">
                                                        </i>
                                                        Support
                                                    </a>
                                                </li>-->
                    </ul>
                </nav>
            </div>
            <!-- Main Content chưa dùng đến -->
            <div class="flex-1 p-6">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="col-span-2 bg-gray-800 p-4 rounded-lg">
                        <div class="flex justify-between items-center mb-4">
                            <div class="text-xl font-semibold text-white">
                                $45,385
                            </div>
                            <div class="text-green-500">
                                12.5%
                                <i class="fas fa-arrow-up">
                                </i>
                            </div>
                        </div>
                        <div class="h-48 bg-gray-700 rounded-lg">
                        </div>
                        <div class="flex justify-between items-center mt-4">
                            <div class="text-gray-400">
                                Last 7 days
                            </div>
                            <div class="text-blue-500">
                                SALES REPORT
                            </div>
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Statistics this month
                        </div>
                        <div class="mb-4">
                            <div class="flex justify-between items-center mb-2">
                                <div class="text-gray-400">
                                    iPhone 14 Pro
                                </div>
                                <div class="text-green-500">
                                    +12.5%
                                </div>
                            </div>
                            <div class="text-white">
                                $445,467
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="flex justify-between items-center mb-2">
                                <div class="text-gray-400">
                                    Apple iMac 27"
                                </div>
                                <div class="text-green-500">
                                    +8.2%
                                </div>
                            </div>
                            <div class="text-white">
                                $256,982
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="flex justify-between items-center mb-2">
                                <div class="text-gray-400">
                                    Apple Watch SE
                                </div>
                                <div class="text-green-500">
                                    +3.5%
                                </div>
                            </div>
                            <div class="text-white">
                                $201,689
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="flex justify-between items-center mb-2">
                                <div class="text-gray-400">
                                    Apple iPad Air
                                </div>
                                <div class="text-green-500">
                                    +12.5%
                                </div>
                            </div>
                            <div class="text-white">
                                $103,967
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="flex justify-between items-center mb-2">
                                <div class="text-gray-400">
                                    Apple iMac 24"
                                </div>
                                <div class="text-red-500">
                                    -2.1%
                                </div>
                            </div>
                            <div class="text-white">
                                $89,543
                            </div>
                        </div>
                        <div class="flex justify-between items-center mt-4">
                            <div class="text-gray-400">
                                Last 7 days
                            </div>
                            <div class="text-blue-500">
                                FULL REPORT
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            New products
                        </div>
                        <div class="h-24 bg-gray-700 rounded-lg">
                        </div>
                        <div class="text-green-500 mt-2">
                            +12.5% Since last month
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Users
                        </div>
                        <div class="h-24 bg-gray-700 rounded-lg">
                        </div>
                        <div class="text-green-500 mt-2">
                            +3.4% Since last month
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Desktop PC
                        </div>
                        <div class="h-24 bg-gray-700 rounded-lg">
                        </div>
                        <div class="text-green-500 mt-2">
                            +12.5% Since last month
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="col-span-2 bg-gray-800 p-4 rounded-lg">
                        <div class="flex justify-between items-center mb-4">
                            <div class="text-lg font-semibold text-white">
                                Smart chat
                            </div>
                            <div class="text-blue-500">
                                View all
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="flex items-start mb-4">
                                <img alt="User avatar" class="w-10 h-10 rounded-full mr-4" height="40" src="https://storage.googleapis.com/a1aa/image/ed1feN6wYuFnYpg2ocEAe5rEMTSDIROXxeSi1ZHrFAU5LcycC.jpg" width="40"/>
                                <div>
                                    <div class="text-white font-semibold">
                                        Michael Cough
                                    </div>
                                    <div class="text-gray-400 text-sm">
                                        01/03/2023 4:15 PM
                                    </div>
                                    <div class="text-gray-300 mt-2">
                                        Hello @designteam, Let's schedule a kick-off meeting and workshop this week. It would be great to gather everyone involved in the design project. Let me know about your availability in the thread. Looking forward to it! Thanks.
                                    </div>
                                    <div class="text-blue-500 mt-2">
                                        4 replies
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-start mb-4">
                                <img alt="User avatar" class="w-10 h-10 rounded-full mr-4" height="40" src="https://storage.googleapis.com/a1aa/image/ed1feN6wYuFnYpg2ocEAe5rEMTSDIROXxeSi1ZHrFAU5LcycC.jpg" width="40"/>
                                <div>
                                    <div class="text-white font-semibold">
                                        Bonnie Green
                                    </div>
                                    <div class="text-gray-400 text-sm">
                                        01/03/2023 4:15 PM
                                    </div>
                                    <div class="text-gray-300 mt-2">
                                        Hello everyone, Thank you for the workshop, it was very productive meeting. I can't wait to start working on this new project with you guys. But first things first, I am waiting for the offer and pitch deck from you. It would be great to get it by the end of the month. Cheers!
                                    </div>
                                    <div class="text-blue-500 mt-2">
                                        14
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-start mb-4">
                                <img alt="User avatar" class="w-10 h-10 rounded-full mr-4" height="40" src="https://storage.googleapis.com/a1aa/image/ed1feN6wYuFnYpg2ocEAe5rEMTSDIROXxeSi1ZHrFAU5LcycC.jpg" width="40"/>
                                <div>
                                    <div class="text-white font-semibold">
                                        Jese Leos
                                    </div>
                                    <div class="text-gray-400 text-sm">
                                        01/03/2023 4:15 PM
                                    </div>
                                    <div class="text-gray-300 mt-2">
                                        Ok @team I am attaching our offer and pitch deck. Take your time to review everything. I am looking forward to the next steps! Thank you.
                                    </div>
                                    <div class="flex items-center mt-2">
                                        <div class="bg-gray-700 p-2 rounded-lg mr-2">
                                            <div class="text-white">
                                                flowbite.offer.345
                                            </div>
                                            <div class="text-gray-400 text-sm">
                                                PDF, 2.3 MB
                                            </div>
                                        </div>
                                        <div class="bg-gray-700 p-2 rounded-lg">
                                            <div class="text-white">
                                                bersgide_pitch
                                            </div>
                                            <div class="text-gray-400 text-sm">
                                                PPTX, 101 MB
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-start mb-4">
                                <img alt="User avatar" class="w-10 h-10 rounded-full mr-4" height="40" src="https://storage.googleapis.com/a1aa/image/ed1feN6wYuFnYpg2ocEAe5rEMTSDIROXxeSi1ZHrFAU5LcycC.jpg" width="40"/>
                                <div>
                                    <div class="text-white font-semibold">
                                        Joseph Mcfallin
                                    </div>
                                    <div class="text-gray-400 text-sm">
                                        01/03/2023 4:15 PM
                                    </div>
                                    <div class="text-gray-300 mt-2">
                                        Hello @jeseleos I need some informations about flowbite reset version.
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-start mb-4">
                                <img alt="User avatar" class="w-10 h-10 rounded-full mr-4" height="40" src="https://storage.googleapis.com/a1aa/image/ed1feN6wYuFnYpg2ocEAe5rEMTSDIROXxeSi1ZHrFAU5LcycC.jpg" width="40"/>
                                <div>
                                    <div class="text-white font-semibold">
                                        Jese Leos
                                    </div>
                                    <div class="text-gray-400 text-sm">
                                        01/03/2023 4:15 PM
                                    </div>
                                    <div class="text-gray-300 mt-2">
                                        Hi @josephmc Sure, just let me know when you are available and we can speak.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center">
                            <input class="w-full p-2 bg-gray-700 text-gray-300 rounded-l-lg" placeholder="Write your message" type="text"/>
                            <button class="bg-blue-500 p-2 rounded-r-lg text-white">
                                Send message
                            </button>
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Sales by category
                        </div>
                        <div class="h-48 bg-gray-700 rounded-lg">
                        </div>
                        <div class="flex justify-between items-center mt-4">
                            <div class="text-gray-400">
                                Last 7 days
                            </div>
                            <div class="text-blue-500">
                                SALES REPORT
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Latest Activity
                        </div>
                        <div class="mb-4">
                            <div class="text-gray-400">
                                April 2023
                            </div>
                            <div class="text-white font-semibold">
                                Application UI design in Figma
                            </div>
                            <div class="text-gray-400 text-sm">
                                Get access to over 20+ pages including a dashboard layout, charts, kanban board, calendar, and pre-order E-commerce &amp; Marketing pages.
                            </div>
                            <button class="bg-blue-500 text-white p-2 rounded mt-2">
                                Learn more
                            </button>
                        </div>
                        <div class="mb-4">
                            <div class="text-gray-400">
                                March 2023
                            </div>
                            <div class="text-white font-semibold">
                                Marketing UI code in Flowbite
                            </div>
                            <div class="text-gray-400 text-sm">
                                Get started with dozens of web components and interactive elements built on top of Tailwind CSS.
                            </div>
                            <button class="bg-blue-500 text-white p-2 rounded mt-2">
                                Go to Flowbite Blocks
                            </button>
                        </div>
                        <div class="mb-4">
                            <div class="text-gray-400">
                                February 2023
                            </div>
                            <div class="text-white font-semibold">
                                Marketing UI design in Figma
                            </div>
                            <div class="text-gray-400 text-sm">
                                Get started with dozens of web components and interactive elements built on top of Tailwind CSS.
                            </div>
                        </div>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Insights
                        </div>
                        <div class="text-white font-semibold mb-2">
                            You are going to grow by 44% next year
                        </div>
                        <div class="text-gray-400 text-sm mb-4">
                            Get started with a free and open-source admin dashboard layout built with Tailwind CSS and Flowbite featuring charts, widgets, CRUD layouts, authentication pages, and more
                        </div>
                        <div class="text-white font-semibold mb-2">
                            Key Takeaways:
                        </div>
                        <ul class="list-disc list-inside text-gray-400 text-sm">
                            <li>
                                What are the new challenges in the delivery industry due to new consumer expectations.
                            </li>
                            <li>
                                How the online delivery business model is diversifying to meet new demands.
                            </li>
                            <li>
                                Which new technology requirements must be met to ensure true retail experiences.
                            </li>
                        </ul>
                    </div>
                    <div class="bg-gray-800 p-4 rounded-lg">
                        <div class="text-lg font-semibold text-white mb-4">
                            Traffic by device
                        </div>
                        <div class="h-48 bg-gray-700 rounded-lg">
                        </div>
                        <div class="flex justify-between items-center mt-4">
                            <div class="text-gray-400">
                                Desktop
                            </div>
                            <div class="text-white">
                                234k
                            </div>
                        </div>
                        <div class="flex justify-between items-center mt-2">
                            <div class="text-gray-400">
                                Phone
                            </div>
                            <div class="text-white">
                                94k
                            </div>
                        </div>
                        <div class="flex justify-between items-center mt-2">
                            <div class="text-gray-400">
                                Tablet
                            </div>
                            <div class="text-white">
                                16k
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-800 p-4 rounded-lg">
                    <div class="text-lg font-semibold text-white mb-4">
                        Transactions
                    </div>
                    <table class="w-full text-left">
                        <thead>
                            <tr class="text-gray-400">
                                <th class="py-2">
                                    TRANSACTION
                                </th>
                                <th class="py-2">
                                    DATE &amp; TIME
                                </th>
                                <th class="py-2">
                                    AMOUNT
                                </th>
                                <th class="py-2">
                                    REFERENCE NUMBER
                                </th>
                                <th class="py-2">
                                    PAYMENT METHOD
                                </th>
                                <th class="py-2">
                                    STATUS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="border-t border-gray-700">
                                <td class="py-2">
                                    Payment from Bonnie Green
                                </td>
                                <td class="py-2">
                                    Apr 23, 2021
                                </td>
                                <td class="py-2">
                                    $2300
                                </td>
                                <td class="py-2">
                                    0047995989
                                </td>
                                <td class="py-2">
                                    <i class="fab fa-cc-mastercard">
                                    </i>
                                    475
                                </td>
                                <td class="py-2 text-green-500">
                                    Completed
                                </td>
                            </tr>
                            <tr class="border-t border-gray-700">
                                <td class="py-2">
                                    Payment refund #00910
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js "></script>


    </body>
</html>
