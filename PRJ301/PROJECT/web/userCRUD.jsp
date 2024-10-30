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
        <div class="flex">
            <!-- Sidebar -->
            <div class="w-64 bg-gray-800 h-screen p-4  sticky top-0">
                <div class="mb-4">
                    <a href="home"><img src="images/FondevJSLogoSmal.svg" alt="alt" height="10px" /></a>
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
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>


            <!-- Main Content -->
            <main class="flex-1 p-6">
                <div class="flex justify-between items-center mb-6">
                    <div class="text-2xl font-bold text-white">All users</div>
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
                                <th scope="col" class="p-4 text-xs font-medium text-left text-gray-500 uppercase dark:text-gray-400">Block status
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
                                    <td class="p-4 text-base font-medium text-gray-900 whitespace-nowrap dark:text-white">${c.blocked}</td>
                                    
                                    <td class="p-4 space-x-2 whitespace-nowrap">
                                        <button onclick="doUpdate(${c.id}, '${c.role}', '${c.blocked}', '${c.password}')" type="button" data-modal-toggle="edit-user-modal" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
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
                        <form action="updateUser" method="post">
                            <div class="grid grid-cols-6 gap-6">
                                <input hidden type="text" value="" name="ouid" id="ouid">
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="newPass" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Reset Password</label>
                                    <input value="" type="password" name="newPass" id="newPass" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 " placeholder="Input new password">
                                </div>
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="oRole" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Role</label>
                                    <select id="oRole" name="role" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                        <option value="admin">admin</option>
                                        <option value="customer">customer</option>
                                    </select>
                                </div>


                                <div class="col-span-6 ">
                                    <label for="oBlocked" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white ">Block status</label>
                                    <select id="oBlocked" name="blocked" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                        <option value="false">Unblocked</option>
                                        <option value="true">Blocked</option>
                                    </select>
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

        function doUpdate(id, role, blocked, password) {
            document.getElementById('ouid').value = id;
             document.getElementById('newPass').value = password;
            const roleSelect = document.getElementById('oRole');
            Array.from(roleSelect.options).forEach(optionRole => {
                if (optionRole.value === role) {
                    optionRole.selected = true;
                } else {
                    optionRole.selected = false;
                }
            });
            const blockSelect = document.getElementById('oBlocked');
            Array.from(blockSelect.options).forEach(optionBlock => {
                if (optionBlock.value === blocked) {
                    optionBlock.selected = true;
                } else {
                    optionBlock.selected = false;
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
