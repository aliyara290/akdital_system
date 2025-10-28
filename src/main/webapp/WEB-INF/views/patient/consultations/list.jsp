<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Consultation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Consultation> consultations = (List<Consultation>) request.getAttribute("consultations"); %>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<html>
<head>
    <title>My Consultations - Patient Portal</title>
</head>
<body>
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto bg-gray-50">
        <% request.setAttribute("pageTitle", "My Consultations"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
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

            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-bold text-gray-800">All Consultations</h2>
                <a href="<%= request.getContextPath() %>/patient/consultations/new"
                   class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                    <i class="fas fa-plus mr-2"></i>Book New Consultation
                </a>
            </div>

            <% if (consultations != null && !consultations.isEmpty()) { %>
            <div class="bg-white rounded-xl shadow-md overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b-2 border-gray-200">
                        <tr>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Doctor</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Department</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Date</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Time</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Room</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Actions</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                        <% for (Consultation consultation : consultations) { %>
                        <tr class="hover:bg-gray-50 transition-colors">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="w-10 h-10 bg-gradient-to-br from-green-400 to-green-600 rounded-full flex items-center justify-center mr-3">
                                        <i class="fas fa-user-md text-white"></i>
                                    </div>
                                    <div>
                                        <div class="text-sm font-medium text-gray-900">
                                            Dr. <%= consultation.getDoctor().getFirstName() %> <%= consultation.getDoctor().getLastName() %>
                                        </div>
                                        <div class="text-xs text-gray-500">
                                            <%= consultation.getDoctor().getSpeciality() %>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                <%= consultation.getDoctor().getDepartment().getName() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                <i class="fas fa-calendar-alt text-gray-400 mr-2"></i>
                                <%= consultation.getDate() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                <i class="fas fa-clock text-gray-400 mr-2"></i>
                                <%= consultation.getTime() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                <i class="fas fa-door-open text-gray-400 mr-2"></i>
                                <%= consultation.getRoom().getName() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <%
                                    String statusClass = "";
                                    String status = consultation.getConsultationStatus().name();
                                    if (status.equals("RESERVED") || status.equals("VALIDATED")) {
                                        statusClass = "bg-blue-100 text-blue-800";
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
                                <%
                                    String consultStatus = consultation.getConsultationStatus().name();
                                    if (consultStatus.equals("RESERVED") || consultStatus.equals("VALIDATED")) {
                                %>
                                <form action="<%= request.getContextPath() %>/patient/consultations/"
                                      method="post" style="display: inline;"
                                      onsubmit="return confirm('Are you sure you want to cancel this consultation?');">
                                    <input type="hidden" name="action" value="cancel">
                                    <input type="hidden" name="consultationId" value="<%= consultation.getConsultationId() %>">
                                    <button type="submit"
                                            class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg text-xs font-semibold transition-colors">
                                        <i class="fas fa-times-circle mr-1"></i>Cancel
                                    </button>
                                </form>
                                <% } else { %>
                                <span class="text-gray-400 italic">-</span>
                                <% } %>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <% } else { %>
            <div class="bg-white rounded-xl shadow-lg p-12 text-center">
                <div class="w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-6">
                    <i class="fas fa-calendar-times text-5xl text-gray-400"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-800 mb-2">No Consultations Found</h3>
                <p class="text-gray-500 mb-6">Start by scheduling your first consultation</p>
                <a href="<%= request.getContextPath() %>/patient/consultations/new"
                   class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors shadow-sm font-medium">
                    <i class="fas fa-plus mr-2"></i>Schedule New Consultation
                </a>
            </div>
            <% } %>
        </div>
    </main>
</div>
</body>
</html>