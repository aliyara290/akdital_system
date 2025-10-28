package com.akdital.service.interfaces;

import com.akdital.model.Department;
import com.akdital.model.Patient;
import com.akdital.model.User;
import com.akdital.model.enums.GenderType;

import java.util.List;
import java.util.Optional;

public interface DepartmentService {
    Department createDepartment(Department department);
    Department updateDepartment(Department department);
    Boolean deleteDepartment(String id);
    Optional<Department> getDepartment(String department);
    List<Department> getAllDepartments();

    interface AuthenticationService {
        Optional<User> login(String email, String password);
        Patient registerPatient(String email, String firstName, String lastName,
                                String password, String phone, GenderType gender,
                                Double height, Double weight);
    }
}
