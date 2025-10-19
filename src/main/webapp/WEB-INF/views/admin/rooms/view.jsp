<%@ page import="com.akdital.model.Room" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Optional<Room> room = (Optional<Room>) request.getAttribute("room");
    if (room == null || room.isEmpty()) {
        room = Optional.empty();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Room - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "rooms"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Room Details"); %>
        <jsp:include page="../layout/header.jsp" />

        <% if(!room.isEmpty() && room.isPresent()){ %>
        <div class="p-6">
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8 mb-6">
                    <div class="flex justify-between items-start mb-6">
                        <div class="flex items-center">
                            <div class="w-20 h-20 bg-purple-100 rounded-full flex items-center justify-center mr-6">
                                <i class="fas fa-door-open text-4xl text-purple-600"></i>
                            </div>
                            <div>
                                <h2 class="text-3xl font-bold text-gray-800"><%= room.get().getName() %></h2>
                                <p class="text-gray-600 mt-1">Room ID: <span class="font-mono"><%= room.get().getRoomId().substring(0, 8) %></span></p>
                                <span class="inline-block mt-2 px-3 py-1 bg-green-100 text-green-800 text-sm font-semibold rounded-full">
                                        <i class="fas fa-check-circle"></i> Available
                                    </span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/rooms/edit/<%= room.get().getRoomId() %>"
                               class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit mr-2"></i>Edit
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/rooms/"
                               class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-arrow-left mr-2"></i>Back
                            </a>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Room Name</p>
                            <p class="text-gray-900 font-medium text-lg">
                                <i class="fas fa-door-closed text-purple-600 mr-2"></i>
                                <%= room.get().getName() %>
                            </p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-sm text-gray-600 mb-1">Occupied Slots</p>
                            <p class="text-gray-900 font-medium text-lg">
                                <% if (room.get().getOccupiedSlots() != null && !room.get().getOccupiedSlots().isEmpty()) { %>
                                <i class="fas fa-calendar-times text-orange-600 mr-2"></i>
                                <%= room.get().getOccupiedSlots().size() %> slots
                                <% } else { %>
                                <i class="fas fa-calendar-check text-green-600 mr-2"></i>
                                No bookings
                                <% } %>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-lg p-8">
                    <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                        <i class="fas fa-calendar-day text-blue-600 mr-2"></i>
                        Today's Schedule
                    </h3>
                    <div class="space-y-3">
                        <div class="flex items-center justify-between p-4 bg-blue-50 border-l-4 border-blue-500 rounded">
                            <div>
                                <p class="font-medium text-gray-800">Dr. Smith Williams - John Doe</p>
                                <p class="text-sm text-gray-600">Cardiology Consultation</p>
                            </div>
                            <div class="text-right">
                                <p class="font-medium text-gray-800">09:00 - 10:00 AM</p>
                                <span class="text-xs bg-green-100 text-green-800 px-2 py-1 rounded-full">In Progress</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between p-4 bg-purple-50 border-l-4 border-purple-500 rounded">
                            <div>
                                <p class="font-medium text-gray-800">Dr. Emily Davis - Jane Smith</p>
                                <p class="text-sm text-gray-600">Neurology Checkup</p>
                            </div>
                            <div class="text-right">
                                <p class="font-medium text-gray-800">11:00 AM - 12:00 PM</p>
                                <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded-full">Scheduled</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between p-4 bg-gray-50 border-l-4 border-gray-300 rounded">
                            <p class="text-gray-500 text-center w-full">
                                <i class="fas fa-calendar-check mr-2"></i>
                                No more appointments for today
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="p-20 flex justify-center items-center">
            <div class="bg-white rounded-lg shadow-lg p-8 text-center">
                <i class="fas fa-exclamation-triangle text-5xl text-red-500 mb-4"></i>
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Room Not Found</h2>
                <p class="text-gray-600 mb-4">The room you are looking for does not exist.</p>
                <a href="<%= request.getContextPath() %>/admin/rooms/"
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg transition-colors">
                    Back to Rooms
                </a>
            </div>
        </div>
        <% } %>
    </main>
</div>
</body>
</html>