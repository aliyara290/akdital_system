package com.akdital.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "departments")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "department_id", unique = true)
    private String departmentId;

    @Column(name = "name", unique = true, nullable = false)
    @NotBlank(message = "Department name is required!")
    private String name;

    @Column(name = "description", nullable = false)
    @NotBlank(message = "Description name is required!")
    private String description;

    @OneToMany(mappedBy = "department_id", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Doctor> doctors = new ArrayList<>();

    public Department() {}

    public Department(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(List<Doctor> doctors) {
        this.doctors = doctors;
    }

    @Override
    public String toString() {
        return "Department{" +
                "departmentId='" + departmentId + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}