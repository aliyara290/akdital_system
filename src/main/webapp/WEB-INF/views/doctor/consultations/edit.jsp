<%@ page import="com.akdital.model.Consultation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Consultation consultation = (Consultation) request.getAttribute("consultation"); %>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<html>
<head>
    <title>Edit Consultation - Doctor Portal</title>
</head>
<body>
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto bg-gray-50">
        <% request.setAttribute("pageTitle", "Edit Consultation"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div class="mb-6">
                <a href="<%= request.getContextPath() %>/doctor/consultations/"
                   class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium">
                    <i class="fas fa-arrow-left mr-2"></i> Back to Consultations
                </a>
            </div>

            <% String error = request.getParameter("error"); %>
            <% if (error != null) { %>
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded-lg shadow-sm">
                <p class="font-bold">Error!</p>
                <p><%= error %></p>
            </div>
            <% } %>

            <div class="bg-white rounded-xl shadow-md p-6 mb-6">
                <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                    <i class="fas fa-user text-blue-600 mr-2"></i> Patient Information
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div>
                        <p class="text-sm text-gray-600 mb-1">Patient Name</p>
                        <p class="text-lg font-semibold text-gray-900">
                            <%= consultation != null ? consultation.getPatient().getFirstName() + " " + consultation.getPatient().getLastName() : "" %>
                        </p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-600 mb-1">Consultation Date</p>
                        <p class="text-lg font-semibold text-gray-900">
                            <%= consultation != null ? consultation.getDate() : "" %>
                        </p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-600 mb-1">Time</p>
                        <p class="text-lg font-semibold text-gray-900">
                            <%= consultation != null ? consultation.getTime() : "" %>
                        </p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md p-6">
                <h3 class="text-xl font-bold text-gray-800 mb-6">Update Consultation Details</h3>

                <form action="<%= request.getContextPath() %>/doctor/consultations/" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="consultationId" value="<%= consultation != null ? consultation.getConsultationId() : "" %>">

                    <div class="mb-6">
                        <label for="status" class="block text-gray-700 font-semibold mb-2">
                            <i class="fas fa-info-circle text-blue-600 mr-2"></i>Status *
                        </label>
                        <select id="status" name="status" required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all">
                            <% String currentStatus = consultation != null ? consultation.getConsultationStatus().name() : ""; %>
                            <option value="RESERVED" <%= "RESERVED".equals(currentStatus) ? "selected" : "" %>>Reserved</option>
                            <option value="VALIDATED" <%= "VALIDATED".equals(currentStatus) ? "selected" : "" %>>Validated</option>
                            <option value="COMPLETED" <%= "COMPLETED".equals(currentStatus) ? "selected" : "" %>>Completed</option>
                            <option value="CANCELLED" <%= "CANCELLED".equals(currentStatus) ? "selected" : "" %>>Cancelled</option>
                        </select>
                    </div>

                    <div class="mb-6">
                        <label for="raport" class="block text-gray-700 font-semibold mb-2">
                            <i class="fas fa-file-medical text-blue-600 mr-2"></i>Medical Report
                        </label>
                        <textarea id="raport" name="raport" rows="10"
                                  class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                  placeholder="Enter your medical report here...&#10;&#10;Include:&#10;- Patient symptoms&#10;- Diagnosis&#10;- Treatment plan&#10;- Recommendations"><%= consultation != null && consultation.getRaport() != null ? consultation.getRaport() : "" %></textarea>
                        <p class="text-sm text-gray-600 mt-2">
                            <i class="fas fa-info-circle mr-1"></i> Document diagnosis, observations, treatment plan, and recommendations
                        </p>
                    </div>

                    <div class="flex gap-4">
                        <button type="submit"
                                class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                            <i class="fas fa-save mr-2"></i>Update Consultation
                        </button>
                        <a href="<%= request.getContextPath() %>/doctor/consultations/"
                           class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-6 py-3 rounded-lg font-semibold transition-colors">
                            <i class="fas fa-times mr-2"></i>Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>