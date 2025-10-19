package com.akdital.repository.interfaces;

import java.util.Optional;

public interface GenericRepository<T> {
    T save(T t);
    T update(T t);
    Boolean delete(String id);
    Optional<T> findById(String id);
    Optional<T> findByName(String name);
}
