<%@ page import="com.akdital.model.Patient" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Optional<Patient> patient = (Optional<Patient>) request.getAttribute("patient");
    if (patient == null || patient.isEmpty()) {
        patient = Optional.empty();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Patient - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "patients"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Patient Details"); %>
        <jsp:include page="../layout/header.jsp" />

        <% if(!patient.isEmpty() && patient.isPresent()){ %>
        <div class="p-6">
            <div class="max-w-6xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8 mb-6">
                    <div class="flex justify-between items-start mb-6">
                        <div class="flex items-center">
                            <div class="w-24 h-24 bg-blue-100 rounded-full flex items-center justify-center mr-6">
                                <i class="fas fa-user text-5xl text-blue-600"></i>
                            </div>
                            <div>
                                <h2 class="text-3xl font-bold text-gray-800"><%= patient.get().getFirstName() %> <%= patient.get().getFirstName() %></h2>
                                <p class="text-gray-600">Patient ID: <%= patient.get().getUserId().substring(0, 8) %></p>
<%--                                <span class="inline-block mt-2 px-3 py-1 bg-green-100 text-green-800 text-sm font-semibold rounded-full">--%>
<%--                                        Active--%>
<%--                                    </span>--%>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/patients/edit/<%= patient.get().getUserId() %>"
                               class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit mr-2"></i>Edit
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/patients/"
                               class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-arrow-left mr-2"></i>Back
                            </a>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Email</p>
                            <p class="text-gray-900 font-medium">
                                <i class="fas fa-envelope text-blue-600 mr-2"></i>
                                <%= patient.get().getEmail() %>
                            </p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Height</p>
                            <p class="text-gray-900 font-medium">
                                <i class="fas fa-ruler-vertical text-purple-600 mr-2"></i>
                                <%= patient.get().getHeight() %> cm
                            </p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Weight</p>
                            <p class="text-gray-900 font-medium">
                                <i class="fas fa-weight text-orange-600 mr-2"></i>
                                <%= patient.get().getWeight() %> kg
                            </p>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-lg p-8">
                    <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                        <i class="fas fa-history text-blue-600 mr-2"></i>
                        Consultation History
                    </h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Doctor</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Department</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    Oct 10, 2025
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    Dr. Smith Williams
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    Cardiology
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                                Completed
                                            </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <a href="#" class="text-blue-600 hover:text-blue-900">View Report</a>
                                </td>
                            </tr>
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    Sep 25, 2025
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    Dr. Emily Davis
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    General Medicine
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                                Completed
                                            </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <a href="#" class="text-blue-600 hover:text-blue-900">View Report</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="p-20 flex justify-center items-center">
            <div class="bg-white rounded-lg shadow-lg p-8 text-center">
                <i class="fas fa-exclamation-triangle text-5xl text-red-500 mb-4"></i>
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Patient Not Found</h2>
                <p class="text-gray-600 mb-4">The patient you are looking for does not exist.</p>
                <a href="<%= request.getContextPath() %>/admin/patients/"
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg transition-colors">
                    Back to Patients
                </a>
            </div>
        </div>
        <% } %>

    </main>
</div>
</body>
</html>