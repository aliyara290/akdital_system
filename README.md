# Akdital System

Akdital System is a Java EE web application designed to digitalize the management of a private clinic. It provides patients, doctors, and the administration with a reliable, user-friendly, and secure platform to manage consultations, schedules, and medical records, while ensuring full supervision of clinic activities and resources.

[GitHub Repository](https://github.com/aliyara290/akdital_system.git)

---

## Table of Contents

- [Project Context](#project-context)
- [Features](#features)
    - [For Patients](#for-patients)
    - [For Doctors](#for-doctors)
    - [For Administration](#for-administration)
- [Entity Modeling](#entity-modeling)
- [Technical Architecture & Technologies](#technical-architecture--technologies)
    - [Backend](#backend)
    - [Frontend](#frontend)
    - [Session Management & Security](#session-management--security)
- [Testing](#testing)

---

## Project Context

The organization wants to digitalize the management of a private clinic. The goal is to provide patients, doctors, and the administration with a reliable, easy-to-use, and secure tool to manage consultations, schedules, and medical records, while ensuring full supervision of clinic activities and resources.

As a Java EE developer, you are responsible for designing and developing a JEE web application following object-oriented best practices and a professional layered architecture (MVC), enabling business process automation and centralized data management.

---

## Features

### For Patients
- Create and manage a patient account
- View a list of available doctors by department (e.g., Cardiology, Dermatology)
- Book appointments with doctors:
    - Input: date, desired time, consultation reason
    - System creates consultation with status `RESERVED` and blocks the 30-minute time slot
- Cancel or modify reservations
- View history of consultations and diagnostics

### For Doctors
- View consultation schedule (reservations)
- Approve or reject patient reservations
- Conduct consultations and input medical reports (diagnosis, treatment)
- Update consultation status (`RESERVED`, `APPROVED`, `CANCELLED`, `COMPLETED`)
- Access patients’ medical history

### For Administration
- Manage departments (add, edit, delete)
- Manage doctors and their department assignments
- Manage rooms and optimize 30-minute slots:
    - Each room can host only one consultation per slot
    - Automatic availability check
- Supervise all reservations and consultations
- Generate global statistics (number of patients, consultations, room occupancy rate)

---

## Entity Modeling

- **Person (abstract)**: `firstName`, `lastName`, `email`, `password`
- **Patient**: `idPatient`, `weight`, `height`, `consultations`
- **Doctor**: `idDoctor`, `specialty`, `department`, `schedule`
- **Department**: `idDepartment`, `name`, `doctors`
- **Room**: `idRoom`, `name`, `capacity`, `occupiedSlots`
- **Consultation**: `idConsultation`, `date`, `time`, `status` (Enum), `report`, `patient`, `doctor`, `room`

---

## Technical Architecture & Technologies

### Backend
- MVC architecture (Repository / Service / Controller / View)
- Relational database: MySQL or PostgreSQL
- JPA / Hibernate for entity persistence
- Java EE / Jakarta EE (Servlets, JSP)
- Java Time API for consultation date and time management
- Exception handling: double bookings, unavailable room, patient/doctor not found

### Frontend
- JSP (JavaServer Pages) for dynamic views
- JSTL (JSP Standard Tag Library) for presentation logic:
    - `<c:forEach>` for lists (doctors, consultations, departments)
    - `<c:if>` and `<c:choose>` for conditional rendering
    - `<fmt:formatDate>` for date formatting
- CSS / Tailwind / Bootstrap for responsive styling
- Optional JavaScript for client-side validation and UX improvements

### Session Management & Security
- `HttpSession` for authentication:
    - `session.setAttribute("loggedInUser", user)`
    - `session.getAttribute("loggedInUser")`
    - `${sessionScope.loggedInUser}` in JSP
- User roles stored for access control (`PATIENT`, `DOCTOR`, `ADMIN`)
- Servlet Filters for security:
    - Redirect to login if session is null
    - Control access based on role
- Logout: `session.invalidate()`

---

## Testing
- Unit testing with **JUnit**
- Mocking dependencies with **Mockito**

---

## Repository
Clone the project:

```bash
git clone https://github.com/aliyara290/akdital_system.git
