/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import za.ac.tut.enetities.Application;

/**
 *
 * @author sambo
 */
@Stateless
public class ApplicationFacade extends AbstractFacade<Application> implements ApplicationFacadeLocal {

    @PersistenceContext(unitName = "StudentManagentEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ApplicationFacade() {
        super(Application.class);
    }

    @Override
    public Application findWithStud(Integer studNum) {
        Query query = em.createQuery("SELECT c FROM Application c WHERE c.student = :id");
        query.setParameter("id", studNum);
        
        Application app = (Application)query.getSingleResult();
        return app;
    }

   
}
