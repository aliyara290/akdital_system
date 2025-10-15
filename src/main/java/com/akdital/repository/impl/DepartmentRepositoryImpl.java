package com.akdital.repository.impl;

import com.akdital.exception.DataDeletionException;
import com.akdital.exception.DataInsertionException;
import com.akdital.exception.DataUpdateException;
import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Department;
import com.akdital.repository.interfaces.DepartmentRepository;
import com.akdital.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DepartmentRepositoryImpl extends GenericRepositoryImpl<Department> implements DepartmentRepository {
    public DepartmentRepositoryImpl() {
        super(Department.class);
    }

    @Override
    public List<Department> getAllDepartments() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT r FROM Department r", Department.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("No departments to show!");
        }
    }
}