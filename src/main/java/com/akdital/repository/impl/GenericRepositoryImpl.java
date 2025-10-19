package com.akdital.repository.impl;

import com.akdital.model.Department;
import com.akdital.repository.interfaces.GenericRepository;
import com.akdital.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Optional;

public abstract class GenericRepositoryImpl<T> implements GenericRepository<T> {

    private final Class<T> entity;
//    public GenericRepositoryImpl() {}

    public GenericRepositoryImpl(Class<T> entity) {
        this.entity = entity;
    }

    @Override
    public T save(T t) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(t);
            tx.commit();
            return t;

        } catch (Exception ex) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error saving entity", ex);

        } finally {
            JPAUtil.close(em);
        }
    }

    @Override
    public T update(T t) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(t);
            System.out.println("lllllllllllllll");
            tx.commit();
            return t;
        } catch (Exception ex) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error updating entity", ex);
        } finally {
            //JPAUtil.close(em);
        }
    }


    @Override
    public Boolean delete(String id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            T entity = em.find(this.entity, id);
            if (entity != null) {
                em.remove(entity);
                tx.commit();
                return true;
            } else {
                tx.rollback();
                return null;
            }
        } catch (Exception ex) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error deleting entity", ex);
        } finally {
            JPAUtil.close(em);
        }
    }

    @Override
    public Optional<T> findById(String id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            T entity = em.find(this.entity, id);
            if (entity != null) {
                return Optional.of(entity);
            }
            return Optional.empty();
        } catch (Exception ex) {
            throw new RuntimeException("Error finding entity", ex);
        } finally {
            JPAUtil.close(em);
        }
    }

    @Override
    public Optional<T> findByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            T entity = em.find(this.entity, name);
            if (entity != null) {
                return Optional.of(entity);
            }
            return Optional.empty();
        } catch (Exception ex) {
            throw new RuntimeException("Error finding entity", ex);
        } finally {
            JPAUtil.close(em);
        }
    }
}























