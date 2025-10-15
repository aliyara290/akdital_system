<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors Management - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <% request.setAttribute("currentPage", "doctors"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto">
        <!-- Header -->
        <% request.setAttribute("pageTitle", "Doctors Management"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <!-- Action Bar -->
            <div class="flex justify-between items-center mb-6">
                <div class="flex gap-3">
                    <div class="relative">
                        <input type="text"
                               placeholder="Search doctors..."
                               class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                    </div>
                    <select class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                        <option>All Departments</option>
                        <option>Cardiology</option>
                        <option>Neurology</option>
                        <option>Pediatrics</option>
                        <option>Orthopedics</option>
                    </select>
                </div>
                <a href="<%= request.getContextPath() %>/admin/doctors/new"
                   class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors">
                    <i class="fas fa-plus mr-2"></i>Add New Doctor
                </a>
            </div>

            <!-- Doctors Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Doctor Card 1 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <div class="bg-gradient-to-r from-blue-500 to-blue-600 h-32 flex items-center justify-center">
                        <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center">
                            <i class="fas fa-user-md text-5xl text-blue-600"></i>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-800 mb-1">Dr. Smith Williams</h3>
                        <p class="text-blue-600 text-sm mb-3">
                            <i class="fas fa-stethoscope mr-1"></i>Cardiology Specialist
                        </p>
                        <div class="space-y-2 mb-4">
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-envelope text-gray-400 mr-2"></i>
                                smith.williams@hospital.com
                            </p>
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-building text-gray-400 mr-2"></i>
                                Cardiology Department
                            </p>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/doctors/view/1"
                               class="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-eye"></i> View
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/doctors/edit/1"
                               class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <button onclick="return confirm('Are you sure?')"
                                    class="px-4 bg-red-500 hover:bg-red-600 text-white rounded-lg transition-colors">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Doctor Card 2 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <div class="bg-gradient-to-r from-green-500 to-green-600 h-32 flex items-center justify-center">
                        <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center">
                            <i class="fas fa-user-md text-5xl text-green-600"></i>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-800 mb-1">Dr. Emily Davis</h3>
                        <p class="text-green-600 text-sm mb-3">
                            <i class="fas fa-stethoscope mr-1"></i>Neurology Specialist
                        </p>
                        <div class="space-y-2 mb-4">
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-envelope text-gray-400 mr-2"></i>
                                emily.davis@hospital.com
                            </p>
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-building text-gray-400 mr-2"></i>
                                Neurology Department
                            </p>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/doctors/view/2"
                               class="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-eye"></i> View
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/doctors/edit/2"
                               class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <button onclick="return confirm('Are you sure?')"
                                    class="px-4 bg-red-500 hover:bg-red-600 text-white rounded-lg transition-colors">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Doctor Card 3 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <div class="bg-gradient-to-r from-purple-500 to-purple-600 h-32 flex items-center justify-center">
                        <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center">
                            <i class="fas fa-user-md text-5xl text-purple-600"></i>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-800 mb-1">Dr. Sarah Martinez</h3>
                        <p class="text-purple-600 text-sm mb-3">
                            <i class="fas fa-stethoscope mr-1"></i>Pediatrics Specialist
                        </p>
                        <div class="space-y-2 mb-4">
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-envelope text-gray-400 mr-2"></i>
                                sarah.m@hospital.com
                            </p>
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-building text-gray-400 mr-2"></i>
                                Pediatrics Department
                            </p>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/doctors/view/3"
                               class="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-eye"></i> View
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/doctors/edit/3"
                               class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <button onclick="return confirm('Are you sure?')"
                                    class="px-4 bg-red-500 hover:bg-red-600 text-white rounded-lg transition-colors">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Doctor Card 4 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <div class="bg-gradient-to-r from-orange-500 to-orange-600 h-32 flex items-center justify-center">
                        <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center">
                            <i class="fas fa-user-md text-5xl text-orange-600"></i>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-800 mb-1">Dr. Michael Thompson</h3>
                        <p class="text-orange-600 text-sm mb-3">
                            <i class="fas fa-stethoscope mr-1"></i>Orthopedics Specialist
                        </p>
                        <div class="space-y-2 mb-4">
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-envelope text-gray-400 mr-2"></i>
                                m.thompson@hospital.com
                            </p>
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-building text-gray-400 mr-2"></i>
                                Orthopedics Department
                            </p>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/doctors/view/4"
                               class="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-eye"></i> View
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/doctors/edit/4"
                               class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white text-center py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <button onclick="return confirm('Are you sure?')"
                                    class="px-4 bg-red-500 hover:bg-red-600 text-white rounded-lg transition-colors">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>