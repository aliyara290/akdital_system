package com.akdital.repository.impl;

import com.akdital.model.User;
import com.akdital.repository.interfaces.UserRepository;

import java.util.Optional;

public class UserRepositoryImpl implements UserRepository {

    @Override
    public void delete(User user) {

    }

    @Override
    public void save(User user) {

    }

    @Override
    public boolean update(User user) {
        return false;
    }

    @Override
    public boolean existsByEmail(String email) {
        return false;
    }

    @Override
    public Optional<User> findById(String id) {
        return Optional.empty();
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return Optional.empty();
    }
}
