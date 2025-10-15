package com.akdital.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/doctors/*")
public class DoctorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/list.jsp").forward(req, resp);
        } else if (pathInfo.equals("/new")) {
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/edit/")) {
            String doctorId = pathInfo.substring(6);
            req.setAttribute("doctorId", doctorId);
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/view/")) {
            String doctorId = pathInfo.substring(6);
            req.setAttribute("doctorId", doctorId);
            req.getRequestDispatcher("/WEB-INF/views/admin/doctors/view.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/delete/")) {
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/?success=deleted");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/?success=created");
        } else if ("update".equals(action)) {
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/?success=updated");
        }
    }
}