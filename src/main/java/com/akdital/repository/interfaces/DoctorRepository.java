package com.akdital.repository.interfaces;

import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.model.User;

import java.util.List;


public interface DoctorRepository extends GenericRepository<Doctor> {
    List<Doctor> getAllDoctors();
    List<Consultation> getConsultations(String doctorId);
}
