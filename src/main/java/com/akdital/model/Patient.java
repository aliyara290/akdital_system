package com.akdital.model;

import com.akdital.model.enums.GenderType;
import com.akdital.model.enums.UserType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.util.*;

@Entity
@Table(name = "patients")
@PrimaryKeyJoinColumn(name = "user_id")
public class Patient extends User {
    @Column(name = "weight")
    @NotBlank(message = "Weight is required!")
    private Double weight;

    @Column(name = "height")
    @NotBlank(message = "Height is required!")
    private Double height;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Consultation> consultations;

    public Patient() {
    }

    public Patient(String email, String firstName, String lastName, String password, String phone, GenderType gender, Double height, Double weight) {
        super(email, firstName, lastName, password, phone, gender, UserType.PATIENT);
        this.consultations = new ArrayList<>();
        this.height = height;
        this.weight = weight;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }


    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        return "Patient{" +super.toString()+
                ", weight=" + weight +
                ", height=" + height +
                '}';
    }
}
