package com.akdital.servlet.auth;

import com.akdital.model.User;
import com.akdital.model.enums.UserType;
import com.akdital.repository.impl.PatientRepositoryImpl;
import com.akdital.repository.impl.UserRepositoryImpl;
import com.akdital.service.impl.AuthenticationServiceImpl;
import com.akdital.service.interfaces.AuthenticationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AuthenticationService authService;

    @Override
    public void init() throws ServletException {
        this.authService = new AuthenticationServiceImpl(
                new UserRepositoryImpl(),
                new PatientRepositoryImpl()
        );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Email and password are required");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

        try {
            Optional<User> userOpt = authService.login(email, password);

            if (userOpt.isPresent()) {
                User user = userOpt.get();
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("userRole", user.getRole());

                if (user.getRole() == UserType.ADMIN) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else if (user.getRole() == UserType.DOCTOR) {
                    response.sendRedirect(request.getContextPath() + "/doctor/dashboard");
                } else if (user.getRole() == UserType.PATIENT) {
                    response.sendRedirect(request.getContextPath() + "/patient/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?error=invalid_role");
                }
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            request.setAttribute("error", "Login failed: " + ex.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }
}