package com.akdital.service.impl;

import com.akdital.model.Patient;
import com.akdital.model.User;
import com.akdital.model.enums.GenderType;
import com.akdital.repository.interfaces.PatientRepository;
import com.akdital.repository.interfaces.UserRepository;
import com.akdital.service.interfaces.AuthenticationService;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;

public class AuthenticationServiceImpl implements AuthenticationService {

    private final UserRepository userRepository;
    private final PatientRepository patientRepository;

    public AuthenticationServiceImpl(UserRepository userRepository, PatientRepository patientRepository) {
        this.userRepository = userRepository;
        this.patientRepository = patientRepository;
    }

    public Optional<User> login(String email, String password) {
        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (BCrypt.checkpw(password, user.getPassword())) {
                return Optional.of(user);
            }
        }
        return Optional.empty();
    }

    public Patient registerPatient(String email, String firstName, String lastName,
                                   String password, String phone, GenderType gender,
                                   Double height, Double weight) {
        if (userRepository.existsByEmail(email)) {
            throw new RuntimeException("Email already exists");
        }

        Patient patient = new Patient(email, firstName, lastName, password, phone, gender, height, weight);
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        patient.setPassword(hashedPassword);

        return patientRepository.save(patient);
    }
}