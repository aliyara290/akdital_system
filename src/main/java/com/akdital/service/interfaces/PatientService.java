package com.akdital.service.interfaces;

import com.akdital.model.Patient;

import java.util.List;
import java.util.Optional;

public interface PatientService {
    Patient createPatient(Patient patient);
    Patient updatePatient(Patient patient);
    Boolean deletePatient(String id);
    Optional<Patient> getPatient(String patient);
    List<Patient> getAllPatients();
}