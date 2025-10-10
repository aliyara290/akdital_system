package com.akdital.repository.impl;

import com.akdital.exception.NoRecordsFound;
import com.akdital.model.Room;
import com.akdital.repository.interfaces.RoomRepository;
import com.akdital.util.JPAUtil;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class RoomRepositoryImpl extends GenericRepositoryImpl<Room> implements RoomRepository {

    public RoomRepositoryImpl() {
        super(Room.class);
    }

    @Override
    public Room save(Room room) {
        return super.save(room);
    }

    @Override
    public Room update(Room room) {
        return super.update(room);
    }

    @Override
    public boolean delete(String id) {
        return super.delete(id);
    }

    @Override
    public Optional<Room> findById(String id) {
        return super.findById(id);
    }

    @Override
    public List<Room> getAll() {
        try (EntityManager entityManager = JPAUtil.getEntityManager()) {
            return entityManager.createQuery("SELECT r FROM Room r", Room.class).getResultList();
        } catch (Exception ex) {
            throw new NoRecordsFound("There is no rooms to show!");
        } finally {
            JPAUtil.getEntityManager().close();
        }
    }

    @Override
    public Optional<Room> findByName(String name) {
       return  super.findByName(name);
    }

    @Override
    public Optional<Room> findByEmail(String email) {
        return super.findByEmail(email);
    }
}
