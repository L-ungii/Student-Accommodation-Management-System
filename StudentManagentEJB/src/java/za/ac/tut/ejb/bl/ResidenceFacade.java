package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Residence;

@Stateless
public class ResidenceFacade extends AbstractFacade<Residence> implements ResidenceFacadeLocal {

    @PersistenceContext(unitName = "StudentManagentEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResidenceFacade() {
        super(Residence.class);
    }

    @Override
    public Residence findWithAdminnRes(Administrator id, String resName) {
        Query query = em.createQuery("SELECT c FROM Residence c WHERE c.admin = :admin AND c.resName = :name");
        
        query.setParameter("admin", id);
        query.setParameter("name", resName);
        
        Residence res = (Residence)query.getSingleResult();
        return res;
    }

    @Override
    public Residence findWithName(String resName) {
        Query query = em.createQuery("SELECT c FROM Residence c WHERE c.resName = :name");
        query.setParameter("name", resName);
        
        Residence res = (Residence)query.getSingleResult();
        return res;
    }

    @Override
    public Residence findWithAdmin(Administrator id) {
        Query query = em.createQuery("SELECT c FROM Residence c WHERE c.admin = :admin");
        
        query.setParameter("admin", id);
        
        Residence res = (Residence)query.getSingleResult();
        return res;
    }
    
}
