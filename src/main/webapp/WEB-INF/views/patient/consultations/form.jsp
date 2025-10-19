<%@ page import="java.util.List" %>
<%@ page import="com.akdital.model.Department" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Department> departments = (List<Department>) request.getAttribute("departments"); %>
<html>
<head>
    <title>Form - Akdital system</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

</head>
<body>
<div class="flex h-screen">
    <% request.setAttribute("currentPage", "consultations"); %>
    <jsp:include page="../layout/sidebar.jsp"/>

    <main class="flex-1 overflow-y-auto">
        <% request.setAttribute("pageTitle", "Consultations Management"); %>
        <jsp:include page="../layout/header.jsp"/>
        <div class="max-w-4xl mx-auto px-4 py-10">
            <div class="bg-white rounded-lg shadow-lg p-8 h-max">
                <form action="<%= request.getContextPath() %>/patient/consultations" method="post"
                      id="consultationForm">
                    <input type="hidden" name="action" value="create" />
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Book Your Consultation</h2>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <!-- Department -->
                        <div class="mb-6">
                            <label class="block text-gray-700 font-medium mb-2">Department</label>
                            <select id="department" name="department_id"
                                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                    required>
                                <option value="">Choose a department...</option>
                                <% if (!departments.isEmpty()) {
                                    for (Department department : departments) {
                                %>
                                <option value=<%= department.getDepartmentId()%>><%= department.getName()%>
                                </option>
                                <% }
                                }%>
                            </select>
                        </div>

                        <!-- Doctor -->
                        <div class="mb-6">
                            <label class="block text-gray-700 font-medium mb-2">Doctor</label>
                            <select id="doctor" name="doctor_id"
                                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                    required>
                                <option value="">Choose a doctor...</option>
                            </select>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <div class="mb-6">
                        <label class="block text-gray-700 font-medium mb-2">Consultation Date</label>
                        <input type="text" name="date" id="consultationDate"
                               placeholder="Select date"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        >
                    </div>
                    </div>

                    <!-- Time Slot -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-medium mb-2">Time Slot</label>
                        <input type="hidden" name="time" id="selectedTime" required>

                        <!-- Initial placeholder -->
                        <div id="timeSlotsPlaceholder"
                             class="text-center py-8 text-gray-400 border-2 border-dashed border-gray-300 rounded-lg">
                            <i class="fas fa-clock text-3xl mb-3"></i>
                            <p>Please select a doctor and date to see available time slots</p>
                        </div>

                        <!-- Time slots container (hidden by default) -->
                        <div id="timeSlotsContainer" class="hidden mt-4">
                            <!-- Morning Section -->
                            <div class="mb-6">
                                <h3 class="text-lg font-semibold text-gray-700 mb-3">Morning</h3>
                                <div class="grid grid-cols-4 md:grid-cols-6 gap-3" id="morningSlots">
                                    <!-- Morning slots will be populated here -->
                                </div>
                            </div>

                            <!-- Afternoon Section -->
                            <div class="mb-6">
                                <h3 class="text-lg font-semibold text-gray-700 mb-3">Afternoon</h3>
                                <div class="grid grid-cols-4 md:grid-cols-6 gap-3" id="afternoonSlots">
                                    <!-- Afternoon slots will be populated here -->
                                </div>
                            </div>
                        </div>

                        <!-- Loading state -->
                        <div id="timeSlotsLoading" class="hidden text-center py-8">
                            <div class="inline-flex items-center">
                                <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-blue-600"
                                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor"
                                            stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor"
                                          d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                                Loading available time slots...
                            </div>
                        </div>

                        <!-- Error state -->
                        <div id="timeSlotsError"
                             class="hidden text-center py-8 text-red-600 border border-red-200 rounded-lg bg-red-50">
                            <i class="fas fa-exclamation-triangle text-xl mb-2"></i>
                            <p>Error loading time slots. Please try again.</p>
                        </div>

                        <!-- No slots available -->
                        <div id="timeSlotsEmpty"
                             class="hidden text-center py-8 text-gray-500 border border-gray-200 rounded-lg bg-gray-50">
                            <i class="fas fa-calendar-times text-xl mb-2"></i>
                            <p>No available time slots for selected date.</p>
                        </div>
                    </div>

                    <button type="submit"
                            class="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition duration-200">
                        Book Consultation
                    </button>
                </form>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>

    flatpickr("#consultationDate", {
        dateFormat: "Y-m-d",
        minDate: new Date(),
        disable: [
            function(date) {
                const now = new Date();
                if (
                    date.getFullYear() === now.getFullYear() &&
                    date.getMonth() === now.getMonth() &&
                    date.getDate() === now.getDate()
                ) {
                    return now.getHours() > 16 || (now.getHours() === 16 && now.getMinutes() > 30);
                }
                return false;
            }
        ]
    });




    let selectedTimeSlot = null;

    document.getElementById('department').addEventListener('change', function () {
        const depId = this.value;
        const doctorSelect = document.getElementById('doctor');

        if (!depId) {
            doctorSelect.innerHTML = '<option value="">Choose a doctor...</option>';
            clearTimeSlots();
            return;
        }

        fetch("/app/patient/consultations/doctors?department_id=" + depId)
            .then(res => res.text())
            .then(html => {
                doctorSelect.innerHTML = html;
                clearTimeSlots();
            });
    });

    document.getElementById('doctor').addEventListener('change', updateTimeSlots);
    document.getElementById('consultationDate').addEventListener('change', updateTimeSlots);

    function updateTimeSlots() {
        const doctorId = document.getElementById("doctor").value;
        const date = document.getElementById("consultationDate").value;

        if (!doctorId || !date) {
            clearTimeSlots();
            return;
        }

        showLoadingState();

        const url = '/app/patient/consultations/times?doctor_id=' + encodeURIComponent(doctorId) + '&date=' + encodeURIComponent(date);

        fetch(url)
            .then(res => {
                if (!res.ok) throw new Error('Network response was not ok');
                return res.text();
            })
            .then(html => {
                // Parse the HTML to extract time options
                const parser = new DOMParser();
                const doc = parser.parseFromString(html, 'text/html');
                const options = doc.querySelectorAll('option[value]');
                const times = Array.from(options)
                    .map(option => option.value)
                    .filter(value => value !== '');

                displayTimeSlots(times);
            })
            .catch(err => {
                console.error("Error:", err);
                showErrorState();
            });
    }

    function displayTimeSlots(times) {
        clearTimeSlots();

        if (times.length === 0) {
            showEmptyState();
            return;
        }

        // Clear the slots containers
        document.getElementById('morningSlots').innerHTML = '';
        document.getElementById('afternoonSlots').innerHTML = '';

        // Group times by period
        const morningSlots = [];
        const afternoonSlots = [];

        times.forEach(time => {
            const [hours] = time.split(':');
            const hour = parseInt(hours);

            if (hour < 12) {
                morningSlots.push(time);
            } else {
                afternoonSlots.push(time);
            }
        });

        // Create time slot buttons
        createTimeSlotButtons(morningSlots, 'morningSlots');
        createTimeSlotButtons(afternoonSlots, 'afternoonSlots');

        // Show the container and hide placeholder
        document.getElementById('timeSlotsPlaceholder').classList.add('hidden');
        document.getElementById('timeSlotsContainer').classList.remove('hidden');
    }

    function createTimeSlotButtons(times, containerId) {
        const container = document.getElementById(containerId);

        if (times.length === 0) {
            container.innerHTML = '<div class="col-span-full text-center py-4 text-gray-500 text-sm">No slots available</div>';
            return;
        }

        times.forEach(time => {
            const button = document.createElement('button');
            button.type = 'button';
            button.className = 'py-3 px-2 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 hover:border-blue-300 transition duration-200 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50';
            button.textContent = time;
            button.dataset.time = time;

            button.addEventListener('click', function () {
                selectTimeSlot(this);
            });

            container.appendChild(button);
        });
    }

    function selectTimeSlot(button) {
        // Remove selected class from previously selected button
        if (selectedTimeSlot) {
            selectedTimeSlot.classList.remove('bg-blue-600', 'text-white', 'border-blue-600', 'hover:bg-blue-700');
            selectedTimeSlot.classList.add('bg-white', 'text-gray-700', 'border-gray-300', 'hover:bg-gray-50', 'hover:border-blue-300');
        }

        // Add selected class to current button
        button.classList.remove('bg-white', 'text-gray-700', 'border-gray-300', 'hover:bg-gray-50', 'hover:border-blue-300');
        button.classList.add('bg-blue-600', 'text-white', 'border-blue-600', 'hover:bg-blue-700');

        // Update selected time
        selectedTimeSlot = button;
        document.getElementById('selectedTime').value = button.dataset.time;
    }

    function clearTimeSlots() {
        document.getElementById('morningSlots').innerHTML = '';
        document.getElementById('afternoonSlots').innerHTML = '';
        document.getElementById('selectedTime').value = '';
        selectedTimeSlot = null;

        // Show placeholder and hide container
        document.getElementById('timeSlotsPlaceholder').classList.remove('hidden');
        document.getElementById('timeSlotsContainer').classList.add('hidden');

        // Hide other states
        hideAllStates();
    }

    function showLoadingState() {
        hideAllStates();
        document.getElementById('timeSlotsPlaceholder').classList.add('hidden');
        document.getElementById('timeSlotsLoading').classList.remove('hidden');
    }

    function showErrorState() {
        hideAllStates();
        document.getElementById('timeSlotsPlaceholder').classList.add('hidden');
        document.getElementById('timeSlotsError').classList.remove('hidden');
    }

    function showEmptyState() {
        hideAllStates();
        document.getElementById('timeSlotsPlaceholder').classList.add('hidden');
        document.getElementById('timeSlotsEmpty').classList.remove('hidden');
    }

    function hideAllStates() {
        document.getElementById('timeSlotsLoading').classList.add('hidden');
        document.getElementById('timeSlotsError').classList.add('hidden');
        document.getElementById('timeSlotsEmpty').classList.add('hidden');
    }

    // Form validation
    document.getElementById('consultationForm').addEventListener('submit', function (e) {
        if (!document.getElementById('selectedTime').value) {
            e.preventDefault();
            alert('Please select a time slot');
        }
    });
</script>
</body>
</html>