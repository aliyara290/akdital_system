<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Consultation - Akidital System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp" />

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Consultation Details"); %>
        <jsp:include page="../layout/header.jsp" />

        <div class="p-6">
            <div class="max-w-6xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-8 mb-6">
                    <div class="flex justify-between items-start mb-6">
                        <div>
                            <h2 class="text-3xl font-bold text-gray-800">Consultation #C001</h2>
                            <p class="text-gray-600 mt-2">
                                <i class="fas fa-calendar mr-2"></i>October 12, 2025 at 09:00 AM
                            </p>
                            <span class="inline-block mt-3 px-3 py-1 bg-green-100 text-green-800 text-sm font-semibold rounded-full">
                                    <i class="fas fa-check-circle"></i> Validated
                                </span>
                        </div>
                        <div class="flex gap-2">
                            <a href="<%= request.getContextPath() %>/admin/consultations/edit/1"
                               class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-edit mr-2"></i>Edit
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/consultations/"
                               class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded-lg transition-colors">
                                <i class="fas fa-arrow-left mr-2"></i>Back
                            </a>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
                            <i class="fas fa-user text-blue-600 mr-2"></i>
                            Patient Information
                        </h3>
                        <div class="space-y-3">
                            <div class="flex items-center">
                                <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mr-3">
                                    <i class="fas fa-user text-blue-600"></i>
                                </div>
                                <div>
                                    <p class="font-medium text-gray-800">John Doe</p>
                                    <p class="text-sm text-gray-600">Male, 35 years</p>
                                </div>
                            </div>
                            <div class="pt-3 border-t border-gray-200">
                                <p class="text-sm text-gray-600 mb-1">Email</p>
                                <p class="text-sm text-gray-900">john.doe@email.com</p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600 mb-1">Height / Weight</p>
                                <p class="text-sm text-gray-900">175 cm / 75.5 kg</p>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
                            <i class="fas fa-user-md text-green-600 mr-2"></i>
                            Doctor Information
                        </h3>
                        <div class="space-y-3">
                            <div class="flex items-center">
                                <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mr-3">
                                    <i class="fas fa-user-md text-green-600"></i>
                                </div>
                                <div>
                                    <p class="font-medium text-gray-800">Dr. Smith Williams</p>
                                    <p class="text-sm text-gray-600">Cardiology</p>
                                </div>
                            </div>
                            <div class="pt-3 border-t border-gray-200">
                                <p class="text-sm text-gray-600 mb-1">Department</p>
                                <p class="text-sm text-gray-900">Cardiology Department</p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600 mb-1">Speciality</p>
                                <p class="text-sm text-gray-900">Cardiology Specialist</p>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
                            <i class="fas fa-door-open text-purple-600 mr-2"></i>
                            Room Information
                        </h3>
                        <div class="space-y-3">
                            <div class="flex items-center">
                                <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center mr-3">
                                    <i class="fas fa-door-open text-purple-600"></i>
                                </div>
                                <div>
                                    <p class="font-medium text-gray-800">Room 101</p>
                                    <p class="text-sm text-gray-600">First Floor</p>
                                </div>
                            </div>
                            <div class="pt-3 border-t border-gray-200">
                                <p class="text-sm text-gray-600 mb-1">Status</p>
                                <span class="inline-block px-2 py-1 bg-green-100 text-green-800 text-xs font-semibold rounded-full">
                                        Available
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-lg p-8">
                    <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
                        <i class="fas fa-file-medical text-red-600 mr-2"></i>
                        Medical Report
                    </h3>
                    <div class="bg-gray-50 rounded-lg p-6">
                        <p class="text-gray-700 leading-relaxed">
                            Patient presented with chest discomfort and shortness of breath.
                            Physical examination revealed regular heart rate and rhythm.
                            ECG showed normal sinus rhythm. Blood pressure 120/80 mmHg.
                        </p>
                        <div class="mt-4 pt-4 border-t border-gray-200">
                            <h4 class="font-bold text-gray-800 mb-2">Diagnosis:</h4>
                            <p class="text-gray-700">Mild anxiety-related symptoms. No cardiac abnormalities detected.</p>
                        </div>
                        <div class="mt-4 pt-4 border-t border-gray-200">
                            <h4 class="font-bold text-gray-800 mb-2">Recommendations:</h4>
                            <ul class="list-disc list-inside text-gray-700 space-y-1">
                                <li>Continue current lifestyle modifications</li>
                                <li>Stress management techniques recommended</li>
                                <li>Follow-up appointment in 3 months</li>
                                <li>Contact immediately if symptoms worsen</li>
                            </ul>
                        </div>
                        <div class="mt-4 pt-4 border-t border-gray-200">
                            <h4 class="font-bold text-gray-800 mb-2">Prescription:</h4>
                            <p class="text-gray-700">No medication prescribed at this time.</p>
                        </div>
                    </div>

                    <div class="mt-6">
                        <h4 class="font-bold text-gray-800 mb-4">Consultation Timeline</h4>
                        <div class="space-y-4">
                            <div class="flex items-start">
                                <div class="w-2 h-2 bg-blue-600 rounded-full mt-2 mr-4"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-800">Consultation Created</p>
                                    <p class="text-xs text-gray-600">Oct 10, 2025 - 02:30 PM</p>
                                </div>
                            </div>
                            <div class="flex items-start">
                                <div class="w-2 h-2 bg-green-600 rounded-full mt-2 mr-4"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-800">Status: Validated</p>
                                    <p class="text-xs text-gray-600">Oct 11, 2025 - 10:00 AM</p>
                                </div>
                            </div>
                            <div class="flex items-start">
                                <div class="w-2 h-2 bg-purple-600 rounded-full mt-2 mr-4"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-800">Scheduled for</p>
                                    <p class="text-xs text-gray-600">Oct 12, 2025 - 09:00 AM</p>
                                </div>
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