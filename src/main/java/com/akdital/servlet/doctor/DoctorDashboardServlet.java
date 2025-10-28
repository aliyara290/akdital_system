package com.akdital.servlet.doctor;

import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.repository.impl.ConsultationRepositoryImpl;
import com.akdital.repository.impl.DoctorRepositoryImpl;
import com.akdital.service.impl.ConsultationServiceImpl;
import com.akdital.service.impl.DoctorServiceImpl;
import com.akdital.service.interfaces.ConsultationService;
import com.akdital.service.interfaces.DoctorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet("/doctor/dashboard")
public class DoctorDashboardServlet extends HttpServlet {

    private DoctorService doctorService;
    private ConsultationService consultationService;

    @Override
    public void init() throws ServletException {
        this.doctorService = new DoctorServiceImpl(new DoctorRepositoryImpl());
        this.consultationService = new ConsultationServiceImpl(new ConsultationRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String userId = (String) session.getAttribute("userId");

        try {
            Optional<Doctor> doctorOpt = doctorService.getDoctor(userId);

            if (doctorOpt.isPresent()) {
                Doctor doctor = doctorOpt.get();
                List<Consultation> allConsultations = consultationService.getAllConsultations();

                List<Consultation> doctorConsultations = allConsultations.stream()
                        .filter(c -> c.getDoctor().getUserId().equals(userId))
                        .collect(Collectors.toList());

                req.setAttribute("doctor", doctor);
                req.setAttribute("consultations", doctorConsultations);
                req.setAttribute("totalConsultations", doctorConsultations.size());

                req.getRequestDispatcher("/WEB-INF/views/doctor/dashboard.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/login");
            }
        } catch (Exception ex) {
            req.setAttribute("error", "Error loading dashboard");
            req.getRequestDispatcher("/WEB-INF/views/doctor/dashboard.jsp").forward(req, resp);
        }
    }
}