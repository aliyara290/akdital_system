package com.akdital.service.interfaces;

import com.akdital.model.Doctor;

import java.util.List;
import java.util.Optional;

public interface DoctorService {
    Doctor createDoctor(Doctor doctor);
    Doctor updateDoctor(Doctor doctor);
    Boolean deleteDoctor(String id);
    Optional<Doctor> getDoctor(String doctor);
    List<Doctor> getAllDoctors();
}