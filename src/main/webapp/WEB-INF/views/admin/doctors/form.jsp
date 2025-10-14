<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String doctorId = request.getParameter("id");
    boolean isEdit = doctorId != null && !doctorId.isEmpty();
    String formTitle = isEdit ? "Edit Doctor" : "Add New Doctor";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= formTitle %> - Akidital System</title>
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
        <% request.setAttribute("pageTitle", formTitle); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8">
                    <form action="<%= request.getContextPath() %>/admin/doctors/" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "create" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="doctorId" value="<%= doctorId %>">
                        <% } %>

                        <!-- Personal Information -->
                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-user-circle text-blue-600 mr-2"></i>
                                Personal Information
                            </h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        First Name <span class="text-red-500">*</span>
                                    </label>
                                    <input type="text"
                                           name="firstName"
                                           value="<%= isEdit ? "Smith" : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter first name">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Last Name <span class="text-red-500">*</span>
                                    </label>
                                    <input type="text"
                                           name="lastName"
                                           value="<%= isEdit ? "Williams" : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter last name">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Email <span class="text-red-500">*</span>
                                    </label>
                                    <input type="email"
                                           name="email"
                                           value="<%= isEdit ? "smith.williams@hospital.com" : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="example@hospital.com">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Password <%= isEdit ? "" : "<span class='text-red-500'>*</span>" %>
                                    </label>
                                    <input type="password"
                                           name="password"
                                        <%= isEdit ? "" : "required" %>
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="<%= isEdit ? "Leave blank to keep current" : "Enter password" %>">
                                </div>
                            </div>
                        </div>

                        <!-- Professional Information -->
                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-briefcase text-green-600 mr-2"></i>
                                Professional Information
                            </h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Speciality <span class="text-red-500">*</span>
                                    </label>
                                    <input type="text"
                                           name="speciality"
                                           value="<%= isEdit ? "Cardiology Specialist" : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="e.g., Cardiology Specialist">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Department <span class="text-red-500">*</span>
                                    </label>
                                    <select name="departmentId"
                                            required
                                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                        <option value="">Select Department</option>
                                        <option value="dept-1" <%= isEdit ? "selected" : "" %>>Cardiology</option>
                                        <option value="dept-2">Neurology</option>
                                        <option value="dept-3">Pediatrics</option>
                                        <option value="dept-4">Orthopedics</option>
                                        <option value="dept-5">General Medicine</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Form Actions -->
                        <div class="flex gap-4">
                            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors">
                                <i class="fas <%= isEdit ? "fa-save" : "fa-plus" %> mr-2"></i>
                                <%= isEdit ? "Update Doctor" : "Create Doctor" %>
                            </button>
                            <a href="<%= request.getContextPath() %>/admin/doctors/"
                               class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-8 py-3 rounded-lg transition-colors">
                                <i class="fas fa-times mr-2"></i>Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>