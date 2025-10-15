package com.akdital.model;

import com.akdital.model.enums.GenderType;
import com.akdital.model.enums.UserType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.util.*;

@Entity
@Table(name = "doctors")
@PrimaryKeyJoinColumn(name = "user_id")
public class Doctor extends User {

    @Column(name = "speciality")
    @NotBlank(message = "Speciality is required!")
    private String speciality;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @OneToMany(mappedBy = "doctor_id", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Consultation> consultationList;

    public Doctor() {
    }

    public Doctor(String email, String firstName, String lastName, String password, String phone,
                  GenderType gender, Department department, String speciality) {
        super(email, firstName, lastName, password, phone, gender, UserType.DOCTOR);
        this.consultationList = new ArrayList<>();
        this.department = department;
        this.speciality = speciality;
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


    @Override
    public String toString() {
        return "Doctor{" +
                "consultationList=" + consultationList +
                ", speciality='" + speciality + '\'' +
                ", department=" + department +
                '}';
    }
}