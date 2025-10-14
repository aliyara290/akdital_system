<%@ page import="java.util.Optional" %>
<%@ page import="com.akdital.model.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String patientId = (String) request.getAttribute("patientId");
    Optional<Patient> patientOldData = (Optional<Patient>) request.getAttribute("patientOldData");
    boolean isEdit = patientId != null && !patientId.isEmpty();
    String formTitle = isEdit ? "Edit Patient" : "Add New Patient";
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
    <% request.setAttribute("currentPage", "patients"); %>
    <jsp:include page="../layout/sidebar.jsp"/>

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", formTitle); %>
        <jsp:include page="../layout/header.jsp"/>

        <div class="p-6">
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8">
                    <form action="<%= request.getContextPath() %>/admin/patients/" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "create" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="patientId" value="<%= patientId %>">
                        <% } %>

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
                                           name="first-name"
                                           value="<%= isEdit ? patientOldData.get().getFirstName() : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter first name">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Last Name <span class="text-red-500">*</span>
                                    </label>
                                    <input type="text"
                                           name="last-name"
                                           value="<%= isEdit ? patientOldData.get().getLastName() : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter last name">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Gender <span class="text-red-500">*</span>
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
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Phone <span class="text-red-500">*</span>
                                    </label>
                                    <input type="text"
                                           name="phone"
                                           value="<%= isEdit ? patientOldData.get().getPhone() : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter your phone">
                                </div>

                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Email <span class="text-red-500">*</span>
                                    </label>
                                    <input type="email"
                                           name="email"
                                           value="<%= isEdit ? patientOldData.get().getEmail() : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="example@email.com">
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

                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-heartbeat text-red-600 mr-2"></i>
                                Medical Information
                            </h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Height (cm) <span class="text-red-500">*</span>
                                    </label>
                                    <input type="number"
                                           name="height"
                                           value="<%= isEdit ? patientOldData.get().getHeight() : "" %>"
                                           step="0.1"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter height in cm">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Weight (kg) <span class="text-red-500">*</span>
                                    </label>
                                    <input type="number"
                                           name="weight"
                                           value="<%= isEdit ? patientOldData.get().getWeight() : "" %>"
                                           step="0.1"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                           placeholder="Enter weight in kg">
                                </div>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <button type="submit"
                                    class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors">
                                <i class="fas <%= isEdit ? "fa-save" : "fa-plus" %> mr-2"></i>
                                <%= isEdit ? "Update Patient" : "Create Patient" %>
                            </button>
                            <a href="<%= request.getContextPath() %>/admin/patients/"
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