package com.akdital.service.impl;

import com.akdital.exception.DataDeletionException;
import com.akdital.exception.DataInsertionException;
import com.akdital.exception.DataUpdateException;
import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Department;
import com.akdital.repository.interfaces.DepartmentRepository;
import com.akdital.service.interfaces.DepartmentService;

import java.util.List;
import java.util.Optional;

public class DepartmentServiceImpl implements DepartmentService {

    private final DepartmentRepository departmentRepository;

    public DepartmentServiceImpl(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    @Override
    public Department createDepartment(Department department) {
        try {
            return departmentRepository.save(department);
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert data!");
        }
    }

    @Override
    public Department updateDepartment(Department department) {
        try {
            return departmentRepository.update(department);
        } catch (Exception ex) {
            throw new DataUpdateException("Failed to update data!", ex);
        }
    }

    @Override
    public Boolean deleteDepartment(String id) {
        try {
            return departmentRepository.delete(id);
        } catch (Exception ex) {
            throw new DataDeletionException("Failed to delete data!");
        }
    }

    @Override
    public Optional<Department> getDepartment(String department) {
        try {
            return departmentRepository.findById(department);
        } catch (Exception ex) {
            throw new NoRecordsFound("Department not found!");
        }
    }

    @Override
    public List<Department> getAllDepartments() {
        try {
            return departmentRepository.getAllDepartments();
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert data!");
        }
    }
}
