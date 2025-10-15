package com.akdital.repository.impl;

import com.akdital.exception.*;
import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.model.Patient;
import com.akdital.repository.interfaces.PatientRepository;
import com.akdital.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.Optional;

public class PatientRepositoryImpl extends GenericRepositoryImpl<Patient> implements PatientRepository {

    public PatientRepositoryImpl() {
        super(Patient.class);
    }

    @Override
    public List<Patient> getAllPatients() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT d FROM Patient d", Patient.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No patients found!");
        }
    }


    @Override
    public List<Doctor> doctorsList() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT d FROM Doctor d", Doctor.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No doctors found!");
        }
    }

    @Override
    public List<Consultation> getMyConsultations(String userId) {
        try {
        return List.of();
        } catch (Exception ex) {
            throw new NoRecordsFound("No consultations found!");
        }
    }
}
