package com.akdital.repository.interfaces;

import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.model.Patient;

import java.util.List;

public interface PatientRepository extends GenericRepository<Patient> {
    List<Consultation> getMyConsultations(String userId);
    List<Patient> getAllPatients();
    List<Doctor> doctorsList();
}
