package com.akdital.service.impl;

import com.akdital.exception.*;
import com.akdital.model.Department;
import com.akdital.model.Doctor;
import com.akdital.repository.interfaces.DepartmentRepository;
import com.akdital.repository.interfaces.DoctorRepository;
import com.akdital.service.interfaces.DoctorService;
import org.mindrot.jbcrypt.BCrypt;

import java.util.*;
public class DoctorServiceImpl implements DoctorService {

    private final DoctorRepository doctorRepository;

    public DoctorServiceImpl(DoctorRepository doctorRepository) {
        this.doctorRepository = doctorRepository;
    }

    @Override
    public Doctor createDoctor(Doctor doctor) {
        String hashedPassword = BCrypt.hashpw(doctor.getPassword(), BCrypt.gensalt());
        doctor.setPassword(hashedPassword);
        try {
            return doctorRepository.save(doctor);
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert data!");
        }
    }

    @Override
    public Doctor updateDoctor(Doctor doctor) {
        if(!doctor.getPassword().isEmpty()) {
            String hashedPassword = BCrypt.hashpw(doctor.getPassword(), BCrypt.gensalt());
            doctor.setPassword(hashedPassword);
        }
        try {
            return doctorRepository.update(doctor);
        } catch (Exception ex) {
            throw new DataUpdateException("Failed to update data!", ex);
        }
    }

    @Override
    public Boolean deleteDoctor(String id) {
        try {
            return doctorRepository.delete(id);
        } catch (Exception ex) {
            throw new DataDeletionException("Failed to delete data!");
        }
    }

    @Override
    public Optional<Doctor> getDoctor(String doctor) {
        try {
            return doctorRepository.findById(doctor);
        } catch (Exception ex) {
            throw new NoRecordsFound("Patient not found!");
        }
    }

    @Override
    public List<Doctor> getAllDoctors() {
        try {
            return doctorRepository.getAllDoctors();
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert data!");
        }
    }
}
