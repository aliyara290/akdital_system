package com.akdital.service.impl;

import com.akdital.exception.ValidationException;
import com.akdital.model.Room;
import com.akdital.repository.impl.RoomRepositoryImpl;
import com.akdital.repository.interfaces.RoomRepository;
import com.akdital.service.interfaces.RoomService;

import java.util.List;
import java.util.Optional;

public class RoomServiceImpl implements RoomService {

    private final RoomRepository roomRepository;

    public RoomServiceImpl(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @Override
    public Room createRoom(Room room) {
        if (room.getName() == null || room.getName().trim().isEmpty()) {
            throw new ValidationException("Room name cannot be empty");
        }
        return roomRepository.save(room);
    }

    @Override
    public Room updateRoom(Room room) {
        if (room.getRoomId() == null || room.getRoomId().trim().isEmpty()) {
            throw new ValidationException("Room id cannot be empty");
        }
        if (roomRepository.findById(room.getRoomId()).isEmpty()) {
            throw new ValidationException("Room does not exist");
        }
        return roomRepository.update(room);
    }

    @Override
    public Boolean deleteRoom(Room room) {
        if (room.getRoomId() == null || room.getRoomId().trim().isEmpty()) {
            throw new ValidationException("Room id cannot be empty");
        }
        if (roomRepository.findById(room.getRoomId()).isEmpty()) {
            throw new ValidationException("Room does not exist");
        }
        return roomRepository.delete(room.getRoomId());
    }

    @Override
    public Optional<Room> getRoom(String id) {
        if (id == null || id.isEmpty()) {
            throw new ValidationException("Room id cannot be empty");
        }
        return roomRepository.findById(id);
    }

    @Override
    public List<Room> getAllRooms() {
        List<Room> rooms = roomRepository.getAll();
        if (rooms.isEmpty()) {
            return List.of();
        } else return rooms;
    }
}