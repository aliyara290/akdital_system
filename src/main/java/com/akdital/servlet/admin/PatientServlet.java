package com.akdital.servlet.admin;

import com.akdital.model.Patient;
import com.akdital.model.enums.GenderType;
import com.akdital.model.enums.UserType;
import com.akdital.repository.impl.PatientRepositoryImpl;
import com.akdital.service.impl.PatientServiceImpl;
import com.akdital.service.interfaces.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/admin/patients/*")
public class PatientServlet extends HttpServlet {

    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        patientService = new PatientServiceImpl(new PatientRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            listPatients(req, resp);
        } else if (pathInfo.equals("/new")) {
            req.getRequestDispatcher("/WEB-INF/views/admin/patients/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/edit/")) {
            String patientId = pathInfo.substring(6);
            Optional<Patient> patient = patientService.getPatient(patientId);
            req.setAttribute("patientOldData", patient);
            req.setAttribute("patientId", patientId);
            req.getRequestDispatcher("/WEB-INF/views/admin/patients/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/view/")) {
            String patientId = pathInfo.substring(6);
            Optional<Patient> patient = patientService.getPatient(patientId);
            req.setAttribute("patientId", patientId);
            req.setAttribute("patient", patient);
            req.getRequestDispatcher("/WEB-INF/views/admin/patients/view.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/delete/")) {
            String patientId = pathInfo.substring(8);
            deletePatient(req, resp, patientId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            createPatient(req, resp);
        } else if ("update".equals(action)) {
            updatePatient(req, resp);
        }
    }

    private void listPatients(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Patient> patients = patientService.getAllPatients();
        req.setAttribute("patients", patients);
        req.getRequestDispatcher("/WEB-INF/views/admin/patients/list.jsp").forward(req, resp);
    }

    private void createPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fName = request.getParameter("first-name");
        String lName = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String heightStr = request.getParameter("height");
        String weightStr = request.getParameter("weight");

        if (fName == null || lName == null || email == null || password == null || phone == null || gender == null || heightStr == null || weightStr == null || fName.isEmpty() || lName.isEmpty() || email.isEmpty() || password.isEmpty() || phone.isEmpty() || gender.isEmpty() || heightStr.isEmpty() || weightStr.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/WEB-INF/views/admin/patients/form.jsp").forward(request, response);
            return;
        }

        try {
            double height = Double.parseDouble(heightStr);
            double weight = Double.parseDouble(weightStr);
            GenderType genderType = GenderType.valueOf(gender.toUpperCase());

            Patient patient = new Patient(email, fName, lName, password, phone, genderType, height, weight);
            patientService.createPatient(patient);
            response.sendRedirect(request.getContextPath() + "/admin/patients?success=created");

        } catch (Exception e) {
            request.setAttribute("error", "Failed to create patient: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/admin/patients/form.jsp").forward(request, response);
        }
    }

    private void updatePatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        Optional<Patient> patientOldData = patientService.getPatient(patientId);
        if (patientOldData.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/patients?error=notfound");
            return;
        }
        Patient patient = new Patient();
        patient.setUserId(patientId);
        patient.setFirstName(request.getParameter("first-name"));
        patient.setLastName(request.getParameter("last-name"));
        patient.setEmail(request.getParameter("email"));
        patient.setPassword(request.getParameter("password"));
        patient.setPhone(request.getParameter("phone"));
        patient.setGender(GenderType.valueOf(request.getParameter("gender").toUpperCase()));
        patient.setHeight(Double.parseDouble(request.getParameter("height")));
        patient.setWeight(Double.parseDouble(request.getParameter("weight")));
        patient.setRole(patientOldData.get().getRole());

        try {
            patientService.updatePatient(patient);
            response.sendRedirect(request.getContextPath() + "/admin/patients/?success=updated");
        } catch (Exception ex) {
            response.sendRedirect(request.getContextPath() + "/admin/patients/edit/" + patientId + "?error=" + ex.getMessage());
        }
    }

    private void deletePatient(HttpServletRequest request, HttpServletResponse response, String patientId) throws ServletException, IOException {
        try {
            Boolean isDeleted = patientService.deletePatient(patientId);
            if (isDeleted) response.sendRedirect(request.getContextPath() + "/admin/patients/?success=deleted");
        } catch (Exception ex) {
            response.sendRedirect(request.getContextPath() + "/admin/patients/?error=" + ex.getMessage());
        }
    }

}
