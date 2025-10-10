package com.akdital.model;

import com.akdital.service.interfaces.RoomService;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.*;

//@NoArgsConstructor
//@AllArgsConstructor
//@Setter
//@Getter
@Entity
@Table(name = "rooms")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "room_id")
    private String roomId;

    @Column(name = "name", nullable = true)
    private String name;

    private List<LocalDateTime> occupiedSlots;

    public Room() {
    }

    public Room(String name, List<LocalDateTime> occupiedSlots, String roomId) {
        this.name = name;
        this.occupiedSlots = new ArrayList<>();
        this.roomId = roomId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<LocalDateTime> getOccupiedSlots() {
        return occupiedSlots;
    }

    public void setOccupiedSlots(List<LocalDateTime> occupiedSlots) {
        this.occupiedSlots = occupiedSlots;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }
}