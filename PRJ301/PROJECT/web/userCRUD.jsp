<%-- 
    Document   : userCRUD
    Created on : Oct 15, 2024, 11:12:01 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user CRUD</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style> 
    </head>
    <body class="bg-gray-900 text-gray-300">
        <!-- Header -->
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
                        <li class="mb-2">
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
                                       class="text-base text-gray-900 rounded-lg flex items-center p-2 group hover:bg-gray-100 transition duration-75 pl-11 dark:text-gray-200 dark:hover:bg-gray-700 bg-gray-100 dark:bg-gray-700">Users</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>


            <!-- Main Content -->
            <main class="flex-1 p-6">
                <div class="flex justify-between items-center mb-6">
                    <div class="text-2xl font-bold text-white">All users</div>
                    <button data-modal-toggle="add-user-modal" class="inline-flex items-center justify-center w-1/2 px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                        <svg class="w-5 h-5 mr-2 -ml-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
                        </svg>
                        Add user
                    </button>
                </div>

                <div class="bg-gray-800 p-4 rounded-lg">
                    <div class="flex justify-between items-center mb-4">

                    </div>
                    <table class="w-full text-left">
                        <thead class="bg-gray-100 dark:bg-gray-700">
                            <tr>
                                <th scope="col" class="p-4 text-xs font-medium text-left text-gray-500 uppercase dark:text-gray-400">Name
                                </th>
                                <th scope="col" class="p-4 text-xs font-medium text-left text-gray-500 uppercase dark:text-gray-400">Address
                                </th>
                                <th scope="col" class="p-4 text-xs font-medium text-left text-gray-500 uppercase dark:text-gray-400">Phone
                                </th>
                                <th scope="col" class="p-4 text-xs font-medium text-left text-gray-500 uppercase dark:text-gray-400">Role
                                </th>
                                <th scope="col" class="p-4 text-xs font-medium text-left text-gray-500 uppercase dark:text-gray-400">Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200 dark:bg-gray-800 dark:divide-gray-700">
                            <!-- Repeat for each product -->
                            <c:forEach items="${requestScope.listUser}" var="c">
                                <tr class="hover:bg-gray-100 dark:hover:bg-gray-700">
                                    <td class="flex items-center p-4 mr-12 space-x-6 whitespace-nowrap">
                                        <img class="w-10 h-10 rounded-full" src="${c.avtUrl}" alt="avatar">
                                        <div class="text-sm font-normal text-gray-500 dark:text-gray-400">
                                            <div class="text-base font-semibold text-gray-900 dark:text-white">${c.username}</div>
                                            <div class="text-sm font-normal text-gray-500 dark:text-gray-400">${c.email}</div>
                                        </div>
                                    </td>
                                    <td class="max-w-sm p-4 overflow-hidden text-base font-normal text-gray-500 truncate xl:max-w-xs dark:text-gray-400">${c.address}</td>
                                    <td class="p-4 text-base font-medium text-gray-900 whitespace-nowrap dark:text-white">${c.phone}</td>
                                    <td class="p-4 text-base font-medium text-gray-900 whitespace-nowrap dark:text-white">${c.role}</td>
                                    <td class="p-4 space-x-2 whitespace-nowrap">
                                        <button type="button" data-modal-toggle="edit-user-modal" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"></path>
                                            <path fill-rule="evenodd" d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z" clip-rule="evenodd"></path>
                                            </svg>
                                            Edit user
                                        </button>
                                        <button onclick="openDeleteModal(${c.id})" type="button" data-modal-toggle="delete-user-modal" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-red-600 rounded-lg hover:bg-red-800 focus:ring-4 focus:ring-red-300 dark:focus:ring-red-900">
                                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                            </svg>
                                            Delete user
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>

        <!-- Edit User Modal -->
        <div class="fixed left-0 right-0 z-50 items-center justify-center hidden overflow-x-hidden overflow-y-auto top-4 md:inset-0 h-modal sm:h-full" id="edit-user-modal">
            <div class="relative w-full h-full max-w-2xl px-4 md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-800">
                    <!-- Modal header -->
                    <div class="flex items-start justify-between p-5 border-b rounded-t dark:border-gray-700">
                        <h3 class="text-xl font-semibold dark:text-white">
                            Edit user
                        </h3>
                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-700 dark:hover:text-white" data-modal-toggle="edit-user-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-6 space-y-6">
                        <form action="#">
                            <div class="grid grid-cols-6 gap-6">
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="first-name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First Name</label>
                                    <input type="text" name="first-name" value="Bonnie" id="first-name" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="Bonnie " required>
                                </div>
                                <div class="col-span-6 sm:col-span-3 ">
                                    <label for="last-name " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Last Name</label>
                                    <input type="text " name="last-name " value="Green " id="last-name " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="Green " required>
                                </div>
                                <div class="col-span-6 sm:col-span-3 ">
                                    <label for="email " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Email</label>
                                    <input type="email " name="email " value="bonnie@flowbite.com " id="email " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="example@company.com " required>
                                </div>
                                <div class="col-span-6 sm:col-span-3 ">
                                    <label for="position " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Position</label>
                                    <input type="text " name="position " value="React Developer " id="position " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="e.g.React developer " required>
                                </div>
                                <div class="col-span-6 sm:col-span-3 ">
                                    <label for="current-password " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Current Password</label>
                                    <input type="password " name="current-password " value="••••••••" id="current-password " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="••••••••" required>
                                </div>
                                <div class="col-span-6 sm:col-span-3 ">
                                    <label for="new-password " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">New Password</label>
                                    <input type="password " name="new-password " value="••••••••" id="new-password " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="••••••••" required>
                                </div>
                                <div class="col-span-6 ">
                                    <label for="biography " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Biography</label>
                                    <textarea id="biography " rows="4 " class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="👨‍💻Full-stack web developer.Open-source contributor.">👨‍💻Full-stack web developer. Open-source contributor.</textarea>
                                </div>
                            </div> 

                            <!-- Modal footer -->
                            <div class="items-center p-6 border-t border-gray-200 rounded-b dark:border-gray-700">
                                <button class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" type="submit">Save all</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- Add User Modal -->
        <div class="fixed left-0 right-0 z-50 items-center justify-center hidden overflow-x-hidden overflow-y-auto top-4 md:inset-0 h-modal sm:h-full" id="add-user-modal">
            <div class="relative w-full h-full max-w-2xl px-4 md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-800">
                    <!-- Modal header -->
                    <div class="flex items-start justify-between p-5 border-b rounded-t dark:border-gray-700">
                        <h3 class="text-xl font-semibold dark:text-white">
                            Add new user
                        </h3>
                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-700 dark:hover:text-white" data-modal-toggle="add-user-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-6 space-y-6">
                        <form action="#">
                            <div class="grid grid-cols-6 gap-6">
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="first-name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First Name</label>
                                    <input type="text" name="first-name" id="first-name" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Bonnie" required>
                                </div>
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="last-name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last Name</label>
                                    <input type="text" name="last-name" id="last-name" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="Green " required>
                                </div>
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Email</label>
                                    <input type="email" name="email " id="email " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="example@company.com " required>
                                </div>
                                <div class="col-span-6 sm:col-span-3 ">
                                    <label for="position " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Position</label>
                                    <input type="text " name="position " id="position " class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="e.g.React developer " required>
                                </div>
                                <div class="col-span-6 ">
                                    <label for="biography " class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Biography</label>
                                    <textarea id="biography " rows="4 " class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="👨‍💻Full-stack web developer.Open-source contributor."></textarea>
                                </div>
                            </div> 

                            <!-- Modal footer -->
                            <div class="items-center p-6 border-t border-gray-200 rounded-b dark:border-gray-700">
                                <button class="text-white bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" type="submit">Add user</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete User Modal -->
        <div class="fixed left-0 right-0 z-50 items-center justify-center hidden overflow-x-hidden overflow-y-auto top-4 md:inset-0 h-modal sm:h-full" id="delete-user-modal">
            <div class="relative w-full h-full max-w-md px-4 md:h-auto ">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-800">
                    <!-- Modal header -->
                    <div class="flex justify-end p-2">
                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-700 dark:hover:text-white" data-modal-toggle="delete-user-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-6 pt-0 text-center">
                        <svg class="w-16 h-16 mx-auto text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <h3 class="mt-5 mb-6 text-lg text-gray-500 dark:text-gray-400">Are you sure you want to delete this user?</h3>
                        <a id="delete-link" href="#" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-base inline-flex items-center px-3 py-2.5 text-center mr-2 dark:focus:ring-red-800">
                            Yes, I'm sure
                        </a>
                        <a href="#" class="text-gray-900 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-primary-300 border border-gray-200 font-medium inline-flex items-center rounded-lg text-base px-3 py-2.5 text-center dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700 dark:focus:ring-gray-700" data-modal-toggle="delete-user-modal">
                            No, cancel
                        </a>
                    </div>
                </div>
            </div>
        </div>







    </div>

    <script type="text/javascript">

        function doUpdate(id, name, price, description, brand, stock, imageUrl, categoryId) {
            // Cập nhật các trường trong form Edit Product Drawer
            document.getElementById('oName').value = name;
            document.getElementById('oPrice').value = price;
            document.getElementById('oDescription').value = description;
            document.getElementById('oStock').value = stock;
            document.getElementById('oldImage').value = imageUrl;
            document.getElementById('oldId').value = id;
            // Cập nhật brand nếu cần 
            const brandSelect = document.getElementById('oBrand');
            Array.from(brandSelect.options).forEach(option => {
                if (option.value === brand) {
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
        }

        function openDeleteModal(productId) {
            document.getElementById('delete-link').href = 'deleteUser?id=' + productId;
        }

    </script>
    <script async defer src="https://buttons.github.io/buttons.js "></script>
    <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/datepicker.min.js "></script>

</body>
</html>
