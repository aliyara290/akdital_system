package com.akdital.repository.interfaces;

import com.akdital.model.Consultation;
import com.akdital.model.Doctor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

public interface ConsultationRepository extends GenericRepository<Consultation> {
    List<Consultation> getAllConsultations();
    List<Doctor> getDoctorsByDepartmentId(String depId);
    Boolean isDoctorAvailable(Doctor doctor, LocalDate date, LocalTime time);
    List<Consultation> getConsultationsByDoctorAndDate(String doctorId, LocalDate date);
}