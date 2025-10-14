package com.akdital.servlet.admin;

import com.akdital.model.Department;
import com.akdital.repository.impl.DepartmentRepositoryImpl;
import com.akdital.repository.impl.DoctorRepositoryImpl;
import com.akdital.service.impl.DepartmentServiceImpl;
import com.akdital.service.interfaces.DepartmentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/admin/departments/*")
public class DepartmentServlet extends HttpServlet {

    private DepartmentService departmentService;

    @Override
    public void init() throws ServletException {
        this.departmentService = new DepartmentServiceImpl(new DepartmentRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            listDepartments(req, resp);
        } else if (pathInfo.equals("/new")) {
            req.getRequestDispatcher("/WEB-INF/views/admin/departments/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/edit/")) {
            String departmentId = pathInfo.substring(6);
            req.setAttribute("departmentId", departmentId);
            req.getRequestDispatcher("/WEB-INF/views/admin/departments/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/view/")) {
            String departmentId = pathInfo.substring(6);

            req.getRequestDispatcher("/WEB-INF/views/admin/departments/view.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/delete/")) {
            String departmentId = pathInfo.substring(8);
            deleteDepartment(req, resp, departmentId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            createDepartment(req, resp);
        } else if ("update".equals(action)) {
            resp.sendRedirect(req.getContextPath() + "/admin/departments/?success=updated");
        }
    }

    private void listDepartments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Department> departments = departmentService.getAllDepartments();
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/WEB-INF/views/admin/departments/list.jsp").forward(request, response);
    }

    private void createDepartment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dName = request.getParameter("name");
        String dDescription = request.getParameter("description");
        if (dName == null || dName.trim().isEmpty() || dDescription == null || dDescription.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required! Please fill them in.");
            request.getRequestDispatcher("/admin/departments/new.jsp").forward(request, response);
            return;
        }
        Department department = new Department(dName, dDescription);
        try {
            departmentService.createDepartment(department);
            response.sendRedirect(request.getContextPath() + "/admin/departments/");
        } catch (Exception ex) {
            request.setAttribute("error", "Failed to create department. Please try again.");
            request.getRequestDispatcher("/admin/departments/new.jsp").forward(request, response);
        }

    }

    private void deleteDepartment(HttpServletRequest request, HttpServletResponse response, String depId) throws ServletException, IOException {
        Optional<Department> department = departmentService.getDepartment(depId);
        try {
            if (department.isPresent()) {
                departmentService.deleteDepartment(depId);
                response.sendRedirect(request.getContextPath() + "/admin/departments/");
            }
        } catch (Exception eex) {
            response.sendRedirect(request.getContextPath() + "/admin/departments/");
        }

    }
}