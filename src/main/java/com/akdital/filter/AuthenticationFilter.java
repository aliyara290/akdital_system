package com.akdital.filter;

import com.akdital.model.enums.UserType;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String path = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        // Allow access to public resources
        if (path.startsWith(contextPath + "/login") ||
                path.startsWith(contextPath + "/register") ||
                path.startsWith(contextPath + "/css/") ||
                path.startsWith(contextPath + "/js/") ||
                path.startsWith(contextPath + "/images/") ||
                path.equals(contextPath + "/") ||
                path.equals(contextPath)) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = httpRequest.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("userId") == null) {
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        // Check role-based access
        UserType userRole = (UserType) session.getAttribute("userRole");

        if (path.startsWith(contextPath + "/admin/") && userRole != UserType.ADMIN) {
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        if (path.startsWith(contextPath + "/doctor/") && userRole != UserType.DOCTOR) {
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        if (path.startsWith(contextPath + "/patient/") && userRole != UserType.PATIENT) {
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        chain.doFilter(request, response);
    }

}