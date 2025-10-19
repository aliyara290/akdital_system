package com.akdital.model;

import com.akdital.model.enums.GenderType;
import com.akdital.model.enums.UserType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.annotations.DialectOverride;

import java.time.LocalDateTime;
import java.util.*;

@Entity
@Table(name = "doctors")
@PrimaryKeyJoinColumn(name = "user_id")
public class Doctor extends User {

    @Column(name = "speciality")
    @NotBlank(message = "Speciality is required!")
    private String speciality;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Consultation> consultationList;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id")
    private Room room;

    public Doctor() {
    }

    public Doctor(String email, String firstName, String lastName, String password, String phone,
                  GenderType gender, Department department, Room room, String speciality) {
        super(email, firstName, lastName, password, phone, gender, UserType.DOCTOR);
        this.consultationList = new ArrayList<>();
        this.department = department;
        this.speciality = speciality;
        this.room = room;
    }


    public List<Consultation> getConsultationList() {
        return consultationList;
    }

    public void setConsultationList(List<Consultation> consultationList) {
        this.consultationList = consultationList;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "consultationList=" + consultationList +
                ", speciality='" + speciality + '\'' +
                ", department=" + department +
                '}';
    }
}