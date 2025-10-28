<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Consultation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Consultation> consultations = (List<Consultation>) request.getAttribute("consultations"); %>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<html>
<head>
    <title>My Consultations - Doctor Portal</title>
</head>
<body>
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto bg-gray-50">
        <!-- Header -->
        <% request.setAttribute("pageTitle", "My Consultations"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <!-- Success/Error Messages -->
            <% String success = request.getParameter("success"); %>
            <% if (success != null) { %>
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6 rounded-lg shadow-sm">
                <p class="font-bold">Success!</p>
                <p>Consultation <%= success %> successfully.</p>
            </div>
            <% } %>

            <% String error = request.getParameter("error"); %>
            <% if (error != null) { %>
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded-lg shadow-sm">
                <p class="font-bold">Error!</p>
                <p><%= error %></p>
            </div>
            <% } %>

            <!-- Consultations Table -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b-2 border-gray-200">
                        <tr>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">ID</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Patient</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Date</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Time</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Report</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Actions</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                        <% if (consultations != null && !consultations.isEmpty()) {
                            for (Consultation consultation : consultations) {
                        %>
                        <tr class="hover:bg-gray-50 transition-colors">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 font-mono">
                                #<%= consultation.getConsultationId().substring(0, 8) %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="w-10 h-10 bg-gradient-to-br from-blue-400 to-blue-600 rounded-full flex items-center justify-center mr-3">
                                        <i class="fas fa-user text-white"></i>
                                    </div>
                                    <div>
                                        <div class="text-sm font-medium text-gray-900">
                                            <%= consultation.getPatient().getFirstName() %> <%= consultation.getPatient().getLastName() %>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                <%= consultation.getDate() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                <%= consultation.getTime() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <%
                                    String statusClass = "";
                                    String status = consultation.getConsultationStatus().name();
                                    if (status.equals("RESERVED") || status.equals("VALIDATED")) {
                                        statusClass = "bg-yellow-100 text-yellow-800";
                                    } else if (status.equals("COMPLETED")) {
                                        statusClass = "bg-green-100 text-green-800";
                                    } else if (status.equals("CANCELLED")) {
                                        statusClass = "bg-red-100 text-red-800";
                                    }
                                %>
                                <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full <%= statusClass %>">
                                            <%= status %>
                                        </span>
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-700">
                                <% if (consultation.getRaport() != null && !consultation.getRaport().isEmpty()) {
                                    String report = consultation.getRaport();
                                    String truncated = report.length() > 50 ? report.substring(0, 50) + "..." : report;
                                %>
                                <%= truncated %>
                                <% } else { %>
                                <span class="text-gray-400 italic">No report yet</span>
                                <% } %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <a href="<%= request.getContextPath() %>/doctor/consultations/view/<%= consultation.getConsultationId() %>"
                                   class="text-blue-600 hover:text-blue-900 mr-3" title="View">
                                    <i class="fas fa-eye"></i> View
                                </a>
                                <a href="<%= request.getContextPath() %>/doctor/consultations/edit/<%= consultation.getConsultationId() %>"
                                   class="text-yellow-600 hover:text-yellow-900" title="Edit">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                            </td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td colspan="7" class="px-6 py-12 text-center">
                                <i class="fas fa-calendar-times text-5xl text-gray-400 mb-4"></i>
                                <p class="text-gray-500 text-lg">No consultations found</p>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>