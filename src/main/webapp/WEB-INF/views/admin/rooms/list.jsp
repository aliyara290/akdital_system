<%@ page import="com.akdital.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms Management - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <% request.setAttribute("currentPage", "rooms"); %>
    <jsp:include page="../layout/sidebar.jsp"/>

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Rooms Management"); %>
        <jsp:include page="../layout/header.jsp"/>

        <div class="p-6">
            <div class="flex justify-between items-center mb-6">
                <div class="flex gap-3">
                    <div class="relative">
                        <input type="text"
                               placeholder="Search rooms..."
                               class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                    </div>
                    <select class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                        <option>All Rooms</option>
                        <option>Available</option>
                        <option>Occupied</option>
                    </select>
                </div>
                <a href="<%= request.getContextPath() %>/admin/rooms/new"
                   class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors">
                    <i class="fas fa-plus mr-2"></i>Add New Room

                </a>
            </div>

            <% String success = request.getParameter("success"); %>
            <% if (success != null) { %>
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6 rounded">
                <p class="font-bold">Success!</p>
                <p>Room <%= success %> successfully.</p>
            </div>
            <% } %>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <%
                    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                    if (rooms != null && !rooms.isEmpty()) {
                        for (Room room : rooms) {
                %>
                <div class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow">
                    <div class="flex justify-between items-start mb-4">
                        <div class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center">
                            <i class="fas fa-door-open text-3xl text-purple-600"></i>
                        </div>
                        <span class="px-3 py-1 bg-green-100 text-green-800 text-xs font-semibold rounded-full">
                                Available
                            </span>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2"><%= room.getName() %>
                    </h3>
                    <div class="flex gap-2">
                        <a href="<%= request.getContextPath() %>/admin/rooms/view/<%= room.getRoomId() %>"
                           class="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-center py-2 rounded-lg transition-colors text-sm">
                            <i class="fas fa-eye"></i> View
                        </a>
                        <a href="<%= request.getContextPath() %>/admin/rooms/edit/<%= room.getRoomId() %>"
                           class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white text-center py-2 rounded-lg transition-colors text-sm">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="<%= request.getContextPath() %>/admin/rooms/delete/<%= room.getRoomId() %>"
                           onclick="return confirm('Are you sure?')"
                           class="px-3 bg-red-500 hover:bg-red-600 text-white rounded-lg transition-colors text-sm flex items-center flex-column justify-center">
                            <i class="fas fa-trash"></i>
                        </a>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-span-full bg-white rounded-lg shadow-lg p-12 text-center">
                    <i class="fas fa-door-closed text-6xl text-gray-300 mb-4"></i>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">No Rooms Found</h3>
                    <p class="text-gray-600 mb-4">Get started by creating your first room.</p>
                    <a href="<%= request.getContextPath() %>/admin/rooms/new"
                       class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition-colors">
                        <i class="fas fa-plus mr-2"></i>Add New Room
                    </a>
                </div>
                <% } %>
            </div>
        </div>
    </main>
</div>
</body>
</html>