<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Consultation" %>
<%@ page import="com.akdital.model.Doctor" %>
<%
    List<Consultation> consultations = (List<Consultation>) request.getAttribute("consultations");
    Doctor doctor = (Doctor) request.getAttribute("doctor");
    Integer totalConsultations = (Integer) request.getAttribute("totalConsultations");
%>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<html>
<head>
    <title>Doctor Dashboard - Akdital System</title>
</head>
<body>
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "dashboard"); %>
    <jsp:include page="./layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto bg-gray-50">
        <!-- Header -->
        <% request.setAttribute("pageTitle", "Dashboard"); %>
        <jsp:include page="./layout/header.jsp" />

        <div class="p-6">
            <!-- Welcome Section -->
            <div class="bg-white rounded-xl shadow-md p-6 mb-6">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Welcome, Dr. <%= doctor != null ? doctor.getFirstName() + " " + doctor.getLastName() : "Doctor" %></h2>
                <p class="text-gray-600"><%= doctor != null ? doctor.getSpeciality() : "" %> - <%= doctor != null && doctor.getDepartment() != null ? doctor.getDepartment().getName() : "" %></p>
            </div>

            <!-- Stats Cards -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                <!-- Total Consultations -->
                <div class="bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition-shadow">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-600 text-sm uppercase font-semibold">Total Consultations</p>
                            <h3 class="text-4xl font-bold text-gray-800 mt-2"><%= totalConsultations != null ? totalConsultations : 0 %></h3>
                        </div>
                        <div class="bg-blue-100 rounded-full p-4">
                            <i class="fas fa-calendar-check text-3xl text-blue-600"></i>
                        </div>
                    </div>
                </div>

                <!-- Pending Consultations -->
                <div class="bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition-shadow">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-600 text-sm uppercase font-semibold">Pending</p>
                            <h3 class="text-4xl font-bold text-gray-800 mt-2">
                                <%
                                    int pendingCount = 0;
                                    if (consultations != null) {
                                        for (Consultation c : consultations) {
                                            if (c.getConsultationStatus().name().equals("RESERVED") || c.getConsultationStatus().name().equals("VALIDATED")) {
                                                pendingCount++;
                                            }
                                        }
                                    }
                                %>
                                <%= pendingCount %>
                            </h3>
                        </div>
                        <div class="bg-yellow-100 rounded-full p-4">
                            <i class="fas fa-clock text-3xl text-yellow-600"></i>
                        </div>
                    </div>
                </div>

                <!-- Completed Consultations -->
                <div class="bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition-shadow">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-600 text-sm uppercase font-semibold">Completed</p>
                            <h3 class="text-4xl font-bold text-gray-800 mt-2">
                                <%
                                    int completedCount = 0;
                                    if (consultations != null) {
                                        for (Consultation c : consultations) {
                                            if (c.getConsultationStatus().name().equals("COMPLETED")) {
                                                completedCount++;
                                            }
                                        }
                                    }
                                %>
                                <%= completedCount %>
                            </h3>
                        </div>
                        <div class="bg-green-100 rounded-full p-4">
                            <i class="fas fa-check-circle text-3xl text-green-600"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Consultations -->
            <div class="bg-white rounded-xl shadow-md p-6">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">
                        <i class="fas fa-calendar-alt text-blue-600 mr-2"></i>Recent Consultations
                    </h2>
                    <a href="<%= request.getContextPath() %>/doctor/consultations/"
                       class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                        View All
                    </a>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b-2 border-gray-200">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Patient</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Date</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Time</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Actions</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                        <% if (consultations != null && !consultations.isEmpty()) {
                            int count = 0;
                            for (Consultation consultation : consultations) {
                                if (count >= 5) break;
                                count++;
                        %>
                        <tr class="hover:bg-gray-50 transition-colors">
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
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <a href="<%= request.getContextPath() %>/doctor/consultations/view/<%= consultation.getConsultationId() %>"
                                   class="text-blue-600 hover:text-blue-900 mr-3" title="View">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="<%= request.getContextPath() %>/doctor/consultations/edit/<%= consultation.getConsultationId() %>"
                                   class="text-yellow-600 hover:text-yellow-900" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td colspan="5" class="px-6 py-8 text-center text-gray-500">
                                <i class="fas fa-calendar-times text-4xl mb-3 text-gray-400"></i>
                                <p>No consultations found</p>
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