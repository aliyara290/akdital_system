<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Departments - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <% request.setAttribute("currentPage", "departments"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto">
        <!-- Header -->
        <% request.setAttribute("pageTitle", "Departments"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div >
                <!-- Page Header -->
                <div class="flex justify-end items-center mb-6">

                    <a href="<%= request.getContextPath() %>/admin/departments/new"
                       class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg transition-colors flex items-center">
                        <i class="fas fa-plus mr-2"></i>Add New Department
                    </a>
                </div>

                <!-- Statistics -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-600 text-sm">Total Departments</p>
                                <h3 class="text-3xl font-bold text-gray-800 mt-2">3</h3>
                            </div>
                            <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                                <i class="fas fa-hospital text-blue-600 text-xl"></i>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-600 text-sm">Available Rooms</p>
                                <h3 class="text-3xl font-bold text-gray-800 mt-2">23</h3>
                            </div>
                            <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center">
                                <i class="fas fa-door-open text-orange-600 text-xl"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Departments Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Department 1: Cardiology -->
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                        <div class="bg-gradient-to-r from-blue-500 to-blue-600 p-6 text-white">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-16 h-16 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                                    <i class="fas fa-heartbeat text-3xl"></i>
                                </div>
                                <span class="bg-white bg-opacity-20 px-3 py-1 rounded-full text-xs">
                                    #DEPT001
                                </span>
                            </div>
                            <h3 class="text-2xl font-bold">Cardiology</h3>
                            <p class="text-blue-100 text-sm mt-1">Heart & Vascular Care</p>
                        </div>
                        <div class="p-6">
                            <div class="space-y-3 mb-6">
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-user-md text-blue-600 mr-2"></i>
                                        Doctors
                                    </span>
                                    <span class="font-semibold text-gray-800">18</span>
                                </div>
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-users text-green-600 mr-2"></i>
                                        Patients
                                    </span>
                                    <span class="font-semibold text-gray-800">245</span>
                                </div>
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-door-open text-purple-600 mr-2"></i>
                                        Rooms
                                    </span>
                                    <span class="font-semibold text-gray-800">8</span>
                                </div>
                            </div>
                            <div class="flex gap-2">
                                <a href="<%= request.getContextPath() %>/admin/departments/view/1"
                                   class="flex-1 bg-blue-50 hover:bg-blue-100 text-blue-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                    <i class="fas fa-eye mr-1"></i>View
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/departments/edit/1"
                                   class="flex-1 bg-green-50 hover:bg-green-100 text-green-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                    <i class="fas fa-edit mr-1"></i>Edit
                                </a>
                                <button onclick="confirmDelete(1, 'Cardiology')"
                                        class="flex-1 bg-red-50 hover:bg-red-100 text-red-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                    <i class="fas fa-trash mr-1"></i>Delete
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Department 2: Neurology -->
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                        <div class="bg-gradient-to-r from-purple-500 to-purple-600 p-6 text-white">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-16 h-16 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                                    <i class="fas fa-brain text-3xl"></i>
                                </div>
                                <span class="bg-white bg-opacity-20 px-3 py-1 rounded-full text-xs">
                                    #DEPT002
                                </span>
                            </div>
                            <h3 class="text-2xl font-bold">Neurology</h3>
                            <p class="text-purple-100 text-sm mt-1">Brain & Nervous System</p>
                        </div>
                        <div class="p-6">
                            <div class="space-y-3 mb-6">
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-user-md text-purple-600 mr-2"></i>
                                        Doctors
                                    </span>
                                    <span class="font-semibold text-gray-800">12</span>
                                </div>
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-users text-green-600 mr-2"></i>
                                        Patients
                                    </span>
                                    <span class="font-semibold text-gray-800">178</span>
                                </div>
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-door-open text-purple-600 mr-2"></i>
                                        Rooms
                                    </span>
                                    <span class="font-semibold text-gray-800">6</span>
                                </div>
                            </div>
                            <div class="flex gap-2">
                                <a href="<%= request.getContextPath() %>/admin/departments/view/2"
                                   class="flex-1 bg-blue-50 hover:bg-blue-100 text-blue-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                    <i class="fas fa-eye mr-1"></i>View
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/departments/edit/2"
                                   class="flex-1 bg-green-50 hover:bg-green-100 text-green-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                    <i class="fas fa-edit mr-1"></i>Edit
                                </a>
                                <button onclick="confirmDelete(2, 'Neurology')"
                                        class="flex-1 bg-red-50 hover:bg-red-100 text-red-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                    <i class="fas fa-trash mr-1"></i>Delete
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Department 3: Pediatrics -->
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                        <div class="bg-gradient-to-r from-pink-500 to-pink-600 p-6 text-white">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-16 h-16 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                                    <i class="fas fa-baby text-3xl"></i>
                                </div>
                                <span class="bg-white bg-opacity-20 px-3 py-1 rounded-full text-xs">
                                    #DEPT003
                                </span>
                            </div>
                            <h3 class="text-2xl font-bold">Pediatrics</h3>
                            <p class="text-pink-100 text-sm mt-1">Children's Healthcare</p>
                        </div>
                        <div class="p-6">
                            <div class="space-y-3 mb-6">
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-user-md text-pink-600 mr-2"></i>
                                        Doctors
                                    </span>
                                    <span class="font-semibold text-gray-800">12</span>
                                </div>
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-users text-green-600 mr-2"></i>
                                        Patients
                                    </span>
                                    <span class="font-semibold text-gray-800">145</span>
                                </div>
                                <div class="flex items-center justify-between text-sm">
                                    <span class="text-gray-600 flex items-center">
                                        <i class="fas fa-door-open text-purple-600 mr-2"></i>
                                        Rooms
                                    </span>
                                    <span class="font-semibold text-gray-800">9</span>
                                </div>
                            </div>
                            <div class="flex gap-2">
                                <a href="<%= request.getContextPath() %>/admin/departments/view/3"
                                   class="flex-1 bg-blue-50 hover:bg-blue-100 text-blue-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                    <i class="fas fa-eye mr-1"></i>View
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/departments/edit/3"
                                   class="flex-1 bg-green-50 hover:bg-green-100 text-green-600 px-4 py-2 rounded-lg text-center transition-colors text-sm font-medium">
                                    <i class="fas fa-edit mr-1"></i>Edit
                                </a>
                                <button onclick="confirmDelete(3, 'Pediatrics')"
                                        class="flex-1 bg-red-50 hover:bg-red-100 text-red-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                    <i class="fas fa-trash mr-1"></i>Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-8 max-w-md w-full mx-4">
        <div class="text-center">
            <div class="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <i class="fas fa-exclamation-triangle text-red-600 text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Delete Department</h3>
            <p class="text-gray-600 mb-6">
                Are you sure you want to delete <strong id="departmentName"></strong>?
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
        document.getElementById('departmentName').textContent = name;
        document.getElementById('deleteModal').classList.remove('hidden');
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.add('hidden');
        departmentToDelete = null;
    }

    function deleteDepartment() {
        if (departmentToDelete) {
            // Here you would make an AJAX call to delete the department
            // For now, we'll just redirect to the delete endpoint
            window.location.href = '<%= request.getContextPath() %>/admin/departments/delete/' + departmentToDelete;
        }
    }

    // Close modal when clicking outside
    document.getElementById('deleteModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeDeleteModal();
        }
    });
</script>
</body>
</html>