package com.akdital.repository.impl;

import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Consultation;
import com.akdital.model.Doctor;
import com.akdital.model.Patient;
import com.akdital.repository.interfaces.DoctorRepository;
import com.akdital.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class DoctorRepositoryImpl extends GenericRepositoryImpl<Doctor> implements DoctorRepository {

    public DoctorRepositoryImpl() {
        super(Doctor.class);
    }

    @Override
    public List<Doctor> getAllDoctors() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT d FROM Doctor d", Doctor.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No doctors found!");
        }
    }

    @Override
    public List<Consultation> getConsultations(String doctorId) {
        return List.of();
    }
}
