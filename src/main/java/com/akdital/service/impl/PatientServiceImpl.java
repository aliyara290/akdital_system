package com.akdital.service.impl;

import com.akdital.exception.DataDeletionException;
import com.akdital.exception.DataInsertionException;
import com.akdital.exception.DataUpdateException;
import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Patient;
import com.akdital.repository.interfaces.PatientRepository;
import com.akdital.service.interfaces.PatientService;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;
import java.util.Optional;

public class PatientServiceImpl implements PatientService {

    private PatientRepository patientRepository;

    public PatientServiceImpl(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    @Override
    public Patient createPatient(Patient patient) {
        String hashedPassword = BCrypt.hashpw(patient.getPassword(), BCrypt.gensalt());
        patient.setPassword(hashedPassword);
        try {
            return patientRepository.save(patient);
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert data!");
        }
    }

    @Override
    public Patient updatePatient(Patient patient) {
        try {
            return patientRepository.update(patient);
        } catch (Exception ex) {
            throw new DataUpdateException("Failed to update data!" + patient.getUserId(), ex);
        }
    }

    @Override
    public Boolean deletePatient(String id) {
        try {
            return patientRepository.delete(id);
        } catch (Exception ex) {
            throw new DataDeletionException("Failed to delete data!");
        }
    }

    @Override
    public Optional<Patient> getPatient(String id) {
        try {
            return patientRepository.findById(id);
        } catch (Exception ex) {
            throw new NoRecordsFound("Patient not found!");
        }
    }

    @Override
    public List<Patient> getAllPatients() {
        try {
            return patientRepository.getAllPatients();
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert data!");
        }
    }
}
