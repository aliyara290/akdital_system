package com.akdital.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.*;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "departments")
public class Department {
    @NonNull
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "department_id", unique = true)
    private String departmentId;
    @NonNull
    @Column(name = "name")
    private String name;
    private List<Doctor> doctors;

}
