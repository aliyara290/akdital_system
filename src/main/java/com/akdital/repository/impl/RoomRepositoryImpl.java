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
}