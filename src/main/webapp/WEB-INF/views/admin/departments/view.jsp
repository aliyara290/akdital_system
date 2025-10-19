<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ page import="com.akdital.model.Department" %>
<%@ page import="java.util.Optional" %>
<%
    Optional<Department> department = (Optional<Department>) request.getAttribute("department");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Department - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "departments"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Department Details"); %>
        <jsp:include page="../layout/header.jsp" />

        <% if (department != null && department.isPresent()) { %>
        <div class="p-6">
            <div class="max-w-6xl mx-auto">
                <div class="bg-gradient-to-r from-blue-500 to-blue-600 rounded-lg shadow-lg p-8 text-white mb-6">
                    <div class="flex justify-between items-start">
                        <div class="flex items-center">
                            <div class="w-24 h-24 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-6">
                                <i class="fas fa-heartbeat text-5xl"></i>
                            </div>
                            <div>
                                <h2 class="text-4xl font-bold mb-2"><%= department.get().getName() %></h2>
                                <p class="text-blue-100"><%= department.get().getDescription() %></p>
                                <span class="inline-block mt-2 bg-white bg-opacity-20 px-3 py-1 rounded-full text-sm">
                                    Department ID: #<%= department.get().getDepartmentId().substring(0, 8) %>
                                </span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/departments/edit/<%= department.get().getDepartmentId() %>"
                               class="bg-white bg-opacity-20 hover:bg-opacity-30 text-white px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit mr-2"></i>Edit
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/departments/"
                               class="bg-white bg-opacity-20 hover:bg-opacity-30 text-white px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-arrow-left mr-2"></i>Back
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Statistics -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">Total Doctors</p>
                            <i class="fas fa-user-md text-blue-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">0</h4>
                        <p class="text-sm text-green-600 mt-1">
                            <i class="fas fa-arrow-up"></i> 2 new this month
                        </p>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">Total Patients</p>
                            <i class="fas fa-users text-green-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">0</h4>
                        <p class="text-sm text-green-600 mt-1">
                            <i class="fas fa-arrow-up"></i> 15% growth
                        </p>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">Available Rooms</p>
                            <i class="fas fa-door-open text-purple-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">8</h4>
                        <p class="text-sm text-blue-600 mt-1">
                            5 occupied now
                        </p>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">This Month</p>
                            <i class="fas fa-calendar-check text-orange-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">127</h4>
                        <p class="text-sm text-gray-600 mt-1">
                            Consultations
                        </p>
                    </div>
                </div>

                <!-- Doctors List -->
                <div class="bg-white rounded-lg shadow-lg p-8 mb-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                        <i class="fas fa-user-md text-blue-600 mr-2"></i>
                        Department Doctors
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="flex items-center p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                            <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mr-4">
                                <i class="fas fa-user-md text-blue-600"></i>
                            </div>
                            <div>
                                <p class="font-medium text-gray-800">Dr. James Anderson</p>
                                <p class="text-sm text-gray-600">Heart Surgeon</p>
                            </div>
                        </div>
                        <div class="flex items-center p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                            <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mr-4">
                                <i class="fas fa-user-md text-blue-600"></i>
                            </div>
                            <div>
                                <p class="font-medium text-gray-800">Dr. Lisa Thompson</p>
                                <p class="text-sm text-gray-600">Interventional Cardiologist</p>
                            </div>
                        </div>
                        <div class="flex items-center p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                            <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mr-4">
                                <i class="fas fa-user-md text-blue-600"></i>
                            </div>
                            <div>
                                <p class="font-medium text-gray-800">Dr. Robert Chen</p>
                                <p class="text-sm text-gray-600">Electrophysiologist</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="p-20 flex justify-center items-center">
            <div class="bg-white rounded-lg shadow-lg p-8 text-center">
                <i class="fas fa-exclamation-triangle text-5xl text-red-500 mb-4"></i>
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Department Not Found</h2>
                <p class="text-gray-600 mb-4">The department you are looking for does not exist.</p>
                <a href="<%= request.getContextPath() %>/admin/departments/"
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg transition-colors">
                    Back to Departments
                </a>
            </div>
        </div>
        <% } %>
    </main>
</div>
</body>
</html>
