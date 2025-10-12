package com.akdital.service.impl;

import com.akdital.exception.ValidationException;
import com.akdital.model.Room;
import com.akdital.repository.interfaces.RoomRepository;
import com.akdital.service.interfaces.RoomService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;

@ApplicationScoped
public class RoomServiceImpl implements RoomService {
    @Inject
    private RoomRepository roomRepository;

    @Override
    public Room createRoom(Room room) {
        if(room.getName() == null || room.getName().trim().isEmpty()) {
            throw new ValidationException("Room name cannot be empty");
        }
        return roomRepository.save(room);
    }

    @Override
    public Room updateRoom(Room room) {
        if(room.getRoomId() == null || room.getRoomId().trim().isEmpty()) {
            throw new ValidationException("Room id cannot be empty");
        }
        if(roomRepository.findById(room.getRoomId()).isEmpty()) {
            throw new ValidationException("Room does not exist");
        }
        return roomRepository.save(room);
    }

    @Override
    public boolean deleteRoom(Room room) {
        if(room.getRoomId() == null || room.getRoomId().trim().isEmpty()) {
            throw new ValidationException("Room id cannot be empty");
        }
        if(roomRepository.findById(room.getRoomId()).isEmpty()) {
            throw new ValidationException("Room does not exist");
        }
        return roomRepository.delete(room.getRoomId());
    }

    @Override
    public List<Room> getAllRooms() {
        List<Room> rooms = roomRepository.getAll();
        if (rooms.isEmpty()) {
            return List.of();
        } else return rooms;
    }
}
