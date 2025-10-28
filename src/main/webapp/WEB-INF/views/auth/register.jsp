<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Akdital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen flex items-center justify-center">
<div class="w-full grid grid-cols-1 md:grid-cols-2 items-center">
    <div class="bg-white h-max rounded-2xl shadow-2xl p-8 mx-6">
        <!-- Error Message -->
        <c:if test="${error != null}">
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded">
                <p class="font-bold">Error!</p>
                <p class="text-sm">${error}</p>
            </div>
        </c:if>

        <form action="<%= request.getContextPath() %>/register" method="POST">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- First Name -->
                <div>
                    <label for="firstName" class="block text-gray-700 font-semibold mb-2">
                        <i class="fas fa-user text-blue-600 mr-2"></i>First Name
                    </label>
                    <input type="text"
                           id="firstName"
                           name="firstName"
                           required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                           placeholder="John">
                </div>

                <!-- Last Name -->
                <div>
                    <label for="lastName" class="block text-gray-700 font-semibold mb-2">
                        <i class="fas fa-user text-blue-600 mr-2"></i>Last Name
                    </label>
                    <input type="text"
                           id="lastName"
                           name="lastName"
                           required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                           placeholder="Doe">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="mt-6">
                    <label for="email" class="block text-gray-700 font-semibold mb-2">
                        Email Address
                    </label>
                    <input type="email"
                           id="email"
                           name="email"
                           required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                           placeholder="john.doe@example.com">
                </div>

                <!-- Phone Number -->
                <div class="mt-6">
                    <label for="phone" class="block text-gray-700 font-semibold mb-2">
                        Phone Number
                    </label>
                    <input type="tel"
                           id="phone"
                           name="phone"
                           required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                           placeholder="+212 6XX-XXXXXX">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="mt-6">
                    <label for="height" class="block text-gray-700 font-semibold mb-2">
                        Height (cm)
                    </label>
                    <input type="number"
                           id="height"
                           name="height"
                           required
                           min="50"
                           max="250"
                           step="0.1"
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                           placeholder="175"/>
                </div>

                <div class="mt-6">
                    <label for="weight" class="block text-gray-700 font-semibold mb-2">
                        Weight (kg)
                    </label>
                    <input type="number"
                           id="weight"
                           name="weight"
                           required
                           min="20"
                           max="300"
                           step="0.1"
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                           placeholder="70"/>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                <!-- Password -->
                <div>
                    <label for="password" class="block text-gray-700 font-semibold mb-2">
                        <i class="fas fa-lock text-blue-600 mr-2"></i>Password
                    </label>
                    <div class="relative">
                        <input type="password"
                               id="password"
                               name="password"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                               placeholder="••••••••">
                        <button type="button"
                                onclick="togglePassword('password', 'toggleIcon1')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-gray-700">
                            <i class="fas fa-eye" id="toggleIcon1"></i>
                        </button>
                    </div>
                </div>

                <!-- Confirm Password -->
                <div>
                    <label for="confirmPassword" class="block text-gray-700 font-semibold mb-2">
                        <i class="fas fa-lock text-blue-600 mr-2"></i>Confirm Password
                    </label>
                    <div class="relative">
                        <input type="password"
                               id="confirmPassword"
                               name="confirmPassword"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                               placeholder="••••••••">
                        <button type="button"
                                onclick="togglePassword('confirmPassword', 'toggleIcon2')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-gray-700">
                            <i class="fas fa-eye" id="toggleIcon2"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Gender -->
            <div class="mt-6">
                <label class="block text-gray-700 font-semibold mb-2">
                    Gender
                </label>
                <div class="flex gap-6">
                    <label class="flex items-center">
                        <input type="radio" name="gender" value="MALE" required
                               class="w-4 h-4 text-blue-600 border-gray-300 focus:ring-blue-500">
                        <span class="ml-2 text-gray-700">Male</span>
                    </label>
                    <label class="flex items-center">
                        <input type="radio" name="gender" value="FEMALE" required
                               class="w-4 h-4 text-blue-600 border-gray-300 focus:ring-blue-500">
                        <span class="ml-2 text-gray-700">Female</span>
                    </label>
                </div>
            </div>

            <!-- Register Button -->
            <button type="submit"
                    class="w-full mt-6 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-lg transition-colors shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                <i class="fas fa-user-plus mr-2"></i>Create Account
            </button>
        </form>

        <!-- Sign In Link -->
        <div class="text-center pt-4">
            <p class="text-gray-600">
                Already have an account?
                <a href="<%= request.getContextPath() %>/login" class="text-blue-600 hover:text-blue-700 font-semibold">
                    Sign in
                </a>
            </p>
        </div>
    </div>

    <div class="text-center mb-8 h-screen w-full flex items-center justify-center bg-white p-10">
        <a href="<%= request.getContextPath() %>/" class="inline-block">
            <i class="fas fa-hospital text-6xl text-blue-600 mb-4"></i>
            <h1 class="text-3xl font-bold text-gray-800">Akdital System</h1>
            <p class="text-gray-600 mt-2">Create your account</p>
        </a>
    </div>
</div>

<script>
    function togglePassword(inputId, iconId) {
        const passwordInput = document.getElementById(inputId);
        const toggleIcon = document.getElementById(iconId);

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }

    document.querySelector('form').addEventListener('submit', function (e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            alert('Passwords do not match!');
        }
    });
</script>
</body>