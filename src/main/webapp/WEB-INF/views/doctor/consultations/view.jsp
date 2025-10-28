<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Consultation - Doctor Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans text-gray-900">

<div class="flex min-h-screen">

    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">

        <% request.setAttribute("pageTitle", "Consultation Details"); %>
        <jsp:include page="../layout/header.jsp" />


        <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
            <h3 class="text-xl font-semibold mb-4 border-b pb-2">Patient Information</h3>
            <div class="grid md:grid-cols-2 gap-4 text-sm">
                <div><span class="font-medium">Patient Name:</span> ${consultation.patient.firstName} ${consultation.patient.lastName}</div>
                <div><span class="font-medium">Email:</span> ${consultation.patient.email}</div>
                <div><span class="font-medium">Phone:</span> ${consultation.patient.phone}</div>
                <div><span class="font-medium">Gender:</span> ${consultation.patient.gender}</div>
                <div><span class="font-medium">Height:</span> ${consultation.patient.height} cm</div>
                <div><span class="font-medium">Weight:</span> ${consultation.patient.weight} kg</div>
            </div>
        </div>

        <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
            <h3 class="text-xl font-semibold mb-4 border-b pb-2">Consultation Information</h3>
            <div class="grid md:grid-cols-2 gap-4 text-sm">
                <div><span class="font-medium">Consultation ID:</span> ${consultation.consultationId}</div>
                <div><span class="font-medium">Date:</span> ${consultation.date}</div>
                <div><span class="font-medium">Time:</span> ${consultation.time}</div>
                <div>
                    <span class="font-medium">Status:</span>
                    <span class="
              inline-block px-2 py-1 rounded text-xs font-medium
              <c:choose>
                <c:when test='${consultation.consultationStatus.name().toLowerCase() == "completed"}'>bg-green-100 text-green-700</c:when>
                <c:when test='${consultation.consultationStatus.name().toLowerCase() == "pending"}'>bg-yellow-100 text-yellow-700</c:when>
                <c:otherwise>bg-red-100 text-red-700</c:otherwise>
              </c:choose>
            ">
                        ${consultation.consultationStatus}
                    </span>
                </div>
            </div>
        </div>

        <div class="bg-white shadow-md rounded-2xl p-6">
            <h3 class="text-xl font-semibold mb-4 border-b pb-2">Medical Report</h3>
            <div class="text-sm leading-relaxed">
                <c:choose>
                    <c:when test="${not empty consultation.raport}">
                        <p>${consultation.raport}</p>
                    </c:when>
                    <c:otherwise>
                        <p class="text-gray-500 italic">No medical report available yet.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>
</div>
</body>
</html>
