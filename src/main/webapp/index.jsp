<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Akdital - Healthcare Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
<!-- Header -->
<header class="bg-white shadow-md">
    <div class="container mx-auto px-6 py-4">
        <div class="flex justify-between items-center">
            <div class="flex items-center">
                <i class="fas fa-hospital text-4xl text-blue-600 mr-3"></i>
                <h1 class="text-2xl font-bold text-gray-800">Akdital</h1>
            </div>
            <nav>
                <a href="<%= request.getContextPath() %>/login"
                   class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors font-semibold">
                    <i class="fas fa-sign-in-alt mr-2"></i>Login
                </a>
                <a href="<%= request.getContextPath() %>/register"
                   class="ml-3 bg-white border-2 border-blue-600 text-blue-600 hover:bg-blue-50 px-6 py-2 rounded-lg transition-colors font-semibold">
                    <i class="fas fa-user-plus mr-2"></i>Register
                </a>
            </nav>
        </div>
    </div>
</header>

<!-- Hero Section -->
<section class="container mx-auto px-6 py-20">
    <div class="text-center">
        <h2 class="text-5xl font-bold text-gray-800 mb-6">
            Welcome to Akdital Healthcare System
        </h2>
        <p class="text-xl text-gray-600 mb-10 max-w-3xl mx-auto">
            Modern healthcare management platform for seamless patient care,
            appointment scheduling, and medical record management.
        </p>
        <div class="flex justify-center gap-4">
            <a href="<%= request.getContextPath() %>/register"
               class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-lg text-lg font-semibold shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all">
                Get Started <i class="fas fa-arrow-right ml-2"></i>
            </a>
            <a href="<%= request.getContextPath() %>/login"
               class="bg-white hover:bg-gray-50 text-blue-600 px-8 py-4 rounded-lg text-lg font-semibold shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all">
                Sign In <i class="fas fa-sign-in-alt ml-2"></i>
            </a>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="container mx-auto px-6 py-16">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <!-- Feature 1 -->
        <div class="bg-white rounded-2xl shadow-lg p-8 hover:shadow-xl transition-shadow">
            <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-6">
                <i class="fas fa-calendar-check text-3xl text-blue-600"></i>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4">Easy Appointment Booking</h3>
            <p class="text-gray-600">
                Schedule consultations with your preferred doctors quickly and efficiently.
                View available time slots and book instantly.
            </p>
        </div>

        <!-- Feature 2 -->
        <div class="bg-white rounded-2xl shadow-lg p-8 hover:shadow-xl transition-shadow">
            <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-6">
                <i class="fas fa-user-md text-3xl text-green-600"></i>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4">Expert Medical Staff</h3>
            <p class="text-gray-600">
                Access to qualified doctors across multiple specialties.
                Browse by department and find the right specialist for your needs.
            </p>
        </div>

        <!-- Feature 3 -->
        <div class="bg-white rounded-2xl shadow-lg p-8 hover:shadow-xl transition-shadow">
            <div class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center mb-6">
                <i class="fas fa-file-medical text-3xl text-purple-600"></i>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4">Digital Medical Records</h3>
            <p class="text-gray-600">
                Access your medical history, consultation reports, and treatment plans
                securely from anywhere at any time.
            </p>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section class="container mx-auto px-6 py-16">
    <h2 class="text-4xl font-bold text-center text-gray-800 mb-12">How It Works</h2>
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div class="text-center">
            <div class="w-20 h-20 bg-blue-600 text-white rounded-full flex items-center justify-center text-2xl font-bold mx-auto mb-4">1</div>
            <h4 class="font-bold text-lg mb-2">Register</h4>
            <p class="text-gray-600">Create your account in minutes</p>
        </div>
        <div class="text-center">
            <div class="w-20 h-20 bg-blue-600 text-white rounded-full flex items-center justify-center text-2xl font-bold mx-auto mb-4">2</div>
            <h4 class="font-bold text-lg mb-2">Choose Doctor</h4>
            <p class="text-gray-600">Select from available specialists</p>
        </div>
        <div class="text-center">
            <div class="w-20 h-20 bg-blue-600 text-white rounded-full flex items-center justify-center text-2xl font-bold mx-auto mb-4">3</div>
            <h4 class="font-bold text-lg mb-2">Book Appointment</h4>
            <p class="text-gray-600">Pick your preferred time slot</p>
        </div>
        <div class="text-center">
            <div class="w-20 h-20 bg-blue-600 text-white rounded-full flex items-center justify-center text-2xl font-bold mx-auto mb-4">4</div>
            <h4 class="font-bold text-lg mb-2">Get Care</h4>
            <p class="text-gray-600">Attend your consultation</p>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="container mx-auto px-6 py-16">
    <div class="bg-gradient-to-r from-blue-600 to-purple-600 rounded-3xl shadow-2xl p-12 text-center text-white">
        <h2 class="text-4xl font-bold mb-4">Ready to Get Started?</h2>
        <p class="text-xl mb-8 opacity-90">Join thousands of patients managing their healthcare journey with Akdital</p>
        <a href="<%= request.getContextPath() %>/register"
           class="bg-white text-blue-600 hover:bg-gray-100 px-10 py-4 rounded-lg text-lg font-semibold shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all inline-block">
            Create Free Account <i class="fas fa-arrow-right ml-2"></i>
        </a>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-8 mt-20">
    <div class="container mx-auto px-6 text-center">
        <div class="flex justify-center items-center mb-4">
            <i class="fas fa-hospital text-3xl text-blue-400 mr-3"></i>
            <h3 class="text-2xl font-bold">Akdital</h3>
        </div>
        <p class="text-gray-400 mb-4">Modern Healthcare Management System</p>
        <p class="text-gray-500 text-sm">© 2025 Akdital. All rights reserved.</p>
    </div>
</footer>
</body>
</html>