package com.akdital.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.*;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "patients")
public class Patient extends User {
    @Column(name = "patient_id", unique = true)
    private String patientId;
    @NonNull
    @Column(name = "weight")
    private Double weight;
    @NonNull
    @Column(name = "height")
    private Double height;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Consultation> consultations;

}
