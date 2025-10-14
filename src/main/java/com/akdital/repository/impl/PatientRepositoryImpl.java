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
    public Patient save(Patient patient) {
        try {
            return super.save(patient);
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert patient into database!", ex);
        }
    }

    @Override
    public Patient update(Patient patient) {
        try {
            return super.update(patient);
        } catch (Exception ex) {
            throw new DataUpdateException("Failed to update patient!", ex);
        }
    }

    @Override
    public Boolean delete(String id) {
        try {
            return super.delete(id);
        } catch (Exception ex) {
            throw new DataDeletionException("Failed to delete patient!", ex);
        }
    }

    @Override
    public Optional<Patient> findByName(String name) {
        try {
        return super.findByName(name);
        } catch (Exception ex) {
            throw new NoRecordsFound("Patient not found!", ex);
        }
    }

    @Override
    public Optional<Patient> findById(String id) {
        try {
            return super.findById(id);
        } catch (Exception ex) {
            throw new NoRecordsFound("Patient not found!", ex);
        }
    }

    @Override
    public List<Patient> getAllPatients() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT d FROM Patient d", Patient.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No doctors found!");
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
            throw new NoRecordsFound("No patients to show!");
        }
    }
}
