<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% List<Patient> patients = (List<Patient>) request.getAttribute("patients"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patients Management - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <% request.setAttribute("currentPage", "patients"); %>
    <jsp:include page="../layout/sidebar.jsp"/>

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto">
        <!-- Header -->
        <% request.setAttribute("pageTitle", "Patients Management"); %>
        <jsp:include page="../layout/header.jsp"/>

        <div class="p-6">
            <!-- Action Bar -->
            <div class="flex justify-between items-center mb-6">
                <div class="flex gap-3">
                    <div class="relative">
                        <input type="text"
                               placeholder="Search patients..."
                               class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                    </div>

                </div>
                <a href="<%= request.getContextPath() %>/admin/patients/new"
                   class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors">
                    <i class="fas fa-plus mr-2"></i>Add New Patient
                </a>
            </div>

            <!-- Success/Error Messages -->
            <% String success = request.getParameter("success"); %>
            <% if (success != null) { %>
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6 rounded">
                <p class="font-bold">Success!</p>
                <p>Patient <%= success %> successfully.</p>
            </div>
            <% } %>

            <!-- Patients Table -->
            <% if (patients != null && !patients.isEmpty()) {%>
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Patient Name
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Email
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Height (cm)
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Weight (kg)
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Status
                        </th>
<%--                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">--%>
<%--                            Actions--%>
<%--                        </th>--%>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Static Data - Replace with dynamic data later -->

                    <% for (Patient patient : patients) {
                    %>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="text-sm font-mono text-gray-600"><%= patient.getUserId().substring(0, 8)%></span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center">
                                        <i class="fas fa-user text-blue-600"></i>
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900"><%= patient.getFirstName()%> <%= patient.getLastName()%>
                                    </div>
                                    <div class="text-sm text-gray-500"><%= patient.getGender().toString().toLowerCase()%>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="text-sm text-gray-900"><%= patient.getEmail()%></span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= patient.getHeight()%>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= patient.getWeight()%>
                        </td>
                        <%--                        <td class="px-6 py-4 whitespace-nowrap">--%>
                        <%--                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">--%>
                        <%--                                        Active--%>
                        <%--                                    </span>--%>
                        <%--                        </td>--%>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <a href="<%= request.getContextPath() %>/admin/patients/view/<%= patient.getUserId()%>"
                               class="text-blue-600 hover:text-blue-900 mr-3" title="View">
                                <i class="fas fa-eye"></i>
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/patients/edit/<%= patient.getUserId()%>"
                               class="text-yellow-600 hover:text-yellow-900 mr-3" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/patients/delete/<%= patient.getUserId()%>"
                               onclick="return confirm('Are you sure?')"
                               class="text-red-600 hover:text-red-900" title="Delete">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%} %>
                    </tbody>
                </table>

            </div>

            <!-- Pagination -->
            <div class="flex justify-between items-center mt-6">
                <div class="text-sm text-gray-700">
                    Showing <span class="font-medium">1</span> to <span class="font-medium">3</span> of <span
                        class="font-medium">245</span> results
                </div>
                <div class="flex gap-2">
                    <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50"
                            disabled>
                        Previous
                    </button>
                    <button class="px-4 py-2 bg-blue-600 text-white rounded-lg">1</button>
                    <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">2</button>
                    <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">3</button>
                    <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50">
                        Next
                    </button>
                </div>
            </div>
            <% } else {
            %>
            <div class="col-span-full bg-white rounded-lg shadow-lg p-12 text-center">
                <i class="fas fa-door-closed text-6xl text-gray-300 mb-4"></i>
                <h3 class="text-xl font-bold text-gray-800 mb-2">No Patients Found!</h3>
                <p class="text-gray-600 mb-4">Create new patient!</p>
                <a href="<%= request.getContextPath() %>/admin/patients/new"
                   class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors">
                    <i class="fas fa-plus mr-2"></i>Add New Patient
                </a>
            </div>
            <%} %>
        </div>
    </main>
</div>
</body>
</html>