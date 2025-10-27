<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <jsp:include page="./layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <jsp:include page="./layout/header.jsp" />

        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">

                <div class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-600 text-sm uppercase">Total Consultations</p>
                            <h3 class="text-3xl font-bold text-gray-800 mt-2">10</h3>

                        </div>
                        <div class="bg-blue-100 rounded-full p-4">
                            <i class="fas fa-users text-3xl text-blue-600"></i>
                        </div>
                    </div>
                </div>

<%--                <!-- Total Doctors -->--%>
<%--                <div class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow">--%>
<%--                    <div class="flex items-center justify-between">--%>
<%--                        <div>--%>
<%--                            <p class="text-gray-600 text-sm uppercase">Total Doctors</p>--%>
<%--                            <h3 class="text-3xl font-bold text-gray-800 mt-2">18</h3>--%>
<%--                        </div>--%>
<%--                        <div class="bg-green-100 rounded-full p-4">--%>
<%--                            <i class="fas fa-user-md text-3xl text-green-600"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Total Rooms -->--%>
<%--                <div class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow">--%>
<%--                    <div class="flex items-center justify-between">--%>
<%--                        <div>--%>
<%--                            <p class="text-gray-600 text-sm uppercase">Total Rooms</p>--%>
<%--                            <h3 class="text-3xl font-bold text-gray-800 mt-2">32</h3>--%>
<%--                        </div>--%>
<%--                        <div class="bg-purple-100 rounded-full p-4">--%>
<%--                            <i class="fas fa-door-open text-3xl text-purple-600"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Total Consultations -->--%>
<%--                <div class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow">--%>
<%--                    <div class="flex items-center justify-between">--%>
<%--                        <div>--%>
<%--                            <p class="text-gray-600 text-sm uppercase">Consultations</p>--%>
<%--                            <h3 class="text-3xl font-bold text-gray-800 mt-2">127</h3>--%>
<%--                        </div>--%>
<%--                        <div class="bg-orange-100 rounded-full p-4">--%>
<%--                            <i class="fas fa-calendar-check text-3xl text-orange-600"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <!-- Recent Activity -->
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">
                        <i class="fas fa-clock text-blue-500"></i> Last Consultations
                    </h2>
                    <div class="space-y-3">
                        <div class="flex items-start p-3 bg-blue-50 border-l-4 border-blue-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">New patient registered</p>
                                <p class="text-sm text-gray-600">John Doe added to the system</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 5 minutes ago
                                </p>
                            </div>
                        </div>
                        <div class="flex items-start p-3 bg-green-50 border-l-4 border-green-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">Consultation completed</p>
                                <p class="text-sm text-gray-600">Dr. Smith completed consultation with Jane</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 15 minutes ago
                                </p>
                            </div>
                        </div>
                        <div class="flex items-start p-3 bg-purple-50 border-l-4 border-purple-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">Room updated</p>
                                <p class="text-sm text-gray-600">Room 101 status changed to available</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 30 minutes ago
                                </p>
                            </div>
                        </div>
                        <div class="flex items-start p-3 bg-orange-50 border-l-4 border-orange-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">New appointment scheduled</p>
                                <p class="text-sm text-gray-600">Appointment set for tomorrow at 10:00 AM</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 1 hour ago
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">
                        <i class="fas fa-clock text-blue-500"></i> Upcoming Consultations
                    </h2>
                    <div class="space-y-3">

                        <div class="flex items-start p-3 bg-blue-50 border-l-4 border-blue-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">New patient registered</p>
                                <p class="text-sm text-gray-600">John Doe added to the system</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 5 minutes ago
                                </p>
                            </div>
                        </div>

                        <div class="flex items-start p-3 bg-green-50 border-l-4 border-green-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">Consultation completed</p>
                                <p class="text-sm text-gray-600">Dr. Smith completed consultation with Jane</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 15 minutes ago
                                </p>
                            </div>
                        </div>

                        <div class="flex items-start p-3 bg-purple-50 border-l-4 border-purple-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">Room updated</p>
                                <p class="text-sm text-gray-600">Room 101 status changed to available</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 30 minutes ago
                                </p>
                            </div>
                        </div>

                        <div class="flex items-start p-3 bg-orange-50 border-l-4 border-orange-500 rounded">
                            <div class="flex-1">
                                <p class="font-medium text-gray-800">New appointment scheduled</p>
                                <p class="text-sm text-gray-600">Appointment set for tomorrow at 10:00 AM</p>
                                <p class="text-xs text-gray-500 mt-1">
                                    <i class="far fa-clock"></i> 1 hour ago
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>