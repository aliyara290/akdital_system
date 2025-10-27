<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Consultation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Consultation> consultations = (List<Consultation>) request.getAttribute("consultations"); %>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto bg-gray-50">
        <!-- Header -->
        <% request.setAttribute("pageTitle", "Consultations Management"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">

            <!-- Success Message -->
            <% String success = request.getParameter("success"); %>
            <% if (success != null) { %>
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6 rounded-lg shadow-sm">
                <p class="font-bold">Success!</p>
                <p>Consultation <%= success %> successfully.</p>
            </div>
            <% } %>

            <!-- Consultations Cards Grid -->
            <% if(!consultations.isEmpty()) { %>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                <% for(Consultation consultation : consultations) {%>
                <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300 overflow-hidden border border-gray-100">
                    <!-- Card Header -->
                    <div class="bg-gradient-to-r from-blue-500 to-blue-600 px-6 py-4">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-blue-100 text-xs font-medium mb-1">Consultation ID</p>
                                <p class="text-white font-mono font-semibold">#<%= consultation.getConsultationId().substring(0, 8)%></p>
                            </div>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-white bg-opacity-20 text-white backdrop-blur-sm">
                                <%= consultation.getConsultationStatus().toString()%>
                            </span>
                        </div>
                    </div>

                    <!-- Card Body -->
                    <div class="p-6">
                        <!-- Date & Time -->
                        <div class="flex items-center mb-4 pb-4 border-b border-gray-100">
                            <div class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center mr-4">
                                <i class="fas fa-calendar-alt text-blue-600 text-lg"></i>
                            </div>
                            <div>
                                <p class="text-sm font-semibold text-gray-900"><%= consultation.getDate()%></p>
                                <p class="text-sm text-gray-500">
                                    <i class="fas fa-clock mr-1"></i><%= consultation.getTime()%>
                                </p>
                            </div>
                        </div>

                        <!-- Doctor Info -->
                        <div class="mb-4">
                            <p class="text-xs text-gray-500 uppercase tracking-wide mb-2">Doctor</p>
                            <div class="flex items-center">
                                <div class="w-10 h-10 bg-gradient-to-br from-green-400 to-green-600 rounded-full flex items-center justify-center mr-3 shadow-sm">
                                    <i class="fas fa-user-md text-white text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm font-semibold text-gray-900">Dr. <%= consultation.getDoctor().getFirstName()%> <%= consultation.getDoctor().getLastName()%></p>
                                    <p class="text-xs text-gray-500"><%= consultation.getDoctor().getSpeciality()%></p>
                                </div>
                            </div>
                        </div>

                        <!-- Room Info -->
                        <div class="flex items-center bg-gray-50 rounded-lg px-3 py-2 mb-4">
                            <i class="fas fa-door-open text-gray-600 mr-2"></i>
                            <span class="text-sm text-gray-700 font-medium"><%= consultation.getRoom().getName()%></span>
                        </div>

                        <!-- Actions -->
                        <div class="flex gap-2 pt-4 border-t border-gray-100">
                            <a href="<%= request.getContextPath() %>/patient/consultations/view/<%= consultation.getConsultationId()%>"
                               class="flex-1 text-center bg-blue-50 hover:bg-blue-100 text-blue-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                <i class="fas fa-eye mr-1"></i>View
                            </a>
                            <a href="<%= request.getContextPath() %>/patient/consultations/edit/<%= consultation.getConsultationId()%>"
                               class="flex-1 text-center bg-yellow-50 hover:bg-yellow-100 text-yellow-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                <i class="fas fa-edit mr-1"></i>Edit
                            </a>
                            <a href="#" onclick="return confirm('Are you sure?')"
                               class="flex-1 text-center bg-red-50 hover:bg-red-100 text-red-600 px-4 py-2 rounded-lg transition-colors text-sm font-medium">
                                <i class="fas fa-trash mr-1"></i>Delete
                            </a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>

            <!-- Pagination -->
            <div class="bg-white rounded-lg shadow-sm p-4">
                <div class="flex justify-between items-center">
                    <div class="text-sm text-gray-700">
                        Showing <span class="font-medium">1</span> to <span class="font-medium">3</span> of <span class="font-medium">127</span> results
                    </div>
                    <div class="flex gap-2">
                        <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed transition-colors" disabled>
                            <i class="fas fa-chevron-left mr-1"></i>Previous
                        </button>
                        <button class="px-4 py-2 bg-blue-600 text-white rounded-lg font-medium">1</button>
                        <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">2</button>
                        <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">3</button>
                        <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
                            Next<i class="fas fa-chevron-right ml-1"></i>
                        </button>
                    </div>
                </div>
            </div>
            <% } else { %>
            <!-- Empty State -->
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
            <%} %>
        </div>
    </main>
</div>

</body>
</html>