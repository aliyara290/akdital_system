<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Department" %>
<%@ page import="com.akdital.model.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors"); %>
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

            <% if (doctors != null && !doctors.isEmpty()) {%>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <% for(Doctor doctor : doctors ) {%>
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <div class="bg-gradient-to-r from-blue-500 to-blue-600 h-32 flex items-center justify-center">
                        <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center">
                            <i class="fas fa-user-md text-5xl text-blue-600"></i>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-800 mb-1">Dr. <%= doctor.getFirstName()%> <%= doctor.getLastName()%></h3>
                        <p class="text-blue-600 text-sm mb-3">
                            <i class="fas fa-stethoscope mr-1"></i><%= doctor.getSpeciality()%> Specialist
                        </p>
                        <div class="space-y-2 mb-4">
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-envelope text-gray-400 mr-2"></i>
                                <%= doctor.getEmail()%>
                            </p>
                            <p class="text-sm text-gray-600">
                                <i class="fas fa-building text-gray-400 mr-2"></i>
                                <%= doctor.getDepartment().getName()%>  Department
                            </p>
                        </div>

                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/doctors/view/<%= doctor.getUserId()%>"
                               class="flex-1 bg-blue-50 hover:bg-blue-100 text-blue-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                <i class="fas fa-eye mr-1"></i>View
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/doctors/edit/<%= doctor.getUserId()%>"
                               class="flex-1 bg-green-50 hover:bg-green-100 text-green-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                <i class="fas fa-edit mr-1"></i>Edit
                            </a>
                            <button onclick="confirmDelete('<%= doctor.getUserId()%>', '<%= doctor.getFirstName()%> <%= doctor.getLastName()%>')"
                                    class="flex-1 bg-red-50 hover:bg-red-100 text-red-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                <i class="fas fa-trash mr-1"></i>Delete
                            </button>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <% } else {
            %>
            <div class="col-span-full bg-white rounded-lg shadow-lg p-12 text-center">
                <i class="fas fa-door-closed text-6xl text-gray-300 mb-4"></i>
                <h3 class="text-xl font-bold text-gray-800 mb-2">No Doctors Found!</h3>
                <a href="<%= request.getContextPath() %>/admin/doctors/new"
                   class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors">
                    <i class="fas fa-plus mr-2"></i>Add New Doctor
                </a>
            </div>
            <%} %>
        </div>
    </main>
</div>
<div class="deleteModal hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-8 max-w-md w-full mx-4">
        <div class="text-center">
            <div class="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <i class="fas fa-exclamation-triangle text-red-600 text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Delete Doctor</h3>
            <p class="text-gray-600 mb-6">
                Are you sure you want to delete <strong class="doctorName"></strong>?
                This action cannot be undone.
            </p>
            <div class="flex gap-4">
                <button onclick="closeDeleteModal()"
                        class="flex-1 bg-gray-200 hover:bg-gray-300 text-gray-800 px-6 py-2 rounded-lg transition-colors">
                    Cancel
                </button>
                <button onclick="deleteDepartment()"
                        class="flex-1 bg-red-600 hover:bg-red-700 text-white px-6 py-2 rounded-lg transition-colors">
                    Delete
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    let departmentToDelete = null;

    function confirmDelete(id, name) {
        departmentToDelete = id;
        document.querySelector('.doctorName').textContent = name;
        document.querySelector('.deleteModal').classList.remove('hidden');
    }

    function closeDeleteModal() {
        document.querySelector('.deleteModal').classList.add('hidden');
        departmentToDelete = null;
    }

    function deleteDepartment() {
        if (departmentToDelete) {
            window.location.href = '<%= request.getContextPath() %>/admin/doctors/delete/' + departmentToDelete;
        }
    }

    document.querySelector('.deleteModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeDeleteModal();
        }
    });
</script>
</body>
</html>