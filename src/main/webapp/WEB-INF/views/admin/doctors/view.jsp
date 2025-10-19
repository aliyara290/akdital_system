<%@ page import="java.util.Optional" %>
<%@ page import="javax.print.Doc" %>
<%@ page import="com.akdital.model.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Optional<Doctor> doctor = (Optional<Doctor>) request.getAttribute("doctor"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Doctor - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <% request.setAttribute("currentPage", "doctors"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Doctor Details"); %>
        <jsp:include page="../layout/header.jsp" />
        <% if(!doctor.isEmpty() && doctor.isPresent()){ %>
        <div class="p-6">
            <div class="max-w-6xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8 mb-6">
                    <div class="flex justify-between items-start mb-6">
                        <div class="flex items-center">
                            <div class="w-24 h-24 bg-blue-100 rounded-full flex items-center justify-center mr-6">
                                <i class="fas fa-user-md text-5xl text-blue-600"></i>
                            </div>
                            <div>
                                <h2 class="text-3xl font-bold text-gray-800">Dr. <%= doctor.get().getFirstName()%> <%= doctor.get().getLastName()%></h2>
                                <p class="text-gray-600">ID: #<%= doctor.get().getUserId().substring(0, 8)%></p>
                                <span class="inline-block mt-2 px-3 py-1 bg-blue-100 text-blue-800 text-sm font-semibold rounded-full">
                                        <%= doctor.get().getSpeciality()%> Specialist
                                    </span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/doctors/edit/<%= doctor.get().getUserId()%>"
                               class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit mr-2"></i>Edit
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/doctors/"
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
                                <%= doctor.get().getEmail()%>
                            </p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Department</p>
                            <p class="text-gray-900 font-medium">
                                <i class="fas fa-building text-green-600 mr-2"></i>
                                <%= doctor.get().getDepartment().getName()%>
                            </p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Speciality</p>
                            <p class="text-gray-900 font-medium">
                                <i class="fas fa-stethoscope text-purple-600 mr-2"></i>
                                <%= doctor.get().getSpeciality()%> Specialist
                            </p>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-lg p-8 mb-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                        <i class="fas fa-calendar-day text-blue-600 mr-2"></i>
                        Today's Schedule
                    </h3>
                    <div class="space-y-3">
                        <div class="flex items-center justify-between p-4 bg-blue-50 border-l-4 border-blue-500 rounded">
                            <div>
                                <p class="font-medium text-gray-800">Sarah Johnson</p>
                                <p class="text-sm text-gray-600">Regular Checkup - Room 101</p>
                            </div>
                            <div class="text-right">
                                <p class="font-medium text-gray-800">09:00 AM</p>
                                <span class="text-xs bg-green-100 text-green-800 px-2 py-1 rounded-full">Confirmed</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between p-4 bg-green-50 border-l-4 border-green-500 rounded">
                            <div>
                                <p class="font-medium text-gray-800">Michael Brown</p>
                                <p class="text-sm text-gray-600">Follow-up - Room 102</p>
                            </div>
                            <div class="text-right">
                                <p class="font-medium text-gray-800">11:30 AM</p>
                                <span class="text-xs bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full">Pending</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between p-4 bg-purple-50 border-l-4 border-purple-500 rounded">
                            <div>
                                <p class="font-medium text-gray-800">Emily Wilson</p>
                                <p class="text-sm text-gray-600">Consultation - Room 103</p>
                            </div>
                            <div class="text-right">
                                <p class="font-medium text-gray-800">02:00 PM</p>
                                <span class="text-xs bg-green-100 text-green-800 px-2 py-1 rounded-full">Confirmed</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">Total Patients</p>
                            <i class="fas fa-users text-blue-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">245</h4>
                        <p class="text-sm text-green-600 mt-1">
                            <i class="fas fa-arrow-up"></i> 12% this month
                        </p>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">Consultations</p>
                            <i class="fas fa-calendar-check text-green-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">127</h4>
                        <p class="text-sm text-green-600 mt-1">
                            <i class="fas fa-arrow-up"></i> 8% this month
                        </p>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="flex items-center justify-between mb-2">
                            <p class="text-gray-600 text-sm">Today's Apps</p>
                            <i class="fas fa-clock text-purple-600 text-2xl"></i>
                        </div>
                        <h4 class="text-3xl font-bold text-gray-800">8</h4>
                        <p class="text-sm text-blue-600 mt-1">
                            3 completed
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="p-20 flex justify-center items-center">
            <div class="bg-white rounded-lg shadow-lg p-8 text-center">
                <i class="fas fa-exclamation-triangle text-5xl text-red-500 mb-4"></i>
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Doctor Not Found</h2>
                <p class="text-gray-600 mb-4">The doctor you are looking for does not exist.</p>
                <a href="<%= request.getContextPath() %>/admin/doctors/"
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg transition-colors">
                    Back to Doctors list!
                </a>
            </div>
        </div>
        <% } %>
    </main>
</div>
</body>
</html>