package com.akdital.servlet.admin;

import com.akdital.model.Department;
import com.akdital.model.Doctor;
import com.akdital.model.Room;
import com.akdital.model.enums.GenderType;
import com.akdital.repository.impl.DepartmentRepositoryImpl;
import com.akdital.repository.impl.DoctorRepositoryImpl;
import com.akdital.repository.impl.RoomRepositoryImpl;
import com.akdital.service.impl.DepartmentServiceImpl;
import com.akdital.service.impl.DoctorServiceImpl;
import com.akdital.service.impl.RoomServiceImpl;
import com.akdital.service.interfaces.DepartmentService;
import com.akdital.service.interfaces.DoctorService;
import com.akdital.service.interfaces.RoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/admin/doctors/*")
public class DoctorServlet extends HttpServlet {

    private DoctorService doctorService;
    private DepartmentService departmentService;
    private RoomService roomService;

    @Override
    public void init() throws ServletException {
        this.doctorService = new DoctorServiceImpl(new DoctorRepositoryImpl());
        this.departmentService = new DepartmentServiceImpl(new DepartmentRepositoryImpl());
        this.roomService = new RoomServiceImpl(new RoomRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            listDoctors(req, resp);
        } else if (pathInfo.equals("/new")) {
            listDepartments(req, resp);
            listRooms(req, resp);
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);


        } else if (pathInfo.startsWith("/edit/")) {
            String doctorId = pathInfo.substring(6);
            Optional<Doctor> doctor = doctorService.getDoctor(doctorId);
            req.setAttribute("doctorOldData", doctor);
            req.setAttribute("doctorId", doctorId);
            listDepartments(req, resp);
            listRooms(req, resp);
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);

        } else if (pathInfo.startsWith("/view/")) {
            String doctorId = pathInfo.substring(6);
            Optional<Doctor> doctor = doctorService.getDoctor(doctorId);

            req.setAttribute("doctorId", doctorId);
            req.setAttribute("doctor", doctor);
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/view.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/delete/")) {
            String doctorId = pathInfo.substring(8);
            deleteDoctor(req, resp, doctorId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("create".equals(action)) {
            createDoctor(req, resp);
        } else if ("update".equals(action)) {
            updateDoctor(req, resp);
        }
    }

    private void createDoctor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fName = req.getParameter("first-name");
        String lName = req.getParameter("last-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String speciality = req.getParameter("speciality");
        String depId = req.getParameter("department_id");
        String roomId = req.getParameter("room_id");

        if (fName == null || lName == null || email == null || password == null || phone == null || gender == null || speciality == null || depId == null || roomId == null || fName.isEmpty() || lName.isEmpty() || email.isEmpty() || password.isEmpty() || phone.isEmpty() || gender.isEmpty() || speciality.isEmpty() || depId.isEmpty() || roomId.isEmpty()) {
            req.setAttribute("error", "All fields are required!");
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
            return;
        }

        Optional<Department> department = departmentService.getDepartment(depId);
        if (department.isEmpty()) {
            req.setAttribute("error", "Department not found");
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
            return;
        }

        Optional<Room> room = roomService.getRoom(roomId);
        if (room.isEmpty()) {
            req.setAttribute("error", "Room not found");
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
            return;
        }

        try {
            GenderType genderType = GenderType.valueOf(gender.toUpperCase());
            Doctor doctor = new Doctor(email, fName, lName, password, phone, genderType, department.get(), room.get(), speciality);
            doctorService.createDoctor(doctor);
            resp.sendRedirect(req.getContextPath() + "/admin/doctors?success=created");
        } catch (Exception e) {
            req.setAttribute("error", "Failed to create doctor: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
        }
    }

    private void updateDoctor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String doctorId = req.getParameter("doctorId");
        Optional<Doctor> doctorOldData = doctorService.getDoctor(doctorId);
        if (doctorOldData.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/doctors?error=notfound");
            return;
        }

        Optional<Department> department = departmentService.getDepartment(req.getParameter("department_id"));
        if (department.isEmpty()) {
            req.setAttribute("error", "Department not found");
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
            return;
        }

        Optional<Room> room = roomService.getRoom(req.getParameter("room_id"));
        if (room.isEmpty()) {
            req.setAttribute("error", "Room not found");
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
            return;
        }

        Doctor doctor = new Doctor();
        doctor.setUserId(doctorId);
        doctor.setFirstName(req.getParameter("first-name"));
        doctor.setLastName(req.getParameter("last-name"));
        doctor.setEmail(req.getParameter("email"));
        doctor.setPassword(req.getParameter("password"));
        doctor.setPhone(req.getParameter("phone"));
        doctor.setGender(GenderType.valueOf(req.getParameter("gender").toUpperCase()));
        doctor.setSpeciality(req.getParameter("speciality"));
        doctor.setRole(doctorOldData.get().getRole());
        doctor.setDepartment(department.get());
        doctor.setRoom(room.get());

        try {
            doctorService.updateDoctor(doctor);
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/?success=updated");
        } catch (Exception ex) {
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/edit/" + doctorId + "?error=" + ex.getMessage());
        }
    }

    private void deleteDoctor(HttpServletRequest req, HttpServletResponse resp, String doctorId) throws ServletException, IOException {
        try {
            Boolean isDeleted = doctorService.deleteDoctor(doctorId);
            if (isDeleted) resp.sendRedirect(req.getContextPath() + "/admin/doctors/?success=deleted");
        } catch (Exception ex) {
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/?error=" + ex.getMessage());
        }
    }

    private void listDoctors(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Doctor> doctors = doctorService.getAllDoctors();
        req.setAttribute("doctors", doctors);
        req.getRequestDispatcher("/WEB-INF/views/admin/doctors/list.jsp").forward(req, resp);
    }

    private void listDepartments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Department> departments = departmentService.getAllDepartments();
        request.setAttribute("departments", departments);
    }

    private void listRooms(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> rooms = roomService.getAllRooms();
        request.setAttribute("rooms", rooms);
    }
}