<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String consultationId = request.getParameter("id");
    boolean isEdit = consultationId != null && !consultationId.isEmpty();
    String formTitle = isEdit ? "Edit Consultation" : "Schedule New Consultation";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= formTitle %> - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto">
        <!-- Header -->
        <% request.setAttribute("pageTitle", formTitle); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8">
                    <form action="<%= request.getContextPath() %>/admin/consultations/" method="post">
                        <input type="hidden" name="action" value="<%= isEdit ? "update" : "create" %>">
                        <% if (isEdit) { %>
                        <input type="hidden" name="consultationId" value="<%= consultationId %>">
                        <% } %>

                        <!-- Consultation Details -->
                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-calendar-check text-blue-600 mr-2"></i>
                                Consultation Details
                            </h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Patient <span class="text-red-500">*</span>
                                    </label>
                                    <select name="patientId"
                                            required
                                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                        <option value="">Select Patient</option>
                                        <option value="p1" <%= isEdit ? "selected" : "" %>>John Doe</option>
                                        <option value="p2">Jane Smith</option>
                                        <option value="p3">Michael Brown</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Doctor <span class="text-red-500">*</span>
                                    </label>
                                    <select name="doctorId"
                                            required
                                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                        <option value="">Select Doctor</option>
                                        <option value="d1" <%= isEdit ? "selected" : "" %>>Dr. Smith Williams - Cardiology</option>
                                        <option value="d2">Dr. Emily Davis - Neurology</option>
                                        <option value="d3">Dr. Sarah Martinez - Pediatrics</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Room <span class="text-red-500">*</span>
                                    </label>
                                    <select name="roomId"
                                            required
                                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                        <option value="">Select Room</option>
                                        <option value="r1" <%= isEdit ? "selected" : "" %>>Room 101</option>
                                        <option value="r2">Room 102</option>
                                        <option value="r3">Room 103</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Status <span class="text-red-500">*</span>
                                    </label>
                                    <select name="status"
                                            required
                                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                        <option value="RESERVED" <%= isEdit ? "" : "selected" %>>Reserved</option>
                                        <option value="VALIDATED" <%= isEdit ? "selected" : "" %>>Validated</option>
                                        <option value="COMPLETED">Completed</option>
                                        <option value="CANCELLED">Cancelled</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Date <span class="text-red-500">*</span>
                                    </label>
                                    <input type="date"
                                           name="date"
                                           value="<%= isEdit ? "2025-10-12" : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        Time <span class="text-red-500">*</span>
                                    </label>
                                    <input type="time"
                                           name="time"
                                           value="<%= isEdit ? "09:00" : "" %>"
                                           required
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                </div>
                            </div>
                        </div>

                        <!-- Report/Notes -->
                        <div class="mb-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                                <i class="fas fa-file-medical text-green-600 mr-2"></i>
                                Medical Report
                            </h3>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Consultation Notes
                                </label>
                                <textarea name="report"
                                          rows="6"
                                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                          placeholder="Enter consultation notes, diagnosis, and recommendations..."><%= isEdit ? "Patient showed significant improvement. Continue current medication." : "" %></textarea>
                            </div>
                        </div>

                        <!-- Form Actions -->
                        <div class="flex gap-4">
                            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors">
                                <i class="fas <%= isEdit ? "fa-save" : "fa-calendar-plus" %> mr-2"></i>
                                <%= isEdit ? "Update Consultation" : "Schedule Consultation" %>
                            </button>
                            <a href="<%= request.getContextPath() %>/admin/consultations/"
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