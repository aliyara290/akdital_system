package com.akdital.repository.impl;

import com.akdital.exception.DateNotAvailableException;
import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Consultation;
import com.akdital.model.Department;
import com.akdital.model.Doctor;
import com.akdital.repository.interfaces.ConsultationRepository;
import com.akdital.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

public class ConsultationRepositoryImpl extends GenericRepositoryImpl<Consultation> implements ConsultationRepository {

    public ConsultationRepositoryImpl() {
        super(Consultation.class);
    }

    @Override
    public List<Consultation> getAllConsultations() {
        try (EntityManager entityManager = JPAUtil.getEntityManager()) {
            return entityManager.createQuery("SELECT c FROM Consultation c", Consultation.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No consultations found!");
        }
    }

//    @Override
//    public List<Consultation> getPatientConsultations(String patientId) {
//        try (EntityManager entityManager = JPAUtil.getEntityManager()) {
//            return entityManager.createQuery("SELECT c FROM Consultation c where c.patient.userId = :patientId", Consultation.class)
//                    .setParameter("patientId", patientId)
//                    .getResultList();
//        } catch (Exception ex) {
//            throw new NoRecordsFound("No consultations found!");
//        }
//    }

    @Override
    public List<Doctor> getDoctorsByDepartmentId(String depId) {
        try (EntityManager entityManager = JPAUtil.getEntityManager()) {
            return entityManager.createQuery("SELECT d FROM Doctor d where d.department.id = :departmentId", Doctor.class)
                    .setParameter("departmentId", depId)
                    .getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No doctors found!");
        }
    }

    @Override
    public Boolean isDoctorAvailable(Doctor doctor, LocalDate date, LocalTime time) {
        try (EntityManager entityManager = JPAUtil.getEntityManager()) {
            TypedQuery<Consultation> isReserved = entityManager.createQuery("SELECT c from Consultation c where c.date = :date AND c.time = :time", Consultation.class)
                    .setParameter("date", date)
                    .setParameter("time", time);
            return isReserved.getResultList() == null;
        } catch (Exception ex) {
            throw new DateNotAvailableException();
        }
    }
    @Override
        public List<Consultation> getConsultationsByDoctorAndDate(String doctorId, LocalDate date) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                            "SELECT c FROM Consultation c WHERE c.doctor.userId = :doctorId AND c.date = :date",
                            Consultation.class)
                    .setParameter("doctorId", doctorId)
                    .setParameter("date", date)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }
}