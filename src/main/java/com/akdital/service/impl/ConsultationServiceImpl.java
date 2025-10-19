package com.akdital.service.impl;

import com.akdital.exception.DataInsertionException;
import com.akdital.exception.DateNotAvailableException;
import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.repository.interfaces.ConsultationRepository;
import com.akdital.service.interfaces.ConsultationService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ConsultationServiceImpl implements ConsultationService {
    private ConsultationRepository consultationRepository;

    public ConsultationServiceImpl(ConsultationRepository consultationRepository) {
        this.consultationRepository = consultationRepository;
    }

    @Override
    public Consultation bookConsultation(Consultation consultation) {
        if(isDoctorAvailable(consultation.getDoctor(), consultation.getDate(), consultation.getTime())) {
            return null;
        }
        try {
            return consultationRepository.save(consultation);
        } catch(Exception ex) {
            throw new NoRecordsFound("");
        }
    }

    @Override
    public Consultation updateConsultation(Consultation consultation) {
        return null;
    }

    @Override
    public Boolean updateConsultationStatus(String status) {
        return null;
    }

    @Override
    public Optional<Consultation> getConsultation(String id) {
        try {
            return consultationRepository.findById(id);
        } catch (Exception ex) {
            throw new NoRecordsFound("Consultation not found!");
        }
    }

    @Override
    public List<Consultation> getAllConsultations() {
        try {
            return consultationRepository.getAllConsultations();
        } catch (Exception ex) {
            throw new NoRecordsFound("No Consultations found!");
        }
    }

    @Override
    public List<Doctor> getDoctorsByDepartmentId(String depId) {
        try {
            return consultationRepository.getDoctorsByDepartmentId(depId);
        } catch (Exception ex) {
            throw new NoRecordsFound("There is no doctors in this department!");
        }
    }

    @Override
    public Boolean isDoctorAvailable(Doctor doctor, LocalDate date, LocalTime time) {
        try {
            return consultationRepository.isDoctorAvailable(doctor, date, time);
        } catch (Exception ex) {
            throw new DateNotAvailableException();
        }
    }

    @Override
    public List<LocalDateTime> availableDates(Doctor doctor) {
        return List.of();
    }

    public List<LocalTime> getAvailableTimes(String doctorId, LocalDate date) {
        List<LocalTime> allTimes = List.of(
                LocalTime.of(9, 0),
                LocalTime.of(9, 30),
                LocalTime.of(10, 0),
                LocalTime.of(10, 30),
                LocalTime.of(11, 0),
                LocalTime.of(11, 30),
                LocalTime.of(14, 0),
                LocalTime.of(14, 30),
                LocalTime.of(15, 0),
                LocalTime.of(15, 30),
                LocalTime.of(16, 0),
                LocalTime.of(16, 30)
        );

        List<Consultation> booked = consultationRepository.getConsultationsByDoctorAndDate(doctorId, date);

        List<LocalTime> available = new ArrayList<>(allTimes);
        for (Consultation c : booked) {
            available.remove(c.getTime());
        }
        System.out.println(available);
        return available;
    }

}
