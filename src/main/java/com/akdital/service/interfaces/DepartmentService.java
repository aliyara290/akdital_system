package com.akdital.service.interfaces;

import com.akdital.model.Department;
import com.akdital.model.Patient;

import java.util.List;
import java.util.Optional;

public interface DepartmentService {
    Department createDepartment(Department department);
    Department updateDepartment(Department department);
    Boolean deleteDepartment(String id);
    Optional<Department> getDepartment(String department);
    List<Department> getAllDepartments();
}
