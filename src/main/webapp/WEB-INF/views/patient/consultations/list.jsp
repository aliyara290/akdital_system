<%--
  Created by IntelliJ IDEA.
  User: aliyara
  Date: 19/10/2025
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Consultations Management"); %>
        <jsp:include page="../layout/header.jsp" />
    </main>
</div>

</body>
</html>
