/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import za.ac.tut.enetities.Student;

/**
 *
 * @author sambo
 */
@Stateless
public class StudentFacade extends AbstractFacade<Student> implements StudentFacadeLocal {

    @PersistenceContext(unitName = "StudentManagentEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StudentFacade() {
        super(Student.class);
    }

    @Override
    public Student findStudentLogin(String password, Integer studNum) {
        Query query = em.createQuery("SELECT c FROM Student c WHERE c.password = :pass AND c.studNum = :id");
        query.setParameter("pass", password);
        query.setParameter("id", studNum);
        
        Student stud = (Student)query.getSingleResult();
        return stud;
    }
    
}
