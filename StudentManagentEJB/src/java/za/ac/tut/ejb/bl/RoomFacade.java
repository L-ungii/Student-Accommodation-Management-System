package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Room;
import za.ac.tut.enetities.Student;

@Stateless
public class RoomFacade extends AbstractFacade<Room> implements RoomFacadeLocal {

    @PersistenceContext(unitName = "StudentManagentEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RoomFacade() {
        super(Room.class);
    }

    @Override
    public List<Room> findByResidence(Residence res) {
        Query query = em.createQuery("SELECT c FROM Room c WHERE c.res_id = ?1");
        query.setParameter(1, res);

        List<Room> room = query.getResultList();
        return room;
    }

    @Override
    public Room findByStudent(Student stud) {
        try {
            Query query = em.createQuery("SELECT c FROM Room c WHERE c.stud_Num = ?1");
            query.setParameter(1, stud);

            return (Room) query.getSingleResult();
        } catch (jakarta.persistence.NoResultException e) {
            return null; // safely return null when no room is found
        }
    }

}
