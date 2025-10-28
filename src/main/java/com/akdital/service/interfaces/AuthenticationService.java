package com.akdital.service.interfaces;

import com.akdital.model.Patient;
import com.akdital.model.User;
import com.akdital.model.enums.GenderType;

import java.util.Optional;

public interface AuthenticationService {
    Optional<User> login(String email, String password);
    Patient registerPatient(String email, String firstName, String lastName,
                            String password, String phone, GenderType gender,
                            Double height, Double weight);
}