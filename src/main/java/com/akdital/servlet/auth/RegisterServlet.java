package com.akdital.servlet.auth;

import com.akdital.model.Patient;
import com.akdital.model.enums.GenderType;
import com.akdital.repository.impl.PatientRepositoryImpl;
import com.akdital.repository.impl.UserRepositoryImpl;
import com.akdital.service.impl.AuthenticationServiceImpl;
import com.akdital.service.interfaces.AuthenticationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

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
        request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gender = request.getParameter("gender");
        String heightStr = request.getParameter("height");
        String weightStr = request.getParameter("weight");

        if (firstName == null || lastName == null || email == null || phone == null ||
                password == null || confirmPassword == null || gender == null ||
                heightStr == null || weightStr == null ||
                firstName.trim().isEmpty() || lastName.trim().isEmpty() || email.trim().isEmpty() ||
                phone.trim().isEmpty() || password.trim().isEmpty() || gender.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }

        try {
            double height = Double.parseDouble(heightStr);
            double weight = Double.parseDouble(weightStr);
            GenderType genderType = GenderType.valueOf(gender.toUpperCase());

            Patient patient = authService.registerPatient(
                    email, firstName, lastName, password, phone, genderType, height, weight
            );

            response.sendRedirect(request.getContextPath() + "/login?registered=success");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid height or weight value");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        } catch (RuntimeException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        }
    }
}