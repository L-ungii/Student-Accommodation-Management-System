/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

/**
 *
 * @author sambo
 */
@Local
public interface ReservationFacadeLocal {

    void create(Reservation reservation);

    void edit(Reservation reservation);

    void remove(Reservation reservation);

    Reservation find(Object id);

    List<Reservation> findAll();
    
    List<Reservation> findStudents(Student stud);
    
    List<Reservation> findByResidenceName(Residence residence);

    List<Reservation> findRange(int[] range);

    int count();
    
}
