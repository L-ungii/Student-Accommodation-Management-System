/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import za.ac.tut.entities.Residence;

/**
 *
 * @author sambo
 */
@Stateless
public class ResidenceFacade extends AbstractFacade<Residence> implements ResidenceFacadeLocal {

    @PersistenceContext(unitName = "StudentEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResidenceFacade() {
        super(Residence.class);
    }
    
}
