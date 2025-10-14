package com.akdital.servlet.admin;

import com.akdital.model.Room;
import com.akdital.repository.impl.RoomRepositoryImpl;
import com.akdital.service.impl.RoomServiceImpl;
import com.akdital.service.interfaces.RoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/admin/rooms/*")
public class RoomServlet extends HttpServlet {

    private RoomService roomService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.roomService = new RoomServiceImpl(new RoomRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            listRooms(req, resp);
        } else if (pathInfo.equals("/new")) {
            req.getRequestDispatcher("/WEB-INF/views/admin/rooms/form.jsp").forward(req, resp);
        } else if (pathInfo.startsWith("/edit/")) {
            String roomId = pathInfo.substring(6);
            showEditForm(req, resp, roomId);
        } else if (pathInfo.startsWith("/view/")) {
            String roomId = pathInfo.substring(6);
            viewRoom(req, resp, roomId);
        } else if (pathInfo.startsWith("/delete/")) {
            String roomId = pathInfo.substring(8);
            deleteRoom(req, resp, roomId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            createRoom(req, resp);
        } else if ("update".equals(action)) {
            updateRoom(req, resp);
        }
    }

    private void listRooms(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Room> rooms = roomService.getAllRooms();
        req.setAttribute("rooms", rooms);
        req.getRequestDispatcher("/WEB-INF/views/admin/rooms/list.jsp").forward(req, resp);
    }

    private void createRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");

        Room room = new Room();
        room.setName(name);

        try {
            roomService.createRoom(room);
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/?success=created");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/new?error=" + e.getMessage());
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp, String roomId) throws ServletException, IOException {
        Room room = roomService.getAllRooms().stream()
                .filter(r -> r.getRoomId().equals(roomId))
                .findFirst()
                .orElse(null);

        if (room != null) {
            req.setAttribute("room", room);
            req.getRequestDispatcher("/WEB-INF/views/admin/rooms/form.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/?error=notfound");
        }
    }

    private void updateRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String roomId = req.getParameter("roomId");
        String name = req.getParameter("name");

        Room room = new Room();
        room.setRoomId(roomId);
        room.setName(name);

        try {
            roomService.updateRoom(room);
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/?success=updated");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/edit/" + roomId + "?error=" + e.getMessage());
        }
    }

    private void viewRoom(HttpServletRequest req, HttpServletResponse resp, String roomId) throws ServletException, IOException {
        Optional<Room> room = roomService.getRoom(roomId);

        if (room.isPresent()) {
            req.setAttribute("room", room);
            req.getRequestDispatcher("/WEB-INF/views/admin/rooms/view.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/?error=notfound");
        }
    }

    private void deleteRoom(HttpServletRequest req, HttpServletResponse resp, String roomId) throws IOException {
        Room room = new Room();
        room.setRoomId(roomId);

        try {
            roomService.deleteRoom(room);
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/?success=deleted");
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms/?error=" + e.getMessage());
        }
    }
}