package com.akdital.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.*;

@NoArgsConstructor
@Setter
@Getter
@Entity
@Table (name = "rooms")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "room_id")
    private String roomId;
    @Column (name = "name")
    private String name;
    @Column (name = "capacity")
    private Integer capacity;
    private List<LocalDateTime> occupiedSlots;

    public Room(Integer capacity, String name, String roomId) {
        this.capacity = capacity;
        this.name = name;
        this.occupiedSlots = new ArrayList<>();
        this.roomId = roomId;
    }
}
