package com.akdital.servlet.patient;

import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.model.Patient;
import com.akdital.model.enums.ConsultationStatus;
import com.akdital.repository.impl.ConsultationRepositoryImpl;
import com.akdital.repository.impl.DepartmentRepositoryImpl;
import com.akdital.repository.impl.DoctorRepositoryImpl;
import com.akdital.repository.impl.PatientRepositoryImpl;
import com.akdital.service.impl.ConsultationServiceImpl;
import com.akdital.service.impl.DepartmentServiceImpl;
import com.akdital.service.impl.DoctorServiceImpl;
import com.akdital.service.impl.PatientServiceImpl;
import com.akdital.service.interfaces.ConsultationService;
import com.akdital.service.interfaces.DepartmentService;
import com.akdital.service.interfaces.DoctorService;
import com.akdital.service.interfaces.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@WebServlet("/patient/consultations/*")
public class ConsultationServlet extends HttpServlet {

    private ConsultationService consultationService;
    private PatientService patientService;
    private DepartmentService departmentService;
    private DoctorService doctorService;

    @Override
    public void init() throws ServletException {
        this.consultationService = new ConsultationServiceImpl(new ConsultationRepositoryImpl());
        this.patientService = new PatientServiceImpl(new PatientRepositoryImpl());
        this.departmentService = new DepartmentServiceImpl(new DepartmentRepositoryImpl());
        this.doctorService = new DoctorServiceImpl(new DoctorRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            req.getRequestDispatcher("/WEB-INF/views/patient/consultations/list.jsp").forward(req, resp);

        } else if (pathInfo.equals("/new")) {
            req.setAttribute("departments", departmentService.getAllDepartments());
            req.getRequestDispatcher("/WEB-INF/views/patient/consultations/form.jsp").forward(req, resp);

        } else if (pathInfo.startsWith("/view/")) {
            String consultationId = pathInfo.substring(6);
            req.setAttribute("consultationId", consultationId);
            req.getRequestDispatcher("/WEB-INF/views/patient/consultations/view.jsp").forward(req, resp);

        } else if (pathInfo.equals("/doctors")) {
            String depId = req.getParameter("department_id");
            List<Doctor> doctors = getDoctorsByDepId(depId);

            resp.setContentType("text/html");
            StringBuilder options = new StringBuilder();
            for (Doctor d : doctors) {
                options.append("<option value='")
                        .append(d.getUserId())
                        .append("'>").append(d.getFirstName()).append(" ").append(d.getLastName())
                        .append("</option>");
            }
            resp.getWriter().write(options.toString());
        } else if (pathInfo.equals("/times")) {
            String doctorId = req.getParameter("doctor_id");
            LocalDate date = LocalDate.parse(req.getParameter("date"));
            List<LocalTime> times = consultationService.getAvailableTimes(doctorId, date);

            resp.setContentType("text/html");
            StringBuilder options = new StringBuilder();
            for (LocalTime t : times) {
                options.append("<option value='").append(t).append("'>")
                        .append(t.toString())
                        .append("</option>");
            }
            resp.getWriter().write(options.toString());
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            bookConsultation(req, resp);
            resp.sendRedirect(req.getContextPath() + "/patient/consultations/?success=created");

        } else if ("update".equals(action)) {
            bookConsultation(req, resp);
            resp.sendRedirect(req.getContextPath() + "/patient/consultations/?success=updated");
        }
    }

    private void bookConsultation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Optional<Patient> patient = patientService.getPatient("1fbb3df2-cc17-4703-acd5-d4186ba9c44d");
        Optional<Doctor> doctor = doctorService.getDoctor(req.getParameter("doctor_id"));
        LocalDate date = LocalDate.parse(req.getParameter("date"));
        LocalTime time = LocalTime.parse(req.getParameter("time"));
        ConsultationStatus status = ConsultationStatus.RESERVED;

        if (doctor.isPresent() && patient.isPresent()) {
            Consultation consultation = new Consultation(status, date, doctor.get(), patient.get(), "", doctor.get().getRoom(), time);
            try {
                consultationService.bookConsultation(consultation);
            } catch (Exception ex) {
                req.setAttribute("error", ex.getMessage());
                req.getRequestDispatcher("/WEB-INF/views/patient/consultations/form.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "Doctor or patient not found");
            req.getRequestDispatcher("/WEB-INF/views/patient/consultations/form.jsp").forward(req, resp);
        }
    }

    private List<Doctor> getDoctorsByDepId(String depId) {
        if (depId == null || depId.isEmpty()) return List.of();
        return consultationService.getDoctorsByDepartmentId(depId);
    }
}
