/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import za.ac.tut.enetities.Administrator;

/**
 *
 * @author sambo
 */
@Stateless
public class AdministratorFacade extends AbstractFacade<Administrator> implements AdministratorFacadeLocal {

    @PersistenceContext(unitName = "StudentManagentEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdministratorFacade() {
        super(Administrator.class);
    }

    @Override
    public Administrator findWithAdminNum(String adminNum) {
        Query query = em.createQuery("SELECT c FROM Administrator c WHERE c.adminNum = :id");
        query.setParameter("id", adminNum);

        Administrator admin = (Administrator) query.getSingleResult();

        return admin;
    }

    @Override
    public Administrator findUsername(String username) {
        try {
            Query query = em.createQuery("SELECT a FROM Administrator a WHERE a.username = :username");
            query.setParameter("username", username);
            return (Administrator) query.getSingleResult();
        } catch (NoResultException e) {
            return null; // No admin with that username found
        }
    }

}
