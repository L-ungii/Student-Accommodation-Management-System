package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

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
    public Application findWithStud(Student studNum) {
        Query query = em.createQuery("SELECT c FROM Application c WHERE c.student = :id");
        query.setParameter("id", studNum);
        
        Application app = (Application)query.getSingleResult();
        return app;
    }

    @Override
    public List<Application> findWithResName(Residence res) {
        Query query = em.createQuery("SELECT c FROM Application c WHERE c.residence = ?1");
        query.setParameter(1, res);
        
        List<Application> appList = query.getResultList();
        return appList;
    }

    @Override
    public List<Application> finAllStud(Student studNum) {
        Query query = em.createQuery("SELECT c FROM Application c WHERE c.student = :id");
        query.setParameter("id", studNum);
        
        List<Application> app = query.getResultList();
        return app;
    }

    @Override
    public List<Student> findApproved() {
        Query query = em.createQuery("SELECT c.student FROM Application c WHERE c.status = 'approved'");
        List<Student> stud = query.getResultList();
        return stud;
    }

    @Override
    public Residence findWithApp(Object id) {
        Query query = em.createQuery("SELECT c.residence FROM Application c WHERE c.id = :id");
        query.setParameter("id", id);
        
        Residence app = (Residence)query.getSingleResult();
        return app;
    }

   
}
