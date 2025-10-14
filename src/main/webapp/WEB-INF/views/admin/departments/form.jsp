<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String departmentId = request.getParameter("id");
    boolean isEdit = departmentId != null && !departmentId.isEmpty();
    String formTitle = isEdit ? "Edit Department" : "Add New Department";
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
    <% request.setAttribute("currentPage", "departments"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto">
        <!-- Header -->
        <% request.setAttribute("pageTitle", formTitle); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div class="max-w-2xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8">
                    <form action="<%= request.getContextPath() %>/admin/departments/" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "create" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="departmentId" value="<%= departmentId %>">
                        <% } %>

                        <!-- Department Information -->
                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-building text-blue-600 mr-2"></i>
                                Department Information
                            </h3>

                            <div class="mb-6">
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Department Name <span class="text-red-500">*</span>
                                </label>
                                <input type="text"
                                       name="name"
                                       value="<%= isEdit ? "Cardiology" : "" %>"
                                       required
                                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                       placeholder="e.g., Cardiology, Neurology, Pediatrics">
                                <p class="mt-2 text-sm text-gray-600">
                                    <i class="fas fa-info-circle"></i>
                                    Enter the name of the medical department.
                                </p>
                            </div>

                            <div class="mb-6">
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Description
                                </label>
                                <textarea name="description"
                                          rows="4"
                                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                          placeholder="Brief description of the department's services and specialties"><%= isEdit ? "Specialized in heart and vascular care" : "" %></textarea>
                            </div>

                            <% if (isEdit) { %>
                            <div class="mb-6">
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Department ID
                                </label>
                                <input type="text"
                                       value="<%= departmentId %>"
                                       disabled
                                       class="w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-lg text-gray-600 cursor-not-allowed">
                            </div>
                            <% } %>
                        </div>

                        <!-- Form Actions -->
                        <div class="flex gap-4">
                            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors">
                                <i class="fas <%= isEdit ? "fa-save" : "fa-plus" %> mr-2"></i>
                                <%= isEdit ? "Update Department" : "Create Department" %>
                            </button>
                            <a href="<%= request.getContextPath() %>/admin/departments/"
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