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
    </head>
    <body class="font-sans">
        <header class="bg-gray-800 shadow-md">
            <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
                <div class="text-xl font-bold text-gray-800">
                    <img src="FondevJSLogo1.svg" alt="alt"/>
                </div>
                <div class="hidden md:flex space-x-4">
                    <a href="#" class="text-cyan-300 hover:text-white">Home</a>
                    <a href="listProduct" class="text-cyan-300 hover:text-white">Shop</a>
                    <a href="#" class="text-cyan-300 hover:text-white">About</a>
                    <a href="#" class="text-cyan-300 hover:text-white">Contact</a>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-search"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-shopping-cart"></i></a>
                    <a href="#" class="text-cyan-300 hover:text-white"><i class="fas fa-user"></i></a>

                </div>
                <button id="mobile-menu-button" class="md:hidden text-cyan-300">
                    <i class="fas fa-bars"></i>
                </button>
                <div id="mobile-menu" class="md:hidden hidden mt-4">
                    <a href="#" class="block py-2 text-cyan-300 hover:text-white">Home</a>
                    <a href="listProduct" class="block py-2 text-cyan-300 hover:text-white">Shop</a>
                    <a href="#" class="block py-2 text-cyan-300 hover:text-white">About</a>
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
    </body>
</html>
