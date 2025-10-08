package com.akdital.model;

import com.akdital.model.enums.ConsultationStatus;
import jakarta.persistence.*;
import lombok.*;

import java.time.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "consultations")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column (name = "consultation_id", unique = true)
    private String consultationId;
    @Column (name = "date")
    private LocalDate date;
    @Column (name = "time")
    private LocalTime time;
    @Column (name = "consultation_status")
    private ConsultationStatus consultationStatus;
    @Column (name = "raport")
    private String raport;
    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;
    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;
    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;
}
