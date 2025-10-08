package com.akdital.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.*;

@NoArgsConstructor
@RequiredArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "doctors")
public class Doctor extends User {

    @Column(name = "doctor_id", unique = true)
    private String doctorId;
    @NonNull
    @Column(name = "speciality")
    private String speciality;
    @NonNull
    @Column(name = "department_id")
    private String departmentId;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Consultation> consultationList;



}
