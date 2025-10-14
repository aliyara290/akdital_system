package com.akdital.service.interfaces;

import com.akdital.model.Room;

import java.util.List;
import java.util.Optional;

public interface RoomService {
    Room createRoom(Room room);
    Room updateRoom(Room room);
    Boolean deleteRoom(Room room);
    Optional<Room> getRoom(String id)
;    List<Room> getAllRooms();
}
