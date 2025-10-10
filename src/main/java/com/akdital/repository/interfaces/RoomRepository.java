package com.akdital.repository.interfaces;

import com.akdital.model.Room;

import java.util.List;

public interface RoomRepository extends GenericRepository<Room> {
    List<Room> getAll();
}