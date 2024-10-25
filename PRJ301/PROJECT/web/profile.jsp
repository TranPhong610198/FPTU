<%-- 
    Document   : profile
    Created on : Oct 24, 2024, 7:32:18 AM
    Author     : tphon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://flowbite-admin-dashboard.vercel.app//app.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <script>

            if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
                document.documentElement.classList.add('dark');
            } else {
                document.documentElement.classList.remove('dark')
            }

        </script>
    </head>
    <body class="bg-gray-900">
        <div id="main-content" class="relative w-full h-full overflow-y-auto bg-gray-50 dark:bg-gray-900">
            <main>

                <!-- Right Content -->
                <div class="grid grid-cols-3 xl:col-auto p-4">
                    <c:set value="${requestScope.user}" var="user"/>
                    <div class="col-span-1">
                        <div class=" p-4  bg-white border border-gray-200 rounded-lg shadow-sm  dark:border-gray-700 sm:p-6 dark:bg-gray-800">
                            <div class="items-center sm:flex xl:block 2xl:flex sm:space-x-4 xl:space-x-0 2xl:space-x-4">
                                <img class="mb-4 rounded-lg w-28 h-28 sm:mb-0 xl:mb-4 2xl:mb-0" src="${user.avtUrl}" alt="${user.username}">
                                <div>
                                    <h3 class="mb-1 text-xl font-bold text-gray-900 dark:text-white">${user.username}</h3>
                                    <div class="mb-4 text-sm text-gray-500 dark:text-gray-400">JPG, GIF or PNG. Max size of 800K
                                    </div>
                                    <div class="flex items-center space-x-4">
                                        <form action="profile" method="post" enctype="multipart/form-data">
                                            <label  for="upload1" class="cursor-pointer inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                                <svg class="w-4 h-4 mr-2 -ml-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M5.5 13a3.5 3.5 0 01-.369-6.98 4 4 0 117.753-1.977A4.5 4.5 0 1113.5 13H11V9.413l1.293 1.293a1 1 0 001.414-1.414l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13H5.5z"></path>
                                                <path d="M9 13h2v5a1 1 0 11-2 0v-5z"></path>
                                                </svg>
                                                Upload picture
                                                <input hidden="" type="text" name="oldAvtUrl" value="${user.avtUrl}"/>
                                                <input name="image" type="file"  class="hidden" id="upload1" onchange="this.form.submit()"/>
                                                <input name="id" type="text" value="${user.id}" hidden=""/>
                                                <input name="checkUpAvt" type="text" value="true" hidden=""/>
                                            </label>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="p-4  bg-white border border-gray-200 rounded-lg shadow-sm 2xl:col-span-1 dark:border-gray-700 sm:p-6 dark:bg-gray-800">
                            <h3 class="mb-4 text-xl font-semibold dark:text-white">Password change</h3>
                            <form action="profile" method="post">
                                <div class="mb-4">
                                    <label for="curPass" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Current password</label>
                                    <input type="password" id="curPass" name="curPass" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"/>
                                    <p style="font-style: italic; color: red">${(errPass==null||errPass.isEmpty())?'':errPass}</p>
                                </div>

                                <div class="mb-4">
                                    <label for="newPass" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">New password</label>
                                    <input type="password" id="newPass" name="newPass" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"/>
                                </div>
                                <div class="mb-4">
                                    <label for="hs-toggle-password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm password</label>
                                    <input type="password" id="cfPass" name="cfPass" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"/>
                                    <p style="font-style: italic; color: red">${(errCf==null||errCf.isEmpty())?'':errCf}</p>
                                </div>

                                <input name="username" type="text" value="${user.username}" hidden=""/>
                                <input name="id" type="text" value="${user.id}" hidden=""/>
                                <input name="checkUpPass" type="text" value="true" hidden=""/>
                                <div>
                                    <button type="submit" class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Save all</button>
                                    <p style="font-style: italic; color: #00ff33">${(success==null||success.isEmpty())?'':success}</p>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-span-2">
                        <div class="p-4 mb-4 bg-white border border-gray-200 rounded-lg shadow-sm 2xl:col-span-2 dark:border-gray-700 sm:p-6 dark:bg-gray-800">
                            <h3 class="mb-4 text-xl font-semibold dark:text-white">General information</h3>
                            <form action="profile" method="post">
                                <div class="grid grid-cols-6 gap-6">
                                    <!--Username-->
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">User Name</label>
                                        <input type="text" name=username id="username" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" value="${user.username}">
                                        <p style="font-style: italic; color: red">${(errName==null||errName.isEmpty())?'':errName}</p>
                                    </div>
                                    <!--Tỉnh-->
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="province" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tỉnh</label>
                                        <select onchange="loadDistricts()" id="province" name="province" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                            <option value="">Tỉnh/Thành Phố</option>
                                            <option value="Hà Nội">Hà Nội</option>
                                            <option value="Đà Nẵng">Đà Nẵng</option>
                                            <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                                            <option value="Thanh Hóa">Thanh Hóa</option>
                                            <option value="Bắc Giang">Bắc Giang</option>
                                        </select>
                                    </div>
                                    <!--Email-->
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
                                        <input type="email" name="email" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" value="${user.email}">
                                        <p style="font-style: italic; color: red">${(errEmail==null||errEmail.isEmpty())?'':errEmail}</p>
                                    </div>
                                    <!--Huyện-->
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="district" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Huyện</label>
                                        <select onchange="loadWards()" disabled="" id="district" name="district" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                            <option value="">Quận/Huyện</option>
                                        </select>
                                    </div>
                                    <!--Phone-->
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone Number</label>
                                        <input type="text" name="phone" id="phone" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" value="${user.phone}">
                                        <p style="font-style: italic; color: red">${(errPhone==null||errPhone.isEmpty())?'':errPhone}</p>
                                    </div>
                                    <!--Xã-->
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="ward" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Xã</label>
                                        <select disabled="" id="ward" name="ward" class="bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                            <option value="">Tỉnh/Thành Phố</option>
                                        </select>
                                    </div>

                                    <div class="col-span-6 sm:col-span-3"></div>
                                    <div class="col-span-6 sm:col-span-3"></div>
                                    <div class="col-span-6 sm:col-span-3"></div>
                                    <div class="col-span-6 sm:col-span-3"></div>
                                    <div class="col-span-6 sm:col-span-3"></div>
                                    <input name="checkupInfo" type="text" value="true" hidden=""/>
                                    <input name="id" type="text" value="${user.id}" hidden=""/>
                                    <div class="col-span-6 sm:col-full">
                                        <p style="font-style: italic; color: #00ff33">${(successInfo==null||successInfo.isEmpty())?'':successInfo}</p>
                                        <button class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" type="submit">Save all</button>
                                    </div>
                                    <div class="col-span-6 sm:col-full">
                                        <button onclick="openDeleteModal(${c.id})" type="button" data-modal-toggle="delete-user-modal" class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-red-600 rounded-lg hover:bg-red-800 focus:ring-4 focus:ring-red-300 dark:focus:ring-red-900">
                                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                            </svg>
                                            Delete account
                                        </button>
                                        <!--<a class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-primary-800" type="submit">Delete Account</a>-->
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
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
    </main>
</div>
<script>
// Dữ liệu mẫu: Danh sách huyện theo tỉnh và xã theo huyện
    const data =
            {
                "Hà Nội": {
                    districts: {
                        "Ba Đình": ["Cống Vị", "Điện Biên", "Giảng Võ", "Liễu Giai", "Ngọc Hà", "Ngọc Khánh"],
                        "Đống Đa": ["Cát Linh", "Hàng Bột", "Khâm Thiên", "Láng Hạ", "Phương Mai", "Thổ Quan"]
                    }
                },
                "Đà Nẵng": {
                    districts: {
                        "Hải Châu": ["Hải Châu 1", "Hải Châu 2", "Bình Thuận", "Thuận Phước", "Thạch Thang"],
                        "Cẩm Lệ": ["Hòa An", "Hòa Thọ Đông", "Khuê Trung", "Hòa Thọ Tây", "Hòa Xuân"]
                    }
                },
                "Hồ Chí Minh": {
                    districts: {
                        "Quận 1": ['Phường Bến Nghé', 'Phường Bến Thành', 'Phường Nguyễn Thái Bình'],
                        "Quận 3": ["Võ Thị Sáu", "Phạm Ngọc Thạch", "Lê Văn Sỹ", "Quận 3"]
                    }
                },
                "Thanh Hóa": {
                    districts: {
                        "TP Thanh Hóa": ["Ba Đình", "Điện Biên", "Đông Cương"],
                        "Sầm Sơn": ["Bắc Sơn", "Trường Sơn", "Quảng Tiến"],
                        "Thiệu Hóa": ["Thọ Lâm", "Thọ Cường", "Thọ Ngọc"],
                        "Hoàng Hóa": ["Hoằng Đông", "Hoằng Hà", "Hoằng Phong", "Hoằng Đồng"],
                        "Hậu Lộc": ["Hòa Lộc", "Minh Lộc", "Ngư Lộc", "Phú Lộc"]
                    }
                },
                "Bắc Giang": {
                    districts: {
                        "TP Bắc Giang": ["Dĩnh Kế", "Đa Mai", "Ngô Quyền"],
                        "Hiệp Hòa": ["Đoan Bái", "Đông Lỗ", "Thường Thắng"],
                        "Lạng Giang": ["Đại Lâm", "Nghĩa Hòa", "Tân Thịnh"],
                        "Lục Ngạn": ["Biên Sơn", "Quý Sơn", "Phượng Sơn"],
                        "Việt Yên": ["Bích Động", "Ninh Sơn", "Tự Lạn", "Nếnh", "Vân Trung"]
                    }
                }
            };



    // Load danh sách huyện khi chọn tỉnh
    function loadDistricts() {
        const province = document.getElementById('province').value;
        const districtSelect = document.getElementById('district');
        const wardSelect = document.getElementById('ward');

        // Reset danh sách huyện và xã
        districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
        wardSelect.innerHTML = '<option value="">Chọn Xã/Phường</option>';
//        districtSelect.disabled = true;
        wardSelect.disabled = true;

//        if (province) {
//            const districts = data[province].districts;
//            for (let district in districts) {
//                let option = document.createElement('option');
//                option.value = district;
//                option.text = district.replace(/_/g, ' ');
//                districtSelect.appendChild(option);
//            }
//            districtSelect.disabled = false;
//        }
        if (province) {
            const districts = data[province].districts;
            for (let district in districts) {
//                districtSelect.innerHTML += '<option value="${district}">${district}</option>';
                let option = document.createElement('option');
                option.value = district;
                option.text = district;
                districtSelect.appendChild(option);
            }
            districtSelect.disabled = false;
        } else {
            districtSelect.disabled = true;
            wardSelect.disabled = true;
        }
    }

// Load danh sách xã khi chọn huyện
    function loadWards() {
        const province = document.getElementById('province').value;
        const district = document.getElementById('district').value;
        const wardSelect = document.getElementById('ward');

        // Reset danh sách xã
        wardSelect.innerHTML = '<option value="">Chọn Xã/Phường</option>';
        wardSelect.disabled = true;

//        if (province && district) {
//            const wards = data[province].districts[district];
//            for (let ward of wards) {
//                let option = document.createElement('option');
//                option.value = ward;
//                option.text = ward;
//                wardSelect.appendChild(option);
//            }
//            wardSelect.disabled = false;
//        }
        if (province && district) {
            const wards = data[province].districts[district];
            for (let ward of wards) {
                let option = document.createElement('option');
                option.value = ward;
                option.text = ward;
                wardSelect.appendChild(option);
            }
            wardSelect.disabled = false;
        } else {
            wardSelect.disabled = true;
        }
    }
</script>

<script>
    const userData = {
        province: "${requestScope.provinceUser}",
        district: "${requestScope.districtUser}",
        ward: "${requestScope.wardUser}"
    };

//    Khi trang tải, gọi hàm để chọn sẵn tỉnh / huyện / xã dựa vào dữ liệu người dùng
    document.addEventListener('DOMContentLoaded', function () {
        const provinceSelect = document.getElementById('province');
        const districtSelect = document.getElementById('district');
        const wardSelect = document.getElementById('ward');

        // Chọn tỉnh sẵn
        provinceSelect.value = userData.province;
        loadDistricts();
        // Sau khi huyện được tải, chọn sẵn huyện
        districtSelect.value = userData.district;
        loadWards();

        // Sau khi xã được tải, chọn sẵn xã
        wardSelect.value = userData.ward;
    });
</script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/datepicker.min.js"></script>
</body>
</html>
