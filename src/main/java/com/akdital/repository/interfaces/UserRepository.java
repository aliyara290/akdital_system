package com.akdital.repository.interfaces;

import com.akdital.model.User;

import java.util.Optional;

public interface UserRepository {
    void save(User user);
    void delete(User user);
    boolean update(User user);
    boolean existsByEmail(String email);
    Optional<User> findById(String id);
    Optional<User> findByEmail(String email);
}
