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
    public Department save(Department department) {
        try {
            return super.save(department);
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert department into database!", ex);
        }
    }

    @Override
    public Department update(Department department) {
        try {
            return super.update(department);

        } catch (Exception ex) {
            throw new DataUpdateException("Failed to update department!", ex);
        }
    }

    @Override
    public Boolean delete(String id) {
        try {
            return super.delete(id);
        } catch (Exception ex) {
            throw new DataDeletionException("Failed to delete department!", ex);
        }
    }

    @Override
    public Optional<Department> findById(String id) {
        try {
            return super.findById(id);
        } catch (Exception ex) {
            throw new NoRecordsFound("Department not found!", ex);
        }
    }

    @Override
    public Optional<Department> findByName(String name) {
        try {
            return super.findByName(name);
        } catch (Exception ex) {
            throw new NoRecordsFound("Department not found!", ex);
        }
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