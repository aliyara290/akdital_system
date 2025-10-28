package com.akdital.service.interfaces;

import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.model.enums.ConsultationStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

public interface ConsultationService {
    Consultation bookConsultation(Consultation consultation);
    Consultation updateConsultation(Consultation consultation);
    Optional<Consultation> getConsultation(String id);
    Boolean updateConsultationStatus(String consultationId, ConsultationStatus status);
    Boolean cancelConsultation(String consultationId);
    List<Consultation> getAllConsultations();
    List<Doctor> getDoctorsByDepartmentId(String depId);
    Boolean isDoctorAvailable(Doctor doctor, LocalDate date, LocalTime time);
    List<LocalDateTime> availableDates(Doctor doctor);
    List<LocalTime> getAvailableTimes(String doctorId, LocalDate date);
}