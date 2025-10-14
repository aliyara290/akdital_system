package com.akdital.repository.impl;

import com.akdital.exception.*;
import com.akdital.model.Room;
import com.akdital.repository.interfaces.RoomRepository;
import com.akdital.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.*;

public class RoomRepositoryImpl extends GenericRepositoryImpl<Room> implements RoomRepository {

    public RoomRepositoryImpl() {
        super(Room.class);
    }

    @Override
    public Room save(Room room) {
        try {
            return super.save(room);
        } catch (Exception ex) {
            throw new DataInsertionException("Failed to insert Room into database!", ex);
        }
    }

    @Override
    public Room update(Room id) {
        try {
            return super.update(id);

        } catch (Exception ex) {
            throw new DataUpdateException("Failed to update Room!", ex);
        }
    }

    @Override
    public Boolean delete(String id) {
        try {

            return super.delete(id);
        } catch (Exception ex) {
            throw new DataDeletionException("Failed to delete Room!", ex);
        }
    }

    @Override
    public Optional<Room> findById(String id) {
        try {

            return super.findById(id);
        } catch (Exception ex) {
            throw new NoRecordsFound("Room not found!", ex);
        }
    }

    @Override
    public List<Room> getAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT r FROM Room r", Room.class).getResultList();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new NoRecordsFound("No rooms to show!");
        } finally {
            JPAUtil.close(em);
        }
    }

    @Override
    public Optional<Room> findByName(String name) {
        try {
            return super.findByName(name);
        } catch (Exception ex) {
            throw new NoRecordsFound("Room not found!", ex);
        }
    }
}