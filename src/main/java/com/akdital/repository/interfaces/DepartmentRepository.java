package com.akdital.repository.interfaces;

import com.akdital.model.Department;

import java.util.List;

public interface DepartmentRepository extends GenericRepository<Department> {
    List<Department> getAllDepartments();
}
