package com.akdital.servlet.admin;

import com.akdital.model.Room;
import com.akdital.service.interfaces.RoomService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/rooms/*")
public class RoomServlet extends HttpServlet {
    @Inject
    private RoomService roomService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.isEmpty() || pathInfo.equals("/")) {
            List<Room> rooms = roomService.getAllRooms();
            req.setAttribute("rooms", rooms);
            req.getRequestDispatcher("/WEB-INF/views/admin/rooms.jsp").forward(req, resp);
        }
    }
}
