package com.akdital.servlet.doctor;

import com.akdital.model.Consultation;
import com.akdital.model.enums.ConsultationStatus;
import com.akdital.repository.impl.ConsultationRepositoryImpl;
import com.akdital.service.impl.ConsultationServiceImpl;
import com.akdital.service.interfaces.ConsultationService;
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

@WebServlet("/doctor/consultations/*")
public class DoctorConsultationServlet extends HttpServlet {

    private ConsultationService consultationService;

    @Override
    public void init() throws ServletException {
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
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            listConsultations(req, resp, userId);
        } else if (pathInfo.startsWith("/edit/")) {
            String consultationId = pathInfo.substring(6);
            showEditForm(req, resp, consultationId);
        } else if (pathInfo.startsWith("/view/")) {
            String consultationId = pathInfo.substring(6);
            viewConsultation(req, resp, consultationId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("update".equals(action)) {
            updateConsultation(req, resp);
        }
    }

    private void listConsultations(HttpServletRequest req, HttpServletResponse resp, String userId) throws ServletException, IOException {
        List<Consultation> allConsultations = consultationService.getAllConsultations();
        List<Consultation> doctorConsultations = allConsultations.stream()
                .filter(c -> c.getDoctor().getUserId().equals(userId))
                .collect(Collectors.toList());

        req.setAttribute("consultations", doctorConsultations);
        req.getRequestDispatcher("/WEB-INF/views/doctor/consultations/list.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp, String consultationId) throws ServletException, IOException {
        Optional<Consultation> consultation = consultationService.getConsultation(consultationId);

        if (consultation.isPresent()) {
            req.setAttribute("consultation", consultation.get());
            req.getRequestDispatcher("/WEB-INF/views/doctor/consultations/edit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/doctor/consultations/?error=notfound");
        }
    }

    private void viewConsultation(HttpServletRequest req, HttpServletResponse resp, String consultationId) throws ServletException, IOException {
        Optional<Consultation> consultation = consultationService.getConsultation(consultationId);

        if (consultation.isPresent()) {
            req.setAttribute("consultation", consultation.get());
            req.getRequestDispatcher("/WEB-INF/views/doctor/consultations/view.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/doctor/consultations/?error=notfound");
        }
    }

    private void updateConsultation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String consultationId = req.getParameter("consultationId");
        String raport = req.getParameter("raport");
        String status = req.getParameter("status");

        try {
            Optional<Consultation> consultationOpt = consultationService.getConsultation(consultationId);

            if (consultationOpt.isPresent()) {
                Consultation consultation = consultationOpt.get();
                consultation.setRaport(raport);
                consultation.setConsultationStatus(ConsultationStatus.valueOf(status));

                consultationService.updateConsultation(consultation);
                resp.sendRedirect(req.getContextPath() + "/doctor/consultations/?success=updated");
            } else {
                resp.sendRedirect(req.getContextPath() + "/doctor/consultations/?error=notfound");
            }
        } catch (Exception ex) {
            resp.sendRedirect(req.getContextPath() + "/doctor/consultations/edit/" + consultationId + "?error=" + ex.getMessage());
        }
    }
}