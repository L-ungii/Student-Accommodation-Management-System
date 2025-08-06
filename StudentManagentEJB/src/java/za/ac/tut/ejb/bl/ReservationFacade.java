package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

@Stateless
public class ReservationFacade extends AbstractFacade<Reservation> implements ReservationFacadeLocal {

    @PersistenceContext(unitName = "StudentManagentEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReservationFacade() {
        super(Reservation.class);
    }

    @Override
    public List<Reservation> findStudents(Student stud) {
        Query query = em.createQuery("SELECT c FROM Reservation c WHERE c.student = :student");
        query.setParameter("student", stud);
        
        List<Reservation> reserveList = query.getResultList();
        
        return reserveList;
    }

    @Override
    public List<Reservation> findByResidenceName(Residence residence) {
        Query query = em.createQuery("SELECT c FROM Reservation c WHERE c.residence = ?1");
        query.setParameter(1, residence);
        
        List<Reservation> reserveList = query.getResultList();
        
        return reserveList;
    }
    
}
