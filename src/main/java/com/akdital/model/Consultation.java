package com.akdital.model;

import com.akdital.model.enums.ConsultationStatus;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.time.*;


@Entity
@Table(name = "consultations")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "consultation_id", unique = true)
    private String consultationId;

    @Column(name = "date")
    @NotBlank(message = "Date is required!")
    private LocalDate date;

    @Column(name = "time")
    @NotBlank(message = "Time is required!")
    private LocalTime time;


    @Enumerated(EnumType.STRING)
    @Column(name = "consultation_status", nullable = false)
    private ConsultationStatus consultationStatus;

    @Column(name = "raport", nullable = true)
    private String raport;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient")
    @NotBlank(message = "Patient id is required")
    private Patient patient;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor")
    @NotBlank(message = "Doctor id is required")
    private Doctor doctor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room")
    @NotBlank(message = "Room id is required")
    private Room room;

    public Consultation() {}

    public Consultation(ConsultationStatus consultationStatus, LocalDate date, Doctor doctor, Patient patient, String raport, Room room, LocalTime time) {
        this.consultationStatus = consultationStatus;
        this.date = date;
        this.doctor = doctor;
        this.patient = patient;
        this.raport = raport;
        this.room = room;
        this.time = time;
    }

    public String getConsultationId() {
        return consultationId;
    }

    public void setConsultationId(String consultationId) {
        this.consultationId = consultationId;
    }

    public ConsultationStatus getConsultationStatus() {
        return consultationStatus;
    }

    public void setConsultationStatus(ConsultationStatus consultationStatus) {
        this.consultationStatus = consultationStatus;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getRaport() {
        return raport;
    }

    public void setRaport(String raport) {
        this.raport = raport;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Consultation{" +
                "consultationId='" + consultationId + '\'' +
                ", date=" + date +
                ", time=" + time +
                ", consultationStatus=" + consultationStatus +
                ", raport='" + raport + '\'' +
                ", patient=" + patient +
                ", doctor=" + doctor +
                ", room=" + room +
                '}';
    }
}
