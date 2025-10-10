package com.akdital.service.interfaces;

import com.akdital.model.Room;

import java.util.List;

public interface RoomService {
    Room createRoom(Room room);
    Room updateRoom(Room room);
    boolean deleteRoom(Room room);
    List<Room> getAllRooms();
}
