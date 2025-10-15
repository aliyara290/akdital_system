<%@ page import="com.akdital.model.Room" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Optional<Room> room = (Optional<Room>) request.getAttribute("room");
    boolean isEdit = room.isPresent();
    String formTitle = isEdit ? "Edit Room" : "Add New Room";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= formTitle %> - Akdital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "rooms"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", formTitle); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div class="max-w-2xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8">
                    <form action="<%= request.getContextPath() %>/admin/rooms/" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "create" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="roomId" value="<%= room.get().getRoomId() %>">
                        <% } %>

                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-door-open text-purple-600 mr-2"></i>
                                Room Information
                            </h3>

                            <div class="mb-6">
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Room Name <span class="text-red-500">*</span>
                                </label>
                                <input type="text"
                                       name="name"
                                       value="<%= isEdit ? room.get().getName() : "" %>"
                                       required
                                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                       placeholder="e.g., Room 101, Operating Theater A">
                                <p class="mt-2 text-sm text-gray-600">
                                    <i class="fas fa-info-circle"></i>
                                    Enter a unique and descriptive name for the room.)
                                </p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors">
                                <i class="fas <%= isEdit ? "fa-save" : "fa-plus" %> mr-2"></i>
                                <%= isEdit ? "Update Room" : "Create Room" %>
                            </button>
                            <a href="<%= request.getContextPath() %>/admin/rooms/"
                               class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-8 py-3 rounded-lg transition-colors">
                                <i class="fas fa-times mr-2"></i>Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>