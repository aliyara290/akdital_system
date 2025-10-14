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

    @Column(name = "doctor_id", unique = true)
    private String doctorId;

    @Column(name = "speciality")
    @NotBlank(message = "Speciality is required!")
    private String speciality;

    @Column(name = "department_id")
    @NotBlank(message = "Department is required!")
    private String departmentId;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Consultation> consultationList;

    public Doctor() {
    }

    public Doctor(String email, String firstName, String lastName, String password, String phone, GenderType gender, String departmentId, String speciality) {
        super(email, firstName, lastName, password, phone, gender, UserType.DOCTOR);
        this.consultationList = new ArrayList<>();
        this.departmentId = departmentId;
        this.speciality = speciality;
    }

    public List<Consultation> getConsultationList() {
        return consultationList;
    }

    public void setConsultationList(List<Consultation> consultationList) {
        this.consultationList = consultationList;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }
}