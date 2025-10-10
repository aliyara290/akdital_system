package com.akdital.repository.interfaces;

import com.akdital.model.Room;

import java.util.List;
import java.util.Optional;

public interface GenericRepository<T> {
    T save(T t);

    T update(T t);

    boolean delete(String id);

    Optional<T> findById(String id);

    Optional<T> findByName(String name);

    Optional<T> findByEmail(String email);
}
